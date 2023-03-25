Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674EF1840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:37:14 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id eh3so16443768edb.11
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ovOf0VQJbLs8pFVaHE8+gPaOdY/j18U17OR+um3GAwM=;
        b=dtQWgKIFC5MVE5WHj/tkEOoErziyY01JN1J46VXEddJz7PS+S2DBEEJSsOJ/CaTaIW
         sY19/NJH1J6atOsJs00RnHMIbUPAQlV4QpY+Fr3RkbZTyk9bu+Bz1I/NHmSr6stiiAdX
         sZRfkZIMnBMkYFz+WRi44hPFbO5NybGwdxBfVi1OzgF6QgiC/xbAF5Wg6/saDleU/J1T
         ZCrMnbBRtrlS3n6sTjbZlRTfHt5s4xanHNvHzo4InganGRiifmbbkthFv12NAC3rH1NF
         0476n8el5jTVEroOMAF4sG/bkTSYGk04kmjY/cvCRRRUTTIF3e6hKKANUKwRmFYT/BHL
         6p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovOf0VQJbLs8pFVaHE8+gPaOdY/j18U17OR+um3GAwM=;
        b=PlCwD6CtKM3/2Ssnp3py6k6WRpaGce+3EA9kDyuMrsr63gYZhi6zz3ERO1R32Fiw48
         q5JqsYS/PpoZHTwV2UkqNfOSTdt18dmRy5mx2wRZnWQ9yuowKElNnRk7NBYunPQ6A9YC
         YXAvX7pu86p/n+ZGGPh1OFPZZFRyNPuvsK7FBbAz3jIMbroXdtXQNUe9iB/J4gC0BIgP
         XA6X//mnNucN8Y4JWLpm1TEidBxcrJF9eGoUFylJl4/s8Gt5cw4PPkA2d0xCyXg2QCpe
         S0T/JsWF0upd6vD59K5fOYmgOUZfaDuykn3MTZ8AIaHGc4lt7W5kn96T5C2VEg1VoxiQ
         8BJw==
X-Gm-Message-State: AAQBX9dqyOrueaox/PM5DzSfs6SyyQcPWC8xlE1Jv/T+5Y+k2VM3Jn4t
	kvEZoEOl1/huJvDOBYwmTqc=
X-Google-Smtp-Source: AKy350bxZ93adCN4Rqg7W6VP99P4KcZ0CUV7dovWEAdh+r/CLokTDRThtGLzPtDbZ1Wcl+JFZqg6Ww==
X-Received: by 2002:a05:6402:2811:b0:502:92d:4f51 with SMTP id h17-20020a056402281100b00502092d4f51mr6903412ede.1.1679733432752;
        Sat, 25 Mar 2023 01:37:12 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id ha25-20020a170906a89900b00934212e973esm8623229ejb.198.2023.03.25.01.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:37:12 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:37:10 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] staging: rtl8192e: Remove priv->rf_chip
Message-ID: <2ce85c1a159ae376d82c19c61e694924f07d1093.1679732276.git.philipp.g.hortmann@gmail.com>
References: <cover.1679732276.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679732276.git.philipp.g.hortmann@gmail.com>

priv->rf_chip is initialized to RF_8256 and not used. Remove
initialization, variable and enum as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 10 ----------
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 1e7be321721b..a67927f0c5e3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -432,8 +432,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 
 	rtl92e_init_adaptive_rate(dev);
 
-	priv->rf_chip = RF_8256;
-
 	if (priv->reg_chnl_plan == 0xf)
 		priv->chnl_plan = priv->eeprom_chnl_plan;
 	else
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index c8816c44ca51..68ec0aeb2dd9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -129,15 +129,6 @@ enum dcmg_txcmd_op {
 	TXCMD_XXXX_CTRL,
 };
 
-enum rt_rf_type_819xu {
-	RF_TYPE_MIN = 0,
-	RF_8225,
-	RF_8256,
-	RF_8258,
-	RF_6052 = 4,
-	RF_PSEUDO_11N = 5,
-};
-
 enum rt_customer_id {
 	RT_CID_DEFAULT	  = 0,
 	RT_CID_819x_CAMEO       = 6,
@@ -221,7 +212,6 @@ struct r8192_priv {
 
 	enum rt_customer_id customer_id;
 
-	enum rt_rf_type_819xu rf_chip;
 	enum ht_channel_width current_chnl_bw;
 	struct bb_reg_definition phy_reg_def[4];
 	struct rate_adaptive rate_adaptive;
-- 
2.39.2

