Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39D271
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 13:17:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id t11so16655713lfl.11
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0S06plEE29isvKviL6ILjCR3CE2KnKhZ0925tx9PQpY=;
        b=vY+IMZPooRMjOtPm5pg/xrmZPiFE7w25mRru10XQXJx7kpiy86zCoQkgRV272+O5eP
         UlBN6eAkPBtuFPEL1/nyCsktpL9GAZjdkgoSa8cfLNQatGgQL067/vVDQeWStt6GMTCg
         mDAk3HBCAtg+TKrQM1FeBZ5GuKqNEmM5GQ/MssZb6bXxZo4zdZJZcQsSg0v551Hh+Vn6
         VuxN+QhgE16k+xX32UeBUyPzE2Nyk2vfahYZj4VJbUWKDgtCOq5FPuDc0ffZmFFAVm/3
         SmEmvo0Os3kGNapE9mKjxmSwoV6kJ8OZBfeJCPrLtgZdmx3WIwUprstbcN6nt+DhZ4ZZ
         FImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0S06plEE29isvKviL6ILjCR3CE2KnKhZ0925tx9PQpY=;
        b=DVDHBmD46U0wiT2CH1xH1GFqKxHjYEJY8QpML2ObgvCyxMenx4y/VpcMke3eKOAnDD
         w1AgBoV7WwSgQhIClDuLt4U70qes747Ki70mXhCINbUBUMWI5SkIB01MkHiQL5dnzXLI
         0L3eVjntnEZAzvjj4zfmJPdGrs+GRVMIpqGwy6TUh5vcVwxcqZRaUZRPs8mnr4aUxApa
         5h22QWuSSZnWRDf90pn9pp+OHb9Ibdh/2G5ca4TkrDpOqIoz8J4nC4JP9ugcsfOIg6xz
         f9PK+fcq0ZL4zdV63D/e3awMWQGgvVcRAn7sfiK9DgwBwNkOm0iVmmewmuDgd+kFQZMW
         TDYA==
X-Gm-Message-State: AOAM532VUyRSF27sXV+pWzYMSZxgm6SsvcpMm+T4ErptDY0d/+eF/Pox
	J8YZbfkyZKAVBoUruhdqLa4=
X-Google-Smtp-Source: ABdhPJxUUg5L8GCKluOA4tjn3sZ7XksIti9/Kt2rHubp3otdXglQ24KVBa0o2EuqHjI+TpxB7ke19Q==
X-Received: by 2002:a19:f114:: with SMTP id p20mr7379795lfh.530.1620479851009;
        Sat, 08 May 2021 06:17:31 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id b11sm1619390lfi.292.2021.05.08.06.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 06:17:30 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v4 3/3] staging: media: atomisp: remove useless returns
Date: Sat,  8 May 2021 16:17:27 +0300
Message-Id: <23a6984ddfb15ba38f6983381bb6fdaef3edd7d8.1620479607.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620479607.git.paskripkin@gmail.com>
References: <cover.1620479607.git.paskripkin@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Returns are not useful at the end of void functions,
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

