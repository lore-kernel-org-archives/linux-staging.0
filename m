Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE5553A0
	for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 07:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1ymj44M"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6d9a795cffbso3679977b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Jan 2024 23:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704956818; x=1705561618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBLgaRParyslbYcOxEJ95TEGXR6cqF/gTpqxREqx/6g=;
        b=T1ymj44M37KCC9V5RUL2vxXOm5LqP7bhAKGqxrYyB4JwbYnfE3GiMg2mOnPmZMudV6
         dJjp4v9nPeucLwKrt0P5fBKH7JV8nAPwyVRt1Oy5za86wVJqecxeBbsAN/Yo71D0lwWY
         Z2OwKfXFKUyBfkh/rWMpB55t05+9URHBSpTmflMFB+LFUCMKlPIcyqN8QlahNniqLZ3U
         9/sel+wHVMwxN1tCNkJNeO1QYLMjalw6I28ZZJMF1LbEO3zo1gCt6Q9ABhKa+i6/6jwR
         KXPwaeLfi8r05PLJD2w3IbkSIv5my8jEFNC+Lh/CBGUGlKFMfcnRREjDDWyLsqF7eu2C
         9BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704956818; x=1705561618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBLgaRParyslbYcOxEJ95TEGXR6cqF/gTpqxREqx/6g=;
        b=FHMLBncmNPhoUx7WONkP5rBbzVV9W7ImFn7I2gI21ZHUJRypBKV2pqI66Gx7QWKp8Y
         1ePXCZ87HRzganRInIyv1qsJcI38vwEXmQ3SW+ojWjdEkXSqMYVXK6jmxKTzxd78xCbp
         UnaKVoYFU9CZd6g/Ug+M2GivVHkvZ+0vOrYb4WJV5S4Xh6HWkrJttampXqvWZGOEJ8Qq
         vGlTVWjXl7mdmK85kUVp3siTLH6oW3R7kIyPlHuGNUNDqj6j1moEoEUgX6dkmKk224Hq
         ow9k7hn8rRsZ53cDsM9WSCwusOOwmuW95N/J0sP4ydD/Gg9k4BBTUgMtoH0nMGpCr6RW
         1fKw==
X-Gm-Message-State: AOJu0YzL+AGDPI52uB0z88usKr55nz1uJuDJz5JVFPHu8ZyOro3+sRl3
	g0caCv62XlSQ25KQwfqKadU=
X-Google-Smtp-Source: AGHT+IHLg/wvK+cJEuAzXcUSRpvXGXcCEfsgYLiy0xQz+a/8N4iZ35+BwIE4lwxaCTkrMXvwSd2ztg==
X-Received: by 2002:a05:6a00:cc3:b0:6da:bcea:4cd4 with SMTP id b3-20020a056a000cc300b006dabcea4cd4mr491210pfv.16.1704956818501;
        Wed, 10 Jan 2024 23:06:58 -0800 (PST)
Received: from pop-os ([27.4.4.207])
        by smtp.gmail.com with ESMTPSA id a6-20020aa78e86000000b006cb4fa1174dsm441585pfr.124.2024.01.10.23.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 23:06:58 -0800 (PST)
From: Pranav Athreya <pranavsubbu@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Athreya <pranavsubbu@gmail.com>
Subject: [PATCH] staging: vt6655: Remove extra blank lines between code blocks
Date: Thu, 11 Jan 2024 12:36:52 +0530
Message-Id: <20240111070652.71717-1-pranavsubbu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

drivers/staging/vt6655/rxtx.h:22: CHECK: Please don't use multiple blank lines

drivers/staging/vt6655/vt6655_stage.mod.c:38: CHECK: Please don't use multiple blank lines
^Ignore the blank lines in vt6655_stage.mod.c since *.mod.c files
are included in .gitignore.

Signed-off-by: Pranav Athreya <pranavsubbu@gmail.com>
---
 drivers/staging/vt6655/rxtx.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6655/rxtx.h b/drivers/staging/vt6655/rxtx.h
index a67757c9bb5c..be1e5180d57b 100644
--- a/drivers/staging/vt6655/rxtx.h
+++ b/drivers/staging/vt6655/rxtx.h
@@ -19,7 +19,6 @@
 #define DEFAULT_MSDU_LIFETIME_RES_64us	8000 /* 64us */
 #define DEFAULT_MGN_LIFETIME_RES_64us	125  /* 64us */
 
-
 /*---------------------  Export Definitions -------------------------*/
 
 /*---------------------  Export Variables  --------------------------*/
-- 
2.34.1

