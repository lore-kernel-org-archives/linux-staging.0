Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BBE71
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 12:30:04 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id c84so12658540wme.5
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 05:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3vV2U8AiPVrINMpNtQIz9UVvV3NauTZiADFopAb6V3Q=;
        b=cCbzsB5e2oZLgJ5FGXSdAsvhX5m8ywtLTR55allVlsSe2eqnwLR2fhksY4nghCdlM8
         I8j2WPyKABpaPrJYR1ZBZK7Xjo4XnjDL6VCnPnwiYt9Q4KOkszSjlGHSJEJVP8hJ8VXu
         lIyOx4JaWqoUqiOHcqwMV+eZGPBuoaZJApM/b9wJ9QnjLzmJ4yyeJpW1J6Yl4sq/5oQq
         /gk422Rq47L/GaeB1c4yy2AEzG9vi4bFLcC9TkoWzBzh5T+pdSekautvR3tj1vxrJpwY
         UTatBr6ay5/a12FFfPL/DectWaOJ3/cVX5Np2905fLLqK5TFpjNPAC//90vlUaZTmjvW
         6CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3vV2U8AiPVrINMpNtQIz9UVvV3NauTZiADFopAb6V3Q=;
        b=JyoiLA14CUolriBhXf2ndZ+Xx88eo6V1MT7YoQqGzpL5dHh0aYG546ipROUsIsHPS8
         Tj33D1g68t5cWLpaQEcKb8fBwKoM7tQvNrgsv1CIw9hc+JsfXCZbMcUnDgelw5IHf3Ad
         k2cTHM3JHxe9pPZy5haMWqOH0Cg6wZiqpKKczaf4lgsfpDqBZRnQ2OJA9TH9DZslujV+
         MTaTGmO4ddtqPTJZ7ZuqHX0Gc9XnC9ypjdkn2YfTr4PXwzA9uWqFJWcwAExJQXEknEo4
         zschLZXomWqATMY9QlDEpiQ+cX0/2JjEXZ4z440LdyMR2LPFhbOmZ+PGfNLZShF8tr8d
         leiQ==
X-Gm-Message-State: AOAM531nrLbUSWiLSfFFy8Kpg6bm0UGGWmSbpB0wFtK0WGHRTE3HdWOf
	4EfSHl5/TdxYkVU3rS4FNUg=
X-Google-Smtp-Source: ABdhPJwg2D+G7gYfGgKwohhs4wbVBupD3Xm436MysbgZAn1G7ioFreCNsFiILCELO3ETIsFmqA945A==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr3921309wmc.141.1624365003514;
        Tue, 22 Jun 2021 05:30:03 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id l12sm21208383wro.32.2021.06.22.05.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 05:30:03 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/17] staging: rtl8723bs: remove unused ODM_CMNINFO_BOARD_TYPE enum item
Date: Tue, 22 Jun 2021 14:29:38 +0200
Message-Id: <fff36a612ff93ff2f4c8b38f3b65272f75ff82eb.1624364582.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624364582.git.fabioaiuto83@gmail.com>
References: <cover.1624364582.git.fabioaiuto83@gmail.com>
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

