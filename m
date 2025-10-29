Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C971EE02F
	for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761704300; cv=none; b=WWC7+q/PTfU5OJeLsGHss9rb1BXkoWowCErzLptLFdj27EZTj/oL7iH43uBgy/Aq1Czxj93Y3OS+deshGsY0ZnSmU7xBwP35kgmvGeD0VfgthPlZKd2PC6IN1nKgQLhhTaxw8A7aWxLQvA2A3l4CiIidl+rzUKJ96a+4QvlJNcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761704300; c=relaxed/simple;
	bh=12I7O+T/BB5vXrNWDf+G6+4oR7EW0ESEut/5OnczsIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X/LdJ0BNgDXfwbuP43srAbNqDH8HL9LAdP818f4xZBRmiCa8yK0trrJvXZ64TTyhc6UPme1EIDkhvavONCuuEuA9uH4+3ibV6HR28DtV3937n9dhRKIl/xLPz9bqM9QbRWmvynesHXNQA5rWZskt3yIkNGsGk1G++cLjV2pEYzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T29F2nsm; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T29F2nsm"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c53c863172so1221659a34.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761704297; x=1762309097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHoGag4qYuBHkU394iiXcv5SpnjOGE5n7s42K/stQF0=;
        b=T29F2nsmz6E+D6CiEW3YKhF0pfwai80HGbLrU+ztaBrWYGYRvy6sUc3t5WxLq/8IfG
         +BcPjebvcv80Fcf02GZy6HN01DgbiuGVmWMO9mG6dfaQBRe9ugUfDAdjgcRBJyaUBBpV
         GKTjJ44F0t8Yr7zqdRL9OIN/xf78MpBGQYAg8CZ3gwz2A+mIyZcp+OHwmNe9+dJh10+q
         gzcS/jX4fO/IGwE7TEqDTFh2PD6F+6TinwEU3zjf1c5B6ZodOwtQw4z3zJVg1ZJkgN6j
         eh7IhxnRc03rhcwV3ISZaPyxhvXq8JtJQALIisyhQfhgpTtBO/F5P3wJ7G2sGI0XDJD5
         v+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761704297; x=1762309097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHoGag4qYuBHkU394iiXcv5SpnjOGE5n7s42K/stQF0=;
        b=W9jqerQ76OiRzIN5w93Ap/iw0nXWvu63XBwTAvDGvpk0vMueBEYSmZnl/8U9nMctRG
         hMDiSu4Z/T5BrfPMOS9VzHc1ixw4eWvkYAXxc69CKSd4PYN3lfUHVdQClqzow9ZOALdH
         XhHBjpIUhlvhNkEjXey3ZvKJxPdWbK6WgkCTv8WiTgwvijwLYUYaGail7bEZewFtdd5Y
         esanBV+By9wCZrpo0vCgj3U+EPB6a/+LVeRNiZX2UGgyi46PSvV3WFuvzy7mPlLD2Hig
         Wgfs3svlmpbetruRztGRjnVOfMkMu+lh0cj28ntaAjC4hkdBn43k4xU/jCpUC+1tIAbw
         XfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJBMnqwav5jkZIQw/rfnxcJdxZ9Q2W/Xzb6UPb/xAqf6dnPadWhmY2JInzEBPYvroGzFmMtDCzHFDdQSjL@lists.linux.dev
X-Gm-Message-State: AOJu0Yz86b+f5OweuiXWXe3X7sBMEsjdsOx/a9NIi9KEV6wos+HOhlrl
	yNinWA4P51IGzo48W1XYpVDXy1XrdTDpP/uuikluLY5z+Ish7Yq6Oyzf
X-Gm-Gg: ASbGncvY1PfVmknbLAepL+7GyOWhv5Py5GCQ7UVkhRKbPebB3jkcY6BSO597V82LkVh
	AS+KTworU3iCYWuA7SaIeHR+DtpRz7FIaWPuTVW2X+8Hgk6S54Y1FGOqgNGAh0Y0kbApiWXkXLb
	dauIghOKK6/D63KFxLBcgZ4dSS6K7N4PP+M5u8hwThsAkcGg6sQdqCsWZ2yugrEfG35I1b2W6MC
	qAV1P0JwLUSQ/T2uOixYgNHr7TlbO+3nyHmYF2rZ7b7FHDnTz7JZ/4ZGUn1pThj6mIiMqEFMqrn
	o/1fvf+wE1MEgBxwbZoufynwLLt+Wv7/STqPyocHpgxrjks85MAYsPa3RawHugVELYCBPkEppb+
	SdTCnWS8lOspOwLPUgkmtQkslgLFezt0259fO4//kOtCSQ62kLAWM2V/811Ge9Cbn+8YjVEY/aK
	KYXb2CWrqOS2gHLPuWaJuvfM1aC88GrZCV
X-Google-Smtp-Source: AGHT+IEvILeiQZsY9hQI4HqxU57DwTh96/ZaoIpzYa8J3J/41J2DdiQ6QFO9Fmvro7ru8YzzqFGlBA==
X-Received: by 2002:a05:6830:631a:b0:7c5:2e2a:d394 with SMTP id 46e09a7af769-7c68329cc5emr1033173a34.23.1761704297050;
        Tue, 28 Oct 2025 19:18:17 -0700 (PDT)
Received: from localhost.localdomain ([104.247.98.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c5302068a6sm3732034a34.25.2025.10.28.19.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:18:15 -0700 (PDT)
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
Date: Wed, 29 Oct 2025 03:17:56 +0100
Message-Id: <20251029021756.5751-1-cristiandelgobbo87@gmail.com>
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

