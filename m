Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8A12C9D
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 13:11:57 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id b73so20017124wmd.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 05:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eU+Qesw8IpwjYFtIpr41tQi/97DSTP46RqXidzHcV88=;
        b=ekjsSS7NQCeZLJ2xPs+LebADC6e65J3pZXMZnNLsHdd7EVWfeNkokhXrEkDzAQyY4R
         z+x1KOTKYMWOzgYaaoJs29N2KSRUD9bfuabK8DKDBD/e+SU4fqBZKcdjjgL97Vs8Gg9o
         nTPpiR3JjMCr/FFNUyppLSib2qWhkpe8jl5CvAFiU3LKAYB0rETsmD82HxIGB2AUnAj0
         prWSEMywNEJXbQptRZVBRx81u/T+wPxbR8LcwRrEiu/d6X/8fjil4vzJQ7P4HPu1Hiba
         ysEfQRg+wHqP0CZIK319Ns7MzHGhEVTA7etL+iItih+O0C9Ksx0P348YdQnC+xrkV5gL
         0mYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eU+Qesw8IpwjYFtIpr41tQi/97DSTP46RqXidzHcV88=;
        b=7bZU5/0ooM0Z0Kpxc+UpxLm9fqynecgKP4RumoFmIb9C6PRsKzrkq8g0+EfyVkDr5e
         T6i1Zf15BCkSxa+IqpRtvWHJQH2FJAJcRoXgGOwN2ASzVLc/xbWe7xgcmBCRUMFCE25W
         XhffCv1VntQc+sxpA6PbW7ZWGKNoLmNBKHO4h1CqCjQyjqkxPuKFwUrQhEJcq9EPYHml
         WC63IHPflYKdLL9hzLVDOD7ZE1Es3NTV8U+NFM43zNvcyqzfOpdkQSReI6fQX2ZITyoB
         9MljCx6K8vTV//OLgD6glGhSZygbQlZzWixCIlG5SniHb+Q7vS0D4yNGRtrrFX0gn8ye
         JNLw==
X-Gm-Message-State: AOAM5306dHfMWEF7xzkVXe/PCncZ++gpTRhK9skrPag8BvqDkf14Y2BJ
	4lBfzjx63af+yQVR81IETeI=
X-Google-Smtp-Source: ABdhPJxawAh2BsSmgRP2n2U6iDlRylBwUPXQ3DCl4oB6JBA4vmWtNuzZtaWx8WRn+VEuu/mKlOe/Sg==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr24026975wmj.168.1641129115938;
        Sun, 02 Jan 2022 05:11:55 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id m35sm65640044wms.1.2022.01.02.05.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 05:11:55 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/11] staging: r8188eu: remove unused enum and defines
Date: Sun,  2 Jan 2022 14:11:33 +0100
Message-Id: <20220102131141.12310-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220102131141.12310-1-straube.linux@gmail.com>
References: <20220102131141.12310-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused enum rf90_radio_path and some unused defines.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_eeprom.h |  5 -----
 drivers/staging/r8188eu/include/rtw_rf.h     | 19 -------------------
 2 files changed, 24 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index e517239bd75e..22c2eddd5e75 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -21,11 +21,6 @@
 #define EEPROM_EWEN_OPCODE		19      /*  Erase/write enable */
 #define EEPROM_EWDS_OPCODE		16      /*  Erase/write disable */
 
-/* Country codes */
-#define USA				0x555320
-#define EUROPE				0x1 /* temp, should be provided later */
-#define JAPAN				0x2 /* temp, should be provided later */
-
 #define	EEPROM_CID_DEFAULT		0x0
 #define	EEPROM_CID_ALPHA		0x1
 #define	EEPROM_CID_Senao		0x3
diff --git a/drivers/staging/r8188eu/include/rtw_rf.h b/drivers/staging/r8188eu/include/rtw_rf.h
index 2308a00b5dec..b7267e75346c 100644
--- a/drivers/staging/r8188eu/include/rtw_rf.h
+++ b/drivers/staging/r8188eu/include/rtw_rf.h
@@ -6,28 +6,16 @@
 
 #include "rtw_cmd.h"
 
-#define OFDM_PHY		1
-#define MIXED_PHY		2
-#define CCK_PHY		3
-
 #define NumRates	(13)
 
 /*  slot time for 11g */
 #define SHORT_SLOT_TIME			9
 #define NON_SHORT_SLOT_TIME		20
 
-#define RTL8711_RF_MAX_SENS		6
-#define RTL8711_RF_DEF_SENS		4
-
 #define	MAX_CHANNEL_NUM			14	/* 2.4 GHz only */
 
 #define NUM_REGULATORYS	1
 
-/* Country codes */
-#define USA				0x555320
-#define EUROPE				0x1 /* temp, should be provided later */
-#define JAPAN				0x2 /* temp, should be provided later */
-
 struct	regulatory_class {
 	u32	starting_freq;				/* MHz, */
 	u8	channel_set[MAX_CHANNEL_NUM];
@@ -64,13 +52,6 @@ enum	_REG_PREAMBLE_MODE {
 	PREAMBLE_SHORT	= 3,
 };
 
-enum rf90_radio_path {
-	RF90_PATH_A = 0,		/* Radio Path A */
-	RF90_PATH_B = 1,		/* Radio Path B */
-	RF90_PATH_C = 2,		/* Radio Path C */
-	RF90_PATH_D = 3			/* Radio Path D */
-};
-
 /*  Bandwidth Offset */
 #define HAL_PRIME_CHNL_OFFSET_DONT_CARE	0
 #define HAL_PRIME_CHNL_OFFSET_LOWER	1
-- 
2.34.1

