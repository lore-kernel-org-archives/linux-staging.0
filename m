Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC423D7CF
	for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 02:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761704101; cv=none; b=QNUYU0eirSlK9qFyw+lYvZE/kG8Y7fY/clGjXdRMGPOoJwEmGbGwzPFy/YbtxxvaxmG+/Kuoabj8/rQuq3pnTMC0W24nv3gkhxwdbf9tvDKOLTvBL1eQ4c/OSRNuMeHv0uv7WtOz4k7Ly2pWCiUD/BhAeAJKSgeUf4+JH+LEk3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761704101; c=relaxed/simple;
	bh=12I7O+T/BB5vXrNWDf+G6+4oR7EW0ESEut/5OnczsIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cPieJbL9vnCvqeEaKuwV8R9pnxEwkiFL+IOSlcRe0ymTg3+C58qsG12gjtK4oKeFdw/U7GwYzxzPeGb3A29QJfIFeKQo3fvASz1fWy+7bZSE95ZDHtzFo9uRudbEP69CzUVD2DyWKeIoKBnOqGZ9iKACCrNHeuTirKws7r//ZEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKdMJfYO; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKdMJfYO"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3c9991e6ad1so380111fac.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 19:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761704099; x=1762308899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHoGag4qYuBHkU394iiXcv5SpnjOGE5n7s42K/stQF0=;
        b=XKdMJfYONnVhquLk31s6tY0Wxue2hA58DTpJvmvVAe+lCY2Rk9UDgwx/5k+6NZxDAW
         4j4Yy5JsEqCskJ9TYBavw3uxLG6PRSZc+wDXs7YJF8iDpMoDxrujC1DbRoNhNoOspAg/
         Dr06kcgaOfvhhaUykfXVdPhUjZ/XGOc1cVWVp9Q087GU+hKnStsPIuSe5WfTkEe5zDpw
         2H9vu3y+UxVs9AUBOVZ+dFvMg9iaoomPPacirLEj3sRb+5mwYSVp/L90TbmY8ijf59Ek
         UjUR12vtclSmAzqlIDiDDU+0tUPUOj4/uB0exUnPZNErIOlsX6cZB1iyDAqEyDqBd8pu
         PsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761704099; x=1762308899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHoGag4qYuBHkU394iiXcv5SpnjOGE5n7s42K/stQF0=;
        b=t7WS0rkto+wiwU7DmcbYUp2VoeGHh7iIwNSDrIEpY7sAA4NZB/17FN40wxgwk4bjK6
         D7ADAzEFhswjxFzjFuGicmUkRB/tCR9tyDW/f8h+QSTniP8qymO/M8o1guZNfCgqQmbn
         EVNhzeSjlW+bVhqzqeHhiVOb7MdVm8176Da+/7/uZ1f2NQevnuAvXWpYqnjrrrNwVNSG
         TjMb/jV71RD9qB2n0cTA5Qgj21cyP7xrhilI7R/a8l/UhQOy6I4YaKk+pbm7lO3KuNMo
         RsnSNIoRjdCcfFKFj3kC7jVSfeBDc8GFpP+041nC9hm7UDs+naCFgCpqm51BPCPHX7hS
         W1oA==
X-Forwarded-Encrypted: i=1; AJvYcCWBjjV2FDFim3Dd9jqh4fY8RmT+Q4l0RQ2XZg0PFli2fMycQZzf4kPDgFZASzIPIO1D4OKfUwKqDtXz8k5E@lists.linux.dev
X-Gm-Message-State: AOJu0Yyry7+L/AITb6FcmvXp6393mgq4SuztGJ4SgVX6GDVlwehOSUkZ
	cpvr6bdI0ioB8wRIAuzqfM0JOeMKrr48D8dut6XO/hFjg53KFQXdeht4
X-Gm-Gg: ASbGnctPd8JSOhhbmtOKPNt5eXxwFB5S7Oh7Tviac7wcZzThtqyZL37I63tJonm+tPl
	lUyoathTzfyahSQXRtWtU/CP/CKv78tCQNkgkw8W2n5goYr8ujH2X9TACcdltuz9u7pfz1w+hKL
	LS05l+PlyAZ3HDRBSzKSvgqE6LpCpAC0Lu498yPtZyFw/Mzw3AlYjLP/l/w+XosX7o0IBr26FdH
	QF4in0LZ0C/7EFg08oL0V04xA6IymOCA1sSe7b3FUhJ/ZHoF16puVKShTbPwl0KFYmSzg3J/YJh
	aJFgdIzUbY08QhQDnWVBwZnwztF3B2S9o/SU82DlmLHSdeABHdbGVzyOgw5Ut251w6u35Mr2M5n
	KlKkhun6Rtox5aKtXqpaxj6x6FJvi013QBibQDK1eR9iQXqrAxKL9R9ijqs+JElyNgG7kDylpcM
	CizDHlOVG+Fetn+sdfoOctyXnE3UrSFviA
X-Google-Smtp-Source: AGHT+IGfgTz8g+xqtQI6DArhNfNdTHyjQWmRw2+ZzPnzomIZgLnkO3eFgWsHbdYW5iK7yEBnpMbcNw==
X-Received: by 2002:a05:6870:e99f:b0:3d2:3429:b243 with SMTP id 586e51a60fabf-3d5e7264ca5mr2344497fac.16.1761704098667;
        Tue, 28 Oct 2025 19:14:58 -0700 (PDT)
Received: from localhost.localdomain ([104.247.98.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3d1e27123d5sm4190377fac.7.2025.10.28.19.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:14:57 -0700 (PDT)
From: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
To: sudip.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cristian Del Gobbo <cristiandelgobbo87@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2] staging: sm750fb: style fixes: align call and split chained assignment
Date: Wed, 29 Oct 2025 03:14:49 +0100
Message-Id: <20251029021449.5420-1-cristiandelgobbo87@gmail.com>
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

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

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

