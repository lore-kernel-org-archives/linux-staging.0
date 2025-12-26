Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012829A307
	for <linux-staging@lists.linux.dev>; Fri, 26 Dec 2025 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766742251; cv=none; b=JmpiY3QyQd/4EUGc+YmZ7A+Rsu2dnT5WMkUiCFgiix/lFoPqurezErk8NVc4Epk+cQbD+w/S7iZe+rnvCRYW2EQpUsrhTnOwmPvPBROPBvl6mSKpMt6bdG1inud78hl3HqyFShukpbVsH93ir1DngvZuLAXcMU7X5mOYVFF5mX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766742251; c=relaxed/simple;
	bh=M0aOdXt1ZrFl4RYJLFbPdD4kNmflwykM/m6VN+0nAYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EwyTrHtTDSRUrQpBVofa7Jo/RmflGYG0iyWTbb3jvJJE4XzSZzHjuJnJevc8n/JNxzKFOfFPGbR+RUiyy/1DQevr0RrNRKyJwR3Rn/ZESee/tS3y305qUgIWxtwCUXP3m5UES6VcarcVAZhnVuWnlNx41ySaiZObELBEjOhHzOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fr0ennwD; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fr0ennwD"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-11b6bc976d6so11746219c88.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Dec 2025 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766742249; x=1767347049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NhgNhOp6quCz7aJokpI0ehZtf9pg3SrW2SryTp8kXoc=;
        b=Fr0ennwDYwwc/I1KDjv4YRU4a7gpd1KgA71ergYNKinYU0S9EgimZdj/M4S2S8MeaK
         N56B7FsHojIdDIhvN0TKOYxk+FZb7cWY9oIDsX3n5wj/zY7Qc36s1GXPCBZgMnCOEcE2
         gjHR3XavlTxCKVatPyz9qinJS2ORS0SxPQc2qRBTW0IIJ5htEWnCjEm4lOCB/9JhoOss
         dHvhBpFxrqbahIegygiwyuDzQdRyC66krVdumS9j17hJlqh0+ODOUKuGk63aNTGX9qVd
         DEJOZMIp6XgoSYdPoNGjDKMZMS/i6q82cXA0uspLm+U0oPd52T4ltF+ayG4BVie2qC+D
         933Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766742249; x=1767347049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhgNhOp6quCz7aJokpI0ehZtf9pg3SrW2SryTp8kXoc=;
        b=BlsdSujMoY6pRVyPpBJEVBXuyaoMq9w0/O+ehHdr5aLBmUuCePKU1BZyskE4cm4eXc
         +2Lfun3CcWKtzYL0LiI6x//1V1oA7TFZHeIWuWeeVN4EaMoP08hdyi1HUpQUIf4qkFZw
         43ojyvaVHnhWyDnt3itjPZ0ZrEma9rjXRosiTl+RYJtmIkcQUe9QQz8K4+Gy4eoQfbhz
         hEIphb//fbfVJQoK45JRyfkrJD5Rokjr+FlACHbCTVxVu03xyKju1t94DOiIx60howQS
         Q+ZQTMwRGtfcBMKQXdk2Wxwf9sWZRDraoIGPZKmQI2TFFKDyl3G6zEe9CMjGhth7O6hF
         HrQA==
X-Gm-Message-State: AOJu0Yyo2N5KX5sPzWG5mg9ViLYZq4yKquDWtZR4YjHMKxgLt+l2AkAw
	bxQIJGG6XYaM4wJmrU4IZWPBcGKeOMdf48t268caMmW6+8V4J17aXtdJwqRJZ60MOew=
X-Gm-Gg: AY/fxX6UDIebeSF5jufoTRpbZU1xcOjfeMvXekoA+1Fb2eD9XvYvFowGEsp5PMN1353
	g2blecfG/KvrcBErF4D75yDY72dkNi4YwtkQ+DjA72lEKwZk37CK1CPSZECqxlfbnEGHvZ3xCLk
	Hb6gthLctEh/wYza2ZeU6tC8ZKwQE+VfvWfMCGxFBA5KWEsQyf8BjBgrykeJseloktwjyu1RjjO
	Qyw5MW8FbGPW7oKNtXVyqR75LX40S/TDitpgjsSlFuiHaRmQ8/tO4/6rVjqug4H8fgAjBBeSyTV
	f+3Z8TeC1Ou+Ss1FCJ87BpXJjcFYYZsSqGVzhz0HMFDOZnbfPQEHaGCtYViCWHA9+1guBGexYRK
	eN0CzuysH47PDLfjjp3An7MJdOsYA8q8s5DokM9vfVUETrqdQx8EpnFXfj/xDimBAX85cGqyINZ
	mjbsqDRPwKy4pbi6ujV2n0Qf9oDHYfQctKgXmshY+QHEo4Ao+DsNqq1GIP8+F68bbua7yh6Z2+4
	mD99UI=
X-Google-Smtp-Source: AGHT+IEGcMRnhDzu9ih8J8CNPxipD+7o3dynsWYYLOyH53FlTnPhvwxfYS78M2NT70Qi46DvreGtiw==
X-Received: by 2002:a05:7022:b95:b0:11c:9c9:224a with SMTP id a92af1059eb24-12171a687fcmr22631009c88.1.1766742249291;
        Fri, 26 Dec 2025 01:44:09 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm86064451c88.5.2025.12.26.01.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 01:44:08 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix missing blank line warning
Date: Fri, 26 Dec 2025 17:43:49 +0800
Message-ID: <20251226094349.156538-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch warning:

  WARNING: Missing a blank line after declarations

This adds a blank line between the variable declaration and
the code logic to improve readability and adhere to the
kernel coding style.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 0ee50b4a1149..454f2fabc116 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -132,6 +132,7 @@ static u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset)
 static u8 sdio_read8(struct intf_hdl *intfhdl, u32 addr)
 {
 	u32 ftaddr;
+
 	ftaddr = _cvrt2ftaddr(addr, NULL, NULL);
 
 	return sd_read8(intfhdl, ftaddr, NULL);
-- 
2.43.0

