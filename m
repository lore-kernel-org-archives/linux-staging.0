Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218022597
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 19:28:27 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id p15so12935678ejc.7
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 12:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vGCnlEHv9nw64WsEYjnHYKjP/dibbUbwl/jK2KIozQA=;
        b=AQq+1KHDxXa1zjrf8HoZKiXspUf+//Y+QDa+9qBI+z3L5VqeQtNEkcjwZhgdxo2SVp
         TKYNFLag/PTEpMecTsXAbVH8JteoQWPcjoZB9MokFO7oE15kZ4YrpfCsRqFmLtu8Dud6
         pWUTrPiyomAq18QmqaEGL0PKDZk5p/KqXsBdQD5Wl8vyskDgjYhTRcxp9hyHX15cd9Bh
         7m/1RPy8+Sw0Z0ruT18ogjT3HPw5o2gXA54LolBn4rnP+6cNw0mLswm/qshqqIZ0GgbY
         XoTuMbsUBPmjeMg0WqIzyPB2fVnr07rsTiMVq1JoE5GmdyqNxYS0jV/oGf0yp0vTBTLl
         UThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vGCnlEHv9nw64WsEYjnHYKjP/dibbUbwl/jK2KIozQA=;
        b=RY3tAtXSX3xCU5yICDlbFzcTx8vk9nf0F+26n26M28wMaafRhuYU8eHwQGn+Xc8ATj
         2gT5ImOdntn+81TvXX0MBHBCivmYOWQfegUgGA0Bs72njx2eK6Io3Xz6s4VmU03+E0q+
         IpXtJE/H75D9xGASE7ar1HOYXTaXsiAZ30rFjjukOnVKanKq03KtfpUKE/lyES7SmDx6
         vPDT0XgwXHHkVrgaWzV/bKvIEXU0mRm16+Umk6EHJm8vBNVRaVLx0bnZ/Gvj+LR6l8VC
         hk3g8qsKOkGpAAfW8D+sJo2c5uiDf+3okYIBS4PRxSBU7MUVYH/djwEiG4RWgjuyND8d
         fcHg==
X-Gm-Message-State: AOAM532I6tNeroXxQ2DIaC4jVEGrsilcQ8Pw5VF0kjQlwkAeOixusk+H
	+a/TBw107NbwqqMgZ13hOK8=
X-Google-Smtp-Source: ABdhPJzEFoHfdPqrpWj911wljIo/Sbv2TKeaYUCXMGhMI3KFyQrAccJqWJ7oaqqjx240JzkRsNUm6w==
X-Received: by 2002:a17:907:d8d:b0:6df:b214:392a with SMTP id go13-20020a1709070d8d00b006dfb214392amr15222921ejc.669.1649359705463;
        Thu, 07 Apr 2022 12:28:25 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm9652798edl.22.2022.04.07.12.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:28:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/8] staging: r8188eu: ROMVer is always zero
Date: Thu,  7 Apr 2022 21:28:14 +0200
Message-Id: <20220407192819.10661-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407192819.10661-1-straube.linux@gmail.com>
References: <20220407192819.10661-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable ROMVer in struct HAL_VERSION is set to zero and never
changed. Remove it and replace its use with zero.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_com.c           | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/HalVerDef.h     | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_com.c b/drivers/staging/r8188eu/hal/hal_com.c
index 7649f9919f67..910cc07f656c 100644
--- a/drivers/staging/r8188eu/hal/hal_com.c
+++ b/drivers/staging/r8188eu/hal/hal_com.c
@@ -44,7 +44,7 @@ void dump_chip_info(struct HAL_VERSION	chip_vers)
 
 	cnt += sprintf((buf + cnt), "1T1R_");
 
-	cnt += sprintf((buf + cnt), "RomVer(%d)\n", chip_vers.ROMVer);
+	cnt += sprintf((buf + cnt), "RomVer(%d)\n", 0);
 
 	pr_info("%s", buf);
 }
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 6811be95da9a..609138887b25 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -505,7 +505,6 @@ void rtl8188e_read_chip_version(struct adapter *padapter)
 
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
 	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK) >> CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
-	ChipVersion.ROMVer = 0;	/*  ROM code version. */
 
 	dump_chip_info(ChipVersion);
 
diff --git a/drivers/staging/r8188eu/include/HalVerDef.h b/drivers/staging/r8188eu/include/HalVerDef.h
index 56dadadb1a0f..7a530c7d57eb 100644
--- a/drivers/staging/r8188eu/include/HalVerDef.h
+++ b/drivers/staging/r8188eu/include/HalVerDef.h
@@ -25,7 +25,6 @@ struct HAL_VERSION {
 	enum HAL_CHIP_TYPE	ChipType;
 	enum HAL_CUT_VERSION	CUTVersion;
 	enum HAL_VENDOR		VendorType;
-	u8			ROMVer;
 };
 
 /*  Get element */
-- 
2.35.1

