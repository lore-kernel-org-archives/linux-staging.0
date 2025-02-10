Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94283204860
	for <linux-staging@lists.linux.dev>; Mon, 10 Feb 2025 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200238; cv=none; b=aA2qwVgzGnz1v3/Rz0nKanmDsQWKrOIm4Y6mihRZxvOYSX6EwVTFvaaumuQ8gx756OZktyoTzFJF+0PmE9JWZYhmMT5cFTMiG8jFRxnY7F1za/MLIQsNHvD/Q+qzCu5lLmgucHJg3ooOYv0YTHC86JprXB8tJic4E7IESOTDjh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200238; c=relaxed/simple;
	bh=Ab/EthacSp9k8Iu10wVGwmduPttIkWKvMepO+R0gYYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEkpnFMdvmwLf/KCZciiy5YO2HmtSTyv/lham3li5AD8AW4HZl+wqjr2rV2O8Yq7+TSlopykJduh4PN/WCT6zaeE7rPN6Aq2caRXeKNuHlYFcYkhfsf8EjsI8Cbma2lFUgdLuZPzlec0bGd4lPg5KGYfBvll+A8Ul8rWBKORTU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8NMp2Gy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8NMp2Gy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dd0dc21b2so1497931f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Feb 2025 07:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200235; x=1739805035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+ph2F5KhKVvbTUhZm/M47bz0r9DxDu0/tq/FGkmTT8=;
        b=N8NMp2GyZJrP7BcWjrj0Hkdqea17TgJi23xq+GCsd050o6DyVOmAJQbJGApVvtWex0
         EadkMNf97/wBgWndUebSATZNz8U39NN6g7/ba3kYdfDwCWPdXul1tRY90c+20kgoVIr2
         cmuJcXimvBhZ5MP14230MGgy0klX4gEvapb71jTufibxfrh8KKpP4HYx7U/A0/V8ewks
         tJN4Sy9Bmskozu6i9HxMvRVHMQYB5Gbyxu9ROFSiJZvc8/012ejz5wySBMLXKBFSv9TU
         uOGiPXPTyW9ePzX5ziR4N/O9S7N7H4tzdzlkfnCmcWcS4lcm6wCJHFkuOTRvF11XbHfD
         byMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200235; x=1739805035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+ph2F5KhKVvbTUhZm/M47bz0r9DxDu0/tq/FGkmTT8=;
        b=jpHlGj+KhIpKwEC9rV7txv7CX/JPOFV6mJ2W6crszrfxrcFanxqFy4/70x50LDlbBX
         hi81IrSYEjZdujxkG1xD15yAPYe0ijpJqqv+UwOCfhkzFAZOp+Tfh+Be9VRjJDw7+nWl
         A3vp8ukFKwlKUrzoEb+ZjThD4M4po29sVApnRyv7p1KdAyX8abNfc75szwXHD0cAHMFj
         u5To+7BcPN8+/uOQd/6YsrftKIQ3mc36BxY3pxiCE1bdvJPy6tPz2yl14Xja+0Cxrx2o
         MWNKYmI+3teanJ0bFUEFr55ETexnIU/1RDlieXNX7QAZb2Hrrw54tnX/xRmAlAstXzj/
         D/cA==
X-Forwarded-Encrypted: i=1; AJvYcCXts8TUvq0I6UFtsnZvJdHd//9/OxRk1wbhzCY3ZOBahVsL5U8NAuowV2e68XQiQ2REGH6fwySbB/WEH1a0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/p3eXlVP/yInoojePt26pcYRhW7T7Bl/VGK+CjtPfsEp9rGdr
	D3RzFxA09iZNnAem9IH/oW8bQf7e6zGnooxxbZdJqpku+rowre96
X-Gm-Gg: ASbGncvQ/RNofggp7J92bpYZ0kGRWo5Hbv+cC8yx0wn387OC9eUM5wsyIq9OfFJNIHa
	nD3hQnulLUHiWC2B+r4F5UrayHBFgyvua7ZoAyI5riggNf4v5xkiGoF3QOHvU938DpVpif08ULe
	HTartg12HG/4ReWLyUOFFVUllEZlAu/jZ0Br/GzT5YZdyll9otoWVs9dTeM648NTHEAKZAymy5f
	nE3agfKJu60PDSUoSLPQmHzDnc+UX1FakO1V26UXCe6PErxJhmTqSkuGhMcQqy8keTM1lScH1y/
	n14p8fgRVY138fXEIGuyDm3sKBbw6sQNk9PTSSNIuBDLIspbpWE=
X-Google-Smtp-Source: AGHT+IFOFeSWRD97dU8jztQYtBklJWN5K+MWoHjK+bqB4GSWwnq5osOsLeupGK2kvMf5cbfCmVyXIA==
X-Received: by 2002:a05:6000:2a6:b0:38d:dc4d:3473 with SMTP id ffacd0b85a97d-38ddc4d34b0mr5128049f8f.51.1739200234740;
        Mon, 10 Feb 2025 07:10:34 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8881sm146834645e9.28.2025.02.10.07.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:10:34 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/2] staging:gpib: Remove GPIB_PCMCIA in Makefiles
Date: Mon, 10 Feb 2025 16:10:22 +0100
Message-ID: <20250210151022.4358-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151022.4358-1-dpenkler@gmail.com>
References: <20250210151022.4358-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This symbol is no longer needed since it is being replaced directly
by its Kconfig equivalent CONFIG_GPIB_PCMCIA in the drivers providing
optional support for the PCMCIA bus.

Remove the definition of GPIB_PCMCIA from the Makefiles.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cb7210/Makefile  | 1 -
 drivers/staging/gpib/ines/Makefile    | 1 -
 drivers/staging/gpib/tnt4882/Makefile | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/Makefile b/drivers/staging/gpib/cb7210/Makefile
index cda0725d6487..d239ae80b415 100644
--- a/drivers/staging/gpib/cb7210/Makefile
+++ b/drivers/staging/gpib/cb7210/Makefile
@@ -1,4 +1,3 @@
-ccflags-$(CONFIG_GPIB_PCMCIA) := -DGPIB_PCMCIA
 obj-$(CONFIG_GPIB_CB7210) += cb7210.o
 
 
diff --git a/drivers/staging/gpib/ines/Makefile b/drivers/staging/gpib/ines/Makefile
index 6b6e480fd811..88241f15ecea 100644
--- a/drivers/staging/gpib/ines/Makefile
+++ b/drivers/staging/gpib/ines/Makefile
@@ -1,4 +1,3 @@
-ccflags-$(CONFIG_GPIB_PCMCIA) := -DGPIB_PCMCIA
 obj-$(CONFIG_GPIB_INES) += ines_gpib.o
 
 
diff --git a/drivers/staging/gpib/tnt4882/Makefile b/drivers/staging/gpib/tnt4882/Makefile
index a3c3fb96d5ed..fa1687ad0d1b 100644
--- a/drivers/staging/gpib/tnt4882/Makefile
+++ b/drivers/staging/gpib/tnt4882/Makefile
@@ -1,4 +1,3 @@
-ccflags-$(CONFIG_GPIB_PCMCIA) := -DGPIB_PCMCIA
 obj-$(CONFIG_GPIB_NI_PCI_ISA) += tnt4882.o
 
 tnt4882-objs := tnt4882_gpib.o mite.o
-- 
2.48.1

