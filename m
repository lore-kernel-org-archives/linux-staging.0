Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD2B1DA38
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 17:53:18 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-52f1ece3a76so4651205a12.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696269197; x=1696873997; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2MaU5uH1ibxilRt8t8r3fgvnKByywWaocqW4N/d4Gzk=;
        b=jjbQEFAOrjO+OsC37tsjjxWfJ5DgeQcqcvEuWFx52xI2OWN0jGtOyde/HFr7psoNUC
         5XxodRodkoL5bjVJiqOxgNUrY4BciFRdbSg2uE6YZfdbfuIMzGHh9QZTDLOdywCKXNQy
         XYLieyWkiCENI73YDdcD9T3FKb1gDCG+Ooic9fY9lL3LAQBG0HzBWFKz8fR6E/qjQ0V1
         uKKeZ91dgX57dOZMr3fZPJzXYmQpgRMdc4vGqZZBxW9YccDnmO6ypYAhz0WPb2Skxm/v
         zRBwuZzjLtPLhJiThFWz70NMNSmII3hsTm5XdawmKB+IXRLGyLyV9hL7D84ptchSZQzs
         xPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269197; x=1696873997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MaU5uH1ibxilRt8t8r3fgvnKByywWaocqW4N/d4Gzk=;
        b=QzkbnYPvuiiqZVLTEZqSXQzpI84WfvIlLFkEiBXOwj6ekT0JrhfxjHtvQNNex0xe4D
         4y0xZWFyzz4o1YWIYt9unaouQhK4jTSS1n6K8OpSVLG3/T9gJ+BP+PTIqSmV+ziaICMF
         XA4PGb6gKoGdlxWwlVPg2n/Dp0oIHDJv2NYU3DL0gB9tIrcsQ+vYOfev1BDRUbVRg8sW
         a83e1GE54FZ57bibzqKgdYBedLWCLDVGNqiqtioIS95L6Til3uFmI0IdNDqeYUI/+MX7
         PIPon0mzURuRq9tpUtxcBPo+eM2+ircKh7dRD3PbAc/vQPqz0E/Khmepk87IiAKKMf2r
         bCKg==
X-Gm-Message-State: AOJu0Ywxv0bv1BeFvpSyN43mkDl15Mz/XtNk2zqlnZhPOp4iqF+I+tgb
	5icnbMLuEu5UcxJ+809SibrLgiAnkbo=
X-Google-Smtp-Source: AGHT+IElZXi/rxyi2s/Mir1JaEEMtjtCsyT10UzRXdO6LgYTAhGKUql4RrYmRq8A6fUBMu4KSMxyqw==
X-Received: by 2002:a17:906:25d:b0:9ae:6552:4af6 with SMTP id 29-20020a170906025d00b009ae65524af6mr10156736ejl.1.1696269196905;
        Mon, 02 Oct 2023 10:53:16 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090685c800b009ad7fc17b2asm17457685ejy.224.2023.10.02.10.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:53:16 -0700 (PDT)
Date: Mon, 2 Oct 2023 19:53:15 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] staging: rtl8192e: Remove unused function
 rtl92e_dm_restore_state()
Message-ID: <be2293f1e50993ae473130403b6150d04427576e.1696266964.git.philipp.g.hortmann@gmail.com>
References: <cover.1696266964.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696266964.git.philipp.g.hortmann@gmail.com>

Remove rtl92e_dm_restore_state() as it is unused. Remove called functions
_rtl92e_dm_tx_power_reset_recovery() and
_rtl92e_dm_bb_initialgain_restore() as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 59 ----------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  1 -
 2 files changed, 60 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 5217ace3f140..8f5e4b932350 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -161,7 +161,6 @@ static	void	_rtl92e_dm_bandwidth_autoswitch(struct net_device *dev);
 
 static	void	_rtl92e_dm_check_tx_power_tracking(struct net_device *dev);
 
-static void _rtl92e_dm_bb_initialgain_restore(struct net_device *dev);
 static void _rtl92e_dm_dig_init(struct net_device *dev);
 static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev);
 static void _rtl92e_dm_ctrl_initgain_byrssi_highpwr(struct net_device *dev);
@@ -915,64 +914,6 @@ void rtl92e_dm_cck_txpower_adjust(struct net_device *dev, bool binch14)
 		_rtl92e_dm_cck_tx_power_adjust_thermal_meter(dev, binch14);
 }
 
-static void _rtl92e_dm_tx_power_reset_recovery(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	rtl92e_set_bb_reg(dev, rOFDM0_XATxIQImbalance, bMaskDWord,
-			  dm_tx_bb_gain[priv->rfa_txpowertrackingindex]);
-	rtl92e_dm_cck_txpower_adjust(dev, priv->bcck_in_ch14);
-
-	rtl92e_set_bb_reg(dev, rOFDM0_XCTxIQImbalance, bMaskDWord,
-			  dm_tx_bb_gain[priv->rfc_txpowertrackingindex]);
-}
-
-void rtl92e_dm_restore_state(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	u32	reg_ratr = priv->rate_adaptive.last_ratr;
-	u32 ratr_value;
-
-	if (!priv->up)
-		return;
-
-	if (priv->rate_adaptive.rate_adaptive_disabled)
-		return;
-	if (priv->rtllib->mode != WIRELESS_MODE_N_24G)
-		return;
-	ratr_value = reg_ratr;
-	ratr_value &= ~(RATE_ALL_OFDM_2SS);
-	rtl92e_writel(dev, RATR0, ratr_value);
-	rtl92e_writeb(dev, UFWP, 1);
-	if (priv->tx_pwr_tracking_init && priv->btxpower_tracking)
-		_rtl92e_dm_tx_power_reset_recovery(dev);
-
-	_rtl92e_dm_bb_initialgain_restore(dev);
-}
-
-static void _rtl92e_dm_bb_initialgain_restore(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	u32 bit_mask = 0x7f;
-
-	if (dm_digtable.dig_algorithm == DIG_ALGO_BY_RSSI)
-		return;
-
-	rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x8);
-	rtl92e_set_bb_reg(dev, rOFDM0_XAAGCCore1, bit_mask,
-			  (u32)priv->initgain_backup.xaagccore1);
-	rtl92e_set_bb_reg(dev, rOFDM0_XBAGCCore1, bit_mask,
-			  (u32)priv->initgain_backup.xbagccore1);
-	rtl92e_set_bb_reg(dev, rOFDM0_XCAGCCore1, bit_mask,
-			  (u32)priv->initgain_backup.xcagccore1);
-	rtl92e_set_bb_reg(dev, rOFDM0_XDAGCCore1, bit_mask,
-			  (u32)priv->initgain_backup.xdagccore1);
-	bit_mask  = bMaskByte2;
-	rtl92e_set_bb_reg(dev, rCCK0_CCA, bit_mask,
-			  (u32)priv->initgain_backup.cca);
-	rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x1);
-}
-
 static void _rtl92e_dm_dig_init(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 9085a6454cbc..5ae2bf467158 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -178,7 +178,6 @@ void    rtl92e_dm_txpower_tracking_wq(void *data);
 
 void rtl92e_dm_cck_txpower_adjust(struct net_device *dev, bool binch14);
 
-void    rtl92e_dm_restore_state(struct net_device *dev);
 void    rtl92e_dm_init_edca_turbo(struct net_device *dev);
 void    rtl92e_dm_rf_pathcheck_wq(void *data);
 void rtl92e_dm_init_txpower_tracking(struct net_device *dev);
-- 
2.42.0

