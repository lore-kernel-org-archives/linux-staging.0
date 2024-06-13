Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6913A89C
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 20:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309790; cv=none; b=N/wS5kk2wU31SzSYqEi+MD+d2NK48YYahJRGFNmuyF+YCJcHVZJFp7Oixur21YFOssQXAzWc+mDREzKAznvnUvdrvZVp8AtQofVVpTQD77kB/uR3A0367HuQNRDelnhqe+eLRQOTtGMc+GEdkBREwPpXClW5wQ/1CmCLa0wcgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309790; c=relaxed/simple;
	bh=qQRjjZZws/Ma6VIvIPN2Ic4SkHiuVcNFQMuhJXO9qHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GR8K9UmpIr3/Hlu8L7PkPtcoszagYmEmMv8EUY/oTJ8jokZhTLvPoTJ9Dkz2gu5J95O2I1FcC+2ANCPnoEKZr2YR0PYG8/w0r/T4o1f7bu/BODvV7Pxij61eRD8lasIQbDcgn8rm4pkv9y4XBKznFTs4Zhuuy1ki0zHwMS+L5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl+ivHOM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl+ivHOM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4217d451f69so12616555e9.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 13:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718309787; x=1718914587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcEzKvcxuUEgSwRZ+SIVZqsXz/1BXJpqKsYkBURq044=;
        b=dl+ivHOMZxl5Xhwj755Fa9gkhwP4vfDK8Og0z6DTrEkbn1g78kqzNfRgJlNK2gjZwc
         VkJlYGQTRHdc695qNoBMNdU6LiYvgOyV5SGlCLmmqrI0OjkhCXADjv7yigvzkDEkP3Fb
         IOWJlOqii4+Kdh1guIP9Efvqber8GPOgcaqIlrh7+fN6DgSj/3hKoCw5hJF53AjktG0y
         BKeuB/jl+Mj/fmGE+nOUPHeOqts1L0q2xIgzQL5P4qaiX1Gi8h8NR1B9PsnvOnT6NUbE
         hEPsjR1vi2YD+gbwofJGOvl3fLD0kIF8vl1b0HnuypbzavAtT695ioM9kGdrC0/UUbRj
         lcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718309787; x=1718914587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcEzKvcxuUEgSwRZ+SIVZqsXz/1BXJpqKsYkBURq044=;
        b=aPol7L0KicZU4QZC4fPgeV0MESMRNFDJrqQEHxVV6mGPzTEZ1XfnhRWu2JHY4TR8jB
         sx8SW4zgG8NYCOaShPSSegvYkuM3jB2amvSv0caObGDp1inzYkFN9zsePZZM2h7HACKv
         wl1IirEnrpQT61Y9PTFky+KW3dD8GPHG+kSzQHk9GYf98MNNkpsXhqOAydPufLhZiQLN
         yFG9PvbBm9xJEj/54gVSqxfbh/iDuPRUyTJk80T0IXmdrYm4X8e7ogXpZpkyVM6QSgiK
         E+1R4yXmPPDxPT09hZZjGd+Q2F0zSa45e4WJ/sZhyF4uqEMj++yQphJs2H8l9V3t62YC
         ZlxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVav4sbW7ra7yt7URnjpwpHD6FvFe8Luqu8k2NCWqN4Fi+t6T0JGwhexm2tDFcSdzG82Am8a82dX443HoUC6yh2yTH1rO9KZi1vV/4oVw==
X-Gm-Message-State: AOJu0Yw2Kza6ys/TfvK2tf/WwOBk0uwBk33HbqmfjtcU3UuF9eLnuQ88
	0Dh+EmVvbbZHTWi+lpidZ8UeYV/9M6wZI28GZqGtRsZ1KsWRynq0
X-Google-Smtp-Source: AGHT+IFkgtJwQYsiJ7l7nJncpcRDWZmQnU7mEqNo1TRcNXmKckGuFg2Um4jfRmaXp4EMGNkF5dmDPg==
X-Received: by 2002:a05:600c:4f91:b0:422:683b:df2a with SMTP id 5b1f17b1804b1-423048273d2mr7764455e9.13.1718309787038;
        Thu, 13 Jun 2024 13:16:27 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de618sm73817195e9.37.2024.06.13.13.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:16:26 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH v2 3/5] staging: rtl8192e: Capitalize constant RegC38_TH
Date: Thu, 13 Jun 2024 21:15:09 +0100
Message-Id: <e78f4c30a838d8e98794d80126ca246614b14b68.1718309120.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718309120.git.engel.teddy@gmail.com>
References: <cover.1718309120.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to kernel coding style, capitalize defined constant.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 5392d2daf870..4863ced04916 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1752,7 +1752,7 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 
 		if (priv->rtllib->link_state == MAC80211_LINKED) {
 			if (priv->undecorated_smoothed_pwdb <=
-			    RegC38_TH) {
+			    REG_C38_TH) {
 				if (reg_c38_State !=
 				    RegC38_NonFsync_Other_AP) {
 					rtl92e_writeb(dev,
@@ -1763,7 +1763,7 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 					     RegC38_NonFsync_Other_AP;
 				}
 			} else if (priv->undecorated_smoothed_pwdb >=
-				   (RegC38_TH + 5)) {
+				   (REG_C38_TH + 5)) {
 				if (reg_c38_State) {
 					rtl92e_writeb(dev,
 						rOFDM0_RxDetector3,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 863af8ef9f94..3add5aa933b8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -42,7 +42,7 @@
 #define		CURRENT_TX_RATE_REG		0x1e0
 #define		INITIAL_TX_RATE_REG		0x1e1
 #define		TX_RETRY_COUNT_REG		0x1ac
-#define		RegC38_TH				 20
+#define		REG_C38_TH				 20
 
 /*--------------------------Define Parameters-------------------------------*/
 
-- 
2.39.2

