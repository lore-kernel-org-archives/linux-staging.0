Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E24A1DB95E
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779636317; cv=none; b=BdwizRlur3x/YpDas4VsPkOtE5bgYoo7o5N9HBjjjGz1rhDhYNe2dSwCn255Pxv5AHvWZT5Os3+OuJy54/82Ck5fonXwQ23KFqNS4yuaEKdmaSaKEuAklNhNwUPnmey60cvvXmIHVrU6P35CM/wMdKu4KWQNDRzD5Hr6cMMUHwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779636317; c=relaxed/simple;
	bh=IeNjHrCVryrK5Aik6KcR9HiGXwhU5r2mjrDQ0Pqjj3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6tUDljDPen/AfJuIo7EWDsZQ3DV1SED63bh1vzODdm4Hg4YmGWuxtLiv5vxKH15JUMPY4/LnoIxCW3uHwTsSaPduVh2GpvTY3PuyeQeZlH13y2DmlK8g7NGqhRgEvPC46X1D2VF2NEGzTO4oKfr3+UZC29hvtI5qPKJ24b4ODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfmjGHBY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfmjGHBY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-367d88b9940so5838842a91.1
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779636316; x=1780241116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wMWTLVErG+lwd2OmwsvEi2f0/+bd0gdnAxYfjdNv9oY=;
        b=bfmjGHBYK2WHlnDe6Ae3gIhFS+CyMA36eIZ77omeG4v1RbHO5MvqaYF1CarM+EQb77
         TfVDXyzR+DCEKnUQxz0mOVynJqFfX6ltFnYhAUAUmZRVlFUqhbiqmncTvS3kG92EK9Ti
         fEQ+c96p+V+g3FKGZoQdAsQZLCvmxyj0yVIzqVqxAvkSgaVfRHJwreumMfvM3qnXdDeI
         8oFB29gnVfiqsLkUGDFUmDXRbo7HC6l4zhH/hrApKHU+KCGJBNG5fjc3/4eLDTst4ZB+
         g3Iin4zBiQofePLbAO8DyBRzX7h/kGOqtbFdclJb5zKjLAGfT1taOA2wfdSqZb3TblMY
         PliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779636316; x=1780241116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMWTLVErG+lwd2OmwsvEi2f0/+bd0gdnAxYfjdNv9oY=;
        b=lxblJfhPSZ0eUwFWNLRNvnJe0pXiIrQnBW+gra/9QfnpzggdgKad6ROJdQWeljInZN
         IRIjyABn31Pgi0EBYSUSpacLYsnxJRsLdcpYl+Q9RZrxr0OoyUnrLe5uVxC/OvU/+11P
         HAPVkwCBTLU0rzcKXEJMOs2acrHp1mISbaCyNRUDs58h6vBxng9z9vzhBwRng3NUqOYd
         XFSMzkJdTZHFuLM3ck7e6jHQEq54T58DZkqjXQOk+mZQnrVJhiOlZscKdsmUWfiZJreD
         qVHvgB9kT73R9VJFC8uQdWjazd/Nq+qSMrBQwrTIis+4VTMvB6IWl6QyDq8Wp1yNzz/s
         cdUQ==
X-Gm-Message-State: AOJu0YzdFsJ99ZJdlmHn1GsGF/8a3Q1DcQGGsiHtb9KDqN+di+ZxPPh6
	v3QZe4CEneNmov//JJphLdr5rMNx7od4srC53IaQNuiRVYgParRZc0KqTKmMQBVh
X-Gm-Gg: Acq92OFdyYXTnFyqFiKEPzHMc96d05vewxlnh/bI8YouydPUx1XiBZU91vlSR9AiaI+
	0ePy07vLbHUTFrDipe0ziFCcy6ughhTatgOlFEYw8pGOSR3yKc8d/m1Kp9IM6tn1kapg6nd5OQF
	EKfG8jXFN6L8eiSJ8V+isRuva8DvqgMo/z/D98TVyMC/zILmmLLro9xpoksrjhJ/Ff/eD+YpFMZ
	aWFIXK8VApcv+vUbSd5lpaMrnigvjpmAQ+WHvlg4hD5Ah9inqwCrci9ZA7ecg9ywJQcui1mcdNk
	PKGNwOH/gQQSVNUBmm5y8JD/1PjifZnR9SSOvv6fm0xHNV+/zVJi5E+29TNHiyPub/ylmFkpZDy
	4xNkZYYUy0JBvw9AwB8xiVteM6mmip9fFu5Wd+8uDFXbCjzl5Zu8C2iAZVk0oIb85BN8ULdUyGs
	/RJb6i+g5nIWAAyretssYtrPG+xFVib6gFHJfr5Q8=
X-Received: by 2002:a17:90b:3887:b0:369:7433:2fe with SMTP id 98e67ed59e1d1-36a676f5e4cmr10671515a91.6.1779636315544;
        Sun, 24 May 2026 08:25:15 -0700 (PDT)
Received: from fedora ([49.37.171.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c44a44asm4601229a91.2.2026.05.24.08.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:25:14 -0700 (PDT)
From: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: Fix block comment style in HalPwrSeqCmd.c
Date: Sun, 24 May 2026 20:55:06 +0530
Message-ID: <20260524152506.5670-1-praveen.pattar2022@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix non-standard block comment format. The comment was using '/*++'
and '--*/' delimiters instead of the standard '/*' and '*/' used in
kernel coding style. Also fix missing '*' prefix on subsequent lines
and remove space before tab characters.

Detected by checkpatch.pl with --strict flag.

Signed-off-by: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c | 32 ++++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index a59505cc4a07..7527ff051865 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -4,22 +4,22 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-/*++
-Copyright (c) Realtek Semiconductor Corp. All rights reserved.
-
-Module Name:
-	HalPwrSeqCmd.c
-
-Abstract:
-	Implement HW Power sequence configuration CMD handling routine for Realtek devices.
-
-Major Change History:
-	When       Who               What
-	---------- ---------------   -------------------------------
-	2011-10-26 Lucas            Modify to be compatible with SD4-CE driver.
-	2011-07-07 Roger            Create.
-
---*/
+/*
+ * Copyright (c) Realtek Semiconductor Corp. All rights reserved.
+ *
+ * Module Name:
+ *  HalPwrSeqCmd.c
+ *
+ * Abstract:
+ *  Implement HW Power sequence configuration CMD handling routine for Realtek devices.
+ *
+ * Major Change History:
+ *	When       Who               What
+ *	---------- ---------------   -------------------------------
+ *	2011-10-26 Lucas            Modify to be compatible with SD4-CE driver.
+ *	2011-07-07 Roger            Create.
+ *
+ */
 #include <drv_types.h>
 #include <HalPwrSeqCmd.h>
 
-- 
2.54.0

