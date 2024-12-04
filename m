Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C020420B816
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324278; cv=none; b=hAe7ivDJqAhGhRbg8nzGzlhriXDyfuCC2Khj5wZ05CErQQsWVFY+68Trsbq3+msZYn3FrDAd/ooT5PN2Xosd3Nom/icvQX0OxA07b9FY/OrubTM3by0Zm6gdnGvf/EDj6HmqZOvNzvP7I/0S8LPw64cRiftzAvzsB5IhVMFc51E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324278; c=relaxed/simple;
	bh=P1ZNFv8s5M0+3Slh4vQI0NzHee3PzeVzJleQKQUH1BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1ig8jIKkSVg5MRte/JgHww1mczvFyeDGhSv1R5NvNhprgrS0Zld5I+R47d7qSreQxOxFVuMUJrqzsEO963IqRAVz27liTYDRHYeEE9vJpZJ4EltlyhOtWZ+AYcaDEbqrNBFbebaezo6OvqRnpt7mh6/qgvdJMEZf8mUhy97O2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxcypVaF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxcypVaF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-432d86a3085so58371045e9.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 06:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733324275; x=1733929075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uvfwi+j1KyAse/3M7FYZc6SKkpOZJr29bzDI2D3zaDw=;
        b=WxcypVaF606SWJs2dSdPxP0zadteBYVG4MzAGYoVK+AqU07M8EWtzC8bdWYyRGDYDs
         d35z9rPneHgv0XZNIkc8CoxqF0RQGns7ZWdGFWanLcnlmfzwYzgpGy7StXfnWd2eaySN
         kQHeiOcXtVuD8vC/d2FXLr2WdVJPxGG6NqiKcd7mXUyUuFv7cAaSONKeWrDG7jnhdgIb
         JQ+xppRRCcl+v2EwCvBti8qL8FDXPFHUfhAq40RfJqq+lErBnV8of6G6hwM744AzlpRP
         5LUsLVu0aMUlGOU77xkygVOKsbUsD380yzDJOD7Oy/YXO8i5q3gODf9bqVcMsN89yw9I
         zrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733324275; x=1733929075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uvfwi+j1KyAse/3M7FYZc6SKkpOZJr29bzDI2D3zaDw=;
        b=SZkR2047X0RKQDkjTBW+yyt4wNEDmHvbPE/3U1Lz46OCHegoLwIW+QvbmMREFXUE1T
         yQ/7Q4F6q+8DICFZS8F8zuZFJZeUBNM9uLZVfLftwVq1QV3oyos5feE42Bf1NulswblQ
         4tBuqHFdgbt5adDCWufe1EqoXik4ygib5n7HG2ui9QfdBLubvbiZL2JzeUEwskOdXpPT
         SlWhrq/3vmahG2T2IO70IXdFo+JMJc2llwrt+JC67dxHKXb0fvm110mMwiBOqyDK6jW3
         TnXTU0aqrI0U9wiYv2VAiQn/EWi1VseUED64qEXvGagopRgnihbmiSMUB7IGn25EMSfN
         JREA==
X-Forwarded-Encrypted: i=1; AJvYcCWC6dCxOn5nnCr1Q6A2y5xeJCQekDrDtF4SQ0x9FgugaUMAvqLtz5EzJbJqGIPjZxdEwpERscpUVQmE29hc@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg+6Rpyy/GTYqhH85/6HbGIpdgZzFK2mKY5ELOIey1gW6TZyxv
	8KHDFaQB06Il+OOwW9/qMr4Scz1ErR6BvHPVyaTa44UpXDfgazDf
X-Gm-Gg: ASbGncse2b1EP4kCBYxBbcchZAu4Rhu5aWba1mfMU3ejpa1Bzd1nGzXsmSTmXk2U2ta
	oRXpfNtF6CCJcz2wmcbIZnPFpXf+bPr9dPcp2U06WVV5i8QnuGaBu1SZ5PjBH74fGDiZyvEt9OU
	2ATMepX+MYPj0pt2GtZ3aaA9So544onCAOQXwyeq3fPomZZs2vjNn/P2IK/NYvUIiHfeBuD2ujA
	m53ki5XxkXzWP0oGCc4E3cEGEHyCui2nizxFVYE5TmW5fJsr34OydiiAPDlxgRp7oVFODUsUJi0
	Fq5CpxyZXw==
X-Google-Smtp-Source: AGHT+IHg9axXITfuSoX19A6v0clv2maNj8PY+pUPxJwY9VwMSX/zDP20IFsKU8QO2ZSwkk07B/E0QA==
X-Received: by 2002:a05:600c:1c07:b0:434:942c:145f with SMTP id 5b1f17b1804b1-434d0a1cdb5mr55667205e9.29.1733324274947;
        Wed, 04 Dec 2024 06:57:54 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527e8besm26678955e9.13.2024.12.04.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:57:54 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	Kees Bakker <kees@ijzerbout.nl>
Subject: [PATCH 4/4] staging: gpib: Fix faulty workaround for assignment in if
Date: Wed,  4 Dec 2024 15:57:13 +0100
Message-ID: <20241204145713.11889-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204145713.11889-1-dpenkler@gmail.com>
References: <20241204145713.11889-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was detected by Coverity.

Add the missing assignment in the else branch of the if

Reported-by: Kees Bakker <kees@ijzerbout.nl>
Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index c30db3615f49..5114f6c519e5 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -899,7 +899,7 @@ static int usb_gpib_read(gpib_board_t *board,
 
 		} else {
 			/* we are in the closing <DLE><ETX> sequence */
-
+			c = nc;
 			if (c == ETX) {
 				c = one_char(board, &b);
 				if (c == ACK) {
-- 
2.47.1

