Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B43486
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:24:02 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n12so13364398wrr.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n2VOF/6t8T7JeMLQ5ygcpvN7H+OM2r3fEaRqgqDNEFo=;
        b=V1Z3GrSE6R7yKM5Jj5/NFf/SVRqtQGh4fdhRYCKCpTBtrtH36XFnXDksnRG2uqGuev
         wCkVUxlFIVYs5pUmYv3kR6vLodbTbVVmELh9Qn7f4l/cJexQzsnk4VMGMr6+1tt0m3VJ
         Yi+V22zFlTNOrMX+q8JcFpgg9z30a1V39fKVUOW3BoscLoD+8h4DDlteTNbBJAad2gT2
         S0UHWXjd1d72obEXl9L2LYbM3b5MML8Jqhq1Gtl2XMz5MGYd374UyJ9kfmH8Yd1Akr46
         +jlagO8W5fefwLMq5AxQtRdkoF2PWbX4R9tWVxrxDqf7LnvM1CI9aDcC8g+xpMe/s+nG
         2b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n2VOF/6t8T7JeMLQ5ygcpvN7H+OM2r3fEaRqgqDNEFo=;
        b=tZvezBTKa1C8GG02+wKDj6nF6FCvf9h+CxVmE7jbxO4rlVxizstSFEDq2nl/yuyTIW
         oy4srm4Y1CA9lVHOm89gaAbfZfX+o49GckB/LBBkbr4/qV6fs8GGNuacaoUMxRbGwoGs
         u9UJwBBdgBc6WEHL+1PFeXCF/yUu8j90syq+R5PeMQtSc8gpYR7kHfEhYuCzJgq85rg/
         g+Oy4JPkv7wFH/Zu1h+izsE+vUjbPD/30POywIOiiFyuQ9oK3mU6WQolDYim4mOAJ4G3
         VTQRnHrTC+V+v5rNkR3UTNvIDwJN8uQWq3zFjftHjS+5k0RCDUDeYQhloqmHGAEtbHmR
         BgHA==
X-Gm-Message-State: AOAM530yfh3SeE5HpattFa62N5PbOXmLcB8TqbrPwyGsJhZ2Utz9X11M
	fuOJD49KdjjAd88wQB6pvXQ7iA==
X-Google-Smtp-Source: ABdhPJxkN5wZuWcRhDHG3WUOtItoVLQD6bvbwON4oXgShpeLWDFzkGmw8OqMmYNFtSfzVsDEBhE72Q==
X-Received: by 2002:a5d:5484:: with SMTP id h4mr5780963wrv.20.1627691041380;
        Fri, 30 Jul 2021 17:24:01 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id x9sm3236011wmj.41.2021.07.30.17.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:24:00 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] staging: r8188eu: remove ODM_RT_TRACE calls from hal/odm_HWConfig.c
Date: Sat, 31 Jul 2021 01:23:47 +0100
Message-Id: <20210731002353.68479-9-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731002353.68479-1-phil@philpotter.co.uk>
References: <20210731002353.68479-1-phil@philpotter.co.uk>
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

