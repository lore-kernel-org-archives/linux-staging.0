Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780B82FD1A4
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166863; cv=none; b=sqs4EQHtoGHX2bv71QQp+qLivm/XJuOCzfUP0gwrwlx5/DXtyGlScvs0rc+MwnfBpV2w7u8+93Y9lNymgRUsfq9z3TeNeB8isiHq6kt9eb4VIDrX2I/t10VesvRpOfUbHGZsEEXMINpqQxUfSCNzp4sVq9nNuu36zJFGGbN1nhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166863; c=relaxed/simple;
	bh=UMCSVacuCqCwvhsGPrhVtzf2WPxDWMp+oNTk/U1V7HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DlPyIk/UHzWakPRV0KhuuJVsCugFUffZLfGUi+N+hIFrimws8J8JvIv0F+dlFLpmf16XaEMHqggVg2cOWnVA6Odz+rlCnvNTqR3KAyup8DJQtNqrdnnP8gRTkOgh4hN5BoXdcUNNanFEYqtTb/sobwj6WNeCbvE6kh2ElXHdQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uu0nuyvy; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uu0nuyvy"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f7039a9fdso3240727e87.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166860; x=1757771660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WIdATCDvQMnbdC21C7QVK0YJMHWri/9rANxhXm72f4=;
        b=Uu0nuyvyC9Zz3TSMhGYTu8pVIJ5P8KevE+kxBz/XKM07JQYMXuE7J4XmZr+Vj633SL
         AztzRTM9XOsEW1fY9Z4+kvavDL6L+5aMzZdMVH6oFOOKpYtiDBjbHegcw22tm2uUDb6Y
         iG13HW8oBcCv0HbNpqHJBHRLvzg87FebARJCSEa/WBrzzdnnXJ6NQCK3BhCPm5efnIZh
         z7VxTCMTK6d6Sdh4SKKVsfZKiRzQjOXIxe/6QXFyctsoDyEsJQVO/b12Y0FsWX7QDcbq
         t6/39ch8OG7ZxLFPREn07lFMbuBzslOgdpjSl1XaE3KpcZU71/esZWO/sgw5vXaW4lR+
         uPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166860; x=1757771660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WIdATCDvQMnbdC21C7QVK0YJMHWri/9rANxhXm72f4=;
        b=cQzyweztsQHUSAV1owwoeM4gIhaXevDuFiy9ohD2DxpOX5duvGAscVNKP1eNgTB/ac
         ZhcNvMZlq9bWCsfABHLj53WpptGZysmlrliET38kInvvDXd3X7IIjJNkPQ6lN7KbMxV/
         L6en/xpTAKDznLihTqEWNwC7ZglRmYOZiw4+oCnrA18UWBY3LGd0h4Bdfg7+eXYNW9Av
         xqdyXacpxmvHVnMglEEewd8cg5K+uuENVMm1GeQNcYjJjzcvLey0aNxP6kkFijhUX1vN
         xQ23I7NTEUbN3ITSzJP+h/d+09bzeL4MMLDnOJm+eGTkYZWFF6MB+50KbD6HEifHdIvx
         PD8w==
X-Forwarded-Encrypted: i=1; AJvYcCVi0Oppq4RocNSCW8luquw8htbx0kL+LaYdnDUX/rkxu6vfsZbbyx9+BN13KKvW0wTeJEH+PY6XzrcAt4Hk@lists.linux.dev
X-Gm-Message-State: AOJu0YxTyKXm2nvRybEhDOaLXnuQyg307jwcV7mGTPg2lb/OXnJqHFwv
	wxX4C1cqj71r341jW5MAINUS4TZ0+Rmzp5X20gNL9AWJcLjOKa9RG4i4
X-Gm-Gg: ASbGncvQjEAqszNRl+IPER4ogPnkHro65cyT7oe7ANiuHfn2vlAes+idkSQ9kqyWsYt
	CKs9QoRyVrr4dvysbnuPOnKHi9tV6wt+rXEzHSSbF7yxCQrf08/Okg5zCawhl8TAbK97FwYTB+U
	mGBsiAbukuX91b99WEdnnTqPNhIMLfUvQDF/rci+5ksh7yshzAIAQ//C2rcx0Fn2VlPzsE8c5z2
	xaclMyMDpSsmCIhdzcGDm2dij61BwfDmnoTvcEc4stP/+gVFLs1z4gvSybhSRQ4ypYOZmy4TA0x
	S+IXiODs5e0xEyqVH6aorqXkaFgAT7LE5qbbDFGWTl8Lqr0zjy9BD6BoHtYeRK4/UFFRH9yWEPT
	Tb3Vi0iAbMgrCU0/0wFak02Yy0PjS60wPzZc=
X-Google-Smtp-Source: AGHT+IFNwfE5WsBiCnMDmHHRkAwMlu0XKdppumOKmQdJeOPj17Tc0h1VteTrfL9JbG9gfpAEqTCYzQ==
X-Received: by 2002:a05:6512:6404:b0:55f:6902:c9f0 with SMTP id 2adb3069b0e04-5626310bdccmr579045e87.43.1757166859396;
        Sat, 06 Sep 2025 06:54:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 11/23] staging: media: tegra-video: csi: add a check to tegra_channel_get_remote_csi_subdev
Date: Sat,  6 Sep 2025 16:53:32 +0300
Message-ID: <20250906135345.241229-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default tegra_channel_get_remote_csi_subdev returns next device in pipe
assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VIP
or even HOST. Lets check if returned device is actually CSI by comparing
subdevice operations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 16 ++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 12 ------------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 3d1d5e1615c2..c848e4ab51ac 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.pad    = &tegra_csi_pad_ops,
 };
 
+struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+{
+	struct media_pad *pad;
+	struct v4l2_subdev *subdev;
+
+	pad = media_pad_remote_pad_first(&chan->pad);
+	if (!pad)
+		return NULL;
+
+	subdev = media_entity_to_v4l2_subdev(pad->entity);
+	if (!subdev)
+		return NULL;
+
+	return subdev->ops == &tegra_csi_ops ? subdev : NULL;
+}
+
 static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   struct device_node *node,
 				   unsigned int port_num, unsigned int lanes,
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 90473729b546..2deb615547be 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -160,18 +160,6 @@ static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
 	wake_up_interruptible(&chan->start_wait);
 }
 
-struct v4l2_subdev *
-tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
-{
-	struct media_pad *pad;
-
-	pad = media_pad_remote_pad_first(&chan->pad);
-	if (!pad)
-		return NULL;
-
-	return media_entity_to_v4l2_subdev(pad->entity);
-}
-
 /*
  * Walk up the chain until the initial source (e.g. image sensor)
  */
-- 
2.48.1

