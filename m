Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0225746B5
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 20:21:17 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id az20so44622801ejc.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 12:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+otSAik9O2Fw7DnAYDScejyC3Rd16+BHk2obm2UhJYE=;
        b=p8rSnuviDnbZz5yS4kcZbexgS3qS7RMQhjxTlO885SOnEZztqbC4A4aU2+fPa9UZ3F
         kbJwOR9qWMN3CKtsj7w2UZW84+Ii0GCmb7W91ks/LPukKdnMa/F6HAFnlSZ2xre6btmj
         2kPGZvLQwrx+VZmXz/+dnR3PW0hX7kCFbbzN8D/Q7fYgbVhB/70Zr7rONj0r/l0Ybm7s
         zOlP7pgLJU6OLHVHb1+Vv94g6gCbBeg77rnFJz2n7UUdd/h559Vfqu4+97SqFmxGlWKe
         q9UWyylQa6jxevsryivU2Hi8EMdewIS6ZDh631LaDm91IWwbaqZd8b3Ln1JGM1+8dDR2
         b0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+otSAik9O2Fw7DnAYDScejyC3Rd16+BHk2obm2UhJYE=;
        b=fOPPxj0QONqmhsNMTlloErTGMmQckW56Bnz3oRyn8tlHHYuf5kdDDU1gjp7AguZvjj
         /1L1H8SKX24YzB13LBNdT2QhzJFGv3tcQ/f1gXv6kk9cor3R3x4RSUEmGNI8RVxo8cIH
         RvL8pi5332f0FkR7tniPnNiSSrWVViDHTaq+pu9KRO9sDITbH8AOJPeZj7uG2lqxNKDk
         Uav+214h/He2ToD7qoHPtFGbFULM2MFhlVfk0bIyBQ3IIfmnjRCojE/wUb5kNSuy3a4S
         DKSM5dnlK9ON2H5i7M9T07X3XOO4WMd4fxSEy+IsNwirdi9+DWR1hR1C+qEncYY+cgi7
         qd0Q==
X-Gm-Message-State: AFqh2kr09PSg5MzWTRRXro+TyBd9KWZmbeGM6Lb3rt0ZmMgrZbSRUQty
	Eeff4Oi+IcBghu5yucKrZ64=
X-Google-Smtp-Source: AMrXdXsk9oUjf+CoVDOMmk2qoWhJvTl6GyzTbbtUnJdT5UcHvVf64Fm2DRXAkZ6GweVZaVzFYnGR4w==
X-Received: by 2002:a17:907:c018:b0:7b9:861b:9744 with SMTP id ss24-20020a170907c01800b007b9861b9744mr16723641ejc.1.1673814076360;
        Sun, 15 Jan 2023 12:21:16 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id kx4-20020a170907774400b007c10d47e748sm10947215ejc.36.2023.01.15.12.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 12:21:15 -0800 (PST)
Date: Sun, 15 Jan 2023 21:21:14 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] staging: rtl8192e: Rename EEPROMTxPower.., AutoloadF..
 and SilentReset..
Message-ID: <60c1fb2861143c8736f061cf85e737b78c210a09.1673812850.git.philipp.g.hortmann@gmail.com>
References: <cover.1673812849.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673812849.git.philipp.g.hortmann@gmail.com>

Rename variable SilentResetRxSlotIndex to silent_reset_rx_slot_index,
IC_Cut to ic_cut and Rf_Mode to rf_mode to avoid CamelCase which is not
accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 12 ++++++------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 10 +++++-----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     |  8 ++++----
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 8522a4b9b8f1..9cffe09e429c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -614,7 +614,7 @@ bool rtl92e_start_adapter(struct net_device *dev)
 
 start:
 	rtl92e_reset_desc_ring(dev);
-	priv->Rf_Mode = RF_OP_By_SW_3wire;
+	priv->rf_mode = RF_OP_By_SW_3wire;
 	if (priv->rst_progress == RESET_TYPE_NORESET) {
 		rtl92e_writeb(dev, ANAPAR, 0x37);
 		mdelay(500);
@@ -724,7 +724,7 @@ bool rtl92e_start_adapter(struct net_device *dev)
 	}
 
 	tmpvalue = rtl92e_readb(dev, IC_VERRSION);
-	priv->IC_Cut = tmpvalue;
+	priv->ic_cut = tmpvalue;
 
 	bfirmwareok = rtl92e_init_fw(dev);
 	if (!bfirmwareok) {
@@ -760,14 +760,14 @@ bool rtl92e_start_adapter(struct net_device *dev)
 	}
 
 	if (priv->rtllib->FwRWRF)
-		priv->Rf_Mode = RF_OP_By_FW;
+		priv->rf_mode = RF_OP_By_FW;
 	else
-		priv->Rf_Mode = RF_OP_By_SW_3wire;
+		priv->rf_mode = RF_OP_By_SW_3wire;
 
 	if (priv->rst_progress == RESET_TYPE_NORESET) {
 		rtl92e_dm_init_txpower_tracking(dev);
 
-		if (priv->IC_Cut >= IC_VersionCut_D) {
+		if (priv->ic_cut >= IC_VersionCut_D) {
 			tmpRegA = rtl92e_get_bb_reg(dev, rOFDM0_XATxIQImbalance,
 						    bMaskDWord);
 			rtl92e_get_bb_reg(dev, rOFDM0_XCTxIQImbalance, bMaskDWord);
@@ -2123,7 +2123,7 @@ bool rtl92e_is_rx_stuck(struct net_device *dev)
 	}
 
 
-	SlotIndex = (priv->SilentResetRxSlotIndex++)%SilentResetRxSoltNum;
+	SlotIndex = (priv->silent_reset_rx_slot_index++)%SilentResetRxSoltNum;
 
 	if (priv->rx_ctr == RegRxCounter) {
 		priv->silent_reset_rx_stuck_event[SlotIndex] = 1;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 6da76ea16ff1..97e859425784 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -203,7 +203,7 @@ void rtl92e_set_rf_reg(struct net_device *dev, enum rf90_radio_path eRFPath,
 	if (priv->rtllib->rf_power_state != rf_on && !priv->being_init_adapter)
 		return;
 
-	if (priv->Rf_Mode == RF_OP_By_FW) {
+	if (priv->rf_mode == RF_OP_By_FW) {
 		if (BitMask != bMask12Bits) {
 			Original_Value = _rtl92e_phy_rf_fw_read(dev, eRFPath,
 								RegAddr);
@@ -240,7 +240,7 @@ u32 rtl92e_get_rf_reg(struct net_device *dev, enum rf90_radio_path eRFPath,
 	if (priv->rtllib->rf_power_state != rf_on && !priv->being_init_adapter)
 		return	0;
 	mutex_lock(&priv->rf_mutex);
-	if (priv->Rf_Mode == RF_OP_By_FW) {
+	if (priv->rf_mode == RF_OP_By_FW) {
 		Original_Value = _rtl92e_phy_rf_fw_read(dev, eRFPath, RegAddr);
 		udelay(200);
 	} else {
@@ -533,7 +533,7 @@ static bool _rtl92e_bb_config_para_file(struct net_device *dev)
 
 	_rtl92e_phy_config_bb(dev, BaseBand_Config_AGC_TAB);
 
-	if (priv->IC_Cut  > VERSION_8190_BD) {
+	if (priv->ic_cut  > VERSION_8190_BD) {
 		if (priv->rf_type == RF_2T4R)
 			dwRegValue = priv->antenna_tx_pwr_diff[2] << 8 |
 				      priv->antenna_tx_pwr_diff[1] << 4 |
@@ -886,7 +886,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				continue;
 			switch (CurrentCmd->CmdID) {
 			case CmdID_SetTxPowerLevel:
-				if (priv->IC_Cut > VERSION_8190_BD)
+				if (priv->ic_cut > VERSION_8190_BD)
 					_rtl92e_set_tx_power_level(dev,
 								   channel);
 				break;
@@ -1088,7 +1088,7 @@ static void _rtl92e_cck_tx_power_track_bw_switch(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->IC_Cut >= IC_VersionCut_D)
+	if (priv->ic_cut >= IC_VersionCut_D)
 		_rtl92e_cck_tx_power_track_bw_switch_tssi(dev);
 	else
 		_rtl92e_cck_tx_power_track_bw_switch_thermal(dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index bd524a818776..d86577277844 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -396,16 +396,16 @@ struct r8192_priv {
 
 	u32 irq_mask[2];
 
-	u8 Rf_Mode;
+	u8 rf_mode;
 	enum nic_t card_8192;
 	u8 card_8192_version;
 
 	u8 rf_type;
-	u8 IC_Cut;
+	u8 ic_cut;
 	char nick[IW_ESSID_MAX_SIZE + 1];
 	u8 check_roaming_cnt;
 
-	u32 SilentResetRxSlotIndex;
+	u32 silent_reset_rx_slot_index;
 	u32 silent_reset_rx_stuck_event[MAX_SILENT_RESET_RX_SLOT_NUM];
 
 	u16 basic_rate;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 96c45e5172bd..63be5f2872c6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -857,7 +857,7 @@ void rtl92e_dm_txpower_tracking_wq(void *data)
 				  struct r8192_priv, txpower_tracking_wq);
 	struct net_device *dev = priv->rtllib->dev;
 
-	if (priv->IC_Cut >= IC_VersionCut_D)
+	if (priv->ic_cut >= IC_VersionCut_D)
 		_rtl92e_dm_tx_power_tracking_callback_tssi(dev);
 	else
 		_rtl92e_dm_tx_power_tracking_cb_thermal(dev);
@@ -891,7 +891,7 @@ void rtl92e_dm_init_txpower_tracking(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->IC_Cut >= IC_VersionCut_D)
+	if (priv->ic_cut >= IC_VersionCut_D)
 		_rtl92e_dm_initialize_tx_power_tracking_tssi(dev);
 	else
 		_rtl92e_dm_init_tx_power_tracking_thermal(dev);
@@ -952,7 +952,7 @@ static void _rtl92e_dm_check_tx_power_tracking(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->IC_Cut >= IC_VersionCut_D)
+	if (priv->ic_cut >= IC_VersionCut_D)
 		_rtl92e_dm_check_tx_power_tracking_tssi(dev);
 	else
 		_rtl92e_dm_check_tx_power_tracking_thermal(dev);
@@ -1038,7 +1038,7 @@ void rtl92e_dm_cck_txpower_adjust(struct net_device *dev, bool binch14)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->IC_Cut >= IC_VersionCut_D)
+	if (priv->ic_cut >= IC_VersionCut_D)
 		_rtl92e_dm_cck_tx_power_adjust_tssi(dev, binch14);
 	else
 		_rtl92e_dm_cck_tx_power_adjust_thermal_meter(dev, binch14);
-- 
2.39.0

