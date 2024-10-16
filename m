Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A8198856
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065415; cv=none; b=hJC9ijIZzQ2f1PTzVFh/11P85sFAUurxDHxQBvRR/sj0fegi+6z0kUtyBDhDaiaJQIN2jATw91fTsObQ8CtKc1C7WyLdRvfVHdoFcodmJrBg5PgeFmr5JHv/rJNvBa4jUjWpxFsTCrmYLS8/HIXh7Cr8FOYUsZGSEP4H78dZZw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065415; c=relaxed/simple;
	bh=O+5lJ5Ni7lFZp26xLN1oEhYuSX0s3Lqt4VrhJx8zBsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdHrPIEsVIMsjs+YlkxefS44mqV+Q9djbzieyl0M6FwMS7TMHUhF83xA+UgMB0LNC1va/QIGLhWrSJ6VDlYqLp95l2a7pLYuXWBgFggq59JB4egNpyzuZc3Qsq9HXTG9GzvITuQnBgpz24t4jxBBXCA9eBWjdbak8leIZW5DdBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=Io3M5PJ6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="Io3M5PJ6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e6cec7227so2050935b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 00:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729065413; x=1729670213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cY1GwhXrLBAJECK/gKfBurYS+3BKFHmYqoD8mjoZOgA=;
        b=Io3M5PJ6xTefrB1RyA0S9zcXf3DcZ/zyIoXC13X5Ao9Ltt8EWKq90amFGYY7OwkT7S
         vtkW38TIM1h//Q5GIXNQCSNixUzHRAEtdCg9BR14y0ax6TnGEsp5QMyLqIfpyIwI7E//
         RQgsejgg4OHxcW6xOCp4H5GLq85Erh2pWzlKjJ+QCsHRbA7ZbiM9EmzH1Xnc1WuBcaST
         4Nu7dE2RzwLkq3vALOzc5GsMTom9exI6SeA6dsYHHHqWWfnP8a3rjsppRwGs2YLJ8CZB
         8jrrwk7KJUUkhEIMZYnBRSQCQSk+V0Bg3EQUcltTqaSbzBM0zStNdyU4AoaF2lPe/TwU
         +EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729065413; x=1729670213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cY1GwhXrLBAJECK/gKfBurYS+3BKFHmYqoD8mjoZOgA=;
        b=UptKzQmi8X+pufUOeYcpV/xVRbfmRhD/i2xqPyrX+SnOGixE0f3A/75kHD5oBq6kRN
         C0o48nn1K5oImmROJlOIMM+Pa+FUB4BGwEUQ/aUdpdf3fLam3wHhWE3G8Vju4a1epah4
         3VQNE9NAHg/aE+4zE8YOVgL58f0xzJ1dMUBnXlCFVLMumK1HRLnYh81meAHe1bZo14Qa
         X1kBvmbwlX5C8UU2hx1ckGqPXQh1RAv1GSWASL6hdpPMQh8+uMmBrygbgFAkv9/WTi4n
         IzM1huIrndSCf1ZCSBlVaLAjhZAzkLCzzXpou+fTHsEZaEFYe/dQbZ711rAanRM7GANv
         hjLA==
X-Forwarded-Encrypted: i=1; AJvYcCWvr3ak14mKZq3tWjjUFJwJqS8Cmf7a9iNseeGBTBCjsaUS6SGqczMGJ9c/iCsS4vCLJdYLg00WC2UHPx3O@lists.linux.dev
X-Gm-Message-State: AOJu0YxVbYqwA0OAceiZasmF2S3OWAgihqqAO0CiJjk69jvcSQIidQUT
	mUc7dL+pRDlXfeHgcw4SW2wAeUOvyQyriuap36f4JwBhqcaAkuwFAwJFMv5xba0=
X-Google-Smtp-Source: AGHT+IEdKtSTNNT7pPj/NNmW0H3kFE87LSlsdU5aTzKc2Bifh4Ju1KicfbqlfaUrAdSDAmYFllUY7g==
X-Received: by 2002:a05:6a00:2da4:b0:71e:4c86:659a with SMTP id d2e1a72fcca58-71e7da48723mr5210472b3a.9.1729065412526;
        Wed, 16 Oct 2024 00:56:52 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.27])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71e77371708sm2522972b3a.32.2024.10.16.00.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 00:56:52 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] staging: gpib: Remove unused value
Date: Wed, 16 Oct 2024 01:55:43 -0600
Message-ID: <20241016075544.4125-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable `complement_count` is assigned a value which is again
overwritten in the next statement.
Fix this by removing the first value assigning statement

This issue was reported by Coverity Scan.
Report:
CID 1600790: (#1 of 1): Unused value (UNUSED_VALUE)
assigned_value: Assigning value from length to complement_count here,
but that stored value is overwritten before it can be used.

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
---
V1 -> V2: - Removed Fixes tag

 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 1da263676f2a..e19e18892468 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -759,7 +759,6 @@ static int ni_usb_write(gpib_board_t *board, uint8_t *buffer, size_t length,
 	if (!out_data)
 		return -ENOMEM;
 	out_data[i++] = 0x0d;
-	complement_count = length;
 	complement_count = length - 1;
 	complement_count = ~complement_count;
 	out_data[i++] = complement_count & 0xff;
-- 
2.43.0

