Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B432505AC;
	Thu, 17 Apr 2025 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900489; cv=none; b=CqOfSI7jxwk1kU/Uw9k/QAN6NuzUHyKZnb8N32tmcahLvo/bbjdoO4r39peJb2XgtE15e1zwBPDdVFsubWPDzhdSxO2N4U9PWzlEX3HQavKtOi9uqALG7rRspLwkZMM+ZUSS89/Y7R0Ed64cSMMJS7V6C0oprqPCFO8XQZbY/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900489; c=relaxed/simple;
	bh=UAWbwn3OEwNZoN0Hj/TtDK0n2Rnxf+jEq7ZazqpZnGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDjKVZSBRWRgdIDtMK67zrdL2RZaHC2e0WZDMZKbsY/oOFAmIAKkvublJeuViZB6zEeFq29Fg/9joyUugeieXCJkq61KhoPHQqdBwOFRkMwfZr5vKVciMgXfppgsyKMElErXjtW5mPXg5asQGEvvrKClL/pFdsuQviI6vGrf1C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdyVkgTI; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdyVkgTI"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso12126926d6.2;
        Thu, 17 Apr 2025 07:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744900486; x=1745505286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+vcDWcINfOfJjicxisaFlx0tomPR1D579mnXzAv3jI=;
        b=RdyVkgTI8E17EquoJ4tzGB0Q14bJXtbLP3iOSG90spyejuMRwnIsIHEXfzxnPpT7Ht
         lrWzVsYEfL9upl9Hc/NPk7JDPYVYGBNGRlBjpyqD8oDlvl2n+OMlQiM3vlbpUh8+Wn2C
         dtPN/hnYeKJ0k788KqPtYja0337EXLmtGP4IIf0ro8obohzJ1eDn0GuiYWOvBMnR81y8
         +BBXqvnc/pOLSmK9usezBdl1Ypb5/4HendkJqQUCU2ac5sagyEHZaabQ33MoOnPNdiSN
         iabFwg7tMgf8qHJDnzobmALRNUNW3lykQaIIrgDRm843IOyrx7vF7KzO8maoUifhz6Yg
         W7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900486; x=1745505286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+vcDWcINfOfJjicxisaFlx0tomPR1D579mnXzAv3jI=;
        b=FUEYwH0EfbuatrdG4qMD1nkT+ftf8nYi5KIBX9Qszpv952ts/9fvjWY6nZlrjEWrl6
         XUZ90Abk/UjLvpre2dWg+WYfahu6r5Km72P0iwqcblGaqB2GGGXQrkl4B6IaDQZJx6Dn
         cfqM0RHh9LRDRuUTPkEjnGNBBpJKkAQ48JCkKCjT3+VDK58Y0uNGD5fcHatm3f2Qqm54
         drG8fRNchUunFMsq4SZOzEbZ+CiTMky2ab0faKM6K384qHW4t+42Fhv+geaDkTf6AF2U
         4x1kwpoxAtAIm2gJhIPpzvgVzt3s0MXHP8l8NMbwGhjhqsj5Pp93lfXvMjpzZJ2RkovP
         xlmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBo4Sl4bhcgR8a84do48ZWL2GQThxitBx8JxGRaaVq8y5zHfihG5y5bzRbrxeSEK/CnN72OSFoAcIUFkJijnGJPsnbgA==@lists.linux.dev, AJvYcCXzMdLXVrUlvQsA/Ap7zqHw6yIiVcQiviI30yNis3qxWTiSXjWVtJhJp0TGG1Be+cu7q/4TctZ5Nj0fpT2LsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEIcTUFS32neB+5lHNYsryPcYiYZh5p7brs7I4xgbhH9WimHag
	BM73eq1OYfoq2Tokb7T18+3oKvZMbrJ+RsS9PQkFU3xqK/LWgntp
X-Gm-Gg: ASbGnctxEmotsAYZQTabQu494hqcy03DpD3NBQpmfYZ7Nk04ZwRLDUrO7XgVlyIrpRX
	4QN0cQxA8exH0cF9wYqSIsxeWaiN5I74UQOuqnkw56oX47bzZWixRsJTmRkiCCWXPC2YHbHB8Kj
	FzsI6+JCvbXC6zxSt/tDZ0hCPMpoXIgBd1NoYbHzTcwOQtx2cw15S94QuNm3QLK7H00ygluupam
	V1nDe7LBT1M9lyx7L4OtoJEoniiGV7LrhQd3FC2yiaNp7zFn9iWVUAmjji17WlzdR5FXUD39rKN
	/que4GagQ6/T0QhUE0OUSQ0K9wdGrPiH4T3RV8dF+Lfmfi+eRS32Mj7Crz/mTjG+Nzw2i3PRFrK
	ihtuNBS5WK7r3Yh0UFe8=
X-Google-Smtp-Source: AGHT+IG9icZZSGylR/t9AWhZ7mftH5cb8yzalcC3BXZjiY6qJg9z16eiJpMA9UlK9w2SkTnLcK98IA==
X-Received: by 2002:a05:6214:240b:b0:6e8:fbe2:2db0 with SMTP id 6a1803df08f44-6f2b3028031mr87470066d6.30.1744900486480;
        Thu, 17 Apr 2025 07:34:46 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de973552sm128069896d6.50.2025.04.17.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:34:46 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] iio: frequency:: Remove unused parameter from data documentation
Date: Thu, 17 Apr 2025 10:32:20 -0400
Message-ID: <20250417143220.572261-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD9832 driver uses the Common Clock Framework (CCF) to obtain the
master clock (MCLK) frequency rather than relying on a frequency value
passed from platform data.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.h b/drivers/staging/iio/frequency/ad9832.h
index 98dfbd9289ab8..d0d840edb8d27 100644
--- a/drivers/staging/iio/frequency/ad9832.h
+++ b/drivers/staging/iio/frequency/ad9832.h
@@ -13,7 +13,6 @@
 
 /**
  * struct ad9832_platform_data - platform specific information
- * @mclk:		master clock in Hz
  * @freq0:		power up freq0 tuning word in Hz
  * @freq1:		power up freq1 tuning word in Hz
  * @phase0:		power up phase0 value [0..4095] correlates with 0..2PI
-- 
2.43.0
