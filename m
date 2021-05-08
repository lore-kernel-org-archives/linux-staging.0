Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F7972
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 12:21:56 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id s25so14997509lji.0
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iFc03Rz0fO9UPNojfAfihtEJ62tAiwVsTwIn7JmK2Gw=;
        b=XeoFsy0qEZr3o8oJi5kAdQCLw9DkpkdS0Wb+BDCL8Ukt2SebSEAnHLsrI8ab3vbxwn
         Rq9X0lyedPBr+uRvLfeHU/QtiZ8sFcriXIYLLgFYn0KRUAZXK5yy7B69xNzdFInYDw8Z
         XzAbYCsm1uz0c4foNDtev9M+Ad2K7gToeOlonWbCrjQ3EMjDLm6XkXSvp1Upyz83/XHK
         gZJn81tac+EItxwYJOA99h8nVAKhCiIC35DITosZG4itAevjOz8TerGWhgVuRa0CdsZv
         YO+P2HCbC6Vf9pNjba8Yl2F6km8zLAfRsIxa7dThN030Vd8xck8kvTbGTWoIYCwrTypt
         mAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iFc03Rz0fO9UPNojfAfihtEJ62tAiwVsTwIn7JmK2Gw=;
        b=H7J1R8+SPqbvzfgljD192cwrXZC08Nb0VgWD7zKs1rJSayYPt1ocEpYGMfuoAQOUkA
         MHKNUP7ihjAM+i/QE4yP5Sss3E9bZVuTtap9Am7ERF1IyKJxdLEYQHhljBqiR+yHAe2U
         5Wf1YJAf4jJ8OL4vZ7uHCVca3B4NvoRr1xTZlzmoXAtOeMDrlGmdpWDKTKY5YybY0fbS
         uTxC9szyAwlSbK26h21H/zBBIb1c7tucgJ0DDoDnbKjiNVBECAGTP2TiYJm51mQ90BtC
         YW9bqR59TQgH4QK5CGQLGgwehf8Nu8A2vHGtJRzrzooRlpRI8MuUR+T1/o7GOMROHviZ
         evtQ==
X-Gm-Message-State: AOAM5302+gHoN1qKqygazwNeCEryYhvQBVWCweu7qQzmINeGhcAGXvf5
	f+LUQgHyt+LY3io/ZTsYLSI=
X-Google-Smtp-Source: ABdhPJyU1r+LUShx2Zr4TM4LBbAu4bDi2ue14Rdrf/bCsbCMZK78+h/PATuzsaXThYmfBmJT3dJGyQ==
X-Received: by 2002:a2e:5713:: with SMTP id l19mr11780202ljb.297.1620476514807;
        Sat, 08 May 2021 05:21:54 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id w16sm1631741lfu.160.2021.05.08.05.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:21:54 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 3/3] staging: media: atomisp: remove useless returns
Date: Sat,  8 May 2021 15:21:52 +0300
Message-Id: <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620475909.git.paskripkin@gmail.com>
References: <cover.1620475909.git.paskripkin@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Breaks are not useful at the end of void function,
they can simply be removed.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 .../hive_isp_css_common/host/input_system.c   | 38 -------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 76414b6b43c9..8e085dda0c18 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -174,8 +174,6 @@ void input_system_get_state(
 		ctrl_unit_get_state(ID, sub_id,
 				    &state->ctrl_unit_state[sub_id - CTRL_UNIT0_ID]);
 	}
-
-	return;
 }
 
 void receiver_get_state(
@@ -246,8 +244,6 @@ void receiver_get_state(
 			       _HRT_CSS_RECEIVER_BE_IRQ_STATUS_REG_IDX);
 	state->be_irq_clear = receiver_reg_load(ID,
 						_HRT_CSS_RECEIVER_BE_IRQ_CLEAR_REG_IDX);
-
-	return;
 }
 
 bool is_mipi_format_yuv420(
@@ -310,8 +306,6 @@ void receiver_set_compression(
 	reg = ((field_id < 6) ? (val << (field_id * 5)) : (val << ((
 		    field_id - 6) * 5)));
 	receiver_reg_store(ID, addr, reg);
-
-	return;
 }
 
 void receiver_port_enable(
@@ -330,7 +324,6 @@ void receiver_port_enable(
 
 	receiver_port_reg_store(ID, port_ID,
 				_HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX, reg);
-	return;
 }
 
 bool is_receiver_port_enabled(
@@ -349,7 +342,6 @@ void receiver_irq_enable(
 {
 	receiver_port_reg_store(ID,
 				port_ID, _HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX, irq_info);
-	return;
 }
 
 rx_irq_info_t receiver_get_irq_info(
@@ -367,7 +359,6 @@ void receiver_irq_clear(
 {
 	receiver_port_reg_store(ID,
 				port_ID, _HRT_CSS_RECEIVER_IRQ_STATUS_REG_IDX, irq_info);
-	return;
 }
 
 static inline void capture_unit_get_state(
@@ -428,8 +419,6 @@ static inline void capture_unit_get_state(
 	state->FSM_State_Info = input_system_sub_system_reg_load(ID,
 				sub_id,
 				CAPT_FSM_STATE_INFO_REG_ID);
-
-	return;
 }
 
 static inline void acquisition_unit_get_state(
@@ -478,8 +467,6 @@ static inline void acquisition_unit_get_state(
 	state->Int_Cntr_Info = input_system_sub_system_reg_load(ID,
 			       sub_id,
 			       ACQ_INT_CNTR_INFO_REG_ID);
-
-	return;
 }
 
 static inline void ctrl_unit_get_state(
@@ -561,8 +548,6 @@ static inline void ctrl_unit_get_state(
 	state->capt_reserve_one_mem_region = input_system_sub_system_reg_load(ID,
 					     sub_id,
 					     ISYS_CTRL_CAPT_RESERVE_ONE_MEM_REGION_REG_ID);
-
-	return;
 }
 
 static inline void mipi_port_get_state(
@@ -597,8 +582,6 @@ static inline void mipi_port_get_state(
 		state->lane_sync_count[i] = (uint8_t)((state->sync_count) >> (i * 8));
 		state->lane_rx_count[i] = (uint8_t)((state->rx_count) >> (i * 8));
 	}
-
-	return;
 }
 
 static inline void rx_channel_get_state(
@@ -652,8 +635,6 @@ static inline void rx_channel_get_state(
 		state->comp[i] = (mipi_compressor_t)(val & 0x07);
 		state->pred[i] = (mipi_predictor_t)((val & 0x18) >> 3);
 	}
-
-	return;
 }
 
 // MW: "2400" in the name is not good, but this is to avoid a naming conflict
@@ -672,8 +653,6 @@ static void receiver_rst(
 	}
 
 	// AM: Additional actions for stopping receiver?
-
-	return;
 }
 
 //Single function to reset all the devices mapped via GP_DEVICE.
@@ -722,8 +701,6 @@ static void gp_device_rst(const gp_device_ID_t		ID)
 	//	gp_device_reg_store(ID, _REG_GP_SYNCGEN_FRAME_CNT_ADDR, ZERO);
 	gp_device_reg_store(ID, _REG_GP_SOFT_RESET_ADDR,
 			    ZERO); // AM: Maybe this soft reset is not safe.
-
-	return;
 }
 
 static void input_selector_cfg_for_sensor(const gp_device_ID_t ID)
@@ -740,8 +717,6 @@ static void input_selector_cfg_for_sensor(const gp_device_ID_t ID)
 	gp_device_reg_store(ID, _REG_GP_ISEL_SBAND_SEL_ADDR, ZERO);
 	gp_device_reg_store(ID, _REG_GP_ISEL_SYNC_SEL_ADDR, ZERO);
 	gp_device_reg_store(ID, _REG_GP_SOFT_RESET_ADDR, ZERO);
-
-	return;
 }
 
 static void input_switch_rst(const gp_device_ID_t ID)
@@ -760,8 +735,6 @@ static void input_switch_rst(const gp_device_ID_t ID)
 	gp_device_reg_store(ID,
 			    _REG_GP_IFMT_input_switch_fsync_lut,
 			    ZERO);
-
-	return;
 }
 
 static void input_switch_cfg(
@@ -786,8 +759,6 @@ static void input_switch_cfg(
 	gp_device_reg_store(ID,
 			    _REG_GP_IFMT_input_switch_fsync_lut,
 			    cfg->vsync_data_reg);
-
-	return;
 }
 
 static void input_system_network_rst(const input_system_ID_t ID)
@@ -843,8 +814,6 @@ static void input_system_network_rst(const input_system_ID_t ID)
 						  ISYS_CTRL_INIT_REG_ID,
 						  1U); //AM: Is there any named constant?
 	}
-
-	return;
 }
 
 // Function that resets current configuration.
@@ -1072,8 +1041,6 @@ static void capture_unit_configure(
 					  sub_id,
 					  CAPT_NUM_MEM_REGIONS_REG_ID,
 					  cfg->nof_mem_regs);
-
-	return;
 }
 
 static void acquisition_unit_configure(
@@ -1097,8 +1064,6 @@ static void acquisition_unit_configure(
 					  sub_id,
 					  ACQ_MEM_REGION_SIZE_REG_ID,
 					  cfg->mem_reg_size);
-
-	return;
 }
 
 static void ctrl_unit_configure(
@@ -1165,7 +1130,6 @@ static void ctrl_unit_configure(
 					  sub_id,
 					  ISYS_CTRL_CAPT_RESERVE_ONE_MEM_REGION_REG_ID,
 					  0);
-	return;
 }
 
 static void input_system_network_configure(
@@ -1223,8 +1187,6 @@ static void input_system_network_configure(
 				    sub_id,
 				    &cfg->ctrl_unit_cfg[sub_id - CTRL_UNIT0_ID]);
 	}
-
-	return;
 }
 
 static input_system_err_t configuration_to_registers(void)
-- 
2.31.1

