Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C95832143D
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 06:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766039206; cv=none; b=GlLhIsAMuHfboiQflcsytj5i1Lv3uuIx4g3Xr8fWOf/LIKYDNuV/HdQayJBp9T2uwIcK9wKzFgB2RkwGX9Oe/DxDNf5ZvAZmCJvci1oDjTbYN4MVoYCy51r2llGwkqeIUCF0sz04y963VypCK6EpFIh2NhQ0VH4b8elT9kd1aDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766039206; c=relaxed/simple;
	bh=UlMEygPgZYt1TC2YAh0pYgTJVUX3LvnVxttd0WMbq5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJaVxliuEZJMgj8WVYn/IHZh1m0qricpwnZwhHKAzDiSb8DLySAyOqmxKiN5XY+bO0HFIcZxuViJpw6FdDRniWJ/Y5WzyH2zFsszR2eNrxJt/vQWgtK62FFwSHnvJC0epdhaZnY4ATvvSdLBDTY6nwRKCJfvL4PVMycJ0KO/XK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtfmOFJb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtfmOFJb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0c09bb78cso2050645ad.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 22:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766039203; x=1766644003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4VUBVbWwpNIpkjB1F2W0ja2iH35Nmps3FuQdZl02MI=;
        b=dtfmOFJb0ucc6RYZT8MRkMDE7Jcr+oq+47kVg0BTc3SV9kSavaXAPupK9MKaaaFgZk
         6S/jfgtvu6n0Om5va3J+dDXztqgIFwx+4o+4PkKDl3Le6c14U4GMMoynTyfUTzfifqsB
         jEA6CACiiCps0HV3LJdIyVRM4YPByJjWhkvaZceJSjzYmB7RmzGXcBR9Hg09C+e2ILun
         7tvHt3CAnqOxCKDdWYUYDLaQ+u9BnD3ZUpxIPgKXiuO44yq2Om9mVsa7YZU414+qsQ3R
         riBVTawuxNk5j7+u5tWVqNLCto7/AO3u9+WCH4Y0DDdgp9mZfNcKtp906gCuyWnRBfBF
         u+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766039203; x=1766644003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4VUBVbWwpNIpkjB1F2W0ja2iH35Nmps3FuQdZl02MI=;
        b=C/KOtOE+CYrSFJrcv1rR4JKxFF2Mk16OrRSHFTxtXxDS7NxBi0/J1g+Mtdd1Uayx5j
         IlIDF8vI3zUrBrqjiYoox4ZlQTQRkka8n/4LCKoUYs+9fStW4/fcEN/ZI6Ykhf2Ye8/q
         vlIwZmoo32UDeB5wa6i8iCP6trF0uEjvoSLkulBgVn1X6wvicRgEpXFGmzrr+k9E6dTL
         nuhIwGg7IY6KKbKsm0MR3ZXWzsm/7Wt9SYpmnz4n2Z+pNhB+Tsvq/gMs3J9WH+kfZk7o
         PBy5jAJQ6WrlElQTRAUP9V4el9nFjF3Nr5QBSPkic3xYo0Pu4Qd0vV7Wc6plM+Dipj8x
         R16A==
X-Forwarded-Encrypted: i=1; AJvYcCXrN4yr5wFF3NYzpHyoPJdqkGy83ogaZETg5zOBtcfHRHozQlF/16Dm1BQ82uxMfH8wF1BkO5gmtLMk8gJ9@lists.linux.dev
X-Gm-Message-State: AOJu0YwgKaemwyzLhyRaelzoEB34pLSWkbfJ9B7gjcdmNYCFnsuFJ7HK
	FB6gh3iJY2nE9+RaVTew7rDGVz/k0lpNst+YAhhNygDZZJh8qsRCjdod
X-Gm-Gg: AY/fxX59fYtGCSIlVZ5t+T8zggWdcmyXsGMttS0idXBzaJKP4s0gWieahDLLehiYEJv
	fJZgXnwpPbb5bw+dS6ZwYbQHPQdgVkuD7oW1NRfEaLIt8JQio7E2PckQ6wJnWGLG9B98Zt5zEYf
	NIH59V7/0JWvxFpGIcVfKri+lnrO2l7Go8jg24TA1PopprufYzm76wWifuaSe2f5A8M5+v7lWdH
	YC/hOSD3h96NN6EIjPXY/Akq961/x0eEDyf70QVtVRFFYWOK0HoMJxdANeDR5M0l9bMxJCdPB1y
	AeVJoi5+jNIcdQNCe36mV7VXvz/BtppnAS6xtGLrstaemEC0mi5IGd8P3CKATSPS7eQIJLM57tO
	lde/03CzVxD5F1ixWOADB4ZSSa3fXsGT7SGdU4RloQm4AmJMQTzj225yBJgBZiExICL2TGYLFIG
	SRNQT6SgOqIEQh1dJ0mf7U/tJp+wB29yAhytK6iuE=
X-Google-Smtp-Source: AGHT+IGx4R+PIVssXH4XccN262LJNTaBCUV1p76NtqjZyU02/zR3inToV5I3TKpqo+j5lyVmwcEt6g==
X-Received: by 2002:a17:903:1c3:b0:262:f975:fcba with SMTP id d9443c01a7336-2a2caac6fa4mr17362855ad.9.1766039203082;
        Wed, 17 Dec 2025 22:26:43 -0800 (PST)
Received: from SIQOL-WIN-8.localdomain ([49.36.67.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d193ce6esm12997115ad.95.2025.12.17.22.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 22:26:42 -0800 (PST)
From: Arjun Changla <arjunchangla7@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix code indentation
Date: Thu, 18 Dec 2025 06:26:26 +0000
Message-ID: <20251218062627.8340-1-arjunchangla7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "code indent should use tabs where possible"
by replacing spaces with tabs for proper indentation.

Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
---
 .../pci/isp/kernels/output/output_1.0/ia_css_output.host.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c471..dac0736f55a6 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -74,7 +74,7 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 }
 
 int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
-- 
2.43.0

