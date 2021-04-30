Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFCE2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:00 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id i24so21927066edy.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oXNpztwSPie87ZGBOUIq/Wsi+dyDvcyo8iFcSTDhBAs=;
        b=lPymAkw9xVO0DT4C1g9346ZThkivOP2Ogkj9qHunM2NnG7ST1sNl0IX/IEWVdQgGy6
         wAPHNRRRGDoN8rzrfNFnHoYbHU0H9tfYnFS0zdXs0YACfmslUg0b09D/diLVZtQRJaBf
         gYXqxJ+GY3gvshQXHbX9rc4aPMrtFYv+Yj40kqRKQNaBgVT1sa5lrt9aWsi1thbv7JcX
         wUif92mu8uSHWoPmjPXuF03G+4Xf0Lhsz4mf0UonlYvo93XZjX2EpxD/IQjNlqM6SOf1
         BmP1VkBtOHMZ0bOS90xv5LOn8Hc5rZNrM8d+noodKKSBDSPSjY5rbIk/Wib7u0SSoAyo
         4JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oXNpztwSPie87ZGBOUIq/Wsi+dyDvcyo8iFcSTDhBAs=;
        b=dc7C9vu0cYFlMhYyiGa19XqxcAPeiRdwI9j3fzPzATpFwKvMcEW5fRMozl80BOWoTn
         /d8Whr6cov8e7dBNoKXV5tfeNI3Z2bL6rcLXqcuM6BrgkMpdJHv9r/rlyGHAFZKvoBa0
         WJdO2+1yDkd39HcHiRPE7hc6Nh5qMiQys/IgLqk+z2Tj2d3NiPqcUWFglXT4STZ/BS6N
         BWWm6ecWiBbPJaSLmMMV5kMe4BPeGQgZxEmywxiZpGLH/MGX1BBvvRgj0LhCu6eeYlBI
         mlHtefimWL+a0h+7WA6rzhrJGusNtXfCeim/7mAV9L/Q3VHQHKnNzR2QNDp8sKppXv8P
         YXBw==
X-Gm-Message-State: AOAM533PSBYhWw/C7pxmKVmXABjdBTkFGTybmciro1jB5RVBUas1evtr
	55R7SApEvdBPjVD0QygB9MOF5O8xhUkS6g==
X-Google-Smtp-Source: ABdhPJxgi+WQ5PaMjNdLs8Lnin5ZsGeYiG5HHaJA/rKn9zweY11i00O+tPnRdKUlfOCfoot7rtMC/g==
X-Received: by 2002:aa7:d14f:: with SMTP id r15mr4059899edo.71.1619768698802;
        Fri, 30 Apr 2021 00:44:58 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id mt26sm1456782ejc.32.2021.04.30.00.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:58 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 32/43] staging: rtl8723bs: remove obsolete GLBtcDbgType array declarations
Date: Fri, 30 Apr 2021 09:43:50 +0200
Message-Id: <cb1f030c561f95fd00b12b003993fbdaa5cc9cdf.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete GLBtcDbgType declarations for it was intended
for private debug facilities.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 1 -
 drivers/staging/rtl8723bs/hal/hal_btcoex.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index f2793d5d9a30..c5444f965699 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -83,7 +83,6 @@ enum {
 	BTC_MSG_ALGORITHM	= 0x1,
 	BTC_MSG_MAX
 };
-extern u32 		GLBtcDbgType[];
 
 /*  following is for BTC_MSG_INTERFACE */
 #define INTF_INIT	BIT0
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index fd26187a976a..da545c4eaac0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -17,7 +17,6 @@ struct btc_coexist GLBtCoexist;
 static u8 GLBtcWiFiInScanState;
 static u8 GLBtcWiFiInIQKState;
 
-u32 GLBtcDbgType[BTC_MSG_MAX];
 static u8 GLBtcDbgBuf[BT_TMP_BUF_SIZE];
 
 struct btcdbginfo { /* _btcoexdbginfo */
-- 
2.20.1

