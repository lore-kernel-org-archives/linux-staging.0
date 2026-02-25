Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE523939CE
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017527; cv=none; b=pAr2jt414M4Abdl4EfOjYWfDvW/L/+5kCudtx2cKauoIlNQ83Xv3EMF7ZSQudXUXDY8lzU/vKBsOE/iwM4+rrqmUZYS2d7JaBOpe5kUZvlS54Ew8Ei76XBPbW4NJd/kP/WevUj/cC+hCWb+yMXtc0YLb8W7MVkRj5tlVKc7a8Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017527; c=relaxed/simple;
	bh=ykKtPkO/mmIzYxLSyrBv8klspIbAKnyBvYqvA7yY3iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oDmjoENYw0SiUhzYVppoun/dirqBDrzu7CsDpwM2UM99e2xyIVPXvfzXwiDITSBhJRn5LIXfHZ9NABVZHvdBnYItghCrdxCTpGJNUCy81SjEmXhISt3aRzB/tmFKPCk6RsctDSm5skJ9FEPGIjl0WlIW90N3EJsgob0HoRPZLbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQtyVDqB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQtyVDqB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so56220285e9.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 03:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017524; x=1772622324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jchPYDkTxTgSHgMaLoueosfcrqNqeUJ5bQfoOU6aUu0=;
        b=aQtyVDqBiFbCZSbHdOLs9K3uQqKoSIFnTzrYv+8KP2ilkM+JdNv4YHdwTcpbtLQiOh
         8TIFiF/XdTEHI/2Hs7VssT18DsW0seWTloHO6qOtRkLKl30cFOqgTeNetMPRyMCN4elk
         Qomj7Mtzk7miiXpSK+ngr1p2/GuuERskD/VWjc6VJ8GQAO7DQfvj88sUwRFWnfE9k1Ce
         Jj5v48Pa4yaKb5DLKUrNqC+JvUy9YE5KQ4907dIohGJBbQpPu4DzcpnKug5BKolqNgXY
         RMEDbcLRI9HkUGFtDm0SVvXX1H6VaUwhuDB0PRPKgyIKgbRicyX1L14U3pDXCn2+hsYE
         i2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017524; x=1772622324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jchPYDkTxTgSHgMaLoueosfcrqNqeUJ5bQfoOU6aUu0=;
        b=bWl7UxoFbOJMVOpd5Pv47XNsfvC6EIHbe0VxXQD1nE4IG158kWkRKIhbWTnhW1yKrz
         rCJiWJLzXe8YChg/ArIeQ5eLsp0iGjLhd9vZi/uGXRBq5rfh+Fv2HCx0si02VJyy1taR
         K5t0CbdvXI3m5pF3E5khmDiKhfxXi8LvccpSZw7JQNLPYwHaL3K1Dbm8GhZ+uYEuki8R
         M4oVlkRe12FasciaClgK00VtX50u9DGHpSj2ahQcTrLXIxg5Q9gWwlK4mn7GR/QOkL7R
         NdnA0+co09SSicti93KN1UPzai47F4NVlaaqmGB0o5dilWQeTbUZCChkTOaaVE7H7beR
         jkvw==
X-Forwarded-Encrypted: i=1; AJvYcCWwi2EYbOOCJwRhnsD1QlelIxwh1DNlRuWrluTC8fz1qg3lUYnt/EOwC4SF4jc63KgbJLednrGv9QyuHeSY@lists.linux.dev
X-Gm-Message-State: AOJu0YyQOPoMnfwIS2yZTeO/NiRtOaT7Kbd+WpYT/SR7CPvGHfWh99Bz
	0R+iILQpvfMcXr3h9GdhL1mZu+UkdsvJfkjsDmfi2Sp0vpxRAKY1iHW+
X-Gm-Gg: ATEYQzz9nIf164JeGBPOrJxoEhOSmp53GscwZCYl/0fQW5hMysf4Q47qgunFUFB19Sg
	5o0OJRbpc92pPv0SgAjMYgCsRjjHH41NzuypEEQ9x+6CfpkltNdNn0sXeFAgvXVOf1d189q13Ow
	nHQ6XvimIOLlmQyQsRBVjviIBuqcU8JsfgpdFDHq+1fBBk6e3R+XI+rdpJfird9h1+3c3seATKi
	dLfhfrQ5UXN8C90LADB7yU1piH0mPD8Fyb7FODUjW0cTXFCjgoZjUJsCWgeSQ+bUeAFcIBfb3V0
	Hya4O9CXZ4lC0we6BSpz4Y2Qykf3JB12LIB0wiT8jwqUGHtoMPNmhAhh5fjwm1IEq1lNmioRXXA
	OQ6ygRxop/6gqKQdoBYqlzpqnpRRNqlFt+RljosgFC1g0L2Dc9Z0xv43QIGMzkUDoHiijX0kcKt
	rnChgmW8rddg+GGrqWxTI6dczKKkgxYkFuncLjGn4=
X-Received: by 2002:a05:600c:674f:b0:483:6ff1:18b with SMTP id 5b1f17b1804b1-483a9555bafmr262387805e9.0.1772017523777;
        Wed, 25 Feb 2026 03:05:23 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm57494205e9.7.2026.02.25.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:05:23 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	azpijr@gmail.com
Subject: [PATCH] staging: greybus: camera: add comment for mutex
Date: Wed, 25 Feb 2026 12:05:06 +0100
Message-ID: <20260225110511.107114-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a comment to the mutex definition in struct gb_camera to
describe what it protects, satisfying a checkpatch.pl CHECK.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Hi,

I noticed a CHECK for alignment in this file on line 267. However,
fixing it pushed the line over 100 characters. I felt that adding
extreme indentation might add more noise than value, so I've only
included the mutex comment fix here.

I'd appreciate your guidance on whether you prefer strict alignment
even if it breaks the 100-column rule in these specific cases.
---
 drivers/staging/greybus/camera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 62b55bb28408..a6f3637b8871 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -53,7 +53,7 @@ struct gb_camera {
 	struct gb_connection *data_connection;
 	u16 data_cport_id;

-	struct mutex mutex;
+	struct mutex mutex; /* Protects camera state */
 	enum gb_camera_state state;

 	struct {
--
2.53.0

