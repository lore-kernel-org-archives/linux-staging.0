Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9293CCF9
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:34:04 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-98273ae42d0so50543766b.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361643; x=1696966443; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KcpwhoTF72QmuvfU2aA3vEoxhzziqn/FfyNb0Sy2saM=;
        b=Vxv9jH4pfA4xz1r2rjZA1IGiesfFo4mvNBuj6myLtlxNKv4VPuFBTBkHGwcAEZg2GZ
         Qn7dIcDLF3EM1/LV6sKpgcbkYhRwPSH+sR7/dzSSM2O/tOuWprMOLcRnPXh80ZqHAe3Q
         aPZuDJu/Qoggi9a/N+IamQPdN2zq3q93tKEPJTeqYdeTOZrPWbYqHgtHlIpVmagIJ6qa
         UlqfPvegn1NlJQfZoIppnCnGKjWYI2ol6J6MCNP23yzrroNgvPWI2L3U3LmhoYMrGZ8L
         Z5bwruudpahf1H45fhccj8YK9/qlViLcCUyV8yXuEAALtnqX/LF5q9GsRzvT2Fsusf+R
         rBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361643; x=1696966443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcpwhoTF72QmuvfU2aA3vEoxhzziqn/FfyNb0Sy2saM=;
        b=FNOR/ohHseYm/hmxP6qEIIe+0fYl/vnBBZ0tpaK03NIYpLWxMNanlddN50wHrIG4p3
         AElHcBf/cMLSoqryBk8Hp+BQ7Y2TwYMZlgbuIhvRiqQQknNuLhEypFIDWN6kgKeQzwxM
         wjW5dcSlHEseD1TTXlA55Pper9KreQTm8EBoXwP9iMDuL4RxDrXyY1lKI45hWfkwLb20
         Hmo41akPtyFlLHiLwwb4Cd7PIEeyvRRnTiCgmtlbGw6LXDCRcDKtDHZauteHSl75V/eF
         4PsO3dvNghZYNmte3itxsbG0cUwy3xmCcA8yW2uz+WceZRuamWE5IbLgqLv7NT1Ptr0P
         5/UQ==
X-Gm-Message-State: AOJu0Ywrf+vylafoshY5wZ82HhYqEyFJpPiMAB9arf9SFNjV6DcvUcRe
	WadhlB2M9GPn8Fq7mu6TwM4=
X-Google-Smtp-Source: AGHT+IF11dzwlLWibdoHdDk0TOJiYh1+h9dOvseHZbz6e77UFQaFgOVSAlaqZVn4inZlch9EJX2rUQ==
X-Received: by 2002:a17:906:7496:b0:9a5:ce62:6e1a with SMTP id e22-20020a170906749600b009a5ce626e1amr125955ejl.1.1696361642874;
        Tue, 03 Oct 2023 12:34:02 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id g5-20020a170906594500b009ae6a6451fdsm1530253ejr.35.2023.10.03.12.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:34:02 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:34:01 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] staging: rtl8192e: Remove constant variable
 promiscuous_on
Message-ID: <07936bcc6a426d6f6d74bece2970ab6028abef44.1696360404.git.philipp.g.hortmann@gmail.com>
References: <cover.1696360403.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696360403.git.philipp.g.hortmann@gmail.com>

Remove variable promiscuous_on as it is set to 0 and unchanged. The
equation results accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  5 +----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  1 -
 drivers/staging/rtl8192e/rtllib.h             |  5 -----
 drivers/staging/rtl8192e/rtllib_rx.c          | 22 +++++++++----------
 4 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 6cfc2254487b..e343e10e011a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -706,10 +706,7 @@ void rtl92e_link_change(struct net_device *dev)
 
 		reg = rtl92e_readl(dev, RCR);
 		if (priv->rtllib->link_state == MAC80211_LINKED) {
-			if (ieee->intel_promiscuous_md_info.promiscuous_on)
-				;
-			else
-				priv->receive_config = reg |= RCR_CBSSID;
+			priv->receive_config = reg |= RCR_CBSSID;
 		} else {
 			priv->receive_config = reg &= ~RCR_CBSSID;
 		}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index f15f73be41a2..ef17472bea05 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -740,7 +740,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->rtllib->mode = WIRELESS_MODE_AUTO;
 	priv->rtllib->iw_mode = IW_MODE_INFRA;
 	priv->rtllib->net_promiscuous_md = false;
-	priv->rtllib->intel_promiscuous_md_info.promiscuous_on = false;
 	priv->rtllib->ieee_up = 0;
 	priv->retry_rts = DEFAULT_RETRY_RTS;
 	priv->retry_data = DEFAULT_RETRY_DATA;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 748ae8d35c1a..97bb00bdbf4d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1175,10 +1175,6 @@ struct rt_pmkid_list {
 	u8 bUsed;
 };
 
-struct rt_intel_promisc_mode {
-	bool promiscuous_on;
-};
-
 /*************** DRIVER STATUS   *****/
 #define STATUS_SCANNING			0
 /*************** DRIVER STATUS   *****/
@@ -1258,7 +1254,6 @@ struct rtllib_device {
 
 	int iw_mode; /* operating mode (IW_MODE_*) */
 	bool net_promiscuous_md;
-	struct rt_intel_promisc_mode intel_promiscuous_md_info;
 
 	spinlock_t lock;
 	spinlock_t wpax_suitlist_lock;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 1086dd0809be..f03ec5f53b34 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -959,18 +959,16 @@ static int rtllib_rx_data_filter(struct rtllib_device *ieee, struct ieee80211_hd
 	/* Nullfunc frames may have PS-bit set, so they must be passed to
 	 * hostap_handle_sta_rx() before being dropped here.
 	 */
-	if (!ieee->intel_promiscuous_md_info.promiscuous_on) {
-		if (stype != IEEE80211_STYPE_DATA &&
-		    stype != IEEE80211_STYPE_DATA_CFACK &&
-		    stype != IEEE80211_STYPE_DATA_CFPOLL &&
-		    stype != IEEE80211_STYPE_DATA_CFACKPOLL &&
-		    stype != IEEE80211_STYPE_QOS_DATA) {
-			if (stype != IEEE80211_STYPE_NULLFUNC)
-				netdev_dbg(ieee->dev,
-					   "RX: dropped data frame with no data (type=0x%02x, subtype=0x%02x)\n",
-					   type, stype);
-			return -1;
-		}
+	if (stype != IEEE80211_STYPE_DATA &&
+	    stype != IEEE80211_STYPE_DATA_CFACK &&
+	    stype != IEEE80211_STYPE_DATA_CFPOLL &&
+	    stype != IEEE80211_STYPE_DATA_CFACKPOLL &&
+	    stype != IEEE80211_STYPE_QOS_DATA) {
+		if (stype != IEEE80211_STYPE_NULLFUNC)
+			netdev_dbg(ieee->dev,
+				   "RX: dropped data frame with no data (type=0x%02x, subtype=0x%02x)\n",
+				   type, stype);
+		return -1;
 	}
 
 	/* packets from our adapter are dropped (echo) */
-- 
2.42.0

