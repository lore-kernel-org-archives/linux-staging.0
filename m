Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B7D25F7BF
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 04:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760997; cv=none; b=mv7EpaR1QlfpPgG8EVZRI6jLs3Xc4DlUMkXcQCRwcwrppUxv0qZ/+tkh/SEwelrUJUig3ozq8e1lLe8DJk2BW8MCPzSUeV7R7+rQZ1fT8gjme2SFLrtzJtOHhqcW62ELj1kCiNOnGNd5p7UZpT7x1hPdAtqzoMGF1ogU1Wi/PJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760997; c=relaxed/simple;
	bh=MkQ4XoQfjzxb5Bd22BM0zqSZxNNCZ/iSlC3xOfhPAgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuI4/uBRXxuN9kDFMHV2Vom/Bw+6a+pms2jdZNWk1KtYVfXb9A2FFzisKSvDmWS3ZWO7FhY6itPlniTK5qmUxtPt8O28jkQm/Fv5oUJNSmpKsS5wUYXrksFSv8I5Ze1XQ2UTt057dzhGcXtUBwPfcbK+6CqzyneAv3f6nxJtsh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqAGN652; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqAGN652"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0a33d0585so12955255ad.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Jan 2026 20:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760995; x=1768365795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thb/F5AmFMs9ckn4s6Vf7Io+bFyVo1RiT6S4i8FpYAM=;
        b=jqAGN652dutjLZQp3TdtFRWwAMEIZ+2QVWpJytS0av6fmWpSR5zYdy2kOI6/iqvh7o
         PcQjWjNSBeK+vhc5MzisHyeNOHA0gDAZFRdvwG6d1UmLznmRqZ/HSpWdi4YFLamQ7o5A
         pdvKDDCR7yUXVeAzL2C7Cvj0STKF/ELV46ONvHwt3ywWtbAPQwYNjwn9YLrq6NNxJTOZ
         NuyAP5+EOjZhIo5TGX0sn8WGcvqeWDH36uQY968Y9yb0nbAbP9orMmv5nSu8WBLs0vqJ
         Ry+X5Ra1slyD9fOPZIN+bnoFLczBrZEaXWOEjn11emcYMYUnzJCYmcZIYU3PvJoNdpLH
         pTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760995; x=1768365795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thb/F5AmFMs9ckn4s6Vf7Io+bFyVo1RiT6S4i8FpYAM=;
        b=Y8Ob+OZQXXpz7EKrHICD8sk7rLHGIH5P1ALRUc/J+HC28au1kd82OxKKD6zCPwgniT
         n+WVZ6wVQQkEnFExEMGbwE9MLxNwvKgUQpSjWsXEw5krHEneq0oU/4Nk8a/LsU7JPMnQ
         swkXxsp/xsJ41YCSSGvvdEljUrWemzSm2b1wuVX+8K1UXHuQTip8kiB+xJDkdsaA6oAL
         kV44BZNC8gYsF0H6HfKUDTCxvrjAzqh6qTj9JwGhR122kOYF3IyqtAQAQK0FK2aRs/Ah
         L4x9XKncAPLoFsoVB8AeAVOfJPgANTRxFGOgdg+W57IjVVGWFyRV7A/Ww/H8qsuKgIj3
         HVfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC1rRfD+bi+Ok7phpvGAbdy15lpSySYw3zy6nrYIkwSnN7DALfwAH8RO+PcB2UQ19whGEtN5s8oXNolsFX@lists.linux.dev
X-Gm-Message-State: AOJu0Ywduflh6l7AX9Gngb6R0nck6+z6MTTgnw3J6PWkfEXQbhlEDJDH
	cAx0MdAS3dDQU5ymRR+RjO1yjIjQkVZrYXj1cB4JyOFW5BLVfVQ5bSJI
X-Gm-Gg: AY/fxX60B9uInwVGllv/PlED2j99TtLyESvKrD8CCIye9ZhvLCFrv4byOcGLY26Q2K7
	efOT0suajIagkyBe18aiue7CdCT+4BWfcj7387379hyiHEteZArjR26kphmiMEBQXnducMbytuJ
	CTkyogkfb+M475CrgGtj91+oYk1NpYgbI4OJmoqEF7dkYiyM1T/id8l8QJlfEuvP5lb/ejhhVV2
	6pc3/DnJYUHIqF2oDf0e3dhNBgv9Fzmsh59j3+6A11eOrv5h5sqgVix1KZxEc2/sEKIQUKRhhd9
	Aux47P6qlLmtcmfL3GZYbLk8Uc4Fjx8TxkswMenl9Bcs8MoUfRl8yYkXbtKZKutyBwFzGzSaZB4
	mB/msL9jQPVnhS8jXlVrw5t17Wm4nLSb9dEWi5RHQD+zBM9sC4bUKKtBCnC0ZEyn5okyOuxCZSi
	e3hAeESATS29+/KJ87089mCFwyv50WTr8an4ATA8DspCc=
X-Google-Smtp-Source: AGHT+IHEaO2WdOiPYRPaVMlPLug2wHz5JWNqR4SeeEsDG6lB5tEtYaBOclypPoot3PX+4+bsXooZ1w==
X-Received: by 2002:a17:902:ce92:b0:2a0:d63c:784d with SMTP id d9443c01a7336-2a3ee4a7dccmr11794585ad.40.1767760995098;
        Tue, 06 Jan 2026 20:43:15 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:14 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v4 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs support
Date: Tue,  6 Jan 2026 20:42:54 -0800
Message-ID: <20260107044258.528624-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107044258.528624-1-chintanlike@gmail.com>
References: <20260107044258.528624-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dev_of_fbinfo() to return the framebuffer struct device when
CONFIG_FB_DEVICE is enabled, or NULL otherwise.

This allows fbdev drivers to use sysfs interfaces via runtime checks
instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
remaining fully buildable.

Suggested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 include/linux/fb.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05cc251035da..dad3fb61a06a 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -628,6 +628,15 @@ static inline void unlock_fb_info(struct fb_info *info)
 	mutex_unlock(&info->lock);
 }
 
+static inline struct device *dev_of_fbinfo(const struct fb_info *info)
+{
+#ifdef CONFIG_FB_DEVICE
+	return info->dev;
+#else
+	return NULL;
+#endif
+}
+
 static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
 					   u8 *src, u32 s_pitch, u32 height)
 {
-- 
2.43.0

