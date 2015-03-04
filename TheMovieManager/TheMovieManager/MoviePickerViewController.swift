//
//  MoviePickerTableView.swift
//  TheMovieManager
//
//  Created by Jarrod Parkes on 2/11/15.
//  Copyright (c) 2015 Jarrod Parkes. All rights reserved.
//

import UIKit

protocol MoviePickerViewControllerDelegate {
    func moviePicker(moviePicker: MoviePickerViewController, didPickMovie movie: TMDBMovie?)
}

class MoviePickerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    // The data for the table
    var movies = [TMDBMovie]()
    
    // The delegate will typically be a view controller, waiting for the Movie Picker
    // to return an movie
    var delegate: MoviePickerViewControllerDelegate?
    
    // The most recent data download task. We keep a reference to it so that it can
    // be canceled every time the search text changes
    var searchTask: NSURLSessionDataTask?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        self.parentViewController!.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Reply, target: self, action: "logoutButtonTouchUp")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.movieSearchBar.becomeFirstResponder()
    }
    
    // MARK: - UISearchBarDelegate
    
    /* Each time the search text changes we want to cancel any current download and start a new one */
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        /* Cancel the last task */
        if let task = searchTask? {
            task.cancel()
        }
        
        /* If the text is empty we are done */
        if searchText == "" {
            movies = [TMDBMovie]()
            movieTableView?.reloadData()
            objc_sync_exit(self)
            return
        }
        
        // TODO: Search for movies by the searchText, then update the table */
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    // MARK: - UITableViewDelegate and UITableViewDataSource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellReuseId = "MovieSearchCell"
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseId) as UITableViewCell
        
        if countElements(movie.releaseYear!) == 0 {
            cell.textLabel!.text = "\(movie.title)"
        } else {
            cell.textLabel!.text = "\(movie.title) (\(movie.releaseYear!))"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let movie = movies[indexPath.row]
        let controller = self.storyboard!.instantiateViewControllerWithIdentifier("MovieDetailViewController") as MovieDetailViewController
        controller.movie = movie
        self.navigationController!.pushViewController(controller, animated: true)
    }
    
    // MARK: - MoviePickerViewController
    
    func cancel() {
        self.delegate?.moviePicker(self, didPickMovie: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logoutButtonTouchUp() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
