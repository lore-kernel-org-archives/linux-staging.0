Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FBF2D4B77
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123024; cv=none; b=ql1NC7lPEjn2jY9SrvBPNTVrxVDJrHDv7PPvqDGrbgBVt77ZtMRXAr0vPmpoArpvuDHYBO0/pr4Zey/lIDUy1IQAJTWoJjECh9PLoPXHwQ02pIJAsWEoqazoOdK14/05CXsxMTvIy9JBltUkPMSHwlDyya/ASOi6nkBZ5GhfGEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123024; c=relaxed/simple;
	bh=86Kzw/hKU0nrIm8xZ8jpwyS+2DiCcDwmWTX+qvqHhFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dryFr1agq39+mkv9Jm4ChdTYMrKjINYS1G717jHGw6+FtOekpLo556wrlO3IDYBA9a7kSgyskd5jDV5R/pK/7WyO9VQLxsgcVGlr1Wz7Ye2zgM0HMtWfKuCgDmw1Gw/+VmNUOrKefo6s0WM+eEAkZc75FzO3GvvUD4+elvwmVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0iY5j78; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0iY5j78"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29f2676bb21so17280795ad.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 21:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123022; x=1766727822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
        b=T0iY5j78rTjW9Wyrp+pdXbAMuk1Bt92F5dfXaDkmIMOo33UMjhK6V5H+KMNDyVwUa+
         zvIDrnNAlr4HY6KVUkoNU4MEHNSd/ezYoCJK8XotKFYzQVApS/8dNKR/8Fexxpm6NWwp
         lkPlptmiP9ECw1aHw8QFPG6vt3IeiFuN3LZefGClKK/UjsrNogp1uAtp3PSd4RRk5teQ
         ESefRweuttK9WDMCSGhM3TkSUWrvW75uACnDk5PhK3oqBrH9VNaV/Z5Igpk+YzqoAnfv
         LVBSWav2PcwTgoh6VMIeZtVQVLSv0A9cDtFHOqmzpcysGhg8wlE0J1yWsk+ELmzl8vBY
         qKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123022; x=1766727822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
        b=AMSO/avsF1s+KFpnd6bqVcHZ70W/9quZzrVdc0FdJdHG/AODduJLeP1szraCFFmgst
         i3FuEfqOkqksYZYo75KU9E2sbLDN+h/j+gTgWnUgwAFe7X3NycNjWa6eBAWoAwPRB6lA
         e5dAkFiT6SExsqfFxPp9ANo0DwfC14vHNkynPgrRSE9NiXP5GY/NGkhBAu2HCpE9GLO+
         7uf6Geinr7YQzu7inIMbjkmf41QD+Vu2koy8G0rOkSuFD6gospwPW927XNRDNDrK6eEe
         KZcCKprwpBRftpBKoK5tKs/2IsloxUAlwtZXA19RuAw7n+zsDAOwmI3J3Dz5S0MG/c/b
         1h0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBwlX7A2P60awDUCzoZ/3o6F+O5pbufZmplLWD3LkDVIP6FbvD6/CKck55mwTrITXXrKezp2z9HO24ZWy/@lists.linux.dev
X-Gm-Message-State: AOJu0YxOSSa65uF4iLqeD2I0aePd1w7VV9kvHI1NDKurnphu+e3U1Ysg
	pbTp6OgUcu5oMxWhIf8JO3MZKnOPGL347hC9Hq6TSyqau7qJmOVmySMS
X-Gm-Gg: AY/fxX4Ioqo81VgbDBLuelBI7VDsohI9WCqBJ0+M9NnbH1+gkPRXsj7mKAJvPjQfAt/
	OyuQeObgycgwJS6Tza7prtMMADYqPFRDe7mChYd1oRVxN+ZtHleAuRr1TPxpmpb8STP9bIExX+e
	Y4I2CbQGLBwl3/iqXXxKbs3PzuiyU4VruAdEDshbNbn87oRK0Sd+p3vbydAe57RyCR64k9lepId
	twc0kFFLCAhzNeuc7iQVpFN4z+2OqrPoDucLrCCkwL55tZqRu6DZe8ctxJNh3Q5LJPFYbTmPYLn
	d017LXrTP/wH9yDnRmZZdUr4gFXVI/E7ySOSg1FbLbMY/oj5ArmfpGYP7Gt83P+qkyQSbJ8ymFY
	dWKZyQSdIr71TufDDlyL9MsHtDph6zgvjYpGGXoDq8+cNlDc77uwdM6vG09GqTN4/AUVXtuO7ed
	g0Re6hyeV0lrvddGzNpPoMrw3AEkQVOjuKeGA6V/DNQcY=
X-Google-Smtp-Source: AGHT+IGRBz3LEiHHY3N36Lf2Jbdyl+OtCRRLAqx/kmUDLPH9d4n3KvJgE1piBAVSSdqL472NtK6Xtg==
X-Received: by 2002:a17:902:f78d:b0:2a0:c35c:572e with SMTP id d9443c01a7336-2a2f2836480mr16751125ad.30.1766123021882;
        Thu, 18 Dec 2025 21:43:41 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:43:41 -0800 (PST)
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
Subject: [PATCH v2 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs support
Date: Thu, 18 Dec 2025 21:43:16 -0800
Message-ID: <20251219054320.447281-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219054320.447281-1-chintanlike@gmail.com>
References: <20251219054320.447281-1-chintanlike@gmail.com>
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

