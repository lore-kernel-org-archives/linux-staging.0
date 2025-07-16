Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36D274B30
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752688250; cv=none; b=dNAkIQGsqzUohpOVdINNA7esWbZrKJg+RJ/loMd/NOsHst9xilhhLNlGeWO8P+45009n624oVwgi2/0mTrtN25U8unQUFLeNjK6FmgJFI5djI1DO2xHvSZ0cOgSDqO+eXXUL9O+4AAG/cOo4JTO1b7IAS0bEGMFqYVAsS4EN34Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752688250; c=relaxed/simple;
	bh=NxmwmV6GKcfbWspqDnWLX92e72awLV8rwODDUq2jO9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WJJu2RYgAnOFK1t3m4HyA4T4MGfo6T/LLaKMIpto5Tj0/f7hmSQ705orRqM/fRuLn4tEXhUpTp5iQiMkd0I9HVHJYL4C+bxRrH5TslOJo6euJtZJPaMvsUp+4ChMz3zdSQeglz5X9PFGgmQnoUlsbwRAN0t2PhsOColMRuqaI3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwuZX+cJ; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwuZX+cJ"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-41b309ce799so105431b6e.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 10:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752688248; x=1753293048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iE/kMDOOHXQl+jFqdxshOOvNPxmkM1ITmOkFwYRBlhk=;
        b=HwuZX+cJEGdCHuQOL9Emaq+Q6UgeUwafqsHqv/0hrSYjXaBz7nPXbWLkSfTxzH7kgJ
         XPixt625cfb3MUBry8YzKCy1MAuQhLyZUlTEXW/eOldEIx/Q3JvAaM883QBdc5SZvBWM
         B6ORA8+SUzDaz+wse/ru6/Jy6AhW+bNy8r5HB5GsQY2Uk26Sgj6K550zqHnudhonFYgh
         MqpH5zh3YJYhLl6dKqaTtHCAcAnk+jMG97pZ5HfCxvPovYsioHZ3+krkSBLGpTUgXmiz
         4Xy0ZUl0X//Vp4AhkJE/aDYH8g/0kDvvkzKqtoRYFPgy1ae+G1GJgVyXoqA/YLQCPCWM
         wO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752688248; x=1753293048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iE/kMDOOHXQl+jFqdxshOOvNPxmkM1ITmOkFwYRBlhk=;
        b=r5DW/puwSmh6mWrxv7Muxz94aAu/qTYaguxxZjKwQpHGQfBK8cAGS74ahIY+Iixxsk
         1wWDw17w6/X0n8Ke3Qf/S/4WM5oTVPM7PqJSXZ9H2N94cLhtY+zjiBOPJfS//d2q/keQ
         9KsEgEjLo6Uo9l8bcwxZTEvXGcNq6WjladjhsNs8o0QwwEeu/9S0ob8T2g3M3hByDIuo
         fLs8+sB9mIswNAf2VPw8KkhTaqYCXQ+Z3ympIJkr/J5AvwqsVzqXbgbsz5DI9mfNGpf9
         CuFQ95NRc5g4bD8hm7p7gE3HADXGx5Ga+CIwxqTvdeiToxVzaAzGN76CH2IrnY2mBg9m
         rC3w==
X-Forwarded-Encrypted: i=1; AJvYcCWz9Cpn1QQwf10VKnEP387iywVSmPYxmNT1HM5zS6yVm0OvBtSDgRY3GH9aBnKMkYjzyAKWaykfZIr1s9fT@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk50BQpULj2xKrn/TBx9MwZBFmB6cpfMwRNHemdqEZHfnjjHL8
	Ac1h+tMZqP7Gpf26/AEA2X+vV0qw4ak3xqHpOJv9+IgeOtX9co4oE6XU
X-Gm-Gg: ASbGncsMdUS6vUr6CRX7nwKnJ6qqqzHdsBBVhApR6y3WQ4r5ARRT84DwLF8g1HBH44H
	jHW/YQFDp52uecIoNhSWzRRWSjg0ZgGh89sJBaO/xTxL313+Zh9HEwoazlrBPOthUJrkVe8o48z
	TWb6mt5TgmMtv/+G6T076EbkNv2Bd9Lo3TJG6fNI8Qk8SCSmJ192thi6SlBM7ARPsklJi7Vof9g
	UKvjulf1fOMqy5Kzj1LK57kTqCY6EkWcD2wquQ9AGd2sMIymofa71JBJmlAdhpoA/raueLXsTkX
	9IA6DpdNL+LBB4RinD5AMWgpqduCj7CMF69V58ka3fElKmlLQ27w1m7XbCfeQm8xqNn99tPb/tY
	O3Gx8D5nODncmVoZdzrqxRMra4Zv9qbEov44LDEyKJtrk6T6QFbRF
X-Google-Smtp-Source: AGHT+IE4howPz3v1VeAuF6HoK97OYrPKZDdlu+4RlgvpZcUSaagshvhw7DBhfXr1ylvZ3R6+VyYDsA==
X-Received: by 2002:a05:6808:3090:b0:408:e5f8:9e2b with SMTP id 5614622812f47-41d038e1ce6mr2659049b6e.10.1752688248393;
        Wed, 16 Jul 2025 10:50:48 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-414197c52a6sm2874649b6e.19.2025.07.16.10.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:50:47 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v3 2/3] staging: rtl8723bs: add missing blank line after declaration
Date: Wed, 16 Jul 2025 13:50:43 -0400
Message-Id: <20250716175044.81439-2-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716175044.81439-1-ignacio.pena87@gmail.com>
References: <20250716175044.81439-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Fix checkpatch warning by adding required blank line after variable
declaration in Efuse_CalculateWordCnts function.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
Changes in v3:
- Added version changelog as requested by Greg's bot

Changes in v2:
- Split from larger patch that addressed multiple issues

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index abc123def..def456abc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -84,6 +84,7 @@ u8
 Efuse_CalculateWordCnts(u8 word_en)
 {
 	u8 word_cnts = 0;
+
 	if (!(word_en & BIT(0)))
 		word_cnts++; /*  0 : write enable */
 	if (!(word_en & BIT(1)))
-- 
2.39.5
