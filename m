Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5D42F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:43 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id w3so105675459ejc.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mJJ61W3+Iu0fr3sRea0FAmFrj9yp9rKb5qGmB+mhT84=;
        b=Sz/zjJpMWKi/lgGWUrf0NvR02MajjEHB6CEN5gc3EPrd+qWVOk/zJ+gbLzR5+bD8dI
         DWJWlDONT3gheOF/HvhCVqenFpKlrIr3RNt7vMZ4fAq3J4Q3p+FEQIc66t56AahpuPPS
         XRESqCxRV9/FFen5KwBSfowWNo0KVGqz+XFoR7imbkt1RSNjXKjffveRDJJ7MF2H9pcC
         EIBufiPnqnXi8bwhNaAtjEYllSkIupVBRzsWxCYezaFkgvQuOWmqCbu2S9ccYWCLpjtb
         0MaP8Zgs0DewnmWpdz1w2zzitEpIY2KlV8NuZdQ+gML04qXx/xG0zUWQcSmGDHwtz/6H
         bYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mJJ61W3+Iu0fr3sRea0FAmFrj9yp9rKb5qGmB+mhT84=;
        b=oZjdb3DUEBLGtn0bgsFbrmzFPdERCid73EurJPr4dl7rsfZhw6Zp7oz/2QcDFp7x7n
         xro/eUc3Rhtrqt1kcCUp8FNXAnsGSJr5V9Ao4BxhYrO9P88Xla6Cj1KzneK8b8PDR2eD
         mHxMyRG6ZriXDvaQKF/FkMwHc/fneE6QdMnf2YX9kzdSr7nMhyz6csBAThPVk/faGA5H
         mGACzTdGfSngouK0PGzcdZi1DvWqRoD8hiKXRbmxBBpo3XnBhrBKkr38KmWBSM+tWTlP
         JkzWDpkPvtoSUHSK1NF2sY4k1vjQ0RWMdhiIVtjuy13f856yhclllVOe8UPTTzJAU7Mj
         X4og==
X-Gm-Message-State: AOAM530KVAKDKpwMq8T8t8LonmPoQfSLinwO8fSrtr/6Acew3kgIBHp8
	2+07g0o3lDjeI4vsOgrUSNs=
X-Google-Smtp-Source: ABdhPJz6Ba7T6+nX9O4+EX9Ig9Ha4VB5Kf16NljCPZE/LuLgYPOIB+rAdQQOU/hpfe7/EC3RO3cNgw==
X-Received: by 2002:a17:906:b315:: with SMTP id n21mr4773621ejz.219.1619793881661;
        Fri, 30 Apr 2021 07:44:41 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id pw11sm2048158ejb.88.2021.04.30.07.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:41 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/43] staging: rtl8723bs: remove commented out RT_ASSERT occurrences
Date: Fri, 30 Apr 2021 16:43:48 +0200
Message-Id: <0c29df66f691f82fe894b153139869cc474cd7ae.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out obsoete RT_ASSERT macro occurences.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c         | 2 --
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 5 -----
 3 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3e671cba6b94..c0689a4b7cb1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1794,8 +1794,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			/* pTS->RxIndicateState = RXTS_INDICATE_PROCESSING; */
 
 			/*  Indicate packets */
-			/* RT_ASSERT((index<=REORDER_WIN_SIZE), ("RxReorderIndicatePacket(): Rx Reorder buffer full!!\n")); */
-
 
 			/* indicate this recv_frame */
 			/* DbgPrint("recv_indicatepkts_in_order, indicate_seq =%d, seq_num =%d\n", precvpriv->indicate_seq, pattrib->seq_num); */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 082448557b53..4e21d98f7414 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -122,7 +122,6 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 	u8 *bufferPtr = buffer;
 
 	pageNums = size / MAX_DLFW_PAGE_SIZE;
-	/* RT_ASSERT((pageNums <= 4), ("Page numbers should not greater then 4\n")); */
 	remainSize = size % MAX_DLFW_PAGE_SIZE;
 
 	for (page = 0; page < pageNums; page++) {
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index fa285003b427..fd060cf7bc57 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -226,7 +226,6 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
 		value = QUEUE_NORMAL;
 		break;
 	default:
-		/* RT_ASSERT(false, ("Shall not reach here!\n")); */
 		break;
 	}
 
@@ -260,7 +259,6 @@ static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
 		valueLow = QUEUE_NORMAL;
 		break;
 	default:
-		/* RT_ASSERT(false, ("Shall not reach here!\n")); */
 		break;
 	}
 
@@ -325,7 +323,6 @@ static void _InitQueuePriority(struct adapter *Adapter)
 		_InitNormalChipThreeOutEpPriority(Adapter);
 		break;
 	default:
-		/* RT_ASSERT(false, ("Shall not reach here!\n")); */
 		break;
 	}
 
@@ -516,7 +513,6 @@ static void _InitOperationMode(struct adapter *padapter)
 		regBwOpMode = BW_OPMODE_20MHZ;
 		break;
 	case WIRELESS_MODE_A:
-/* 			RT_ASSERT(false, ("Error wireless a mode\n")); */
 		break;
 	case WIRELESS_MODE_G:
 		regBwOpMode = BW_OPMODE_20MHZ;
@@ -530,7 +526,6 @@ static void _InitOperationMode(struct adapter *padapter)
 		regBwOpMode = BW_OPMODE_20MHZ;
 		break;
 	case WIRELESS_MODE_N_5G:
-/* 			RT_ASSERT(false, ("Error wireless mode")); */
 		regBwOpMode = BW_OPMODE_5G;
 		break;
 
-- 
2.20.1

