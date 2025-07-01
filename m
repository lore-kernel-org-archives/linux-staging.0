Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5244D25B31E
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362871; cv=none; b=a9e//uMDdez2W6wIBXt6aKn5Ni4BcoB59X2K9cUQ/nE3ZluJ5C00IWdp58lfombmaPXaK9BbrP/PhMH0+andRX91oHM6geyBU8fS60FmUWi/+I7afdVFxVhYqgyTVZQnBuE703KDl+y2LcniAtmkjYXZxcXT4G8yphq5tXVmtYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362871; c=relaxed/simple;
	bh=5kQ5HbATbSWIj1JFpHo9PbQOlrrjpSHqiXePkD1/QwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmY5sVCLRz28Y0mmHMr6kawd0nQbWwJ34OqbXaXpKj7KGW0uk5xyYIWpwHFnHcxedNDeOB715Kb+FNY6YR5h3KiNItpP9JYq/cA7RmDBksxiAQjbM5Vc98x6NysB4UctPOFiPRB6/BB7lH+e09oMuzWwbBcKttpOdWasRIDgbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsQILaJy; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsQILaJy"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74931666cbcso5426709b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751362869; x=1751967669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6VPondI9s6Ps40JI4paXgB0FQE9DZBVRKYHGloiqBo=;
        b=XsQILaJyNlfxJ6PkQgxwXd27q5kiEONPnceV32CMq8EQUxHnPN5pc/Zfobv3qZI09w
         IgRQij/0CujDwCKRTYDYYy27cc9b00VzAy8+EYAs9KQkJVVlzdrxr0NOebOenC9QKdDD
         htE5RvGkiiIgVkPOjEHzS/FUAVxIcXafEwbpB+2KtYVuAH4wdId4s0KkH+QwV1QQdozE
         Aar79aOzZRVewexzl5lKd/+k+hmkQW2f4pN+NSMysdT6RuSEv/Sr9ZiCeY6qtUFj9geL
         z/i1SFm5zvmpZ9t8LSGo9U0DJDnfib4oldjkYYFbo33h18+fGHO78GTlveW/mF+Wo4o1
         RCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751362869; x=1751967669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6VPondI9s6Ps40JI4paXgB0FQE9DZBVRKYHGloiqBo=;
        b=B/A4XIbVsqo+hFtcxbYRk2ZvHtwe/SSZI6n1DB7SFpavr5v1AEwVrUMCm9hJbljF17
         nj6EjGqpmPCzCNQu5w75NNBqC4MQd2Q8/AugwoC+Y4TSzy4jJBWOTvkOJvSA/Uy9c6/k
         EHKCKVz5O8s2j6Ipwz5GFLVpttT5zey43yFOCfGBkTZBDC1b8m90cApkLuk5asN+5L5+
         MXjlXAYLfA522kbTMHJACK0mDD6xjFw9nBpj8xRpddf1gwM/EgwyAnhnv9JfAbh9u8K5
         Nqj7nOCC8RVBLRzLR96+tw1uw5pUafwJv3YK1lYwXWUIjdOk8Kcx3tljh13cuMBnLl8w
         gDCw==
X-Forwarded-Encrypted: i=1; AJvYcCVyVclQWs1qFXdhIrdgl/XFLCjaTUzQi45iwi5U8KWeLjJHvyR1528IRZGBR+Rg0opgAQoER0OG9nxNmpe9@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk/VQoDWG1xKY9jj2SwzssJbmYa2AoNYTloQxN1h4pNe9rANDN
	0KhyJv4Mcw9/uzLyLWQUa/j3cbP0LdlU+3CLXAwm5OLoEAOP8ACrqdEW
X-Gm-Gg: ASbGnctQ7QZFZfs9u6kdoj330xCWyFTvJxQkJsw8s8B6GWtc0/Gy4l7leBAsUSG50PO
	oBB/5CwaAPbjwhCGoi8wznmvDmsVLEOxylib2Q9ZX15BZ+Dv5iYAFzdJcwR8RuMPZrNwdHTaqMl
	vyebSjLj8DwTW9aeHycZns2emzTzUX6+Y/Tleg28FW+X13hU2UyP5MW9ECqgBKFW47fp1YbCGyP
	nUvxjo3xgeOMYPqmLEtpXtMLWOsXH19VRaGD4y+p/aCyH17QM7kdyObRLCNCt9AZ7A6FczjFJOw
	Mo94mxshCXE1cTnHGzzRKWoOjfjc0hLgx9pKSi/7AX2Wd+y0hRCSrbetpgw8bdTQQ/0YAXsXB4I
	/JQ==
X-Google-Smtp-Source: AGHT+IGCUJ6tlUrEWS8XsccIwNxw4AUXaAE5LiMgz6vheF+DRB+JBGiWDglKUzh32UvkY9tpeCODvQ==
X-Received: by 2002:a05:6a00:1302:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-74af6f40a01mr24461769b3a.12.1751362869457;
        Tue, 01 Jul 2025 02:41:09 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-74af57e7279sm10945766b3a.150.2025.07.01.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:41:08 -0700 (PDT)
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
Subject: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"
Date: Tue,  1 Jul 2025 15:10:22 +0530
Message-ID: <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751361715.git.abdun.nihaal@gmail.com>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
leak in fbtft_framebuffer_alloc()").

An updated patch has been added as commit 505bffe21233 ("staging:
fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
and so reverting the old patch.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
Newly added in v4.

 drivers/staging/fbtft/fbtft-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index d920164e7710..8538b6bab6a5 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -695,7 +695,6 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 cleanup_deferred:
 	fb_deferred_io_cleanup(info);
 release_framebuf:
-	fb_deferred_io_cleanup(info);
 	framebuffer_release(info);
 
 alloc_fail:
-- 
2.43.0

