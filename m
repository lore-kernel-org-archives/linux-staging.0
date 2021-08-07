Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902F42FB3
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:31 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id m28-20020a05600c3b1cb02902b5a8c22575so7554279wms.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2eP60BAewtPb8OrcJ+QFT8Xszokf67jZLlK3tsEIbVQ=;
        b=u+KJ5T2Zb+LhDxixAbZLWp54GSMxqsmw0ewA6jHY/Zf1jxAZ3ThTiLZR6rtX/GWak7
         rqH8eb5dW+uiPks2ABWvyfHIqCgASG8nPw1jy6EF9hU5/E2H3tySRzsCEm5OBuEe3VZP
         iRq57H06qeZO/w0MyVz0RCbi0hCyquAE5jm5xfMQdowYbKGP0Ujk67TIhgSBnpwE0F/2
         Wtrqfv/f9AMjbdf+2+nr1+KAFAVTTG0f4xJNk6eNtWbBFDq/MjjHOu2nJGFcrpNMnV24
         2wDWWuFlwFYkfkXcUbnnEBSYwIunUYNryGzABf/glkaro5PWJ8pDkRFM71sB4FvBqQoK
         t8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2eP60BAewtPb8OrcJ+QFT8Xszokf67jZLlK3tsEIbVQ=;
        b=LZCnPn1cuMyqxWHQ54jgy+/LztJzJr7nuWNO2A2O8+sJiPbo1olYbf56n1yH13px1v
         CZKvHHPCschiRbfAK570rZcRHbV2vFoCbJ/bp7ScrUjLWATlcrPD1kX9O9p8j6hWKIJD
         57arhQQvjcyTvpDBm7QRYf6lWT7/DbmNC38ebZUoz1v894XYiuQ6UYav7k6u0ZJDfMt5
         B9oZfcGwruGDxBdzKUu7xbrBXFwjKpD5Tx+pqv3TqoPKVwq1An5YLKUtjnYzpInF5HJT
         TlUzlMUK2RmsC5ykwnVfrsXfgcNaZ4ugJinkrivN+QIMBZqulmeDFD2cnz1uVkFhKZHQ
         n9Jg==
X-Gm-Message-State: AOAM5315z5bqvkJ4vTQBKmhrxMIv5h66BAPcvUeectpGOClh0XBX/Sos
	TMSTKEaWR6mRRpKmLAvNhRo=
X-Google-Smtp-Source: ABdhPJyY/kDcYU08ilYUJbIuntBXJ5r1U9lpd2S0rnAeUHsT+gbAmRo9eyAdOAmljokycvvjK9fPfQ==
X-Received: by 2002:a1c:c914:: with SMTP id f20mr1650548wmb.140.1628329709961;
        Sat, 07 Aug 2021 02:48:29 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id j2sm1738073wmi.36.2021.08.07.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/21] staging: rtl8723bs: remove unused struct member
Date: Sat,  7 Aug 2021 11:48:03 +0200
Message-Id: <ad7831868683a99598cd00a3aacc45f76ba234e8.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused bIsMPChip struct member and all code
storing it.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c         | 4 ----
 drivers/staging/rtl8723bs/hal/odm.h         | 2 --
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 1 -
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index fd5656398c3d..f87dd84434f7 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -856,10 +856,6 @@ void ODM_CmnInfoInit(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, u32 V
 		pDM_Odm->SupportInterface = (u8)Value;
 		break;
 
-	case ODM_CMNINFO_MP_TEST_CHIP:
-		pDM_Odm->bIsMPChip = (u8)Value;
-		break;
-
 	case ODM_CMNINFO_IC_TYPE:
 		pDM_Odm->SupportICType = Value;
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index c77fb6e341b2..814f4d54a96d 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -282,7 +282,6 @@ enum odm_cmninfo_e {
 	ODM_CMNINFO_PLATFORM = 0,
 	ODM_CMNINFO_ABILITY,					/*  ODM_ABILITY_E */
 	ODM_CMNINFO_INTERFACE,				/*  ODM_INTERFACE_E */
-	ODM_CMNINFO_MP_TEST_CHIP,
 	ODM_CMNINFO_IC_TYPE,					/*  ODM_IC_TYPE_E */
 	ODM_CMNINFO_CUT_VER,					/*  ODM_CUT_VERSION_E */
 	ODM_CMNINFO_FAB_VER,					/*  ODM_FAB_E */
@@ -802,7 +801,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	bool bsta_state;
 	u8 RSSI_Min;
 	u8 InterfaceIndex; /*  Add for 92D  dual MAC: 0--Mac0 1--Mac1 */
-	bool bIsMPChip;
 	bool bOneEntryOnly;
 	/*  Common info for BTDM */
 	bool bBtEnabled;			/*  BT is disabled */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 54e2a68a0824..c1caeaf44943 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -44,7 +44,6 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_FAB_VER, fab_ver);
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
-	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_MP_TEST_CHIP, IS_NORMAL_CHIP(pHalData->VersionID));
 
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
 	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
-- 
2.20.1

