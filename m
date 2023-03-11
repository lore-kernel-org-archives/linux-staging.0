Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3407B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 21:52:50 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id cy23so34351665edb.12
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 13:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678571568; x=1681163568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RyEajtXCKm6Ql9H6gCOuQjRwjcr6+UWMUOeAMqv/92A=;
        b=SIy/GjaY1a77lyDckpFkDXDtsTsXvwKdxAdSL9w6MIK9ZcJf6Ze/rYWKK5bodNCpP7
         SDZFUNs1ntMFhPV/M6bPLvmtlRXKwIvDM5lUD3MzAcHVtyO/5x6VO2swwSnFFqAVQpWw
         bLp4KIJgGx1Ux5h21LAsAcibn0W4Tu5cr13khx77MBtn6llKqIbbQCddAMb0ia1qpbLg
         vq607BohABsjQqLto09qYTXiZVGyyV3WLBian0jcJdKa3Tyel26naQ90pDhM+C29mPfW
         VZKCK3+l5wC3uqJ2CnU1o5UGzJYrDeSOpM6SONsqrzEl2pXMY73d347so8hDD/k5Y174
         vsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571568; x=1681163568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyEajtXCKm6Ql9H6gCOuQjRwjcr6+UWMUOeAMqv/92A=;
        b=7qfAZp874sO7I2L5asuuPufmddh8m8rplvO0+nzPAWzsDJLWxps3fSTyDzkCxE0qFF
         9Mp4Cbv9yuAsyGfYUi/1+3WdJsz6JzFaGUn028rjFKBfahGttuJT/DhKKW6I6kbiXRZM
         HrZ4UBZCdg441o6lnrbAkjN9Pn59AGjB3B+pRFE942CTMJ73E+z5ptQpTDZDEWrN/ZJI
         jgrNZbCdDR45ScoD/j8BakSwxTHerJXOxlhFRyBhn0jvyD9jGfKCcS7OjKyPQeg6Ns7C
         mE/MzbrDrM9kkdsRLKmAO2mir7cp/EXiEGQnz6Tv3CjYkz0BfyjdYhUGaJH0rfXg0XNF
         6/WA==
X-Gm-Message-State: AO0yUKU3h/hqhUZ9b3UeDBRcADe+oVrQEvv2o88xUNQYxGI8rcomN7jE
	QTAdMv/aj+zbAemZxqtZWHg=
X-Google-Smtp-Source: AK7set+DeLK3epRnJ1IoskS86bjOn3azl461Sqqzs9fpCLoU1bIAAK68n+2VIcBXGiPam7J2rGdEZA==
X-Received: by 2002:a17:906:19c:b0:8d3:be84:1cc6 with SMTP id 28-20020a170906019c00b008d3be841cc6mr9843663ejb.3.1678571568225;
        Sat, 11 Mar 2023 13:52:48 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id lc22-20020a170906dff600b00922b009fc79sm746203ejc.164.2023.03.11.13.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 13:52:47 -0800 (PST)
Date: Sat, 11 Mar 2023 22:52:46 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] staging: rtl8192e: Remove unused RF90_PATH_C and ..D
 for rfLSSIReadBack
Message-ID: <622777b394a896b6db08eb7faeb455e5cbeae93f.1678569965.git.philipp.g.hortmann@gmail.com>
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

Remove unused priv->phy_reg_def[RF90_PATH_C].rfLSSIReadBack and
priv->phy_reg_def[RF90_PATH_D].rfLSSIReadBack.
rfLSSIReadBack is used in:
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
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c    | 3 ---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index fe12df93bc60..b26ea8dfd871 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -375,9 +375,6 @@ static void _rtl92e_init_bb_rf_reg_def(struct net_device *dev)
 
 	priv->phy_reg_def[RF90_PATH_A].rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
 	priv->phy_reg_def[RF90_PATH_B].rfLSSIReadBack = rFPGA0_XB_LSSIReadBack;
-	priv->phy_reg_def[RF90_PATH_C].rfLSSIReadBack = rFPGA0_XC_LSSIReadBack;
-	priv->phy_reg_def[RF90_PATH_D].rfLSSIReadBack = rFPGA0_XD_LSSIReadBack;
-
 }
 
 bool rtl92e_check_bb_and_rf(struct net_device *dev, enum hw90_block CheckBlock,
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index fe05a94561e8..28f9af71f193 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -65,8 +65,6 @@
 #define rFPGA0_AnalogParameter4		0x88c
 #define rFPGA0_XA_LSSIReadBack		0x8a0
 #define rFPGA0_XB_LSSIReadBack		0x8a4
-#define rFPGA0_XC_LSSIReadBack		0x8a8
-#define rFPGA0_XD_LSSIReadBack		0x8ac
 #define rFPGA0_PSDReport		0x8b4
 
 /* Page 9 - RF mode & OFDM TxSC */
-- 
2.39.2

