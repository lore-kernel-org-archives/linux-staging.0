Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698F2C11CF
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161042; cv=none; b=tdPvNEW6m8uDVh3wA7wVzzKG3IqasNGJ93Z8/axDZgxMM2WwL8D7wkuo04vZwRe4Js9K1rT6nrXgzbuTxWqYODFUkLLLEYOpqJS/W0BDExPLKYR6wFRcHA2R+aQyKELraGj5DE1YeRXq2m7mMS6/mQCW+SQY6ZQpMgezGWToKpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161042; c=relaxed/simple;
	bh=K3e3dnefZ8/RlIqQHbNniXFpMlTitiztd78IhxO8lVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r1td3ojQG06v7WlBAgIEMGT4QUE86iGZjgEFjkKCtQUnnppBxGzimhmAzkQVGiwOtbnGnL6VVFtZ8tYcuUhockhoMUrxaRLkLOTm49oOnglucIqmzZaaV7bi4FDPq4jzslpHIyvhLdnS+bOzgZtICID8kX4BYbp7WqkTzKNQNgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pUyTpyOK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pUyTpyOK"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aea0fff535so2966874e87.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 07:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785161037; x=1785765837; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s+Tn4HTlZ3/styb7vy8HClV5wDXtpEStYadcdkObfR0=;
        b=pUyTpyOKyanBbuhDcmagzsBkmdTPEsKqQdGoX7JXFwzFeG9EqYoiEQb5EbHIzpZBM6
         xFfRAJi62TIX1ol+Ttr6cpF3DB5ODNE9NJIy6YGfCnWOZ+jjOlAT8cOUAwqKoHZpqHAb
         pF+iduZfY02zp7w+Lu0GIqVCvYgwjRAvIAGShpaI5kHD5fB2eXZ1Yq8Ouq0PZbFF6ffj
         V8DoKdWyyFh13rPNei+qXUHzNpJsBL7wzdcErEdB8rjjhs1uQD6qSaRql/pa0OSS/Lrv
         ejP0A/G81G16czlonNDVFbIBw9Qh5u6WhKHaeHJNzo9R2mMmHbvAsscmdbiXCqeEid/Y
         4nPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161037; x=1785765837;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s+Tn4HTlZ3/styb7vy8HClV5wDXtpEStYadcdkObfR0=;
        b=dS87oFOWCFuZsj23Rrx/AC5Z+VpscuJrSANpbDrQ2yye/06YUySEM6vuzjr+QkHW/D
         XwdNUiSEQY1ulVLAs0xYBSmawHUtxIDxrlLMQPG4fj+dF52vG0L1RaS8fYz6tYGpUKDe
         9mf8nExwJgHCSO92s/rCwoJIOmQfb5tpdpxV2JlsEitSBaTdjudv0RmcqIIpF+G0B5/S
         yr5kgUMK9ckyLEtLc0+1Y+RL5n5kPQEACnp4OlX3+D9S1rF+XofFKniEzd6kQMHB6l/q
         H6NSAggwQ95fIo1tecPJE5Ik0k/MfHf2crWz96eYtJ4Vt/83ZH3lzxNNXroc0fpss6Zk
         A4Mw==
X-Gm-Message-State: AOJu0YxwLOTGRLN4cbvcXKTrfxX69FUJVqZajgc/1LW3GlSs5HCXsv75
	WHwEhMFIjAnIgoSmc6ub/uqZiZXq5xlgGFO/E/VhRxYrIZdcYlgzv/59
X-Gm-Gg: AR+sD11bKFmdR3iN+l9vC+Sk5rGP+6HZFKisdQO9CQTPed/JB6Rq5m/1XhzEo/wEOYZ
	RNtrut7mxlQiCEQ3F3Sp562jXa9zwLVt1e33+Q00lLZZFIQ8tUTDUgcEi5bDlfZoQeZxon80KMP
	I9u+2Yd3phx5LeQERuiiwjFAT5g4nsa+jjTpoewUwceBAzK5wE6F5o9V4YCXjOw0HwVHZGrRY9i
	pgKD6ZARWng1uVMtAVkWSRytefn3r8ndCSOMmCBD2PmzvpoWe1hRhWkTQPB2M1kXQUdPtWLBKix
	9CDyptnPW5GyrPhUpmxl29gdj4kIV3gvKTudjpIa1SR+XAUR+OISj3DtoY6TcYXFHAvFpkVXuCE
	2WF3og7beLZEcXXe9GkgYvXgfQx9L1ZxkPEiCSwBv27Yvih1qsMJisfWxLVk02re9oizwTkcY8u
	DmQCVBoPG6zQ==
X-Received: by 2002:a05:6512:3b9c:b0:5ae:b86b:71f4 with SMTP id 2adb3069b0e04-5b2c1b3fbabmr1575383e87.39.1785161037252;
        Mon, 27 Jul 2026 07:03:57 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f22262dcdsm12318201fa.37.2026.07.27.07.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:03:56 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Mon, 27 Jul 2026 17:03:41 +0300
Subject: [PATCH] staging: rtl8723bs: remove unused enumerations
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-rtl8723bs_rmove_enums-v1-1-7974aab6c86e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA1oKkZ7FSliklFHapQZlYJ49
 6Z1+Rb/nyDIhALP5ATGg4SWEJGnCbixCwMq8tGgM11mRhvF27sy+mGl5Xk5sMWwz6K6IrfeF1X
 pfA2xXRl7+vy/zeu27HZCt/1mcF1fCI8UsnkAAAA=
X-Change-ID: 20260727-rtl8723bs_rmove_enums-a41bdd486cd9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785161035; l=4923;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=K3e3dnefZ8/RlIqQHbNniXFpMlTitiztd78IhxO8lVo=;
 b=B/R8aXUj/hDsY0Hf7b1w+dAkDtB1UVAl4DzEqSpM3zTgNcIt7iQ2BG/n5uiEGfUdKj1tQRK4e
 fmUZLwgaw6TDdoMIB84h/06XKcKgN0KiJSn1UFJHCXL9YDXapDqnBuP
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These enumerations and their values are never used anywhere else; remove
them.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h          |  7 -----
 drivers/staging/rtl8723bs/hal/odm_DIG.h      |  5 ----
 drivers/staging/rtl8723bs/include/hal_intf.h |  5 ----
 drivers/staging/rtl8723bs/include/wifi.h     | 41 ----------------------------
 4 files changed, 58 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index ee263790b32b..a20b48660e63 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -942,13 +942,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	#endif
 };
 
-enum odm_rf_content {
-	odm_radioa_txt = 0x1000,
-	odm_radiob_txt = 0x1001,
-	odm_radioc_txt = 0x1002,
-	odm_radiod_txt = 0x1003
-};
-
 enum ODM_BB_Config_Type {
 	CONFIG_BB_PHY_REG,
 	CONFIG_BB_AGC_TAB,
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.h b/drivers/staging/rtl8723bs/hal/odm_DIG.h
index 032c4abae49b..5517ef79bdf5 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.h
@@ -77,11 +77,6 @@ struct  false_ALARM_STATISTICS {
 	u32 Cnt_BW_LSC; /* Gary */
 };
 
-enum ODM_Pause_DIG_TYPE {
-	ODM_PAUSE_DIG = BIT(0),
-	ODM_RESUME_DIG = BIT(1)
-};
-
 #define		DM_DIG_THRESH_HIGH			40
 #define		DM_DIG_THRESH_LOW			35
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 8a85e8419e47..d72fc4326a19 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -153,11 +153,6 @@ enum hal_odm_variable {
 	HAL_ODM_NOISE_MONITOR,
 };
 
-enum hal_intf_ps_func {
-	HAL_USB_SELECT_SUSPEND,
-	HAL_MAX_ID,
-};
-
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 #define RF_CHANGE_BY_INIT	0
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index d5132bc4280a..48cc31c9125a 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -397,47 +397,6 @@ struct ADDBA_request {
 /* 	WPS attribute ID */
 #define WPS_ATTR_SELECTED_REGISTRAR	0x1041
 
-/* 	=====================P2P Section ===================== */
-enum p2p_role {
-	P2P_ROLE_DISABLE = 0,
-	P2P_ROLE_DEVICE = 1,
-	P2P_ROLE_CLIENT = 2,
-	P2P_ROLE_GO = 3
-};
-
-enum p2p_state {
-	P2P_STATE_NONE = 0,							/* 	P2P disable */
-	P2P_STATE_IDLE = 1,								/* 	P2P had enabled and do nothing */
-	P2P_STATE_LISTEN = 2,							/* 	In pure listen state */
-	P2P_STATE_SCAN = 3,							/* 	In scan phase */
-	P2P_STATE_FIND_PHASE_LISTEN = 4,				/* 	In the listen state of find phase */
-	P2P_STATE_FIND_PHASE_SEARCH = 5,				/* 	In the search state of find phase */
-	P2P_STATE_TX_PROVISION_DIS_REQ = 6,			/* 	In P2P provisioning discovery */
-	P2P_STATE_RX_PROVISION_DIS_RSP = 7,
-	P2P_STATE_RX_PROVISION_DIS_REQ = 8,
-	P2P_STATE_GONEGO_ING = 9,						/* 	Doing the group owner negotiation handshake */
-	P2P_STATE_GONEGO_OK = 10,						/* 	finish the group negotiation handshake with success */
-	P2P_STATE_GONEGO_FAIL = 11,					/* 	finish the group negotiation handshake with failure */
-	P2P_STATE_RECV_INVITE_REQ_MATCH = 12,		/* 	receiving the P2P Invitation request and match with the profile. */
-	P2P_STATE_PROVISIONING_ING = 13,				/* 	Doing the P2P WPS */
-	P2P_STATE_PROVISIONING_DONE = 14,			/* 	Finish the P2P WPS */
-	P2P_STATE_TX_INVITE_REQ = 15,					/* 	Transmit the P2P Invitation request */
-	P2P_STATE_RX_INVITE_RESP_OK = 16,				/* 	Receiving the P2P Invitation response */
-	P2P_STATE_RECV_INVITE_REQ_DISMATCH = 17,	/* 	receiving the P2P Invitation request and mismatch with the profile. */
-	P2P_STATE_RECV_INVITE_REQ_GO = 18,			/* 	receiving the P2P Invitation request and this wifi is GO. */
-	P2P_STATE_RECV_INVITE_REQ_JOIN = 19,			/* 	receiving the P2P Invitation request to join an existing P2P Group. */
-	P2P_STATE_RX_INVITE_RESP_FAIL = 20,			/* 	recveing the P2P Invitation response with failure */
-	P2P_STATE_RX_INFOR_NOREADY = 21,			/*  receiving p2p negotiation response with information is not available */
-	P2P_STATE_TX_INFOR_NOREADY = 22,			/*  sending p2p negotiation response with information is not available */
-};
-
-enum p2p_wpsinfo {
-	P2P_NO_WPSINFO						= 0,
-	P2P_GOT_WPSINFO_PEER_DISPLAY_PIN	= 1,
-	P2P_GOT_WPSINFO_SELF_DISPLAY_PIN	= 2,
-	P2P_GOT_WPSINFO_PBC					= 3,
-};
-
 #define IP_MCAST_MAC(mac)		((mac[0] == 0x01) && (mac[1] == 0x00) && (mac[2] == 0x5e))
 #define ICMPV6_MCAST_MAC(mac)	((mac[0] == 0x33) && (mac[1] == 0x33) && (mac[2] != 0xff))
 

---
base-commit: cb08dcd0a896c3ac8073a57296f2377b106c35b4
change-id: 20260727-rtl8723bs_rmove_enums-a41bdd486cd9

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

