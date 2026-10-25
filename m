Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792938166;
	b=vXYjT+x4gkK+2DcX2NCA0xzOxduUbjt7wMXZJjl4EcxJlG3Om4jyfOpbG2DGUXnJLGw1
	 24mol7iauimtq1R9bKy8r48SasYNgtBsxzx9cVnBycUUc/iHjdnUojImZ7M8lw+jesxq8
	 ZOaf0Oa1z651FwqpXhQPxN162wu9DoQDQO5coyX/wXtT24Qr9a/J0wOJlG6CdQdHCZ+PS
	 VaclNCQstB3vMZ2rSJeCo4BDlUlfzQU/LvTDhm2B0cud7JSzRCJb5u2J7Np90uutkYswj
	 nTRddJtytftoa2X2Q0ux0iNrg8Gx9vl06miDOQiunRIwcGksZmUqOLE5Vnx7KHZ1QxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=GWA3ILffVhGa4FkzQXQubKTR5QBs74w5VthahbifZWg=;
	b=GgG2a+aOccaS4rJY57ruOPaREfbSMJhXttFc62VEYAlcJ2CTUxtyH2YnGYAGKBpBuTeZ
	 O/YaMjwmlJHUVh9D/oxmhnikVWyvzWMS7CE5pCltj+4rxtpLNlZyFExznaqRwrE9EEQRb
	 LEcWXMS5IoB9dO/ywJhiYwZ8BW28JWJhyLp28AreO9mtpK57Cf/egDYNRKdOf5fSaOfym
	 6qCMUanexXSt/jk8AnQdibNVJK0tGpQh9wjNpeJAg3HfY1dZptMCrVout0ZYsoEvA21Cp
	 Wtd8KEcN2ac8DKK1L3QGeZ+PuHCkBnLGheNzfgyjTAWDnGHm1+i/3E8j/8ADXrbyIPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DIzbT5VE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDE6606A31D
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 14:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCDE6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DIzbT5VE
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4697404c2bso279914866b.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 07:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792938164; cv=none;
        d=google.com; s=arc-20260327;
        b=e+n74yoRSvKllMiA8KOjjjmipqRRKpaO9n6ar6Tc9BrgkGjA7NO6Jo4NVc7e37H9my
         7AyOLHlii1QGM+Kzeonx5wFNVwXJkpaAOuQsIqGtnYn3714xT1HMyofxzhQjVxbvEdxn
         CQTlJ5xBIZJ159ry7p2uflbT2UTrWgRYePlZ43nGNanI+L4hIWRCdsUoP/BoiIgRjW8G
         ESlzsHvOCCxJ0q7hmZVULKnoDfIxauLiWaW/HriqozuYTYf/BoiYTLMY+wGJhkz+zAFL
         gONWTlSCoMiBVv9Yy+jR4vuLKuXJCxgu8dxowYxKdgR0HvrrYpVFiVjvkA1sgD6Qnil0
         vPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GWA3ILffVhGa4FkzQXQubKTR5QBs74w5VthahbifZWg=;
        fh=LF2jwPc6OKylAQr6jbim0Z80q6bit9XXetLnNl95+eA=;
        b=IQCTc2SIrI1qKloazdtfZb/ZO6crfE7WqgKosdSeFxuvFRlnqQDOPVUYZ3IfThGxKG
         jHEkBUyFn2Bt2NiFhuLngJHoteICnwWLMST6brhUvnUvAOscHPVJ7iMUPdVxR8xm+0Rz
         ANkgpKNzPIBoYknSYrwnqab5PR44OzeHt5ZCYUoNsXDOj6NPaQDBGN6CFyuvZJXfZw/L
         bJ8O7P6K0gnvwoJkwc1CqO/Ibn7biwshdmEHkcj60+rM0jmogu7uFos5ni55TO3AeFr5
         G6Pn+9XCwbhXQosXPRmmWkRWXH04XQF0VekmHQqbj/OSZFoVqq5/Lp9/BTG8AaMGrPxp
         gLYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938164; x=1793542964; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWA3ILffVhGa4FkzQXQubKTR5QBs74w5VthahbifZWg=;
        b=DIzbT5VE3DatzXwwt3fVgwxYEF6irCk92Jo+7BKwCPiPRXRNIpnATpkrFETGI7Pfkl
         y0hni7URlUWYrKjWrILmtKsKblgk91r4N0XVgdSPR00d3DZ1G+1W2iRSh2hNjz3GeMMf
         WYCeVjzdS58cXFuc2xKRkyx6FnCDPeXkMcy/EhTHj0F3I72U4ZC8fevOtx4p/SFT0VIA
         nuw3kKvO13WjeFcOeZFgx/oo0RffDA3Pq2odK01IbxYriKbPQcqg5GqQ2Oy/eVXZC36S
         6A2qy5+6U98QpcZBPPYqxXuJxPbIl+iJy9QLBkExU+qtfv9224T8qqTKZpXckCDscmC6
         bmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938164; x=1793542964;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GWA3ILffVhGa4FkzQXQubKTR5QBs74w5VthahbifZWg=;
        b=cL7gfdQCRcgHtUdakBbI7FtniRkb1PGzFRybd3RbXjfzvcxRAFpAv2jaSZOk92YtIc
         7xudl9rJe62tPfLLjaskvxa3C6fk7Wh7nA36lX0blsNwkN97KP+4HtofKifYL0CQ/VWL
         IviMUxgPpkfpr5ju2cr/F7re6s0UznA4FidHwPElK4ShPcuKiTx/VLjBfd2SCl/XJEtW
         qTTuv0FPfwNLqOlDD8Zi4cKoY4ngjRzj+SF/E+WWoVwPQcxifle9xqJMfKmaJNjATwyP
         NFYfEweL3k1JaLXO5/6yVpzp2XdK5m9DqTW1fInjK56TM6xdiZy8Vw2IC6h3Lw61W0lA
         YLZA==
X-Gm-Message-State: AFq9FYKkXfVd7Rn/ghYAVjq0tk3Suunnqp2zRhEaJFaMcr6bXqt84lfk
	aeYhK3BYKlExiT//sjtYI7yhWziC+pM2CTaoXbBJ/difqx2BzeNcma4bFf/xFq1Ai8xY+QvwJ32
	F6xrVEzi9nCttjWPlXTGNLAwxO+PfAsU=
X-Gm-Gg: AYBFou0pFSWIXfdOdxLYLoBiNjxEyTaGd37ryezLLx2aNKGT0xdf9fAchqT3FOElrBP
	b37cnw6OO6qe9II/Bmy3HBo99ebWnmtAE85vuNCZwFh6i14oMwJ1iWmTakExrMKY8EkVBaJ9r/c
	1IEoAbtpRm+MZOf8qKtyeqQxidF1Qtq9M9GbPdI8gSC4femh4Lr8krwf0Tg22ZefWkyseBL9uiX
	ssh2IsEkdlsoVFdB3+PlKTp2O2vOdvAZphp6oLpI9FDYgNNf8NJS/s8GEEEG1XK6iS1lg6YF2oz
	Kwm/GqMKCkkVovymZ0M+JxrqZDmmhf0r7qnV4Jdduyvwsd8G6xtuxJao4enfVHJzPVlxGn/aQAA
	44uotiFuD53fpURDO54Q5E4g4mmxr8uYCUPvEDZXqS/5eOuJITZdwDoLyLIGXbgJ3bw==
X-Received: by 2002:a17:907:dac:b0:c31:e9b7:f10b with SMTP id
 a640c23a62f3a-c46bdea43dfmr530904366b.42.1792938163869; Sun, 25 Oct 2026
 07:22:43 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sun, 25 Oct 2026 15:22:30 +0100
X-Gm-Features: AclHuK9wgskeKFnwTz3UroDZd-FWWYPOLCNifdGibJ7BV5fPBFLMKtRw3_x8_lk
Message-ID: <CAHxSwT_bdBdiwwXpGpr9+rGizZU3p+RsB18hPH5TxqMuMZOsQw@mail.gmail.com>
Subject: [PATCH v3] staging: fbtft: fb_upd161704: Replace udelay() with usleep_range()
To: julia.lawall@inria.fr, gregkh@linuxfoundation.org, andy@kernel.org, 
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Replace udelay() calls inside the init_display() initialization
sequence with usleep_range() to avoid CPU busy-waiting. Since
init_display() runs in a non-atomic context, sleeping allows the CPU
to yield, improving power efficiency and system responsiveness.

Signed-off-by: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
---
v3:
- Remove raw git headers from the email body per maintainer feedback.
- Add a descriptive commit message body explaining the rationale for
usleep_range().

v2:
- Send patch inline in the email body rather than as an attachment.
- No functional changes to the code diff itself.

v1:
 drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/fbtft/fb_upd161704.c
b/drivers/staging/fbtft/fb_upd161704.c
index 7288140e7..94ae5bbf0 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)

        /* oscillator start */
        write_reg(par, 0x003A, 0x0001); /*Oscillator 0: stop, 1: operation */
-       udelay(100);
+       usleep_range(100, 150);

        /* y-setting */
        write_reg(par, 0x0024, 0x007B); /* amplitude setting */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0025, 0x003B); /* amplitude setting */
        write_reg(par, 0x0026, 0x0034); /* amplitude setting */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0027, 0x0004); /* amplitude setting */
        write_reg(par, 0x0052, 0x0025); /* circuit setting 1 */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0053, 0x0033); /* circuit setting 2 */
        write_reg(par, 0x0061, 0x001C); /* adjustment V10 positive polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0062, 0x002C); /* adjustment V9 negative polarity */
        write_reg(par, 0x0063, 0x0022); /* adjustment V34 positive polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0064, 0x0027); /* adjustment V31 negative polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0065, 0x0014); /* adjustment V61 negative polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0066, 0x0010); /* adjustment V61 negative polarity */

        /* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)

        /* Power supply setting */
        write_reg(par, 0x0019, 0x0000); /* DC/DC output setting */
-       udelay(200);
+       usleep_range(200, 250);
        write_reg(par, 0x001A, 0x1000); /* DC/DC frequency setting */
        write_reg(par, 0x001B, 0x0023); /* DC/DC rising setting */
        write_reg(par, 0x001C, 0x0C01); /* Regulator voltage setting */
-- 
2.34.1
