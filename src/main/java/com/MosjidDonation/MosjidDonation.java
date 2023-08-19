/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.MosjidDonation;

import com.MosjidDonation.ui.WelcomeJFrame;

/**
 *
 * @author Raofin
 */
public class MosjidDonation {

    public static void main(String[] args) {
        // Set the look and feel of the GUI to match the Windows style
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | javax.swing.UnsupportedLookAndFeelException ex) {
            // If there's an error in setting the look and feel, log the error
            java.util.logging.Logger.getLogger(WelcomeJFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        
        // Start the GUI in the Event Dispatch Thread
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                // Create an instance of WelcomeJFrame and set its properties
                WelcomeJFrame homeFrame = new WelcomeJFrame();
                homeFrame.setLocationRelativeTo(null); // Center the frame on the screen
                homeFrame.setVisible(true); // Make the frame visible
            }
        });
    }
}