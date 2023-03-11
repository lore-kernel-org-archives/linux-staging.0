Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E32C7B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 21:52:57 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id o12so34450752edb.9
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 13:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678571576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SylOTguwShw07odTtBf+yZjPkOGNYCA1EPzmfLeERyE=;
        b=AbZc6dNuE0DH9mrk0BnEsbIXtG2SqvEmEZowDKThmKeW8hzqHWKHhdvM5iJyvMyb1G
         9D/KOEBqVuL4F1YlthGY0jogQao5l4kSdm8bVYeXirOt43il2Wz3zzO0qUC/kswDXGFB
         qz8w49EjaE5O/38jeukq/oxtQtVqEpglGAWTKsDZGnViQf+fC5rU1WUT8JcrRjWAoP6K
         txLDpZakyeJEn4XV1GjmtZF6xozwcghxbAN9v3rC0PllZj4LwDIU+uHYE/S5qPYiewQ7
         3HLHGueLABbbEY33Udz/BFi4pTxS/J770AHt+nuJGPNOu3TplgW9vKfRI2PIfrPTYjHb
         1oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SylOTguwShw07odTtBf+yZjPkOGNYCA1EPzmfLeERyE=;
        b=ZyihXpyRVwLkoR79rLwgSQwNbXZ6cX+PE78CqaU/c6f1piMxPImnwUZNWqfU3xcXvT
         XJpo9BEMjvJoTP7GQm8uuMP+7QkbbfB1LH+3eskmjML495pRjlQDPjK9ZvzvF+2z3NYf
         /9B7UV70ns9YWk4WEJlu5quIzajMUaEAIJsIa0XX4Fc7w8ndkS2nfUc5r3Mm7Gymh+mF
         f4BcjeY/uCQFAvcYiDlTWZCdCmxjDr5f2rD6JE55eAdTbzSIIn7/dGZKFDOMmrMTm24r
         i2B+DBgla8vwimL3I0iIuJf80WZ5WXLgj7P2cg2X0v5Yz0c6svTPn0BDlob5p6EE37BN
         cOCA==
X-Gm-Message-State: AO0yUKUU0GqaZQeC0wwbe5JFhLyGc/f03qbARW73yDnz6CZQqRoSXfQ4
	a9Uk4JcdRTXsWIxA/HS6613fmAyxpwc=
X-Google-Smtp-Source: AK7set8lyrTenEJG15id4K+NGbBsW+IlQ8cynBwrYrfBI78SIIMSrlkel1poLGPQl1iL7fp/CnL29A==
X-Received: by 2002:a17:906:5352:b0:8b1:814e:c83d with SMTP id j18-20020a170906535200b008b1814ec83dmr6343436ejo.6.1678571575854;
        Sat, 11 Mar 2023 13:52:55 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906395600b008b2aba5fb22sm1501442eje.206.2023.03.11.13.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 13:52:55 -0800 (PST)
Date: Sat, 11 Mar 2023 22:52:53 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] staging: rtl8192e: Remove unused RF90_PATH_C and ..D
 for rfHSSIPara2
Message-ID: <186f3e59e736de6fd2111e835cdb4b633ca41bbc.1678569965.git.philipp.g.hortmann@gmail.com>
References: <cover.1678569965.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678569965.git.philipp.g.hortmann@gmail.com>

Remove unused priv->phy_reg_def[RF90_PATH_C].rfHSSIPara2 and
priv->phy_reg_def[RF90_PATH_D].rfHSSIPara2.
rfHSSIPara2 is used in rtl92e_set_bb_reg which is used in:
rtl92e_config_rf (eRFPath only for 0 and 1)
_rtl92e_phy_rf_read which is used in:
rtl92e_set_rf_reg and rtl92e_get_rf_reg are used in:
rtl92e_set_bandwidth (eRFPath only for 0 and 1)
rtl92e_config_rf (eRFPath only for 0 and 1)
_rtl92e_phy_switch_channel_step (eRFPath only for 0 and 1)
_rtl92e_dm_check_tx_power_tracking_thermal (eRFPath only for 0)
rtl92e_check_bb_and_rf is used in:
rtl92e_config_rf (eRFPath only for 0 and 1)
_rtl92e_bb_config_para_file (eRFPath only for 0)
rtl92e_config_rf_path is used in:
rtl92e_config_rf (eRFPath only for 0 and 1)
Remove dead code and constants.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c    | 2 --
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index b26ea8dfd871..e3886db3bfbb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -370,8 +370,6 @@ static void _rtl92e_init_bb_rf_reg_def(struct net_device *dev)
 
 	priv->phy_reg_def[RF90_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;
 	priv->phy_reg_def[RF90_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;
-	priv->phy_reg_def[RF90_PATH_C].rfHSSIPara2 = rFPGA0_XC_HSSIParameter2;
-	priv->phy_reg_def[RF90_PATH_D].rfHSSIPara2 = rFPGA0_XD_HSSIParameter2;
 
 	priv->phy_reg_def[RF90_PATH_A].rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
 	priv->phy_reg_def[RF90_PATH_B].rfLSSIReadBack = rFPGA0_XB_LSSIReadBack;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index 28f9af71f193..e1b30fbdf8cc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -50,8 +50,6 @@
 #define rFPGA0_RFTiming2		0x814
 #define rFPGA0_XA_HSSIParameter2	0x824
 #define rFPGA0_XB_HSSIParameter2	0x82c
-#define rFPGA0_XC_HSSIParameter2	0x834
-#define rFPGA0_XD_HSSIParameter2	0x83c
 #define rFPGA0_XA_LSSIParameter		0x840
 #define rFPGA0_XB_LSSIParameter		0x844
 #define rFPGA0_RFWakeUpParameter	0x850
-- 
2.39.2

