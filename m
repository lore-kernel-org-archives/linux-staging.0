Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D3915698E
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071935; cv=none; b=hG0xiNi3fYDUQw8YiU0OmE0r8jlxpxdAFF6ZzNLGhP/4lsfuY47y0nRrDN7p0VCz2qLfwS8/WStJQKLTGo1nDieQojduJmdn2yNYacIE369NBWjc0m/P4lmy4tYvfDALc4tq1nj+mKALotIgF1stZYi+ogEif/dnodE934V2QJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071935; c=relaxed/simple;
	bh=sD4PGbM5HqA6toI1/CAMqbYx9lSjxRaalfZB/ur59io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PUHYq6HQfI5xJU5dA4+aITK7N3O/KtK0YT+D0eg5Q8UqmhACbbgxMgqDZaMkD0XzkuH3po2/d37VZVNQOjm5n4RhZXhDAy1ZmIH96wuZvEBIqIgSewGbtNll50kz2I26dFdUp8k5NJiUsyC8wbs7HYH8whrFCHBmf+z+7wlZhaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtvlFwPa; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtvlFwPa"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33d509ab80eso2262018f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071931; x=1709676731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieLYzymPNePmb67aE/EpZNATNNR4k3uKBe/0iiseYBc=;
        b=FtvlFwPajNWd5IDUYRfaB7M4QhiQYH+VRnk5nraY3i+iQKVgdsdO4WI6rojSKiUp/B
         HNWooLw2wMR8PY3t51lWXheem4/dj8RVCRL9JxebgjmDTQmOsEeU/vxS91HJfvQpwK7O
         4KURNpR+dShEpFWbnJs2R9LDcZnHYr9PFN6xRzDrXgAyKQmWiabQhVR5dhgEelbyL9Am
         hiHG7ABjG82aI4LoFHP2UTWnz6Xcoo0BkGykTMOsJnS1k55nIZqIBXXYMiMZwl6sQVdT
         eRJw5Chv4YvTxVzmjk9akb9F4ZrLK1vDU0lxgn1WgSx4inTaJd9mbAh2RwajezR3EJv8
         pltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071931; x=1709676731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieLYzymPNePmb67aE/EpZNATNNR4k3uKBe/0iiseYBc=;
        b=V5U+T46x9e+jI/Er+C5NrlXw8h73a+XsbAyRerg6eKGrs5IK4V+UXZWTxsuNdWbDr2
         bGBBgirBB4Vj2Oxx4bhvPUKlnHF8Tj6wgQ76K2PsIe40U86mHVnApigR1/mVeCDyQthT
         BEL4wT7kQPBc28QIokbpoF/hNtey3WEVivShYNgyBp9f8xjLeP3GrqhyoH9TFkH2xHx8
         KovAu12oTtSvwGUUwbJYryr/HTJR0NfQS1QrE2gcNQvb+X3MSa+5IbT3NGLrUkZgWkzE
         iySId30LTFzKP7RWbaC461ybVAaf0xriTXhs8KfPuvOQCobQF7TACUNLsSORk/nZMg94
         O0ZA==
X-Gm-Message-State: AOJu0YxQ0ihvh6ls2KmHR8nEGB9D59HQXWhat8eUQCMcYY4JCn6GCo6R
	o6NZm7eg18dBQushsqaOXxcUwITwu/jNz0w6WYgxGo3mtOZoX/8Y
X-Google-Smtp-Source: AGHT+IGEPieExhprrrklXju6UTCtUDpK0Dvkf7ngQAnI0TNhp3s7PZ2YjipnG9rMPGWGhBYZndPeBg==
X-Received: by 2002:a05:6000:1:b0:33d:3099:e67b with SMTP id h1-20020a056000000100b0033d3099e67bmr8504809wrx.63.1709071930805;
        Tue, 27 Feb 2024 14:12:10 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id o8-20020a056000010800b0033d202abf01sm12415560wrx.28.2024.02.27.14.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:12:10 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] staging: pi433: Redefine F_OSC using units.h macro
Date: Wed, 28 Feb 2024 00:12:02 +0200
Message-Id: <20240227221204.534131-4-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227221204.534131-1-ikobh7@gmail.com>
References: <20240227221204.534131-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use HZ_PER_MHZ for a more robust definition.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index b3b8d1abd3eb..5a1c362badb6 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -8,11 +8,12 @@
 
 #include <linux/types.h>
 #include <linux/spi/spi.h>
+#include <linux/units.h>
 
 #include "rf69.h"
 #include "rf69_registers.h"
 
-#define F_OSC	  32000000 /* in Hz */
+#define F_OSC (32 * HZ_PER_MHZ)
 
 /*-------------------------------------------------------------------------*/
 
-- 
2.34.1

