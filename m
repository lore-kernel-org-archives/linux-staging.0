Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AFA134DF
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFw8oopR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-405d70d19bcso4787105e9.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697208253; x=1697813053; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vm9Boe/IQ1CKHp5Z4OotYOocbOOmHzj4fbuWIiiw6vc=;
        b=bFw8oopR5e0J4vU9XB4lps08nKe78iFx/poG4gKvgJ0S6xeAlIVpd5BtLh0WFdXzyE
         wwTRIbTymqjFEkO1WPuUKXWifF/ej4kp21bWvk/zVII0gerB0hYK9pl9n/wq1vsk8OmR
         d7j3+nF9eOiGftFd6ZS8tGWeSVB2dQPMsMebUjeCC4ejgjvXlmqyQZ2+hjHArwNPuh/j
         HgWaapzw+45LKc5VoTTPdAbSI7CGkD7F9rRSdqW1ATlNhYft/KxxQtM1SzSUqqVGlZpU
         pqUhIz3qOrAxG8iRxG0Ai2ent4ehwMtWYIih8ph2d1McWZAPOXRe7wxufoSza0uXSSrn
         +gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697208253; x=1697813053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm9Boe/IQ1CKHp5Z4OotYOocbOOmHzj4fbuWIiiw6vc=;
        b=nbi/9NJh/3CKMvGDtk1q5JzzO0uE07rh5eszwzJupMfjfTCyuE/EQge88JCTcu0qAg
         XkJBYu66ss1soBtRW74I7FKCayxKslTB9UUwLU+Xrov7tzH+BMjS6JGdKH07UwhiNEtw
         QDjRc+ToFA/7LBHeKkX0/jTg2r5cg+2RO7mgpwx8Dl50NzrZWSOlMv+/ru1Xe2Z7dOHE
         q3PbM2jp/mUOFJJ4wah40jhuD+uvVRBOZIIftXMYnts9AAVFCcWrc9afeWJqgEw9+K2s
         6dTkkhGiIeygsai+C+ei73aPL5h17BtgrYD93TGm4Z+xSPRseXJ4GoMHygE9al190fxm
         VZ/w==
X-Gm-Message-State: AOJu0YxMQmp7sQ+HEwiTUvMYwMQWxQoN9+eupfmpXTo0z+1d0YPN4O/7
	s+BvViTWDxWCBal4exnSwro=
X-Google-Smtp-Source: AGHT+IH48KHg/LzodbjMHv7fJ3mhlY9Z6dAer1u3kPbEDpMrh+GBR9WyOudn2nEe1Np50VTK4aCYNQ==
X-Received: by 2002:adf:ab49:0:b0:32d:974b:6dde with SMTP id r9-20020adfab49000000b0032d974b6ddemr2356312wrc.0.1697208252846;
        Fri, 13 Oct 2023 07:44:12 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id n14-20020a05600c4f8e00b00405bbfd5d16sm337950wmq.7.2023.10.13.07.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:44:12 -0700 (PDT)
Date: Fri, 13 Oct 2023 16:44:11 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] staging: rtl8192e: Remove unchanged variable
 dig_algorithm_switch
Message-ID: <a76d8b86f2591446a071b4f614adf628b0fe5c93.1697127817.git.philipp.g.hortmann@gmail.com>
References: <cover.1697127817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697127817.git.philipp.g.hortmann@gmail.com>

Remove variable dig_algorithm_switch as its value is set to 0 at
initialization. The equations result accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 18 ------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  2 --
 2 files changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index e69c22e5d205..0bd9211500ac 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -911,8 +911,6 @@ static void _rtl92e_dm_dig_init(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	dm_digtable.dig_algorithm_switch = 0;
-
 	dm_digtable.dig_state		= DM_STA_DIG_MAX;
 	dm_digtable.dig_highpwr_state	= DM_STA_DIG_MAX;
 	dm_digtable.cur_sta_connect_state = DIG_STA_DISCONNECT;
@@ -962,8 +960,6 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev)
 	u8 i;
 	static u8	fw_dig;
 
-	if (dm_digtable.dig_algorithm_switch)
-		fw_dig = 0;
 	if (fw_dig <= 3) {
 		for (i = 0; i < 3; i++)
 			rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x8);
@@ -980,8 +976,6 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev)
 	_rtl92e_dm_initial_gain(dev);
 	_rtl92e_dm_pd_th(dev);
 	_rtl92e_dm_cs_ratio(dev);
-	if (dm_digtable.dig_algorithm_switch)
-		dm_digtable.dig_algorithm_switch = 0;
 	dm_digtable.pre_sta_connect_state = dm_digtable.cur_sta_connect_state;
 }
 
@@ -991,10 +985,6 @@ static void _rtl92e_dm_initial_gain(struct net_device *dev)
 	u8 initial_gain = 0;
 	static u8 initialized, force_write;
 
-	if (dm_digtable.dig_algorithm_switch) {
-		initialized = 0;
-	}
-
 	if (rtllib_act_scanning(priv->rtllib, true)) {
 		force_write = 1;
 		return;
@@ -1040,10 +1030,6 @@ static void _rtl92e_dm_pd_th(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	static u8 initialized, force_write;
 
-	if (dm_digtable.dig_algorithm_switch) {
-		initialized = 0;
-	}
-
 	if (dm_digtable.pre_sta_connect_state == dm_digtable.cur_sta_connect_state) {
 		if (dm_digtable.cur_sta_connect_state == DIG_STA_CONNECT) {
 			if (dm_digtable.rssi_val >=
@@ -1100,10 +1086,6 @@ static void _rtl92e_dm_cs_ratio(struct net_device *dev)
 {
 	static u8 initialized, force_write;
 
-	if (dm_digtable.dig_algorithm_switch) {
-		initialized = 0;
-	}
-
 	if (dm_digtable.pre_sta_connect_state == dm_digtable.cur_sta_connect_state) {
 		if (dm_digtable.cur_sta_connect_state == DIG_STA_CONNECT) {
 			if (dm_digtable.rssi_val <= dm_digtable.rssi_low_thresh)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 15af490d2dcd..12b7d426b6b9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -50,8 +50,6 @@
 
 /*------------------------------Define structure----------------------------*/
 struct dig_t {
-	u8		dig_algorithm_switch;
-
 	long		rssi_low_thresh;
 	long		rssi_high_thresh;
 
-- 
2.42.0

