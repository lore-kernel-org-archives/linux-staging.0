Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C04128EA54;
	Thu, 10 Apr 2025 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290409; cv=none; b=dGCDrj18a/k6yiKnvPIYmwfEZHbU9Acjvva2f5uOXSY4o9I88OsBR/jmMghpWOQ5xeezlXtjZnYGjrR5m7BwVR9+WcNm96C+LA8Xog4OwoDdXmun2sjcq5n2kVPMJN2JRpBKHz3Hsos1F7K/AT3eO99r04SWWgRm4fyj4s8OP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290409; c=relaxed/simple;
	bh=kHgNB5nPT3+1wDW0Eoz6Kq84hg9zCpDrlYGgyCDJ3KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TL0BsVu/V2H7YNiV6ULVstMWZ5A/46cYRfqUveCxMvFK7sDruJlTWdDGsCLlZNnqmtwB1wc+BdvEztO3PYVtCxseQ61BoQID7GxebCWUPRy/Z9xDz7z/XdEZhzsBlkXwTBVakNmsSoLCctrZkNMdKe1NjePCErULDGgYL4f6ofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqF4dR6a; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqF4dR6a"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0618746bso5855765e9.2;
        Thu, 10 Apr 2025 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290405; x=1744895205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuhP725w1oGaI5ekaGtjNwebtNvqySCoCtAnGKOGveQ=;
        b=EqF4dR6afgk6bt2f++NSTCp3t4ndbSDFOeJPoLu90BAmC5x8S8mZf4d0xqJLLrrSTQ
         wYHzis6VCV04plU4kA8z0SC+Vy01klt78wC0E7XRGncxvgNwMnozVozO4rniCpeicGa8
         MJFQ62VF91DywlxN7wKp+hWOIwSCDqeaQVzyE+rrYU8BbnS5oQp4fYiFT0EQmNWf88xH
         fpuiZaoWG6mcv2cUuVzx3wNWrbtGz14o0jkU0592D1dCF0Kaj4soy3fXf0UktTQANwsI
         KSlL7Bh8CiY/vPO5ghelK1K6bghAlxfHX4kAPR0Q7wMAD4xFr9gESODv0QYvNWiWQvBW
         oOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290405; x=1744895205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuhP725w1oGaI5ekaGtjNwebtNvqySCoCtAnGKOGveQ=;
        b=LPlSd9FUbPXL+vof6QRMryx5UCpdIifBtwPSBZdCPvP6sa3cUc1pAkjs94ibuizfeW
         zRDmn5f6Lp8vruarIzVlUZJyZoMSW61qR+9DC15jNNcPCj4g0zi27dJ5hRXBkaGyCTrH
         MTTKNwCzr1XoOZP6B66TlmhxK16SEn7lwZGKsU1Z1Q/8GHbZpNxl+AyQvg4h23XvLxJi
         rjAYk6uWXqSUt3OpzLQdscbsEy0FgitAHpDobKDdFN/f5VBzwTpJV4lcLcPs3NNemf1c
         +95B3BifvsF3iGIhWSyZedWdT+1q7QhDCeF0s/GYo/lJoN8I6dOk2ydTNschM9/TE/KL
         pRdA==
X-Forwarded-Encrypted: i=1; AJvYcCWCk+AfsB506MHtwRMKrThuA9dtFtZtwxe0PQFiwrl+vPgeUq3UNrBjRTe81Y15JhP59gvRLauXGF6u@lists.linux.dev, AJvYcCWZPWOuK7Py0wkHVUiaDcQSYxhF2Qo8/gmkTkQsjWJ2DvgvvdQ3ZmhAuF/DEGtZUoMz9qox2uhDhB9oTmZk@lists.linux.dev
X-Gm-Message-State: AOJu0YzRT0BWznIVs5V6hq15CtYtT7QwMl2Y4OXojQy7NGmcRualcOV5
	8SJVD91U1+abMtGod5SzHhCRe1su+Z3ydqOlatMXSCkwOj7tF0rKKlWOTqMW
X-Gm-Gg: ASbGncuAkLL/mmz6a4tzvhzJ9tn0SLBLJiLisDQ6xecDKd7qYzrSIVUSLgW2rksT2FO
	PA1pf6pxuuhLyktGWgxklhVV/tU3onRas3j0PYUgwCiFx2o9pSXVf81QhNoSAlz/kMULq+EftNg
	sk1VlrFgfemgTV0zV9hUL1bxZNc2uTKtXM0oBYuXCjmbZCrqTLPeC06VWgERmDJeUD+Obigsboz
	TIHOYh/dDb/6aTHEEEgcA2niIEXoeuGyIdS31jG5J/lL/76NJ1BRlDbbZag+20ZUcrGnC0dy1Qk
	jNoNG/IShmkc8DRNqYr7Ikpu87+QyKl4YH/i2A==
X-Google-Smtp-Source: AGHT+IFV+X8eGPGvO60BeRP9k7sTmXuetERMG8d4vBQlZCejW0/yD/+PGC6Wz392dpKJgECF49JzLg==
X-Received: by 2002:a05:600c:674a:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-43f2d97bc34mr26058215e9.22.1744290405003;
        Thu, 10 Apr 2025 06:06:45 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:44 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] staging: rtl8723bs: Initialize variables at declaration in sdio_halinit.c
Date: Thu, 10 Apr 2025 16:06:09 +0300
Message-ID: <82af6a6042e359c4ab9c2fdbb68cc238f43be857.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744285781.git.karanja99erick@gmail.com>
References: <cover.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more concise and readable by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index af9a2b068796..cfc4cace6bb9 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -453,11 +453,8 @@ static void _InitRetryFunction(struct adapter *padapter)
 
 static void HalRxAggr8723BSdio(struct adapter *padapter)
 {
-	u8 valueDMATimeout;
-	u8 valueDMAPageCount;
-
-	valueDMATimeout = 0x06;
-	valueDMAPageCount = 0x06;
+	u8 valueDMATimeout = 0x06;
+	u8 valueDMAPageCount = 0x06;
 
 	rtw_write8(padapter, REG_RXDMA_AGG_PG_TH + 1, valueDMATimeout);
 	rtw_write8(padapter, REG_RXDMA_AGG_PG_TH, valueDMAPageCount);
@@ -498,11 +495,9 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 
 static void _InitOperationMode(struct adapter *padapter)
 {
-	struct mlme_ext_priv *pmlmeext;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	u8 regBwOpMode = 0;
 
-	pmlmeext = &padapter->mlmeextpriv;
-
 	/* 1 This part need to modified according to the rate set we filtered!! */
 	/*  */
 	/*  Set RRSR, RATR, and REG_BWOPMODE registers */
-- 
2.43.0

