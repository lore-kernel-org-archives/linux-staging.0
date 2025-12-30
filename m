Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0137D2E6CC7
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 05:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767072547; cv=none; b=fekPIePy7NkrFkzOj8C7sli6Y/Nrw9Om4+8FoJMgWGUHZMdkylaz1hFLxLyq4/jSehcKcta4sx8Ty5xqQRSUt73lCIoeua/zJ/9S6Jnaqd6R7dnNBMy66/f+peUiSLVhQKYKdA2c288alHlU05Qizp1bZQdIConmQSMaA8nmp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767072547; c=relaxed/simple;
	bh=86Kzw/hKU0nrIm8xZ8jpwyS+2DiCcDwmWTX+qvqHhFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdvEwtC6mJshEL37zRscPlmyGg1ONASjkLOAb8eZF6BJvcH/0kil/P4uSStJnbl+Xf+zAI9gexvMURSL3n1FywWC8G6PbtrxKHOTjX02Td70BzO8XvNxWAaJQAvI5nZyZ+mfnE55PxwZsA/EvydV6LwLsREcw5otfapwaSbIX3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN1jQzoO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN1jQzoO"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d0788adaso86682805ad.3
        for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 21:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767072545; x=1767677345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
        b=ZN1jQzoO2IB/SxF9749Qy8+pXEb4pmOkoFAzS7FXFKob8LhjUlfJUUi215catacCU0
         WKUp9coLDQGpPHjzGNYf+HPLkNRyoRqePiuNUpsmQgkbbMSUzaJR7mUBZ7NNHqS9vED7
         W+NlYQGD38M0IIOcl050ocDCWN8PCY87e4+iVPbEjzIfLlZLTqUp0dGvgFROKbsFFl3f
         uyCxuBsBlflg70IMcNMHmmRMUWcd+uVnnCJ1YTwRbLkIPkB9y6nNGegNGzJOWxQ0vSGg
         o4KfobGc/S8ODsXoUKT02U6zcSYNTEX81omHLIu+kA1xciKMa/mEF00ifaM78cEY1nWT
         Es6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767072545; x=1767677345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
        b=NiVR8gnfXZ2VLCrmV6jFC1sSEgQxmOHFvg1Gyf46vau+pcrzc1f4u8UE+UpNRd7YDm
         kQfJujSSpLli1YdutdADSkdDiCf7cr8jPJMEpnl9KMLkQz/o8wxsoryPM2oHdPbQ5d8y
         33lF3zdQ6TqBW2pViyKk/Zc6gjYsb3q58N1pHhTWPYv31jNYQHFiELXemRxdMjLnbuc+
         f+yBx0TKodFdG/MxPKYEzpmnBTE5NLdE8UbMWLPHL8fJmmNrI5JYX/8O46lenEYCqK0e
         UwxHlIRnEKW+626b4cMqBw3Z2hRy1R4pUIQbCV6scfWF7yrlxnGbfiPGG6f9dU/P/Rol
         URrg==
X-Forwarded-Encrypted: i=1; AJvYcCUugTue13YsRb/2sOz5BB/KNxP4tMnIzjAtIy6fwSyhrwc/aYpnuySwieLUVtB8ui1yfAf4mLGkJbU6k7o8@lists.linux.dev
X-Gm-Message-State: AOJu0YxdG00upe8zKsX1JXDzmDYAOvLRFAX621s4NoSwZ/Z//QaBWhol
	dTGFHyhNMdPb4KKgI8RICKTfyoHkEWgidw2UEGENB9kFbDKz5IoeQG9h
X-Gm-Gg: AY/fxX6U1z2IB2j0ILI+h5p2woiFjPV3WnauuDN6NIC5AlDYcllh+3tUBFuqxF12vkL
	mJ1QkQmtpzDb3IbwKvD+bIb6v+6NcfilQA9BLvguZ4aZEct2U094f4vkkXKGtiowFGN32yZFyNU
	elJE6/iYuM+q2EkeviGjy14kNGl9TREGJoWgwy1UijDsFyIvNgxDaGhZglzF55YlF6oRIPbDxcw
	wpMo8VsrvE91xZDphlrkwtLnxZkIlukgGBhihlSWEreCwvABGIK2EELcv0Vj+vflIbNl/QSpWSj
	NmS/zQr+KPKKp3WsU6XZAr7Omflhu/VsfORg+eg3QUiWzis4XGuTpZYY4c1aDds5DDiInA3+AK3
	S0vFt+OopENVR6mK8G+56xwWDP/M8aDMngHjtU99xZ381zbpBTKkBkgkcIy3m+PxE3yejgG71T4
	CnmMMlQUAAzw60EjLDjqZcQoKQTv2sPSLyM2vyibZqf4ra7wuMqtTE
X-Google-Smtp-Source: AGHT+IEF20IOQ3ACEEG5Q9roz15yiegJkgEV49gziCCB4yVsuyx2zyUl9Tnp5LPbFSW7p23DGv+NWQ==
X-Received: by 2002:a17:902:d2c4:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a2f1f789ffmr344796915ad.0.1767072545159;
        Mon, 29 Dec 2025 21:29:05 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 21:29:04 -0800 (PST)
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
Subject: [PATCH v3 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs support
Date: Mon, 29 Dec 2025 21:28:19 -0800
Message-ID: <20251230052827.4676-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
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

