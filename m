Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D32C3261
	for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774179170; cv=none; b=lCnd+n4Tnchai6koFN9Cbd/2Golnmz4e9kInTnLzmLHp4B42Ccivbb68IfLdJOKiEwgwCpbWx/uidxf5Pzwpk3t4aFhYhpwx0LIFEsaUT9OukUdrmONbZse3YK5FebvW7Jdon0eS3ZS7bvb9/CdgZLFE3pG5AwDKcUQOCgCBBsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774179170; c=relaxed/simple;
	bh=iqw9joRcspZCH/8gMqnFSFCc4GCnkWYXmP5HtvqP8lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PCvd+kQTj9QVUOIIQ46eI/6+GFviMr/wQablfnUXuhEmSNbLjBaTKpn4WtOPlVdhtOLLnbysLOqSamo/KopMrHkp7JHJLUNk9VkZ1mbxVz2t+tRkuUMl1GkitvkZouFP1YTbeRuyq7YgiKWz/SKMK7IMaB9VtlOM1JRDpSiB0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcgONvWu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcgONvWu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so13003825e9.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774179167; x=1774783967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duit6oVlvEzPP5nc9GzgTOHOPo7U9Sp31ZgxaS7C5gQ=;
        b=WcgONvWuYRpl1lQW2fXDHck6rn/FrHt00SWyJGFmXSc9iCJVVhM9sA5yxAkcmDRr0x
         Ovb4J8jaDNgru+Tghm+rGS1yuG0txIkBX5jfiM1dPaRVhc/n/LALZWnDDvBnlmMOMcco
         /b2FygRUQgBoXrCz2XDGuo3zcOSf+yvu5XWLdiWOwYRomCb+/tS7gJzlq04S23aqEJ1Q
         +j9VfhH+IVj0gT96RERBlItWryJTBU+qsdx2PDSM9YauRlsBbCwcAjCloSZ5MGqYCzxB
         YFgrOYOm7ON/gK/mpb71LvQXFDF6fVX6XYkvyZSNjN0KZPi3T9KbpPO3ur1dlIVbVEJN
         jgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774179167; x=1774783967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duit6oVlvEzPP5nc9GzgTOHOPo7U9Sp31ZgxaS7C5gQ=;
        b=Tj4SW31PYeRewy7CAAJP26PR50fTPcTOV4ts2biF2kRBs5tNir3+KfHqBBY8xG8Vqb
         c26YMF/HZnmCuvuaFPvVSpe5wawGeRpQk4w/xQf8Q0Ds4ollLavjYooLj5yaDGzfzTVF
         qAyGPGx6oQaYQKjao7tjvqZDElHjCUe+Vwu4eOgx8b57M0CIPQIxEvWnlZCha75T6Lta
         O2LsdwwnGNRQFI0DX9mPb0/CZRjT9dZbI4Ee5kHNsmqeBwyfuTrZggjyl2R7SVgYo3en
         0ioIlxoAxvI/YDLze90bgzETetEr9pGfkkJSDHOxQ4D3sQtt2PAYllIhAf0YsBQqmON/
         TNIw==
X-Forwarded-Encrypted: i=1; AJvYcCV9sKjQq1zLDpieWd++Ob1SJ4gl7fPxBg4Ctaf86OpaarK/iZqVown2y2STxgaOpjf9jNsP5JkrjvFbFc8u@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr/bOwCVsCx3GuNSJiKLpGitU0Wex1URmYi5lSFV4wutpdX0ug
	4/1gl+LWE7/qDt9fzr6Aq3DVzLWUVac2VxvcScpS/xVCTSH5JYkaN34=
X-Gm-Gg: ATEYQzx+zhYfBi9ndintQhkQl6iFyt3jnCFvM1z5joDtQvx7nTDNObPETowSp1IFRMr
	btes813IXm63DZSS10bzOX4tQrPixAPHSsIHz5h+0LMyXLYoQAH00Mb5ACzR61btC2wov6kL/PD
	tGiF7qG2IONdiJmREj/mJ//VT1tDoVy3UNcemtzKuAI3PwZLQZFoCFmDIkwL9wf33yyocSUI+XM
	QHu+WBBQj0rTrk7nVZ9l16kgZzkPn/pkZ8lKuesAjV9Y+OOWpyTkeVy+mkg+Z4PRyTm1bzhyonb
	wyGFTTxJk9WKCeBdpA79WXrveqku23J4EyOaLGNB90Qwovtq4ybYGBOxdhhA0GlYituxYpbb3Rn
	xdaCTqrlwyH0YvvSyDHkyXpw8xbCdHAr3sZUgharcfKNrgX0l1i1NP3EYkrArXkAeM4qhHnsZBF
	6GfbLIxXxmFAUOMOI7oMQlgm4XeUZ3yfa5ZVMxAbsMeeEEWBV6iXpaD0vq/0IoU2A7lypUdI8=
X-Received: by 2002:a05:600c:3b07:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-486febbc65emr123715415e9.3.1774179167349;
        Sun, 22 Mar 2026 04:32:47 -0700 (PDT)
Received: from hp-ubuntu.. ([41.249.139.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm201025045e9.12.2026.03.22.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 04:32:47 -0700 (PDT)
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
Date: Sun, 22 Mar 2026 12:32:22 +0100
Message-ID: <20260322113222.27488-1-med08elkadiri@gmail.com>
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

