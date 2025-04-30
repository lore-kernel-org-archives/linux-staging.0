Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CD71DEFFC
	for <linux-staging@lists.linux.dev>; Wed, 30 Apr 2025 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992627; cv=none; b=bo7z/CW1FcqvKmme1CjtuRSE4+a3vvnkBbiaOxo9uTyv4zB8oOpOtGBUP5Q/4Qamyfau0GScQyC3+5JIqIc0WWba/3c2Hjtf58g79nttLfcoKL3NscPMVMz1pW+9hq1hXpABCPWeieyJ9sFZLwGEuWzNgWqiA4VfxZ9DmDiccRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992627; c=relaxed/simple;
	bh=Ok0vLnMs2cPHb7AazlsNmTPiFSkZuejxGCip6igXVvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VVXqiqIgDEh2RixfuSeZJqa2VoMWAEm26Uz39vUd2nsyry3ElaZLcZdsT0iKnbvWC6ymJeTV+wh8Syt76Tqgmlsf6mOGwry2w/XE5HXUpzWLwGhuQGrizJFZj3aocSa7JuUs8bKJYlFFVyFtIBPzxSTfRSc4NgGX12ZS3Sw7jMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sn2UCb8P; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sn2UCb8P"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-227e29b6c55so12690385ad.1
        for <linux-staging@lists.linux.dev>; Tue, 29 Apr 2025 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745992625; x=1746597425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg19nM6sxGDDVqPg3PFyXzXPfM/4I/zlx4EFgMlc6d8=;
        b=Sn2UCb8PUcZNBWjuUNGCH2orXlu2ET6lCaF8VqIy4nbVfoqmhVdxHqUoJCQl2xTrKB
         K8vH3k2JbtcN5O/LmcwtXCRl1UtUTt1KtKb23sBVnpgGFB5MlYC7GlMPNkBorhdJi4b5
         Gfh7kHnMbA3dNJ+bThcPhmPX3zXJAdDBncc+DnyZSOPz2MFb8Cj9O7Voih7zNFiHHAWp
         aCFARcuMU0XSNSIF7P/Db5RRFeI+D5vdajj61DMDPhv6rEAPtsI5eivh2OAJEF5XRma7
         GGkUtdumR7A86lzmpL+SIUuRUvpoBJFwedOsZBbZ5EUf/Qlk5v5m6DRSxB7SuSZRCfAD
         thBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992625; x=1746597425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eg19nM6sxGDDVqPg3PFyXzXPfM/4I/zlx4EFgMlc6d8=;
        b=SlbdexUPx5Sa+J9VzXpeiaS2f1iJYTzXem1cKbQzDONlTz6yGLfE0RDvrCLJYRLDEh
         fjIHLqiYXBiomwsm8bes6PsNtnlmEkbnv0jKAjvE/BfpfIBsBmS/NcGFb+p9owvfO9jX
         +dTK+xvIdxYHkEdNSL0/K9jMk7js12jKWyq3rKZdfP6C7xUVB4Z3t8kgzI+YRfgfwQ18
         W5PWONPCCzPsf+u4VYqCb/cCh4pGQZ/GQQDobSlg7RfKzVx+mSsqfdHsebOHy3m1kkvY
         +TbJgHHX0VCoOaprCLqZ2kYHKTJ3JkHhbPAr2ws8YT0Cue/Gl0pdeo+Jov+Wc6WyGDEM
         t8kw==
X-Forwarded-Encrypted: i=1; AJvYcCWk/82wHtjGY+C3Uk5X04BvPY++q26edRdFSCEyXABsc47QRuEYZ9lBUlmYM/9l+pWlx1V6RgPi8qnsSS4w@lists.linux.dev
X-Gm-Message-State: AOJu0YxD1/z1XN36bcFciz2smcPpJx5wP+zIpXB/Vr5jEswqVesFUILa
	POgveNr6sdHrsieTszk+aRc25Ie4OKxxYUxCLnIqBxelc92s5ilg
X-Gm-Gg: ASbGncvQ0HGjoi5mNMdiuVzZLg6lZz0Vty9c8fhAzcgaF99XFROZNgf3P+SoKK6fOmr
	FhwZH2pF37BUevucRhH5IirHmrRV6YsVnt2g3FiiL4mo2orTO7H7OQKATL9vqo2ME0sQ/vnm80M
	1s34FkGi60ySbSA55MgF4cM1Mg9d90AWHqdofdQtzxVEiB4IMsSLFk8MET9v50eypIc8HXY/K2n
	8dmDVhcVJF8YcefFiMyxSu9fEkYJR6jvFJlIr9J3cF6PHYM9y6OucK3dBwSCLjxnJrINuof8Mds
	ePkvQbaAKjq8RcjhyoTVHZlMV/qogNioihA/2H0V9enagnPcBgkfrNV793qFoeGdShwr+uiTvYy
	HvdGLBzswpxOKRgRi+MwzF1kPy9rvSeURM5YnFUqN9hE4Ud9d8tq3bqI=
X-Google-Smtp-Source: AGHT+IHMwfMf6lRM9cj30ORQrvSHK1/wmWX/dBW3Kxu4UaCZHZmp0baJrqGCvprX+JZKltdzt6QDfQ==
X-Received: by 2002:a17:902:ce91:b0:224:1785:8044 with SMTP id d9443c01a7336-22df578aa9fmr7662845ad.4.1745992625083;
        Tue, 29 Apr 2025 22:57:05 -0700 (PDT)
Received: from kerneldev.localdomain (162-225-124-171.lightspeed.sntcca.sbcglobal.net. [162.225.124.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221a82sm113383895ad.257.2025.04.29.22.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:57:04 -0700 (PDT)
From: Eric Florin <ericflorin.kernel@gmail.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Florin <ericflorin.kernel@gmail.com>
Subject: [PATCH 2/5] staging: sm750fb: rename sm750_hw_cursor_setPos
Date: Tue, 29 Apr 2025 22:55:36 -0700
Message-Id: <bf20fba915d2f0139a55ada29fcdefb9fdcbc1d6.1745982772.git.ericflorin.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745982772.git.ericflorin.kernel@gmail.com>
References: <cover.1745982772.git.ericflorin.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename sm750_hw_cursor_setPos to sm750_hw_cursor_set_pos to conform with
kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <sm750_hw_cursor_setPos>

Signed-off-by: Eric Florin <ericflorin.kernel@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 2 +-
 drivers/staging/sm750fb/sm750_cursor.c | 2 +-
 drivers/staging/sm750fb/sm750_cursor.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 47c84331e3d9..8dd32aa6ac6e 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -125,7 +125,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 					fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
-		sm750_hw_cursor_setPos(cursor,
+		sm750_hw_cursor_set_pos(cursor,
 				       fbcursor->image.dx - info->var.xoffset,
 				       fbcursor->image.dy - info->var.yoffset);
 
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 3128ff3f4b70..a6fe241e7748 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -63,7 +63,7 @@ void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
 	cursor->h = h;
 }
 
-void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
+void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
 {
 	u32 reg;
 
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index edeed2ea4b04..d0ade8e366f4 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -6,7 +6,7 @@
 void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
-void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y);
+void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
 			     const u8 *data, const u8 *mask);
-- 
2.39.5

