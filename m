Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6EC70
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:39:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id l4-20020a05600c1d04b02902506f89ad2dso8580496wms.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n2VOF/6t8T7JeMLQ5ygcpvN7H+OM2r3fEaRqgqDNEFo=;
        b=peZS5FzuXtr3oQ9RpPLqTQ4DB7LgvrjNRpJEzhtW8ykQ2ZmmG7Vrbs9cmce83/5cy3
         TzLDnG/pzs0lMxCZjQJx7ICBCKxe9hwoHfxDN2VB4lyxRZ5fhjR5zt7tixICOpVUifod
         XHRfaDngoCkuFUMh0btrY0bn1DZSyiwtX6By3/wFByfrM3/g3Z5uqqg8vp/N+RubJl7V
         QknExQdSiKTKnRxHLXjN5wy5tkqFR5wTwcIJ0oMmJp4n0gItQQQUjcxk4jh37MjM+Lw2
         ps2lrHHEhKaMc/kGczq5qH3pQ5Dq5sxLyK3tdkGlee1WlOrJtLqgeivMpg+xtiDT/xWQ
         Ytjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n2VOF/6t8T7JeMLQ5ygcpvN7H+OM2r3fEaRqgqDNEFo=;
        b=TRaqsDQCCnS1468bPsbtcgU63Z7gGSPr4P+3SqT2N0/Cg31pvzLLvpCvF61QrvzHaH
         HQSmDul5coqKSNojls6zSt0LCLj3PebFSh5M0JNthO5npQtBQVbgTpgoteAfQeY2w/cY
         GV4sVBhy6EM6WgGrBbtQDDMB2TOiPJgJuRh4vPSDx8zs0Oaxr9SFKDdLpKtlcj46pBpw
         pnk3w5VpUOkQ+K1DPdO56ANBnPipS48vp3NuIeRLpSec5GQMkBa4y+W7tgrXo2yksdGz
         idKudY6oDzY+Gwfi/q4nuHZipVl5N7FMsHY/F3EPnYdKNxCbb4Ok8O9wPS8yoOGBPRav
         9FVA==
X-Gm-Message-State: AOAM5320/WTNtbcEkt2QRzwd4RcWWczCWOEUcnNkzVDYZm2PpYWmDEhE
	oXwtLsG+DBVwvIsm38W2fKB3dl8ye3vVqmmSS/0=
X-Google-Smtp-Source: ABdhPJwiAep0brjFq/rPm4G6fftgTAxQ5G5L2SnKj4HehFQ3hAHVDoqu/dhwpY2RveHpx1B718tKGg==
X-Received: by 2002:a05:600c:290:: with SMTP id 16mr5609310wmk.71.1627691985338;
        Fri, 30 Jul 2021 17:39:45 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id g138sm3829614wmg.32.2021.07.30.17.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:39:44 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/14 resent] staging: r8188eu: remove ODM_RT_TRACE calls from hal/odm_HWConfig.c
Date: Sat, 31 Jul 2021 01:39:31 +0100
Message-Id: <20210731003937.68615-9-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731003937.68615-1-phil@philpotter.co.uk>
References: <20210731003937.68615-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ODM_RT_TRACE calls from hal/odm_HWConfig.c, as by removing these
calls in this file and others, we can ultimately then remove the macro
definition itself, which does not follow best practice.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 93a91cce21ec..5f29535590cd 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -535,15 +535,11 @@ enum HAL_STATUS ODM_ConfigRFWithHeaderFile(struct odm_dm_struct *dm_odm,
 					   enum rf_radio_path content,
 					   enum rf_radio_path rfpath)
 {
-	ODM_RT_TRACE(dm_odm, ODM_COMP_INIT, ODM_DBG_LOUD, ("===>ODM_ConfigRFWithHeaderFile\n"));
 	if (dm_odm->SupportICType == ODM_RTL8188E) {
 		if (rfpath == RF_PATH_A)
 			READ_AND_CONFIG(8188E, _RadioA_1T_);
-		ODM_RT_TRACE(dm_odm, ODM_COMP_INIT, ODM_DBG_LOUD, (" ===> ODM_ConfigRFWithHeaderFile() Radio_A:Rtl8188ERadioA_1TArray\n"));
-		ODM_RT_TRACE(dm_odm, ODM_COMP_INIT, ODM_DBG_LOUD, (" ===> ODM_ConfigRFWithHeaderFile() Radio_B:Rtl8188ERadioB_1TArray\n"));
 	}
 
-	ODM_RT_TRACE(dm_odm, ODM_COMP_INIT, ODM_DBG_TRACE, ("ODM_ConfigRFWithHeaderFile: Radio No %x\n", rfpath));
 	return HAL_STATUS_SUCCESS;
 }
 
@@ -557,8 +553,6 @@ enum HAL_STATUS ODM_ConfigBBWithHeaderFile(struct odm_dm_struct *dm_odm,
 			READ_AND_CONFIG(8188E, _AGC_TAB_1T_);
 		} else if (config_tp == CONFIG_BB_PHY_REG_PG) {
 			READ_AND_CONFIG(8188E, _PHY_REG_PG_);
-			ODM_RT_TRACE(dm_odm, ODM_COMP_INIT, ODM_DBG_LOUD,
-				     (" ===> phy_ConfigBBWithHeaderFile() agc:Rtl8188EPHY_REG_PGArray\n"));
 		}
 	}
 	return HAL_STATUS_SUCCESS;
-- 
2.31.1

