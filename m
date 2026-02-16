Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD11256C84
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 00:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771203474; cv=none; b=cq5Oht41yeNcG6HwueRiEdBDpCuQjsTwEGT0wddmwsJGaANEUwLcCrwn2FEIrCl5kh1Sm7i+5wr7KngY4JNPlgITd7il/000n7zJedcbhx8TFRznHnnmTJ3gQS5+hjtE567wvLonKDX6JoocK45TmwxNVf2nG0s8zNeha+rKMdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771203474; c=relaxed/simple;
	bh=0zgEok0+37p3eDuvqgqaUzIPwvmXu6pnaWg6bkB1ymI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+FItF6ZExr3mBSZ88PJJ3OZ47km6j9raPJA9UQSJVyh9Zs/UK4szquM8ljb/M91prICEj77pEKa2nMXMgXDRqrW6gmRV5Y9nAkjeKLM7oWf3Qa+vsqN7XMhBz+DAXHmLlTmA+mDXZPvLcNdF+un7oKKA2d4ysRnj+N1Szsp7+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wAlQZ8aF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HiG2Z0iL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wAlQZ8aF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HiG2Z0iL"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771203470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Nfa28DuNniAivW25JVgFFGcEoKTD2wIIe6OVumjmOjI=;
	b=wAlQZ8aFcWDlwqfWKb1NGjxD2o+GSP1sZgnUxaS3XOxwI8sAvUa/R8+PQi5UGJhzEg132y
	xDx1+Ea+b4US42ZRlv1/a/I+lPwG3+DrZJXnDfBgSbmfpH2zjSzqvCB/KAb+h0l07UlC6l
	IWCtr1g0M1ywUAlbACsea4VE2RiomKfwRCVjXsygQifjkorgWRFfIwfFLOoSnBWFXkv7rk
	PS8fXNFp07x6YpoxfJWtsyNeycPmNg9YumUT1aBZd8/Xol9HacbRoPxEqOg/NGBGhzh1gb
	eABWIsy4vYxDPteOE5ufQUu8Hm2F42OSCTDJx3t1n6Z4DObEIYGLOs/tiDbRWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771203470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Nfa28DuNniAivW25JVgFFGcEoKTD2wIIe6OVumjmOjI=;
	b=HiG2Z0iLSDXgxyxQgn9A/OvwnSVUEDv9sl5SsVOCUKXnBf7JRd9AQvg02Zj5h8ceJuIRl1
	KkQsJqQdWhMJURCA==
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2] staging: fbtft: Optimize partial write()
Date: Mon, 16 Feb 2026 07:57:30 +0700
Message-ID: <20260216005730.4535-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When user write() only to part of the screen, the driver still updates the
entire screen. That wastes CPU cycles.

Optimize by updating only the changed lines.

Also remove a "special case" in fbtft_mkdirty() as its only user is removed
in this patch.

Tested with an Adafruit ILI9340 (drivers/staging/fbtft/fb_ili9340.c).
Improvement is measured by a pair of trace_printk() at the beginning of
fb_write() and at the end of fbtft_deferred_io().

Update type         Before     After
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
full screen         196ms      200ms
half screen         200ms      124ms
quarter screen      193ms       81ms
one pixel           199ms       43ms

It is interesting to note that if the deferred IO's delay time (40ms) is
subtracted, then the time amount scales linearly with the write size.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2: commit message amendment (add extra info & fix typo)
---
 drivers/staging/fbtft/fbtft-core.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbt=
ft-core.c
index 8a5ccc8ae0a1..16899b979623 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -300,12 +300,6 @@ static void fbtft_mkdirty(struct fb_info *info, int y,=
 int height)
 	struct fbtft_par *par =3D info->par;
 	struct fb_deferred_io *fbdefio =3D info->fbdefio;
=20
-	/* special case, needed ? */
-	if (y =3D=3D -1) {
-		y =3D 0;
-		height =3D info->var.yres;
-	}
-
 	/* Mark display lines/area as dirty */
 	spin_lock(&par->dirty_lock);
 	if (y < par->dirty_lines_start)
@@ -414,9 +408,12 @@ static int fbtft_fb_blank(int blank, struct fb_info *i=
nfo)
 static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t=
 len)
 {
 	struct fbtft_par *par =3D info->par;
+	u32 start, end;
+
+	start =3D off / info->fix.line_length;
+	end =3D (off + len - 1) / info->fix.line_length;
=20
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	par->fbtftops.mkdirty(info, start, end - start + 1);
 }
=20
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 =
width, u32 height)
--=20
2.47.3

