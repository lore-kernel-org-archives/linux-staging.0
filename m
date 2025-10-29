Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC4227B9F
	for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 02:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761704494; cv=none; b=gBJKJaOBylVFKoeH2L2VWqAQluCV6tfFbXRUjXt/qxBzCosYqR8qZx+q4VLDsOZlmNc5+jFVR+kdAwFH92Q8c6OTq6+y28GvaYREY2czP+lRL219qzFdnO/YUPVedrv/tRdhUzoCQS25TMN+7RGJW407f4Y8+Kr6U0x6ejH8e7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761704494; c=relaxed/simple;
	bh=dbwZvu9hhIyVuqMTWNgr+/TO7f8rMnKkqOT/atxJsyw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZCM3KmJM8KXVkpDPUmAbXsHQ7TamzeV2+tVPFV+/xptHsX+56W7SIpnG9y4TRPH5YW6mzUuJtXOfzv2sS5U9wRMFu1OdMPD+/QfhkOGttzbNG/uDwfQG+WeSmq/6gbfJEEoPrdfcvSfeSmBiw69LCs9WgE+Sl3/YddnSkLhr7R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJvC6LZf; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJvC6LZf"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-44dbaff4117so307578b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 19:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761704492; x=1762309292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cynnkWYdpDtStoLe2q3qh9uk2uD/o/JQhJvnV67pO8E=;
        b=dJvC6LZfHbTw27KRqszdR32YQjur0Uwtab9Hi6EFH7ZIZDDht/2G+WI9LbcDMtGafJ
         npda+Z81hEEEI8h0xKr8J0xJQdxADusuJkzPjjLB0UJRQ/LjN8FEoPf3OXRy8lqG72CY
         7QBkhKqLRn8iwJoU3zBDTEPx+mX9goXBxP2+XFF7tQJccAafnrOGOO4z7+YA1PJXKJ9S
         n4jvROFCXL2ZGQAy5PA/1zxDn9Q5DBzPxNrkGsTenLXdxuIpJm9x/FlCb399wTPJ+PMP
         MGHrTNN16+P0kdYTMiVy8ZXYECeuFk/DMHjufH9NFbZOzxhuv0wuL1frb2SJwzAQ4fra
         aD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761704492; x=1762309292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cynnkWYdpDtStoLe2q3qh9uk2uD/o/JQhJvnV67pO8E=;
        b=tJHdP+UF2gCpqJDk7HMZNFXLRiexe7c/qVnEQhd8BompKPCZp4xV2caHFah6yDunvZ
         VmgGVsEzKnosFxM+5mpvxd3TQbH7BHCzT8S0mHgAuRmZsCtM4fAaWFiXaNQxaYF3xerZ
         ewDxSlRZDTZcK83S7bz2YoM7PobYci5c1JKKviEhuqyATk8UfPur3wMmZ5IuX15jFPYT
         cSBkNnSbcXuspF739AbLXI1iUncSl7cKUK+SsQG4BYW7Tvyu4StLyDWLyuquSBlmYXYH
         k33FEOvEWpSryj0x37/wFCCSBQNphxoY2UETyKUYshjoNminlGVKOSg5bcJRS1kimXhu
         l3Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ8ZU0xTlajzw7SPE3vxIHPmViWFfoa7Bb+MJmiQEabDAJYEmIO03JkUUA1PhzzGQ4A0x8hi5m6jKMyghK@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9dF/ELDkA4FMN0+CK1FRTaJ9RufiC4COtck3Rgc+aCQuMl99l
	G63voxF/VVtYPRlxpiDshBnacCJauyKMJWdaSwXEg0NUUslwGTIaz9CA
X-Gm-Gg: ASbGncv+bBA8qR0pCqXBqckQRP9svRFeJ6zi44PZLAwNffYOKb/7y4TCG/4/FFv5VM0
	Xb5Jf5q0nnRq21rTPYikQonqNG5TL3F/3/Z+QsbQ861+09D+EW2yAdEaBHVmKCPu9SeE5niGmRW
	yItAMx0SlmepT4XT10a/GLkfKxEbCA/cW7ZU1heVEWpwLo475nF22oPLeS3x8YevMdwmT1lbn4S
	UHcAZgxBmSO5noMYs1OxScuUZDgE6AGCt6Vqk5ptSD0Gx0rio5OX9yz1ohTX+6T31Xwf8H/Jvor
	+hT3UWO0OwKdXEy7aU7T4FMx4t12v5RJYJ96bKi1cAhZduw2Bj2B5pQ6aqxWMNDJMpvlBGvnucy
	fhymc9SqJhkVzWSk9xbFsS68xu9LHJaDdkeNsp5UDsw4RtufWkKBAXSmTxSL/AhDu+qolEpSWjH
	5DndB29MYnXHIiM/P+VLEvlXPxhKPeDcnj5i7MKC8AnF0=
X-Google-Smtp-Source: AGHT+IEbzvH4doyoZTsME/vt7Aop2SgS9zRyrPlNBrd6OpJTwf4P0pZiGzx+zwlfugi8jpvZSSIqBg==
X-Received: by 2002:a05:6808:3191:b0:44d:a5cd:e803 with SMTP id 5614622812f47-44f6c79f9fdmr2633390b6e.20.1761704492254;
        Tue, 28 Oct 2025 19:21:32 -0700 (PDT)
Received: from localhost.localdomain ([104.247.98.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c5302203d2sm3775042a34.32.2025.10.28.19.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:21:30 -0700 (PDT)
From: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
To: sudip.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cristian Del Gobbo <cristiandelgobbo87@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] staging: sm750fb: style fixes: align call and split chained assignment
Date: Wed, 29 Oct 2025 03:21:23 +0100
Message-Id: <20251029022123.5829-1-cristiandelgobbo87@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Drop previous change that made g_fbmode[] elements const (broke build).
- Align the continued arguments of sm750_hw_cursor_set_size() with the
  opening parenthesis.
- Replace a chained assignment of red/green/blue with a temporary
  variable to satisfy checkpatch and improve readability.

No functional change intended.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

Signed-off-by: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 3659af7e519d..94a99af4320e 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -121,8 +121,8 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
 		sm750_hw_cursor_set_size(cursor,
-					fbcursor->image.width,
-					fbcursor->image.height);
+					 fbcursor->image.width,
+					 fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
 		sm750_hw_cursor_set_pos(cursor,
@@ -538,7 +538,11 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 	}
 
 	if (info->var.grayscale)
-		red = green = blue = (red * 77 + green * 151 + blue * 28) >> 8;
+		int y = (red * 77 + green * 151 + blue * 28) >> 8;
+
+		red = y;
+		green = y;
+		blue = y;
 
 	if (var->bits_per_pixel == 8 &&
 	    info->fix.visual == FB_VISUAL_PSEUDOCOLOR) {
-- 
2.34.1

