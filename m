Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37231E51D
	for <linux-staging@lists.linux.dev>; Sun, 29 Jun 2025 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208079; cv=none; b=oXgX4MIInM9FCkbUEBThFVxohS6wlHwR2gsWxxyCZPtIm1lsFoOELYxO1kPZPHU8cfMV6A7bPk10dhRU0HZfpqB1GK1xEVBg5qM+Y8tkRMdSkgIQ1wtXrJifaufwhXfPyw4lsF+2xZJXNKHag2homLEycvh3wPAZubZ9GZj7KpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208079; c=relaxed/simple;
	bh=HOnI86sZjsx6xFz6HUkJ6Y/S0K2+grzeifCdZ0x8xRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbROaxv9QJbjbmSgLWRhcMB9dnP1ChWNJnj6KSid6+DH/eNdvwmSELlpEJjRhu1rvmdYT+ULFM4u/LKpU9LAwx8iCFY6nszfWjFWdr1mReaZKTq37vvpvBOt6wfH4vYeoG2/TsdMI5SJYHibAZNJvr2MjmsqHmc6I+wMFYqWYDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbL+cLpp; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbL+cLpp"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748f54dfa5fso3254379b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 29 Jun 2025 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751208077; x=1751812877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZlX6oH8dce3MqKqn1FEplwlovX0z97sZ7lCxjfOmHQ=;
        b=jbL+cLpp/FX+cFHvAeDtL1InjV01riX4aJw8Yzb0c2H5EZ5SENzW7JTC/NVcffR6zm
         d4gSKQuGBgOT4JCf2qCukO+E7uooh2+J0X5KrWTfblysH11OLI+DW6Pa5IvkFJoQLUgb
         QruqkYEZjmYpMjy44qz5Gpw10I/mxrwHFbIVLwKcwXqVRza2YNh4wmdPo8irVkt72MX6
         jriHLxJeVmiDMM0JGw9ULHaojZSgg6ulZl6CxdAh9ZItsOMdH7RuEvfO2mkLIstAB7mB
         wrlBNTtYds/pjZiv4gOhMAzyWeCQJUBB2tsGLg/VEiBA/BBCuufJ1q74vzrO0EnjhN1m
         d6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751208077; x=1751812877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZlX6oH8dce3MqKqn1FEplwlovX0z97sZ7lCxjfOmHQ=;
        b=j+cjQWtPm4xa9QdNOk5EvafoRqs8SLybTkjAdZPt7/Sg8IMKzJSKgrKtp0t7I6lXdC
         TTOzxGE3xLkz2RNB9W37qVweHquABfp1pyjbdW7z3n+D8/OoxkXz+0/21c/PvMwyyAyH
         h9qP1A4iu/pIIZvGo/k1Ecp1/pImlt/1p66NFFSwbRnIQ29EBZVZCMUS8wySAVnUF9+M
         6onvDRKUcebcyHMlH6nfGc9rgaUx2D8BjSeGwN0Sw+CaaLKTHIRQwxxLbwpRd+TeJBcF
         n7QqHiHrXcmieSMQ2B0r6nSNTXg6M9ZjpItvQNAn6WhdPlH1s7LpLWWMeJUE/Nlb/M9W
         xClw==
X-Forwarded-Encrypted: i=1; AJvYcCWnZFn6RLE+hV+XnjhrQwXCEgQIIN4OlovGQnDekxWZlfrpqg/1bBPBsrKMrIR/iCJECNNd+MUv+qK+jpba@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1DXbZANQNZrMYYdcuNC4qkQKrLfId4TsPUhHfE66Lz9NQU7lX
	j5tRX4pCa3fhF/1O2+wLAV4tzGiSbb+Cq/+0kmTDQU9epnt8btSzITGc
X-Gm-Gg: ASbGncuvO8O+9bE05jMEqaiZ6eXPdUMBQixz/qQ5uhrroREuyZyLZEBHUzWLNV7k1H9
	6JcA3CF9ljVv0bcPTltcvpy+TQcQV83wXPz9GLFeoC9KQODSgHnu5+/W38/LGvh3qTvDizG/ST4
	c5oRgkwaSY1aSyfng1+CudvthDLUZSxA2KsxGphMQfaBiwe5w/CO7TLlVTFxTQws7oS9P/gPsJJ
	+20sW6zrpRjjkpK07sODvxBJ4AK1XT5ahVkmc993hwFxOXBO3Tsv8laQbcqftK5BJJIQVwT2UvV
	bfLVR3BIa0tGuBtukZ4eheN1sj5sx/aYX07ISDl79RGf0b8YsqB21yivs28NTZYZEhwTUuGLjSy
	Gso7442H1Lr7c
X-Google-Smtp-Source: AGHT+IEdbEmJ+1xilLUoHHztIEeRjjOpIEv3s8aocZ+HWOglf6JfXuWncmoSPjHPoauzqRoD+CjaUA==
X-Received: by 2002:a05:6a00:c90:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-74af6fde138mr16238310b3a.23.1751208077090;
        Sun, 29 Jun 2025 07:41:17 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-74af55c7e89sm7039127b3a.109.2025.06.29.07.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:41:16 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de,
	riyandhiman14@gmail.com,
	willy@infradead.org,
	notro@tronnes.org,
	thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
Date: Sun, 29 Jun 2025 20:10:10 +0530
Message-ID: <fd2be49cfef72799f17a96d01a4c6b92770cda7d.1751207100.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751207100.git.abdun.nihaal@gmail.com>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref
struct"), fb_deferred_io_init() allocates memory for info->pagerefs as
well as return an error code on failure. However the error code is
ignored here and the memory allocated could leak because of not calling
fb_deferred_io_cleanup() on the error path.

Fix them by adding the cleanup function on the error path, and handling
the error code returned by fb_deferred_io_init().

Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
v2->v3: No change
v1->v2:
- Handle the error code returned by fb_deferred_io_init correctly
- Update Fixes tag to point to the commit that introduced the memory
  allocation which leads to the leak.

 drivers/staging/fbtft/fbtft-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a60..8538b6bab6a5 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -612,7 +612,8 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->fix.line_length =    width * bpp / 8;
 	info->fix.accel =          FB_ACCEL_NONE;
 	info->fix.smem_len =       vmem_size;
-	fb_deferred_io_init(info);
+	if (fb_deferred_io_init(info))
+		goto release_framebuf;
 
 	info->var.rotate =         pdata->rotate;
 	info->var.xres =           width;
@@ -652,7 +653,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (par->gamma.curves && gamma) {
 		if (fbtft_gamma_parse_str(par, par->gamma.curves, gamma,
 					  strlen(gamma)))
-			goto release_framebuf;
+			goto cleanup_deferred;
 	}
 
 	/* Transmit buffer */
@@ -669,7 +670,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (txbuflen > 0) {
 		txbuf = devm_kzalloc(par->info->device, txbuflen, GFP_KERNEL);
 		if (!txbuf)
-			goto release_framebuf;
+			goto cleanup_deferred;
 		par->txbuf.buf = txbuf;
 		par->txbuf.len = txbuflen;
 	}
@@ -691,6 +692,8 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 
 	return info;
 
+cleanup_deferred:
+	fb_deferred_io_cleanup(info);
 release_framebuf:
 	framebuffer_release(info);
 
-- 
2.43.0

