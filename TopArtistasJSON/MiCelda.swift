//
//  MiCelda.swift
//  TopArtistasJSON
//
//  Created by Usuario on 25/01/2020.
//  Copyright © 2020 net.azarquiel. All rights reserved.
//

import UIKit

class MiCelda: UITableViewCell {

    @IBOutlet weak var lbNombreCelda: UILabel!
    @IBOutlet weak var lbListenersCelda: UILabel!
    @IBOutlet weak var lbWebCelda: UILabel!
    @IBOutlet weak var ivIcoCelda: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
