Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35264378D95
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929271; cv=none; b=Z1+AptWWpZZdvORHsBR5znuAJjCUsysBUiKPY83UONAXQY6UBHPWyoV0FULR097AhAI75Unbp2LGo5dhG/jXPvsHPKSgih+5r1qdPwj7ZxbmZS6eqUuh7Z6NCeJOCrdkpow9RPqbKrHwjnp8lAgjkDD3YwzHpl7zg56nKLEN8vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929271; c=relaxed/simple;
	bh=wpp7CAlNW4oDopaVvDX2plKrdYNsllL+FIcPhoOLoJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HU+CFvYVNjiKv53YGhzJBUQtIP3xZalTlr7hTL0BBxHYOhslc3Z53zcOBUFgzGP1dNMS/waMLSMSlRcyEivh1uJEPCcTFa55uxyVKB0k33wXAk/+e2yl3StLIFP/+3zPdOMx7K4PhxYC2YW+sIbceIK60fjrnr5hPKhFiA8Q4/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dH7PdyXF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH7PdyXF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806fd9033bso7415585e9.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771929267; x=1772534067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ijFX+8pworxpOgu32P2okqMzL9v0GAftqGv4n5laZkY=;
        b=dH7PdyXFkhIY8nyb0nLkmH+cCqskF/OzCCzQEyqyNEZCbPKi7hVFqagcN4RA/iavDm
         SEAk7LPmG2YFZLadt83kB7C1tE48BJe3jCbzsXfEjQ2oIQ5oVyPSWvQs93qO8qYJXMvh
         XpEbQ0ZD5RS2TY2oBSqRGMuZFhk7K8DAHxsdRYM+5guGlL7jjyBbSwuPrivIgeZj0lAV
         7KvdOBWASfxr0Eb96xGk25JH9WqJXQj8WevR0m5l3WQTnPWSd42O2+sqrMSR7uqIQf3k
         Y4rkqRwjeUsySk4F1SPRAlDloN51I9gTF+JXSr8rBvFvBWfJFWibpxaYOIpolELJrrQG
         1MYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929268; x=1772534068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijFX+8pworxpOgu32P2okqMzL9v0GAftqGv4n5laZkY=;
        b=bvo6iWul3DuqFD1zpY5tAZ9Rpt9m9w+Gy0F2/UsPsVKB4YfiOIQzK2vu8D1pNaoVIT
         tJg6E6ynqUsP/f/iLZQTW2FcK3w8WpJOCerdrIz1WQ3vClWs7oLxYINSwWzBObvG57RI
         R0TKV4p6P+2FrE3F/3bMFKdEOxoyOBprpxhoStmVM1/couJD/3AFNUmqC5FqvzDX1/2N
         jcJlplrruBVvUnHZzjCw6xlKjgYk5dW1EyFWOBK6+SJbNJMvK5tcSDMi9cvhw2EgFTbm
         LI1VRVGbwxpsCoRE9xWWf8wkDg+kA9N4Bo5FpVEhQeAaHBS2R2Yp+BYQSruO0ukSiJrN
         +S8Q==
X-Gm-Message-State: AOJu0YyW/njE7b8u6+w2xKrLno30lkpjQSeDL9yb/TCmzGAIj77A4tgc
	x1i5A7mfHx1kKNVpxmg9L/3cCn/ZQ1wBrQg/nNKW1rrWoUgTfjgFlABG
X-Gm-Gg: AZuq6aKF0AzWV8pKGhrP10vRNlP5eS7PxAGGBVBIpF2eAd/haq5L2mQLURr5As2AtAg
	o7xEBY34hdUtW/cBBqRbn2EQ/U3Dkmro2J+9pufMSIJCkYDFD1oFJ4tzvDKEhy6QHeVGxoBnIIV
	glBW7rC6yik6ZVfPTHHkUj+eWzJO29/G2kZY/fw2jggsrb1KhyVUdJR4yorE07FG0xBwTG2t+NW
	oLO46sc6O63L9kNvZjv7Y4+zfLMeLSn+WmKo4bzxuNINVcb0L0oEo95oA9C4WOqEGbH+U5y+C3k
	L6WeylobRDT4Vmzbz+flQJhegjyEhkE2n/xWBasQExUPdkULHXVqr7MdyO+lWpSgpSVzO9olgkt
	L1cAHQXvskWy7XoNwFSKCJqTzg3hhOIBDu/7BwXgDxvHhSJxhb/Tccfa1pvTWxf1NOP1ZZVTOyD
	td25uR412qlRIii7vjcA7LxKCBVCtouskvmKcPjWXQ/2l2oMCD1csDCS30qNPIq0+EoLBr9Ospd
	6N5FutiHwyH/x/i7Z0Xkcro+U09PAi8lw0YcWd6KLEgSmGRJOEo
X-Received: by 2002:a05:600c:1d0e:b0:483:887:6e32 with SMTP id 5b1f17b1804b1-483a9607cecmr102819005e9.8.1771929267513;
        Tue, 24 Feb 2026 02:34:27 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm500687595e9.1.2026.02.24.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:34:27 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v3 2/3] staging: rtl8723bs: Fix "Enalbe" typo in sdio_ops.c
Date: Tue, 24 Feb 2026 14:34:12 +0400
Message-ID: <20260224103413.48216-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changed "Enalbe" to "Enable"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
v3: resend as series with unique subject lines (Greg)

 drivers/staging/rtl8723bs/hal/sdio_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..d653d5df7d35 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -720,7 +720,7 @@ void InitSysInterrupt8723BSdio(struct adapter *adapter)
 
 /*  */
 /*	Description: */
-/*		Enalbe SDIO Host Interrupt Mask configuration on SDIO local domain. */
+/*		Enable SDIO Host Interrupt Mask configuration on SDIO local domain. */
 /*  */
 /*	Assumption: */
 /*		1. Using SDIO Local register ONLY for configuration. */
-- 
2.52.0

