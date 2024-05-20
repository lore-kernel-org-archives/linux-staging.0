Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB2A1B7E9
	for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716187687; cv=none; b=eXYH1pUSzogGpkdsyOezBMefzG+5gHvuk3DW3CKt/oPA6RBcsA3FJ3MXuzriSM9SeQCS7RVus70cJUDSFreFdY5UUd0nRDXehj8zP4ZBFMhg3Ea2CYvnvZRXzl1KUqE8rbRVVGSSy7EAPhQ9Rp+8KeNjmdorSKq2YD/jnfpofaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716187687; c=relaxed/simple;
	bh=y9ZGn5ap2YWzMsXkY7gtbA7uHfkEFSZUvzYZUdbBh+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hH+/Z4PVSI69VH4xMOHI2AcMp1BT7umWWnoQrG5+6hFI3wBTEvm8uxZwpYGRp87Az/KThfHNX6pbNcdBT24w+5WaAXauSd/0cqXSmPGVvBV6+7sSxpxb7M62r4/98fJqtXIBbZvXJ6Z2B+8XHOewzQj36OEBSAxdqjZFM/olxJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLFgT+F0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLFgT+F0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1edc696df2bso75114605ad.0
        for <linux-staging@lists.linux.dev>; Sun, 19 May 2024 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716187685; x=1716792485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zfMzlC0870/LEOajOtqmC6jp6j08ml+NFYZpxKCmgUI=;
        b=iLFgT+F0kuK2kAdnyOYf8xbxECj0gOHg3FkpoWzLfuNnY/StMbCw6vAKgUW320FY9X
         6hLlPN4up86TuuxAF7wo+nlgH5ZrjkxJyZlgEIghUi/R2WoD4dmbHMJ8KwY3v6cWiqwE
         CSvN4RodpLNL5EeWtsV4V2vZBYfd4UcujBH02hFfR53Jo7KRrCj3W2dTheC8xB6byb9p
         18wHlUwSyzUnWEPx+o1lOidze5uLkUNMSKQQlm4/Rg1LH/eoDqS0VuJg9jcqKxpqBlN5
         VWBJ2lbGhxUWE1mBhUGj/IUGnr4WY63TJPnYlFpQYDJY/LwzSk46wMf4CF9yNoZ27Gz+
         Y5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716187685; x=1716792485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfMzlC0870/LEOajOtqmC6jp6j08ml+NFYZpxKCmgUI=;
        b=Z1menyvYY6Az8TUNejnezcW8Y9St+7QNnB1L8GPK5ZcgSdpiscWgpQ6vQxXj04MJt5
         U8UjGEFYpL86ubR1c0a3OXvg40/4HpWwCeXL7zZUGtETsku4br4ax9j8pZh7ToBbVt4b
         6mRw1OpTDkbHybLMFZDDwUUe8uif5lq95gGYbUlVBErb4Xac/mnPGCoTTjg5+ikLQO22
         iOPJttuE5uO7trN8kjKYMMR4sUGhVCUoMZpp0Tvig/nZqF4Y4clZlAb/qhiOP6edCFBU
         WVqy0cUBwdOTQIXRSsgMZ5kJSlHkjaCb5LHHAY7EExrwJfZvk9BtW8mRU30YatrXUq1T
         tX3A==
X-Forwarded-Encrypted: i=1; AJvYcCWXq6141/y3xyao1LbyLbWvPyXoaJtWKwkCsNJS2O0w9jY3FmQfh5qdZPl4pFXkmWfcx/ROS1T9rjoic6knf9+QkyLFtugN64qMS/H87A==
X-Gm-Message-State: AOJu0YwFU9RzCxK2WdhNhv2IKfa0OYvg8XijEu+6+D5IodX+A73cXqJQ
	jMeSRQDSEYkJo2dK1Gck5OdDxnxaW4RQozCCA/4p9LZ14wwJ/hPB
X-Google-Smtp-Source: AGHT+IGMwSQRDnd6pbwi2Fukz0POjpWHTpsfdv+vu5vnuyuyukqUIACaipIlOEHjNA7nHESLEyakWg==
X-Received: by 2002:a17:90a:9601:b0:2ac:9baf:25b5 with SMTP id 98e67ed59e1d1-2b6cc76f70emr24064874a91.25.1716187685331;
        Sun, 19 May 2024 23:48:05 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863cd9dsm21206699a91.12.2024.05.19.23.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 23:48:04 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	ayushtiw0110@gmail.com,
	dan.carpenter@linaro.org,
	namcaov@gmail.com,
	linux-kernel@vger.kernel.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8712: Fix spelling mistakes in rtl871x_event.h
Date: Mon, 20 May 2024 12:32:50 +0545
Message-Id: <20240520064750.48912-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled joining in rtl871x_event.h. This patch
fixes the misspelled joining word.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_event.h b/drivers/staging/rtl8712/rtl871x_event.h
index 759a2d27d8f2..0cc780cf4341 100644
--- a/drivers/staging/rtl8712/rtl871x_event.h
+++ b/drivers/staging/rtl8712/rtl871x_event.h
@@ -37,7 +37,7 @@ struct surveydone_event {
 };
 
 /*
- * Used to report the link result of joinning the given bss
+ * Used to report the link result of joining the given bss
  * join_res:
  *  -1: authentication fail
  *  -2: association fail
-- 
2.34.1

