Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981632F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:35 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id y7so4961256ejj.9
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mJJ61W3+Iu0fr3sRea0FAmFrj9yp9rKb5qGmB+mhT84=;
        b=Df8+PccqxGVzyPU5aq4HxMr8akEVeR1QBUg9wpWf+c6u5UwxAxPILZa1zqVdLP4wmi
         Nh251fhGTdhkE1IKBwAVyUm5L8Lr1yaGeAayplWNeOJdwg2Jr6wkv2O89a9irUA9D9xE
         oBKh6XZcE3C37Wz38gryQGb9K0Oc170GeqFx2gdlYwnxkUFOXde1YCmdegqr1f7KDDbY
         MsAaFAFgdFLOsUQ1SsEZachX6aP3tqAvs1WxLG+pXZvu7nxrGp9W1N6gceZE1CXchKnq
         KFQHHqeLXxFNEVi94RZiFK6PqN/Y/QagZ1xSfatcnrC4/3RZPvG1hvw+3n8uVb6HxVLw
         Eu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mJJ61W3+Iu0fr3sRea0FAmFrj9yp9rKb5qGmB+mhT84=;
        b=WyyywwSCMgMlUqwXgqnNnOk8ODwy+xKCiQfbBG7cWUY2nDMYR7ugpFt4vDSbU0Obbf
         2uL0fB4EHSpa90jzmJlGExEpw4TIXdbFEBQjqlWgNkc8C36oYTY/btNM6qGqpLFdYR0t
         JsFOuGRrnRDFObwarkS3WPB4dhvCT8EvEYoQVL6suhwyk12rRFQY1ERXIiEGuIWNozk/
         N7gaziTmqHpQM0+Z6QTUJL6RUL7g0YJYQ+t97sXjdEFOLx2FnAUAxVvUlE7ccE/P2LdJ
         wN1IyNVFAtj1U9JtQweYt2AZQXt/yfO0odaZ6JAeIo+7M3/ftHqsjniXFDWwmxrAMw9I
         E5aQ==
X-Gm-Message-State: AOAM530y5FJ9KyXbrEqDUMEQTemLImNWggNNvOBbq5hGj2gKlFFKjZ2B
	WrI1DkoY2BVbrF1hGEMCxKA=
X-Google-Smtp-Source: ABdhPJzox9v1SA5LN+VNJIVGeNTXD1bur23Tw5YLcAJ3VUMXBEMlw/ATpYNDlBrOk1oOFvXtrxfYZA==
X-Received: by 2002:a17:906:6d01:: with SMTP id m1mr2890750ejr.501.1619768674162;
        Fri, 30 Apr 2021 00:44:34 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id ss6sm1467359ejb.60.2021.04.30.00.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:33 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/43] staging: rtl8723bs: remove commented out RT_ASSERT occurrences
Date: Fri, 30 Apr 2021 09:43:36 +0200
Message-Id: <008f036ac799cecf2878d76fbfe28e10a2587ce6.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
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

