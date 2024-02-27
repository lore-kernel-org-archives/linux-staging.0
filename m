Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D621534EF
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071931; cv=none; b=ST/aQwxx563E1lwLsu7YAszYGwQCWvtTXyIyaU6ybyb9YHlmoDLSnn3Bu7kyqDH+MWO6rAAR4v1RO8jZKSz7tXKNf0NwRFXDXP/aAHplV2eR2qpUPfA5po3J2u4450F0aL4xCn7GnMOTYjzAdK/ixlgoHmA0IwYvNDefy+T2FFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071931; c=relaxed/simple;
	bh=+2njOV5Ga0IzlzN0XUiI1XPr4AZxQTAQfakyMWn49qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LA842CeRVOx2UH6Yckgfa3PKriBnp6n4nY1wfxGJ+IK4/euWubpK9AIfPxiULjtCOznyIvCxv7FaeOS760Jw1GutQV0nRKMQ3DavyhHx6sjdFIy1AD9zUoZxfInqRXUsu4nqr5LAzq+fIY5bbiSBuPsWfX7nrLy5DGGHFoN0Mtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFqjpHGE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFqjpHGE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d153254b7so3653063f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071928; x=1709676728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ahqsv6gOyMACRg/0NA4F3TAuiEZ+oz6aihxiy2L38w=;
        b=QFqjpHGE0dDy1+rRbiA6G8vrjwRTP3t08i1i5/eKrq/ULfDEtRFfLFl8c29nZJD/xh
         Hmrv2uLmbZYb0ih0Qrg5NPSc4tSww/b1kNlra+4Mab/8ssrTyIodWwknhyGge95UCDeV
         OUhA/5J6hePUG7qJ2QunpTQF8x+SnxxtYA0RKjhPj/N6moGyvZJbR4g4pj9Xzw2a/UZ0
         134H/JwHJwS+/vKLpde5iu0YYWiK5CkMrKgX0XzwLRV3GJXsyNceI23dyqY91VZow80K
         SuByCL5IDJX+pFyEaFN69erLCpvzXPI/csXoxXyRgTIrgbg0QkIuUZ+JUgiPdQyG7RId
         Boxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071928; x=1709676728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ahqsv6gOyMACRg/0NA4F3TAuiEZ+oz6aihxiy2L38w=;
        b=TUJSIc+7k/dftbe+D8G+ZT3tJkcmmXHJn3t7x8LIHdy99eGxa4w8MwkCDO0uD8KU3a
         QB45H6Ftvc4twANKDV7jpD+FILcdJY55wbouTSd6LvmPXVS21LdDV469NZLDVhIOr/y4
         xhPThHRDkS96COse/Meqe03ITsRmE9Lfz17XeRpgB131UrXNN0BXPTlVGfSHI8KgXpKP
         7573sJOSuQk92xpj1Y/f+PV19NScVmjd/ks7SVKoE2D+1E8DyK02NZkSuw2yXg45lZeM
         w0hqdJ+VzgKpek2iwz+DlKwNwKna8Edp87aV8wUQjHIDQFfI6GKfxIzl9PY14EZg30TA
         lArQ==
X-Gm-Message-State: AOJu0YwdF+h4VHPyl4SLZKhCgDgvI8dEDpsOHy0T2ydsiyMDa5LuK7J1
	qNQ3nym2g2OMbG1AZ6anb0/7B/XbaG/KYYAqkToKcrF4yx+dT0HE
X-Google-Smtp-Source: AGHT+IFxeTviGcC/lzANrGD6bgEzkPpsHyY3xp3fzzfL89LThzqsCFEG6WS0XyMDXyNgRMGvxShwyQ==
X-Received: by 2002:a05:6000:543:b0:33d:1cc1:bb08 with SMTP id b3-20020a056000054300b0033d1cc1bb08mr7903187wrf.22.1709071928001;
        Tue, 27 Feb 2024 14:12:08 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id o8-20020a056000010800b0033d202abf01sm12415560wrx.28.2024.02.27.14.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:12:07 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] staging: pi433: Remove a duplicated FIFO_SIZE define
Date: Wed, 28 Feb 2024 00:12:00 +0200
Message-Id: <20240227221204.534131-2-ikobh7@gmail.com>
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

FIFO_SIZE is being used in both rf69.c & pi433_if.c source files.
It is also already defined in rf69.h header file.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 8c7fab6a46bb..b3b8d1abd3eb 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -13,7 +13,6 @@
 #include "rf69_registers.h"
 
 #define F_OSC	  32000000 /* in Hz */
-#define FIFO_SIZE 66	   /* in byte */
 
 /*-------------------------------------------------------------------------*/
 
-- 
2.34.1

