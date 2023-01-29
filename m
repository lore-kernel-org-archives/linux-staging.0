Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BFB23A3
	for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 14:58:34 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id r2so8910409wrv.7
        for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kObtkesHDp3/jvTg21bOv7yEj2AdVjYtEj97EYzt4U=;
        b=nn0+dCEGm10fKkUm78VcoLjWaZpJwjB4bHUDywbWtUJCDHsf9ZMfrZn7txLxgBs9Ya
         YdPXo9SQ+k8eD1CjU27DoAvh2/vmPaoFkA277Qc0y2rg4Ewzsvr5sOk/laThLk4gAxBk
         jym2s4C2NBr4aRrilPO8hRrkt7V3l0UnqccpY4lMoecjNiGraLBAa6+B3m955BcFiqAI
         QBJfndZQBZq96BZofLXKZR/poud2Issp72OvQYWgLBpwbaVfpPy2INosxL1JHX/qWDvA
         lVcEtre89LNAim+itY+jAsdDYWfFftOJXJN7h+Co+1BY2lk8LkhBvpawJ2jsaM+LLZgo
         4NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kObtkesHDp3/jvTg21bOv7yEj2AdVjYtEj97EYzt4U=;
        b=5uKTntGtTCJIm8qyZdK+Nvb8ro/riZv2ty3QFTKI4s6Kra8uGa1leAK7Mk/aCWwhpb
         llYqVeCA+/veK6Zrx+pESn8dSxaqUX8FcIA/q5cAybUJSXftEPst9Othj9zd2vL+4oUW
         pJpgR4mp9nDl8GCIsq7x2qdt/6ks1oOb5jKgTNAZ05IT3/nDKTNcQDpgKJzPGm9vsAuG
         uPf2Rb5zWkDZhRpShTC5YVYKulEux68Sd2eE/2jzECgYNlGnyFq96d1/nU9ojRzQyoy1
         ASaNOkI5IWkt5GbHegL45zL10UtQ4AaRAltapEkI+IBt6jdo1yKqqJeuJfo46j8hc2qj
         qRLg==
X-Gm-Message-State: AO0yUKXxhyUz63FEgmSItgUocwD3bmdzSb+71HsgWz+0OMR6Sxgy+rFQ
	KxXeRStGcTLALxHxxTil5EZjS1tF5jc=
X-Google-Smtp-Source: AK7set8AHcPD4BiH1iMgc/5WOn6Ubc4u3IdJ3/2Oux877cLj7U+eeFDQzreKKiVTdpHqUxfPGzC7Tg==
X-Received: by 2002:adf:ba4a:0:b0:2bf:dfd5:98c9 with SMTP id t10-20020adfba4a000000b002bfdfd598c9mr974249wrg.7.1675004312434;
        Sun, 29 Jan 2023 06:58:32 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c2e0400b003dc4ecfc4d7sm3892938wmf.29.2023.01.29.06.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:58:31 -0800 (PST)
Date: Sun, 29 Jan 2023 15:58:30 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] staging: rtl8192e: Rename BaseBand_Config_PHY_REG and
 BaseBand_Config_AGC_TAB
Message-ID: <6d26690c7c2c68cc7c766c981293bd8e40999ed0.1675003608.git.philipp.g.hortmann@gmail.com>
References: <cover.1675003608.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675003608.git.philipp.g.hortmann@gmail.com>

Rename constants BaseBand_Config_PHY_REG to BB_CONFIG_PHY_REG and
BaseBand_Config_AGC_TAB to BB_CONFIG_AGC_TAB to avoid CamelCase which is
not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h  | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 3e223151d4b7..858cfc203f13 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -8,8 +8,8 @@
 #define R8180_HW
 
 enum baseband_config {
-	BaseBand_Config_PHY_REG = 0,
-	BaseBand_Config_AGC_TAB = 1,
+	BB_CONFIG_PHY_REG = 0,
+	BB_CONFIG_AGC_TAB = 1,
 };
 
 #define	RTL8187_REQT_READ	0xc0
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 456b7ca73073..cbda027656dc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -342,13 +342,13 @@ static void _rtl92e_phy_config_bb(struct net_device *dev, u8 ConfigType)
 		Rtl819XPHY_REGArray_Table = Rtl819XPHY_REG_1T2RArray;
 	}
 
-	if (ConfigType == BaseBand_Config_PHY_REG) {
+	if (ConfigType == BB_CONFIG_PHY_REG) {
 		for (i = 0; i < PHY_REGArrayLen; i += 2) {
 			rtl92e_set_bb_reg(dev, Rtl819XPHY_REGArray_Table[i],
 					  bMaskDWord,
 					  Rtl819XPHY_REGArray_Table[i+1]);
 		}
-	} else if (ConfigType == BaseBand_Config_AGC_TAB) {
+	} else if (ConfigType == BB_CONFIG_AGC_TAB) {
 		for (i = 0; i < AGCTAB_ArrayLen; i += 2) {
 			rtl92e_set_bb_reg(dev, Rtl819XAGCTAB_Array_Table[i],
 					  bMaskDWord,
@@ -526,12 +526,12 @@ static bool _rtl92e_bb_config_para_file(struct net_device *dev)
 			return rtStatus;
 	}
 	rtl92e_set_bb_reg(dev, rFPGA0_RFMOD, bCCKEn|bOFDMEn, 0x0);
-	_rtl92e_phy_config_bb(dev, BaseBand_Config_PHY_REG);
+	_rtl92e_phy_config_bb(dev, BB_CONFIG_PHY_REG);
 
 	dwRegValue = rtl92e_readl(dev, CPU_GEN);
 	rtl92e_writel(dev, CPU_GEN, (dwRegValue|CPU_GEN_BB_RST));
 
-	_rtl92e_phy_config_bb(dev, BaseBand_Config_AGC_TAB);
+	_rtl92e_phy_config_bb(dev, BB_CONFIG_AGC_TAB);
 
 	if (priv->ic_cut  > VERSION_8190_BD) {
 		if (priv->rf_type == RF_2T4R)
-- 
2.39.1

