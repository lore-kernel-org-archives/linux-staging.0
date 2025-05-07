Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F375128C01A
	for <linux-staging@lists.linux.dev>; Wed,  7 May 2025 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638339; cv=none; b=tdctb+THYbidLH5g4H8Q/21qtE7CCHUMm2AL893zzLciJ99ec5ZlrgjDgj9zY7fboQxkidrHdb8Ay3TDBYTcmsZn6Q8waVpnUQNgidizinafMNXPo6i5fN6MTxXZb7le4FavzzeCUrODAQR9BCgMyqeffWWFzFTJdfRVa4OvPQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638339; c=relaxed/simple;
	bh=zF3faO3IU2jde88KWMuQmf5+Q/l8n/LuG6lA+m+zJG0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nV+QE+w5SHeN0y8iBTouNI8lWw892CYF3RYNOBFTdt7DiadZGGUGssFQsN6SANhe4plvRxeQy/7zDSUv5KHg3wgK6col0P4WHmBNML2rfVjLivOzzfrp5B7Q+PDhN7/tjDQ5VubO7wb8fZrD7CBRdc/aTNqxvKUdtAMNb6E0EsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gf4KPuFU; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gf4KPuFU"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e78e53cc349so178351276.0
        for <linux-staging@lists.linux.dev>; Wed, 07 May 2025 10:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746638337; x=1747243137; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b9n5cPfDVXl8uppj2xa5Gl/xVZFBnu8YM//f96k1dBI=;
        b=gf4KPuFUibyCQsewioePpL403WmrZRFXOkDkXRW/w7NRJwqCwYiRs4mk7M6Ilklh1Z
         GW2ojPqlOUaxHN8Xnb3R/lvHjLkjOJlx2mV1bkLAWBK80vPw7Um1uoYT08NmGie71pie
         3SaO8QFCxu6acCnckV5vy9bg1jzd0SHsF5EIa/BVoCDQm3PsaDzuAZwfyfba5MDr41bE
         ykvVCd0f2oYthq13hnKPbvb96LoZfqwwgNaf9nfzDwO9xWjBO0y4mq+MK6tGrDIAMtDM
         ARWG1P9OG78kwtbnDLFGQiVLEjRh2gmpX+oISonilxPrWCGwtd4lNKENnIq5uDC2ambT
         qEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638337; x=1747243137;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9n5cPfDVXl8uppj2xa5Gl/xVZFBnu8YM//f96k1dBI=;
        b=qTOivYvbmtR6ghNG7SDbTpb1nAIgKfpgl4aiq2OAJfx/y5wmtota0maYXE301uHiRt
         AKPnIcWCdL04u60k/NHUCB0pzKoWDy0E5aB+6KcCpj4eU7qG1OyESFznoJQmqAeASvVj
         hytvq2ji/fWn0Qqt8gvpjqq4hZtE/H5TJ0+/3YcS1CG79yJDEZBN5jafQEZyM7aMeMFF
         NzyeyTIW1Y0+OQ50KbH8PLPgXLpa1q6kvpWgr6n4ie0Y1PFNSoZpdtOntzIENguY6czz
         u3di0Ra46W4G4HfjGh9ojQCuF5SY6gL/0T3YOHYvLWCYKDDUg6wiC6at5gEMc8Jb31tb
         bo2A==
X-Gm-Message-State: AOJu0Ywjibu/j0vb1RvBhF2MwjxNiS0fisXn6BmXlZuTSzkTe1ziOPq6
	fg0yyG5akPRX9QDFzToRS8flmH3flpeVMN9sIky4LYjzXQvugFB6DoZFcZv3xK4eSGK6kXc03r8
	45OXv1H+Nf1VOa5+zOUr2Nxm6lFs=
X-Gm-Gg: ASbGncsUaGhH2a2b0cUXyRFBb8E7ex7eUQkMoETnhabdUudKRdBo6qcrfW9V0ci6o8C
	1B1df+NyEFKhUcap7FtdB+ZJCQ5aX/BEYb6UUEe4GnnqHTRF+TwB220kipNbQ4XqtieGVd4HwPY
	Lp2MKNN7H2XmbsbIpncK+l
X-Google-Smtp-Source: AGHT+IEi8UCQyXy6izOt+S9txk4foE6SJeIXLqYU7Jpt6MhUGFskBtJYKyYfBg021oobJBG026n4Opi8qk5w/Shq1Gg=
X-Received: by 2002:a05:6902:4909:b0:e75:6432:4b26 with SMTP id
 3f1490d57ef6-e7880f8bffcmr6037346276.13.1746638336849; Wed, 07 May 2025
 10:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 7 May 2025 22:48:45 +0530
X-Gm-Features: ATxdqUFrIxLe3S0Qz6iJ5R7Hiy0EoaZxRQ1wavXrU1wOMLUufsELAUMCly03aQQ
Message-ID: <CAG+54Da+jDEXRQMgmXGyCD2EHjNFjA9nS9=ShdJPrC3EKjUgBg@mail.gmail.com>
Subject: [FIRST-PATCH] staging: gpib : gpio : gpib_bitbang.c : fixed
 parentheses error.
To: Dave Penkler <dpenkler@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To pass it as one parameter, wrapped the entire macro expansion in parentheses.
and build it successfully.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c
b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 9670522fe36e..a1f9c99c5ad2 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -47,10 +47,10 @@
                        dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
        while (0)

-#define LINVAL gpiod_get_value(DAV),           \
+#define LINVAL (gpiod_get_value(DAV),          \
                gpiod_get_value(NRFD),          \
                gpiod_get_value(NDAC),          \
-               gpiod_get_value(SRQ)
+               gpiod_get_value(SRQ))
 #define LINFMT "DAV: %d         NRFD:%d  NDAC: %d SRQ: %d"

 #include "gpibP.h"
--
2.43.0
