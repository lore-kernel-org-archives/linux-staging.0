Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8501B2FB0
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:10:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id h11so6119654wrx.5
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3vV2U8AiPVrINMpNtQIz9UVvV3NauTZiADFopAb6V3Q=;
        b=rv+AZfqqrRzYV1G+1LIbavYJpuI3WFJ0IgbC1+2ME6SWpEI8vgeDbg/3+NY9bUT5IE
         P6Ye0DDelUDINevIlSUzCwRNxh1eZ9yl8yNXFmnsKzDDz7GxKpZPETi/TSB4sURZLUzQ
         EawEdOl0mFXEOysaaCRrXjllBWs2PeZC8/nPs3kQbx6Vzh/egz4zutLcTCniVgK9tk4o
         6pbb8jW1T99ZLArKyLT84R23N7wL5bYtAAMZSMF5JJibxaUj6l+LRiearuoXbIYliEmH
         ENcbZUU7tndpXSp9pZml3ZI5CKJrOppmSg1nRw2VpRzO2HQXkItam0ATV43Cj5Zkhd+o
         S0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3vV2U8AiPVrINMpNtQIz9UVvV3NauTZiADFopAb6V3Q=;
        b=B+hby5ck397a4vhr114xjGZ0GARi+dp3YDdVpe3HMSMQGqvKUY5ICEy7WMf0XM0gi6
         fERN9gBDHggC8DlfoIoBin39M+LBECRUQ8iWUuyNTNp5FA8H+B+6NiloB15Cuvy433Jx
         IVQUB2u0FXjqfHDd3slm4ppxYbxH6zmyRGooyX7W+OIn0DLPFhMIhOSPDe6rsEdjAbbk
         Oct7cZIT5huT19mhsfM1aDDrd5JTvD0+qxtVRbpN968ja8SZ2QQvVHgWP9n5K+6PDc5G
         ENpwgkA11LNP1LQb5Vv8r+OCPwQap3iXMKuDUq+kBsoIKQKXLHhfpsjK6oBQF+kIuDhx
         klJw==
X-Gm-Message-State: AOAM532oALDTMZp5mheKEgA6Aqo2g4qb9jiSrjvvMcbjRAm7t09b5xkS
	ooPF44vKUhTvlqPk9Eio1w4=
X-Google-Smtp-Source: ABdhPJz4WLOl5jiuymh9giygvsC5RvI46BhT3wnGSMMI7mXYb7PrY8n/G/+HaqypjDnyT4ESETCm6A==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr1793742wrt.259.1624367423128;
        Tue, 22 Jun 2021 06:10:23 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id e17sm23470996wre.79.2021.06.22.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:10:22 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/17] staging: rtl8723bs: remove unused ODM_CMNINFO_BOARD_TYPE enum item
Date: Tue, 22 Jun 2021 15:09:57 +0200
Message-Id: <e3adfc218779c9c1ea904e806f77fc5007be180f.1624367072.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624367071.git.fabioaiuto83@gmail.com>
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
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

