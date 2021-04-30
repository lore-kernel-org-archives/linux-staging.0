Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4912E2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:03 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u17so103939078ejk.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ge3P0WNdYY2EQIE5X7at+1ZyKJ0Q7vBILrEN41L9FQE=;
        b=jYlUZsZ5o9jdFL1AtrTq+qlzPyXbh4K0D99y8p0lBTv0o+ENx1rkr0zb/xe03S53u+
         oL/sJT1b0ggYPj7ILj97RlfVEJyxWYy60MNbmk1MxoMzdP0UuTW5BPWsW2G9QSqN8U5X
         HqTtG0BmYI7VYx4Rwd9aNxS63y6UqIw03JqWNqVMF66WWUpuqhH3q/qtlnz/kw9W25ur
         Gn0zamLxlaJuddk/jDbLebtaGMJumilK1PzoUxKcPwKH0G1pjp881YHfFM5I9hmYr0CQ
         SCF/SJEyMxWwJH+oLqol3aP0E9OzQPsU/kqj/Bc6+kXjxSQPOgk9Zg/EhHPy+HBAJydO
         vxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ge3P0WNdYY2EQIE5X7at+1ZyKJ0Q7vBILrEN41L9FQE=;
        b=rSdvB6zdD4YHVP5lQ4nqIE07TQ73gWQaoMFeH8eTeTJy6qhrmsiEKt2CZnlqyTrtXd
         UHcilAaD4xW7Mtl8yfHTHKZjVuD/NKfypjNWeWVwMunIbG07wB01PvNRg8pZkMC2W719
         2UxNVx52WzYLnisHfCwWH/DeDRRvHz/Ee90PXGFHhZGAu4edNtOGEIn+vQGw0BOHNhZ0
         WGoCNQ06YE27ifAdsfSl0bppVkxtaVp7s3RHuCTj9VWncSkYVeA8QmGG/+qb4SjnIlzv
         vMIMP4CgrMMfjFdP8O111T9qVvD7vZ6awXbvP+8EqseX6PZEEjMoif3SLrxMwUxTnx/7
         leuA==
X-Gm-Message-State: AOAM530MAOOv+fMPkls3eiE7e//uigNr1+oEalc6ackX2lntWi6dM1Zb
	EMGx4TsoPu3+U+ujje3atdu2BJ6c6cOy5Q==
X-Google-Smtp-Source: ABdhPJzmajSPbzr4UKNIAU/QXa68J+Vr/Qh5TG+GvdWHkOdQEVb/8GUQQ/uWMWFBFucZGU4a598OyA==
X-Received: by 2002:a17:906:74c6:: with SMTP id z6mr2863943ejl.13.1619768701925;
        Fri, 30 Apr 2021 00:45:01 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id hc43sm1457195ejc.97.2021.04.30.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:45:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 34/43] staging: rtl8723bs: remove obsolete debug macros
Date: Fri, 30 Apr 2021 09:43:52 +0200
Message-Id: <c090830a8b6dc855a11ef3b336b6873c8c64e641.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete debug macros.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index c4616a69425d..db9d8a529877 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -78,22 +78,6 @@ enum {
 	BTC_CHIP_MAX
 };
 
-/*  following is for BTC_MSG_INTERFACE */
-#define INTF_INIT	BIT0
-#define INTF_NOTIFY	BIT2
-
-/*  following is for BTC_ALGORITHM */
-#define ALGO_BT_RSSI_STATE				BIT0
-#define ALGO_WIFI_RSSI_STATE			BIT1
-#define ALGO_BT_MONITOR					BIT2
-#define ALGO_TRACE						BIT3
-#define ALGO_TRACE_FW					BIT4
-#define ALGO_TRACE_FW_DETAIL			BIT5
-#define ALGO_TRACE_FW_EXEC				BIT6
-#define ALGO_TRACE_SW					BIT7
-#define ALGO_TRACE_SW_DETAIL			BIT8
-#define ALGO_TRACE_SW_EXEC				BIT9
-
 /*  following is for wifi link status */
 #define WIFI_STA_CONNECTED				BIT0
 #define WIFI_AP_CONNECTED				BIT1
-- 
2.20.1

