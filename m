Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7EF14F138
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711566615; cv=none; b=V48dz/azzkfOR/F1T+f6vmQXFKe9uBuMwK3+in/qhwlbPX4HDOqCBTffJBMTp5yiJ6V01iyZuvRoDRxLE4xeSoBHnT9sKE6uYDKCr2NmSXYxgzTKFnnVD0/F2bXXN4LY9RCwgUcc9DtA0dNeL+4xAzbBVghx+moZVdhDR6r/5v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711566615; c=relaxed/simple;
	bh=8dmOsKq57IuaVaer0JOPg69UA1GcaPAsLPAfsZhZQiI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NLrDBwl91Ih/divYJSxkiFgVOVvWbfnpiAmeImlqFwkqsvzLgmA8m5qZJOHoDqkuWySWidT9XAAbcLMwt9/k2HhuhvLBWqHjyoByOjJ/aFRX9qK4NL5Ea07YMuhnDh3nqcmUjUOskwFtOorah5mnwgGsfIHIqdlzNS557jMMA88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVxlZ1Rk; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVxlZ1Rk"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-690fed6816fso1080026d6.1
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711566611; x=1712171411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+9nQ7dH6WY9yuVDU973sw8jAti2zGpoo5WiLa9bEuI=;
        b=JVxlZ1RkemxNRt9AlqacKeXn9lwJXAjug0M3CbKB7gUzjzhb4YYtjDqNDR10+xtUTH
         uRI7FTVZbmq0TeILKK8pu0XkPxKdTDn4MStaO4Pm/GXfSZU7zRFUBrFZw43V0jd5BB6W
         6WjLs+vZjTc8yUXRz04DNrNy59aCcXQv7djvR+XxpWsGlXbLEzXj3D/h4O3BRteB2Sxt
         DtENgO2LTmofM6c5L/PVy6NFQ6tPU9+B2FlKgTgBZyg4jiiBt6gQXipJNld/sGKBbQoH
         g9Tu5CkKK3eT+gAAaS2P1RJ4BBvYvdKjLpWOyTNeypJFBZKgHEW+sUc2yuKmVaT2CqAa
         5mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711566611; x=1712171411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+9nQ7dH6WY9yuVDU973sw8jAti2zGpoo5WiLa9bEuI=;
        b=PhJcr9HH0AuBGxoicJsAbLhZh52aIA32uzl7+NL230gzOqcy90dTISVDZPgTWTlCOa
         NM4R6qnovirZFzsB71F8+tkz1wGKxx1g7l3GLMeNZG+grzk4yXq9tGRjIq3qdtq2tlhb
         VrkZDGHlcgB4wvKYVv1eN0xAQnxCWHr299i/EpEUzyR+QruWtv2kb+kWRy9jYFKxlS0r
         5WpicUlxGYEqJR+lMLMlcY4+fa6CN7kHmK4fLmT3tlLqCcDEEVK7qDKGcrU4xt+yJd1h
         sx6Fxd44d+u8imrTtH2DCsrmnilGHTtxHXUg/UP9x9y3ooazbDzmEtwHiDteRjPErfBK
         c2ow==
X-Gm-Message-State: AOJu0YyPoYZKfz/Ogw1XtB8lf1cWiTO6+4lICQ8+irv8qMvzL/eopvod
	BG9Sa8cZPLM7inNC+8Yk//pPUOUtVlFymDju0pWh2H6xWzwMyy7e
X-Google-Smtp-Source: AGHT+IHu6MivQFc8ofw8fRsMfLJUOt76eUOv6nrLY3cbrB7L0u8GES2dWHFYcbnketG5FUlT0uUWcQ==
X-Received: by 2002:ad4:4e10:0:b0:696:a0e8:8f2a with SMTP id dl16-20020ad44e10000000b00696a0e88f2amr442653qvb.44.1711566611666;
        Wed, 27 Mar 2024 12:10:11 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:f38a:32d3:e6f6:959])
        by smtp.gmail.com with ESMTPSA id 10-20020a05621420ea00b00696a1f5dd18sm1784789qvk.116.2024.03.27.12.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:10:11 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] staging: pi433: Fix includes, comments & macros.
Date: Wed, 27 Mar 2024 21:10:01 +0200
Message-Id: <20240327191004.619748-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset continues with some cleanups:

1. Untangle include hierarchy.
2. Delete a misleading comment.
3. Make use of general macro instead of magic number.

v2->v1:
        Undo macro update. Remove its inaccurate comment instead.
v2->v3:
        Restore Reviewed-by tag, previously omitted from patches 1 & 3.

Shahar Avidar (3):
  staging: pi433: Use headers in appropriate files.
  staging: pi433: Remove an inaccurate comment.
  staging: pi433: Make use of spi mode macro instead of magic number.

 drivers/staging/pi433/pi433_if.c | 5 +++--
 drivers/staging/pi433/rf69.c     | 1 +
 drivers/staging/pi433/rf69.h     | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)


base-commit: 20952655235dd9b1447829591774f1d8561f7c6a
-- 
2.34.1

