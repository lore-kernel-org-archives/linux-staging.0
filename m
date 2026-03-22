Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B133630B0
	for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189531; cv=none; b=m75L+t1xKFs6zCwQfn6lhNAbQIgdB3Q+w5Xt92c953Zt+3u1SNsXZF0eZMJMglu+Qgd8CRkoAGgs0uLKgvO0OwqatCFE9FbPEyhNMZ5rt1/5jre1lbnPEO/2to0tMZXmKGsmDMclvlgIJaRaWrTXP1sL1R/+XgG8POZdnjtxcBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189531; c=relaxed/simple;
	bh=XoYW9chMxNN0O5MWYqWV1Eox0ODfDzkDGcCIWamBRPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqi7aKM4R8uiA/LWGkvI8OSRZYbvEFQAVCuzfOpFhQCX77f6zHPUX3guOxANhwFvcekr6AK0l/K/H6L6/5F54nWc5HA8yzKWihRFccQAdM+wbHLBBr/RjFgpLEGudYAL7w14emPP/pAaRN/V6t5786jjCXeWrvLJPjPZzdA2o18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcT1QYy8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcT1QYy8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-487035181a7so7460065e9.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774189528; x=1774794328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRnUNTaRuV/yZtwq26vTO8rrkAf6zU9cYXMu+kKRVc0=;
        b=QcT1QYy8Z6Cu75ub5cXOQ13Egf+kvWd1WJTStEhwgmO7/7qe+Zp+OS/f3m/4XUvZ+r
         MOSR9LQ0yq20pYz2J7zWZNPkRYRy91KFF8QVQq93Agg/2PjPHPVly9K0pj6I0dClSS9Y
         ZzvnVcxVrQU4T0VP7Gm4hVaBx6rUtWq9Vdnbes+5qDTWAFsCVv8zj1hqmlyPQuKoGl92
         6W47j+HwNRj+cGj34h9Tg+QPbPTHyFM2u//t6jmQM4jpalV73LcZNGGcZgLFeHF+9KN+
         LY4mYSxE0Zl19GGzYUK3jQULffP0Sl+MapUuDMM9PvtAvxFDMJ6e2CFKtGbTLshbiDib
         JqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774189528; x=1774794328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRnUNTaRuV/yZtwq26vTO8rrkAf6zU9cYXMu+kKRVc0=;
        b=qqUUID8mdaitVrwPyM/jJmi8Sd2MUHODiE9I9ECb4g1SPUlJ2RVJ/xUbXweZcKLUzc
         cpmARbup3tzK2UwIoyIteEAICsPpNfw7vRJIug+57uMBPqnoFrRqOSf7IHrK2I8goitw
         G53+StbQ+wvN7tv3Sfwshufl59iyhd9LoKCqdEkw46TL91N3M//dH6HiyN4VYukbZ1wl
         vQPpm0P4SE4vijweE3gS95s6MPjBv1NA/Ap9/HOonhlR7iAqumooCWgWN6Y/S7jCaj6v
         B844k8uucyX0WduJYl7WwuvWagjRc6DW7UEscYm6qgm/ZFAuQspeAy2l0Ml4H/wKQ4r+
         d4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdIpHUma8BN01IvfA5EjLStvxsgyEB+OT40xmNRpxKRN/iVXUsZ6PurIWd90o4fbt3YoxBmKkafjwmrG7g@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf3cfdyn7gsvUs2ivIdB1A7tiDRqVyVXeQT4edRO49YYio+CyZ
	8RNdWtnMrLeVcnzaRPNmxc0Jhr1qQiXIOgczuS75PTE2tbaZvkMaBV4=
X-Gm-Gg: ATEYQzxltPurPxW1sZUnNeGEJFv4euwSu37fz7WniVFXx8dkQ2god2O7voPOme5XYGK
	jF/WIXPt/mky8e8ZvnneLB41qgO8+xeYOfvhnEiuXU4bMjyFdYtX696AYGixWatDfQmobxOuFrw
	kXU2HYgQ19s8BPccevzQjdF8BA2jIl29NnIpqroKB+Py9DmqM6nvaZNqe8wzv3OXIK02Q1g5PA0
	h/Nn2wYozcwxmWzLdkMGA3Xm57gWY/7uVsER5M5BDcNxzxst1fQey4JCsmBSNGt7mCFeve02fR7
	tw84RH+9FXTe5nZVNEXVAbeswd/GUDGGnq4O4ziDZjOcvWlzvIwNUg3w1ceEJUcc5oDEFob1yoj
	cRiO++9Q+SJOVwryXMgb9bLER8GloIUI9W/YdX4+r0xvEjNKqzVKdssFkpGiZn5ZAeYLk95sU4J
	AR0xHOtTs82aSAUzm0I6qLnb7GZEZOsn76RE2NqKyOOGXqwR7jQVAyNDQmFJxUvKgiOlZPvqU=
X-Received: by 2002:a05:600c:1d0c:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-486fee2ff25mr140908425e9.30.1774189528450;
        Sun, 22 Mar 2026 07:25:28 -0700 (PDT)
Received: from hp-ubuntu.. ([41.249.139.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm141466655e9.1.2026.03.22.07.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:25:28 -0700 (PDT)
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
Subject: [PATCH v2] media: atomisp: fix spelling mistake
Date: Sun, 22 Mar 2026 15:25:06 +0100
Message-ID: <20260322142506.42022-1-med08elkadiri@gmail.com>
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
v2:
- Changed subject prefix to 'media: atomisp' to satisfy Media CI requirements.

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

