Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793462966;
	b=AJrtUxDXC7Z+Mn+WHkcoTCjqUufbU0NqUJYo9bgYJfIQ8Xm9gj57xhy7oCuuAVO/7QE2
	 XVWP+wpDxVxyhVzVa5A9WgjXbTMOp4668ywwwULxGDnUIo3o9cejONQvaQSGtmVHCA3Pz
	 f4GrE32TDdKcZIoGJQsT/KaagkYq+6Z+pPffrNklh8Nc3Z0oe+ik5CuwzmIp+BzlPNgyt
	 mDSw6mlS1E2zaAusxB771mw8T7ckunhwJBboQ3nYxDkWMnDUp2UeNPpWKRGrcnY2sHx+v
	 im8indCQ5hqDmMS8V+0BA++Klshjx1S5bUImGLvDm/ZraKWJFWcJawgVThym41bkBqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793462966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pIMO9wgY/VwwK5nxTStbEs7fUPx2bmuTq8LX9Vofsqo=;
	b=MKI6rHz56SgccgTvVDBPkER+o4DFkmqt6tcTYKxlzGJ25IJ0N6/Lhw5EwYOz/J33hDpW
	 SAc+U2mgqrivxf3N8UXINhRhmrgPQFFMysoq2oM1dKqJ2upWiC5p+k0e3/zK8q36iRgVw
	 Dzcb3hBsJwIcUnMyxbovV0GApYEY5HYKCpP7lybylqgGps0ZZxiC6slrCgFhtH+v3TfLj
	 3m3taavW5YVqNVu2tIzL0yijNkii2VYac4IpkMn/8XqQseX0SIk7vHJncdNrgWpI5821a
	 u/N1gM7joaCa+OdBo21WWRyb1uJ7+A4cOWFNZ1frM2Mty0UxVF0vdXnIHUX9GcrNRYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZQwj/+q2";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068F3606A31C
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 16:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 068F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQwj/+q2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so18930395e9.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793462964; x=1794067764; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIMO9wgY/VwwK5nxTStbEs7fUPx2bmuTq8LX9Vofsqo=;
        b=ZQwj/+q2hV9Mbl3GMOcsA71Ck3EwblJYIoWp+QjgKh6vxjkeESYPauJcU5N45CQt/u
         AhKPpKCzYMGaQSd9fW6Ljx/8c+PtZRtok2Hoj3dHRcQjkLc3jmx5tokGTBgA6mC18ZVE
         dqhFbVN1j2G5tvswqRif8warrylgqG3rD+S2zSGST+I5Ly3bwTURz+6s43VeoREj6YpJ
         tfXq32cyywx/LHzhLEn0a/KBZvL5W7HTMcdisy7GUnReSduConO5+1mWYdFAmPi4a+4B
         AiNJXHw4P9jyCBugb1n1bns76n9hoE+3Nu4En+YfLUvX6sSWZ9z8LuAKX+HhUZhb7xbt
         fxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793462964; x=1794067764;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pIMO9wgY/VwwK5nxTStbEs7fUPx2bmuTq8LX9Vofsqo=;
        b=YhRhzu+a7ZIEb4FnqPyeMfSOC3mfSxUKydgEpN+FrHL93ByXGOy81ZjBJab9EIyGV5
         VrHmh8ckRYbyxgc/BLp37x078eXc+oLvOZZQevXWTNaRW9sDncPWavDTlrN0SDac1KX4
         x9xr9rXPws80cJSvikKcqsfMs/ZEoUJvb750GBgdrl9y1GaeghIqGsETvyRyLafZ+Pkq
         35Sd14xrCZeaknZ1fR82tYrneJVTPdinqq2/k9F2xiXIo0T6e1YOqComIW7ic2uXP2dB
         gr3rYGyrqMteqcAGBsGvMNh8SZAAs7fWjxcMrZS+7PoOxiJoVPvJWZVDKLGgdiTklw7T
         M2ug==
X-Gm-Message-State: AFq9FYJ3/C5wwL+/HrfLtUM7seEuHWcYr3uJMdmt0MK0VwlqAMa0oAuA
	HG/Yxloo6wYsQEXlngMQrl2y1CubsmYA0erLtIYy2B26hLXqwnI4NZnn
X-Gm-Gg: AYBFou1/9k37bjFL1qkQ2+LGedJqsRbeFsW7errA9cKrABxnZBQfn16S8w4iBsVZEMI
	1ofvL6KbA1FQb9VRnu28NlbLLaYuwiFUpuovWb7uxxa1PzRpzYNwLyDGKIBeIxrDbDjBBVxctIP
	copVx0u4M+QaZgSJ2qU/DLozXMQq9NBhXDo2vPrUQ4yZERUP+KdpBX3JXtnEdVhyvLBT42njmXo
	+5n5tsBZixP9feUTex3N8akI97EzYCcuYlvRwK4PntRteJnlPXW+SE9Sw72stG684ig0BTN1ocX
	w5XewPs6/971d6yhDd5xflGcvWqz+YC2bfJeP479oLSd0ng7KC1xO9tlTpZclozgBwyrzG8FCPV
	Dr04kahEsLXYT4dz2C3hHMEFxEWG03J5sfR8HFgos1XZ2/bZHDE0SI9T2QD4A7SX2Mg1smvfaND
	8Fmv/wT6j+g8ACeBKDy20qnD3LOfbZonWml45zUORrphpdQcBqlVidj3Ghh9Pccp+uLQNMMHJ3h
	A6U/f/vYbxUtErD0xdWYZncik1hg5tUf844Y2kB1kdADheDvWZ4WHBY0R4PqbKDbywkWp/+otP2
	EoRdI6onPVuw17mE12vf+9hQSA9dAH1ct2gZ7ARrsHI522H0YX2FfA==
X-Received: by 2002:a05:600c:310e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4ac1709ae70mr125197655e9.15.1793462964034;
        Sat, 31 Oct 2026 09:09:24 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm110103945e9.5.2026.10.31.09.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:09:23 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: octeon: remove unused cvmx_pko_get_base_queue_per_core() stub
Date: Sat, 31 Oct 2026 16:09:02 +0000
Message-ID: <20261031160902.2540710-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cvmx_pko_get_base_queue_per_core() is not used by the driver, so its
stub for COMPILE_TEST builds is never called. Remove it.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9c1968b7e2d10..ac7a98093398d 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1323,11 +1323,6 @@ static inline void cvmx_pko_disable(void)
 static inline void cvmx_pko_shutdown(void)
 { }
 
-static inline int cvmx_pko_get_base_queue_per_core(int port, int core)
-{
-	return port;
-}
-
 static inline int cvmx_pko_get_base_queue(int port)
 {
 	return port;
-- 
2.43.0

