Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4283368A6
	for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189273; cv=none; b=n93nh/DKGSS+M9vv1xUJEJ8QmcQK0wroophnovjlrCesi25os7AVcj5PUWr3iwZjMw6nLN0KSg2dATooLMEN/VBDUfx0fTmzWjfP/otihOemdaOP84N8OMXGE18/qkdKLb2ip49D6wDfctctX2jYDYltCtEyInir/8jMUpORsMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189273; c=relaxed/simple;
	bh=iqw9joRcspZCH/8gMqnFSFCc4GCnkWYXmP5HtvqP8lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q5EgjNhEhPXSYUI7R3AqXRNvgCZdzQNTykO2Z2hgMpKx7vl40RJS1f/8jaZYQgZ3BbqR/G2QFAC06oKN/MQODr8MFoH4XqVMlIXqliLrqM39zJeMDFt7g0LOLqGa0JeLsmgCZbwFCyUbn+wsNwWL6Uo3wS62RUrOidifiCoelFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/0sqh2X; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/0sqh2X"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-487035181a7so7449545e9.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774189269; x=1774794069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duit6oVlvEzPP5nc9GzgTOHOPo7U9Sp31ZgxaS7C5gQ=;
        b=Q/0sqh2XKGr+DbtsSriAi8oiZxUTSJ01lQtdtI9O8ntADLIvsOw67OCkmRkAu1v0c8
         qR7N2ShF9IKgMZScthHG1ErIzHpedTT833za8o9IBBRGtPNMmmJ/V0wZ8DfTZdj33Euu
         Vk7FtBBpEGykJu8bmmwlRrfwEbY9rW6kFHRzQk5FF8UGmbeV1nb0l6ZF4kPlCvENWGYB
         rCaTLjtb8UKlOs4MxAIuHeldZm84UHPHomhg+ykB0oLcpatXS0c5qpkSgq1lbaeXE7pF
         iiEH7hR3WeizYxO7sWY/fxquykf1vBcKDmaYaM26Jwe3dvxE2gZ2ocbDUbqEUpcRAayq
         UB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774189269; x=1774794069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duit6oVlvEzPP5nc9GzgTOHOPo7U9Sp31ZgxaS7C5gQ=;
        b=DnssffgsM8/NSx1URE5xVsW80pF04/Ii3D5qUCRIdpPdqe9jzlzS9krZS04WMFa4gG
         xPjvTXE3KRC/VP37UdYoa0cUjH83dAvkjuk/2cbicy6aMaeeSWzhXhfDjyyS5TJreyQm
         ten+5cak3935P0Lad6POua8NwS5ylLWk90XOlg5RvV/DCILWOjFDvcUqy0xrNZ+puPJ6
         Vaq563+x860q6I8LkbZ8sJZTWedW4m8xzQCwJRjBsHcG+qKxChOiOkdP/CKywkmQMG6L
         HNt1esJ9oY/njPxQubSEf0Y6ATQr1mykJgk3RVTdHyXHrYOlWly3mDNb/bUNRmf31UUD
         Qlew==
X-Forwarded-Encrypted: i=1; AJvYcCUuk2cB7TEHL1Zq/HyP72KbiQR8sAL80H6L7ul/sh+LeO9OvromwgOhRo/tDbiP1JCYqCE/E2lDQU34cZic@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc4TFZWYNColY3J14Gr/3pXjcKZnDAtmj05sbA/9wg6pYHLqXr
	9FUTbJK4Yfhe58VELvjgwlj+EVQSRKKds2Fr7G5Z4XgA4ECxflpQ9/E=
X-Gm-Gg: ATEYQzxTXsYQeaOgO+/gnBGeSqo7k9OagWBr7JznEgSHRlbPxL7Aj2cmpSkaIv+7kOU
	HaaiVf/1RtoTgKfc2V3+ysbK+55EpAMb0SbLp7PL4nscsNvwf2ineQMaYxTsCtka1AwKqjcb8Qe
	rioxnwF7H/0jGMhFbvjBmgtf3hzzaIsLudDA5P5dvua8X8Gx7WpZWJYteHCcQ2+2jHgwAIHedaz
	e6UopaWTXB5ZEpcJ5kPCnKCl4pTBnh7ImCzqbVophaEc0Q0rZ/NMF3LocRgLwDdH7SS7pvHITr2
	VDztcA2SgMMcl/P0G5p7xV5oiSZD/OWU0WCVPm+LJR50w9YcjGY5kT0XeC7RRR76MGQoe0L/tr7
	xsjC/0XFnCKi0erB8tNgVJIt5boievWhqFCW/DGk16mBWxmGCZeg5Xch/R54dr1RpIzzxLZ0/V9
	mrgFh/8dBNK9iaJ5WzNsuFTRsGD7i0XRihloiYPpWUL5J0Z5cuLnGgjSHVgI1DM8uS9RU7bpg=
X-Received: by 2002:a05:600c:8b25:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-486fee0d8cdmr138331555e9.21.1774189268766;
        Sun, 22 Mar 2026 07:21:08 -0700 (PDT)
Received: from hp-ubuntu.. ([41.249.139.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm141340055e9.1.2026.03.22.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:21:08 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH] staging: atomisp: fix spelling mistake
Date: Sun, 22 Mar 2026 15:21:04 +0100
Message-ID: <20260322142104.41647-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of 'uninteruptible' to 'uninterruptible' in a
comment within system_global.h. This improves code readability and
searchability within the atomisp driver.

Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..bfa8682ee667 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -29,7 +29,7 @@
 #define DMA_DDR_TO_HMEM_WORKAROUND
 
 /*
- * The longest allowed (uninteruptible) bus transfer, does not
+ * The longest allowed (uninterruptible) bus transfer, does not
  * take stalling into account
  */
 #define HIVE_ISP_MAX_BURST_LENGTH	1024
-- 
2.43.0

