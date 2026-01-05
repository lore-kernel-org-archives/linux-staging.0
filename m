Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347BB31195F
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 02:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767579040; cv=none; b=ihvzV9FC6x6QkqVUivy9W7RKNYaA7LuzUFKntX32cWpxW/3pad35+hOYxQ1v7zw8S2+TAIhvSsU+8lh6ozofU1BDGgcdJbGmDYqXuFwrB+lgnaiY4ub8QgZGkFR5u2v1eaUOydb+rWtxmMR9V5rbeGwbI7r+jRjQG1N75hSyQe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767579040; c=relaxed/simple;
	bh=0vwCrzGD82Ry2ARhk4Xc0rYw3WMR62lsFO6Ax/l4doo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fp7qIPNWBtBMkuSwVK6mj3M8vaDvhw9w+YtNokYrNZQIy/0a20LKqreDwDpasL4Xk3hxq47r8NWSYhMe7l5VyIvgEiycVDUi1E3VgoUw37dTHfU3N7OtFBYwaNNGOzEf8b69UTFV6hEuQwHyanBUHKqrrE3lm8oerOBgfLyAZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRGnXKYv; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRGnXKYv"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78fcb465733so106208867b3.3
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 18:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767579037; x=1768183837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZh6OfyrjwSD0R+vDwnPJjj9xWF6XT/KbzSM5i3k5sY=;
        b=JRGnXKYvo76gkUn1J61cdX6yqR3eTxag5PKjQCQoRmy+rR8lBA5Mzs+vl8ulqIGHhS
         FNnW2qoPnPgyiZ31l4fgfczsx+9MQCUBkUM/D9qfVNotuN8Y+e+RS5SAxCWJ7497fVQF
         Fnr5Wd3CghIglF3tYeBJk9WThTtIBLTaAlBanttGFUGRcU5HUQ4gleUmv9Z2A9ahg6aZ
         WGKpzMfdkvOQ7On2u21p7Cd/apj2Zn1NaJqXzjyTRMrGrdrRf0Y5PSWxEEv7i5dKLFPu
         6rs+iDwn9ytwjq/v2bk//0JEkZUZVQMLRsCVqMJ00Whs8q/YSuN5M3NRGSOcyvOqFAJn
         BRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767579037; x=1768183837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZh6OfyrjwSD0R+vDwnPJjj9xWF6XT/KbzSM5i3k5sY=;
        b=TtckAoR2vveA4+2QtKNAP8R7dqYOlirfhmxrcPA3dlNDn33EYg4ecWHGhAl7wwC9Hc
         y3GFaq3roeJpMoVXvc7BityM9bFTXK/8c4KBCRXxtXnBk+VjJnHs9E8iUOxiNZF0lyLq
         SP6WdLaK8gxShBR87c7iBGFoJi2/SMKsZivExGi0nRfNbU+KdkjpJs1uuQPa2cGVZENV
         /Uuj/9SQQLtpdQn+YXvyILlGD4MTlbpMf1aCX4utOl7U84TlNB9tUZZBDkGI3GCgJcRz
         3LYsYY8FojBkBbpqq7yoej/sIGmwm/sLUjppZC5LmJCvf45BaV5R1sJTjBtFv5USJUhr
         HWcA==
X-Gm-Message-State: AOJu0YxrqzNUX3Z1UkExepEiWZxlK7lm78ieGFSujW+J/TPrTmRn+j+D
	oQvmVyZxnqMudkwW9u3G7uT/pQcml12OGLZLNscuIG/OERKm9vg0+U9Lsvnm6JD24xJmCg==
X-Gm-Gg: AY/fxX4PY+sBGjZxnwKvgk4juaMDPbgOo+/QjzsZpKsh2jPV+cuOed+tWz3XFzsQQkc
	napfNIBfla3Eo59AnrnpT0FJvOs72Dkce7vWDST2NMBLPWgSxhoLBMFRan0Z2nJrVV/MINElNpq
	QJII3p/RzxbfDAytLEJmjmL9JgN/Wa1nh6ae5FHHUnxKFjC5rwJCS1lYDnN6LjeI2h1dl967d6P
	1pj/ufK8jdxKJYIFf/od7C2lWXBUp2HgMYWF2PWZzqKzJA/WMGjX83xvOm9+CJ2jnvTC40ru/7U
	H4wFarilKxVwHMYzi0WeYt3+szJkb0HA4JzhPH7QNAc7W3j2/nJOVmFeEOsNTAllu4qxb1Ai/4p
	wYqv+Vyfzfk4A2hlqOLz5GHtKBRVfJQzmVb791ZuQ/CSK3unwElQVCwF8Am6dRT0NhvTwUxUct7
	n1yvr9Q6lZlxQwmBoRH4f984PGFIiH2TGYoV3MwgDyArYDYL3/AcbkitF3V/YKYPdTLukMzCADo
	2fjm1c=
X-Google-Smtp-Source: AGHT+IFP4cKlb7pVuGWgX0kABNLB8AddxBLEDUHDNDVXTtT+5aRajtle0ByOO5nWA/FJ+WdjF9zl9A==
X-Received: by 2002:a05:690c:6704:b0:786:5712:46c3 with SMTP id 00721157ae682-7902e6e99camr182881307b3.41.1767579037054;
        Sun, 04 Jan 2026 18:10:37 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7905a24322bsm47425747b3.32.2026.01.04.18.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 18:10:36 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: linux-staging@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] staging: sm750fb: fix unused tmp in sw_i2c_wait
Date: Mon,  5 Jan 2026 10:10:26 +0800
Message-ID: <20260105021026.556244-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang W=1 warns that 'tmp' is set but not used in sw_i2c_wait().

Replace the dummy loop with cpu_relax() to keep the delay loop without
triggering -Wunused-but-set-variable.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..279a1a10f132 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -92,12 +92,11 @@ static void sw_i2c_wait(void)
      * it's more reliable than counter loop ..
      * write 0x61 to 0x3ce and read from 0x3cf
      */
-	int i, tmp;
+	int i;
+
+	for (i = 0; i < 600; i++)
+		cpu_relax();
 
-	for (i = 0; i < 600; i++) {
-		tmp = i;
-		tmp += i;
-	}
 }
 
 /*
-- 
2.43.0

