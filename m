Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22C345EC8
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824320; cv=none; b=D+7n65pFivlvHMj4SB7rxlgi3WE7mLetLABQrUuUidbqkhEMil4lzDJq3S/aGLqqSGzvN7aoLK/Iq82zWhoESkMuFDjz74FnIPJtH6YaTqhXhoJQ44wMfphxM94xjWjIpyZ0HpeW3Dqh6ML+v4FtDj33YabcPn1pkVMriFSiUnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824320; c=relaxed/simple;
	bh=t0hG9YA48ZZNV0kpogaOOG5tSfxvprWWT2J/V/k1w5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ui2TEhIT0LpR/bOL+ixQOPM2wMBxBDo6RocXCuE5mgPuW2NnpyQgP3Zpkz7KMiZ2ztEZbvaeoKOZFqe7WuOrtRajj5iNblh/vJtdMXqr+sP5hktx91KqP1PmevjeVNrwqM5upQXT18y2hXSR9D5AXV7eSWVC8Ss67q0uC43nzwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYVxNUHu; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYVxNUHu"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso589406a12.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784824319; x=1785429119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DL3aBnuaIoM1W274IhT+THzPcUruGGe4QCGqMrm2LZA=;
        b=sYVxNUHu9LEgGb/R+PFsSZm5acQIDacFXKPjQAc8mudljXTKkfU0tgsb78tohTk0ar
         p8kiaCTx2J+0FYbv3ASXhftWLeRNmn2ffG1jxg0NPNZeRHNVclXjyPtE1d+JtbTqhLZy
         F6d25d0gFUhrBA/FWjuz9pnnij3eaHGPyKWpn8rAb/b7gWx2ZV3QkK5jtxRldz57oid8
         uPPEfBUUPs48VVqTb9h/UOSoJRUV1g8w67AzW6brPo6rUc64yXohzGff72VTOrdaGr32
         DqY7zbOhe6u83j45rIAdnywl8a2ty/AUrBIsWeVLK6uV+B4WqsglwqQUCTffgbwAmLtd
         913A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784824319; x=1785429119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DL3aBnuaIoM1W274IhT+THzPcUruGGe4QCGqMrm2LZA=;
        b=LatxEhzXQF+Zsbd01CmQ4Y1bfZ7josUoKnpU09zaek66nNLCOXk+TYTOE6OWTdhMlu
         L5YGq4WyABRdy7XYkyXT2zKG5jPhTRygePti4TVhpxHffyr4xIGFjhGvO7T4jCmg/0oV
         XfgFTXFXHA+mV2G7tBgu02OtzRU2V3/E8KlaWQIoOMnawWiWD35QBzeRyNemPGlP+/R7
         r6xERWsBzcW3AH4u4q7wpdmBUsUtbvqjzFH6g7x3bIiG+cLYo4PxD7j24QGyU1+UnUtR
         zgixo531PCPW7kOwjA2/ZgN/hdVm9tJRmw9RRzmBS26KUXOfhC76j0D4Vxi9T1VCZZhb
         e93w==
X-Forwarded-Encrypted: i=1; AHgh+RrUGot0MmYOGSGvUPBFuQYfjXMf3kuRo3bnD2m/ubRkWDHXARY5daUQnFmVAfbCzpW74pv7wuF7MgSr5c+h@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5viHDnYY/JhLcCcauqyY8yO8OoU31aOzpWJgiopMfoLMd5hsD
	wXD//J7r7Eh4LXw1LwWHXRTDZ17Ohp3qsnOQMpCOxFxWf/oGO6MQBzdc
X-Gm-Gg: AR+sD10zlhpuvkjb6T1K6utmjheCTgtCSbsDxZYDj+UJAyGx+ZURvKtXh+1Uex/2tXg
	dAc9k2jjJsB55smb1jBBgc2HSriboiBk5kHdiPhABVky88LW4FuMlR2EX1exM1DRMNIxTWB9bBz
	Bg8zV58pbMOXf5P2jeA9VUHaORtPM3vAe8K+HC3LMs4+FBP10JRum2DypyJNqw6fJIg4ZcCFQba
	ERea/6AWm545WAEPIGCvsq3jhWsbn9mGXpQTnzwQQEAXYj4QTF8D7L4leyRUf/2f5zntUbtHH5I
	tSmSX7pI12Z7OTCgpv2MS4svO4ZIgXze/F+zNqvrOHDwjD0fLIXCjCwO8GoCD6uWziGDffC2y2r
	wk22sw1DyP5GaXhRAo0VKZ8w7XP+0YBkqQ9xQlcPh3S6t2CEkg5AUqQmL0nZLBbBAABzqce8Ma3
	KTTKoetPPAy0ixB47K
X-Received: by 2002:a05:6a21:e8c:b0:3c3:a529:1e44 with SMTP id adf61e73a8af0-3c44b209ff9mr4296837637.57.1784824318805;
        Thu, 23 Jul 2026 09:31:58 -0700 (PDT)
Received: from Default ([2409:40f4:103a:a0b9:b09a:8c9e:d470:9a8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm20824106eec.12.2026.07.23.09.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:31:58 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	error27@gmail.com,
	gustavopiazdasilva2102@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>
Subject: [PATCH] staging: axis-fifo: Fix alignment in open parentheses
Date: Thu, 23 Jul 2026 22:01:10 +0530
Message-ID: <20260723163110.126797-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error:
"Alignment should match open parenthesis" in axis-fifo.c

Thanks,
Jeffin

Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..e8facc9b429b 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr +
+					       XLLF_TDFV_OFFSET) >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.55.0

