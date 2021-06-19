Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343670
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:42 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n7so13733645wri.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3vV2U8AiPVrINMpNtQIz9UVvV3NauTZiADFopAb6V3Q=;
        b=Yg/OJoOas9Ors+r5bnXh464rPXwRz/EL34/9+8Lg5TbtDZJXg02EP+hNl0CrjmW8Cw
         AdjX3e+nIHzi2NgQ3/uN7HLHN5EcOpoja6G/u3lfzwzPqSgFqeao6Eh+peJ5O7KWtwzz
         cTwu6HEQ08NnfMGSqasPNQCLj+/WXeNtpVWvV45xtqXp8G0MgFtkvkYXwlwejjlEMZfg
         0E96iqckMmxmQTHH48UXEv68qdZtcQU4mrWer4fu4eedW3kzLwvlnluT/tSPaJ/SzRIZ
         GNuYil/9fVxTWyHfZsyfIKV4Uo62qNy0Y2BEi4gg37t3iR1O8U0/A3E9oogSvFjkj/8x
         Qr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3vV2U8AiPVrINMpNtQIz9UVvV3NauTZiADFopAb6V3Q=;
        b=r3WDlvEphCc4oSVQKNYusDeuPZ5ifYnrZKm5AGthp4l71D5xbPks84gHWCgY6P61Ur
         F61QznZBKYXPvlRQQN2Bt31PxKAbaFyIEpLV4A/O/0XYR/FP03TUWjxA8llcyzQWSQRQ
         AhAwo1fhu2o8LYgksXXYrv9ywp8k7+VU4C0BJSdnAuolljZlD1x0dE3WTHJMPnO0oT+l
         9jMxrZ/1monSUGtb6uAcDy2EdpSV2syPT4bbqdVXmmmvp+CLRfc9hrjWlJNNrGYuMs9n
         BIk4AWV0LnzG76kWQVhVqpEJiNHKzVaFdWuCtVn4nGoA5c+iP2H0x875iEhkIzkVHa2F
         bS+Q==
X-Gm-Message-State: AOAM530JDilmsPsDm8rGFqQi0XhSA80H+Up5gyhpfnMMFMRLB2qLH1Df
	NikJiIz0YZLC8CQcrUb3KtHRyyEa74vmCQ==
X-Google-Smtp-Source: ABdhPJxUGEwInlcojT97n9kRihicD2gRb/nL8vrwukQVtbFwqPlg97pYxVlC+JEpTpYk3EmDWXnDHQ==
X-Received: by 2002:a05:6000:154e:: with SMTP id 14mr17404276wry.305.1624099661264;
        Sat, 19 Jun 2021 03:47:41 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id p11sm881896wre.57.2021.06.19.03.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:40 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/18] staging: rtl8723bs: remove unused ODM_CMNINFO_BOARD_TYPE enum item
Date: Sat, 19 Jun 2021 12:47:16 +0200
Message-Id: <fff36a612ff93ff2f4c8b38f3b65272f75ff82eb.1624099126.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624099125.git.fabioaiuto83@gmail.com>
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove ODM_CMNINFO_BOARD_TYPE enum item, fix comments
accordingly (given that 5GHz code isn't supported).

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 4 ----
 drivers/staging/rtl8723bs/hal/odm.h | 5 +----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 4c959efd447a..68dfb77772b2 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -884,10 +884,6 @@ void ODM_CmnInfoInit(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, u32 V
 		pDM_Odm->AntDivType = (u8)Value;
 		break;
 
-	case ODM_CMNINFO_BOARD_TYPE:
-		pDM_Odm->BoardType = (u8)Value;
-		break;
-
 	case ODM_CMNINFO_PACKAGE_TYPE:
 		pDM_Odm->PackageType = (u8)Value;
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index a5bca7d7826a..c349de205f93 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -291,7 +291,6 @@ enum odm_cmninfo_e {
 	ODM_CMNINFO_FAB_VER,					/*  ODM_FAB_E */
 	ODM_CMNINFO_RF_TYPE,					/*  ODM_RF_PATH_E or ODM_RF_TYPE_E? */
 	ODM_CMNINFO_RFE_TYPE,
-	ODM_CMNINFO_BOARD_TYPE,				/*  ODM_BOARD_TYPE_E */
 	ODM_CMNINFO_PACKAGE_TYPE,
 	ODM_CMNINFO_EXT_LNA,					/*  true */
 	ODM_CMNINFO_EXT_PA,
@@ -461,9 +460,7 @@ enum { /* tag_Bandwidth_Definition */
 	ODM_BW40M		= 1,
 };
 
-/*  ODM_CMNINFO_BOARD_TYPE */
-/*  For non-AC-series IC , ODM_BOARD_5G_EXT_PA and ODM_BOARD_5G_EXT_LNA are ignored */
-/*  For AC-series IC, external PA & LNA can be indivisuallly added on 2.4G and/or 5G */
+/*  For AC-series IC, external PA & LNA can be individually added on 2.4G */
 
 enum odm_type_gpa_e { /* tag_ODM_TYPE_GPA_Definition */
 	TYPE_GPA0 = 0,
-- 
2.20.1

