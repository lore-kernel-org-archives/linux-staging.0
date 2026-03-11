Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC98361DAE
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239067; cv=none; b=rsxI8fvn3QTP5G2dqopqN02VpS21VYEeNESR6ba4ZNL26wCtKff6buNoJcDgSvEEX3qX8Tj1y8PP7UFs0AfbP/Zs+3aR/Xqca4XBN2DgFFi1FHkMmj+CxSxWwZRNgs/k9KYo8TfeKOSn7Lj1Lh9OwMPKrH2dB0tf4++Rr41g+oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239067; c=relaxed/simple;
	bh=qxuc6aZ56T+xnzaeHprNxYhwYlFIqbF0a3n93get2js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhOsqetMfzz6SFgZFZdN6Q7YMgO2Uv5dq4xWTdnZICI7q0tE/Vyp2ZTjaB4dr4ax5t7qeGMnFjJ6+vHBv5LUbv1IpVkMYYIuCMtjDgXx1EGiUnt4Od6djUKjCnAxSpj8SkRu/0B9rohuSmf3BqdjWB7fcUwVLDhuuVSA19NAe5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3fBnsrF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3fBnsrF"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ae43042ea7so118917985ad.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773239062; x=1773843862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yzQHobrc9BT4KEtSHYUs3e9/ChyfEojgCvQAMRjcdo=;
        b=i3fBnsrF7u3m/vJfdwBhHemFtB0LpB+5uSlKDnayDIMYxHhiSInbzwdtw5Sou9OaN8
         ika4lVO4Z0NOY/RCTkFuPl0uytAKMqHeTd1NGrgtS0ZgMdJXZaFwWGwQCFp8TrMe0lZl
         EPS5PWROUo7OoJfFz6h2IaD3W8C9cXirWmCwln4kvXcqbXTRzMpFJUFvT8fn6HnYW+0s
         XY67+JNup+LRNnrBhDCbfUf5m/lYcVDNONwMfLX4JjBpkD03YzU3ZDCTKhv9Ez86LHW4
         90FA7w8advsti+HMXAIcUzKr/NnsOSQYcrmRQDeQ1Ryvbczqar15Mx0/Mw6HACHE9HHk
         CzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239062; x=1773843862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yzQHobrc9BT4KEtSHYUs3e9/ChyfEojgCvQAMRjcdo=;
        b=WTpAmcwn2X9+3Qh/fpov4C09A0ss9s9uasuJ+5X8rtL2AuQ/czobweqLYsi9AnSEbg
         BrJzbxIFVpuYOa5NJnlsGelFgdWwzM40YaHlaWBsKbatmX6pE7RLxpQZmRwS2rqabDMn
         snZevmH2so8nr+ghWhC2OCRzf+x176gRrdhyVxOZYEpP20JvcsMdfIgCMkYxdXXR9Nk2
         XlDks4IE+2tCGwHSlOzuCId0TFAHEfFsPJDOySWx4jZUqeoxKW3RgFLbXRwPsrp0/5dg
         bAUYsDAgvsNsGLDzX8CYRxj75iQ+ImN5WNPy+QlqclzIGV/Kx2/C4h9KSdPK47pitP1V
         vsdw==
X-Gm-Message-State: AOJu0YznQEXiAd1xh86sSEnk8S7UlUiVKljiwtvn+BMuebOw2D4gjMwM
	f+X65M6VvF75Zr0OvL33HsaRdCHaYm5o+tG25TgZcjfZDsErnvuOoLaZ
X-Gm-Gg: ATEYQzwdlYGrZNpto8VSu7xi1mJBXCjseS8/retd5IvneD+9NHoIIfYHG00Ww1vXsiY
	turIw1TcDlpAj3qIU90n7uDe9oNOEezGwzJszWYqZawE9t8Gx0BzE/TZ/ePfuy8lFs4+L81lfo5
	hXHQvrQkW8qOVtdxade8bsOw/i5x1RmPuJa8fWVBBAfneVdkBe1ScrVVBBJRwB6d5ubeEJZgUh4
	ezM2NUTWy6Xs13kW/mX75Yxx7pU94gUgEHijBF4A/hS2QojEjSl6IMdW4ndHwwT0noF/0VP4qPS
	0d7Iw8vxz7CtVe9qQqiQJF41plKC7RSJYe9D7kRc5r8XKUXVqQysXiB4wZxg2FEBrTt+3ulnh76
	nohKnEQCHVDd3jLdCVd0JV8lAAA0jDLz156UXpSFU54pEoqn3xda6/6EEQt2Dst2dxlMZvFpnhn
	+pJImsCTQtcrTALFPEyLJyKVE2M4o=
X-Received: by 2002:a17:903:2349:b0:2ae:7f49:8e37 with SMTP id d9443c01a7336-2aeae77068amr28402225ad.11.1773239061611;
        Wed, 11 Mar 2026 07:24:21 -0700 (PDT)
Received: from ubuntu.. ([152.58.130.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34d93bsm25395405ad.43.2026.03.11.07.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:24:20 -0700 (PDT)
From: Anas Iqbal <mohd.abd.6602@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anas Iqbal <mohd.abd.6602@gmail.com>
Subject: [PATCH] staging: fbtft: fb_tinylcd: replace udelay() with usleep_range()
Date: Wed, 11 Mar 2026 14:24:07 +0000
Message-ID: <20260311142407.35403-1-mohd.abd.6602@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace udelay() with usleep_range() for a 250 microsecond delay
as recommended by checkpatch.pl. usleep_range() avoids busy
waiting and allows the scheduler to schedule other tasks.

Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..51e6493b050f 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,10 +38,10 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	usleep_range(250, 500);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
-- 
2.43.0

