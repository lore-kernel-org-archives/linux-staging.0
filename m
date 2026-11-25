Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604906;
	b=5jYOtYKK2QUaCzVMWy+Bo0kDcSLGluQQHvsLg8g7fhEVJ0UuHjZfggx+oCYYnXCMajmP
	 X4eProKJ9qeOD5B/ZIl0Rr9A6R7DkLirm7s8klkraaBVXTlvx1VvIkpm2hfLUhf20F/af
	 gSgv3JcY2vJh10PnGS3Yp+zYNrxwHEYgz2AtWio84s3sh6HU9L/c1p3Uj4akpKuPCEo1p
	 ItZvKG/odnIAPH+IhY4bcBnMMIVqYgJyU8TRbUMpvOW2J4/Zn1OGxldPlzXuSMO13Jy6C
	 O7o1xhdDp7NgJtraXAvWbOc+88rAWEO75Nv8iEmv3go0c7Bv9R1i8BcGYMsSQWKI2+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
	b=QlTg/OsYovWkEs/zpdnlCA6ZazkB7gnron+qkGvQh5oIlHIcP56ENjK+0bztQVSIaXyj
	 IcTRxGPa6m0sK0x36buEZAcslk9ft7Tvu7xa7Raqju+efIiC0s0/HaY9F2pAp+TdP084T
	 vsT51US8Zz6FVjDorZ0nsqY920at6pkQrFaSSR2EP8R9yQdzJCgJ/dH5EuV515ErTY+wM
	 eqEE4+z0KfHWD2t6kgL3UfcLO9te+Q0TVY6jqCoDxhoXn4k1DW0eKn/DAt6UhShfKLFoY
	 qQuoiVm19NticBseyQ9gqSxIMcaGk7UHxGhrqkfo5L+vIu9dOG1LO+ZGGnCNO+AJ7wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sL7uMF04;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3E606A695
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D3E606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sL7uMF04
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4395d31228so949347066b.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604904; x=1796209704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
        b=sL7uMF0459qUHBDEY+FNN1naxf0vEeK2CVU/k3eWvnBZ1TTG2bSEhkcLx7SS12TtpD
         UUnCwP1ZBh9FxZnzk6MKTzc+oBNv3LxORqiEK3etk6xFE/VlrzQDWp8/aMOIabdrOQ2N
         3kQiH6X4bNgNa/cUMtL8HCkjjBDT6gi2m6PYQk+5pP6UvTlXFaYA0KTf1vSPYbuwmHbn
         3JqVQlvmYy+6IiLhRkTFFOXZki+JvyB2i8Q0YPeQ+c88Mh3W1BKtRFfvUBwJaCViQY5M
         sO8LTqjGYC1A6vmVa2f0Viom8540Xzw7sKEE386Gsp/s2OQtfLY7OGTTOT5MuXSnIyi5
         L5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604904; x=1796209704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
        b=UXq2VlfV6S+P4460Muoe28EW2uBkgaf0Xjh3q2N2f0qOhbcCHQ3NW4/KPpbGQAH2on
         vABLnL0Xw+vH6enUepcoUEGUr2OdEDy2rrK4kB5oL8YXWvuJFOCXMnV/48XcCwzescXL
         rhbnPLq7fJBoGKEF9Hd1QWlCDwrHqxNik7JLsQ7/j0sXH9Cydr6xk5FPIDNZu/ce79Eg
         ZUxrWOFwFZlzelnGn9637xJMA9AoWyVHc2ukkKniPb8oXfddNxYDsMzPZicinhejYkli
         00Lwh9S1YbatDedd1Bjh2o6jD9HYgmjioa/4cjvgguvlnr8lpRPgFDqmJxSwbZwXVRAT
         qWVw==
X-Forwarded-Encrypted: i=1; AL+hErGdvp6TjSJqRFWjMIb5lnTWjF0+wxlg2Ciqkp57GdtEWvnms+5ZyiHl/BhEttxiI2ANG3/6v5v4UiP+6E2c@lists.linux.dev
X-Gm-Message-State: APuU4Z9NcX41FSWj6cQgvlDKBeadZuYEW3qaeAQjpk5z6vSwK8CkzGNc
	nsO3qx6KuWtUl6ZX3Ec2ywb2SYRH82l0pqijB7PK2NJDbbkizwXb6mkI
X-Gm-Gg: AZFdTZceH7LEZEEduhiDfs4dj2ajnq8GC7SweGR5x9WmaE0QVZumGMbbI06ONXeZkpd
	63Ez6lCoQZujVhsFKUBiB13d827BWyyBAJ43FwmHqA2c8et/7gRAINfI5sWYm9w1j82D3fCYiyS
	SloE2WPuXI4+HYbypFdb1TGd23cP3WJtXbR+P+WOalEVmwBxYVLxC6KMlyclRjNgi8nngGlUFwR
	zu95oGVnIX7H7SXgSh4oOCeIP43R1v7ql47Xlec0HZoueC88OMgVeS3tmbD2gUlkSA52iOz1YaO
	KLTmZtJf0alD3p1P6KlI+FHown6SXLb5MWbr2r8TGWhdmdq3Iku7WsW7eG0srn1auRZS9PCOmny
	//2q0Zxr5B2J0u87cfDI7tKKMShgY+l/oRIP6fUZxik7jeIski+WwUDxvH6I0cgmDIRbCh9rq5P
	FYUg7WxkyVWUAF+hvD6Ky23m5lqwyuFrlWqGIzqajj5jJHm14M7/fixsZn73BDY2L6XwMXLY8Yi
	FJifiBI3BVWLjUzy8BdNP2dyJ4043z+o8BP+LK3jSMRF/BK8Iw3l5miI8iWHJ2AbVzrp+A6jciK
	8NQYUKVH5DFMSWuilDvdRZllyQjMV/z79eIX0rYu7/BaFnJtq6JFIo57Nd98KbJhZ6C1oDVYi16
	ifg/NroYW7g==
X-Received: by 2002:a17:906:5006:b0:c50:5e10:71ae with SMTP id a640c23a62f3a-c513a5e2124mr1216666866b.17.1795604904078;
        Wed, 25 Nov 2026 03:08:24 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 03/13] media: tegra-video: vi: Expose all sub-devices in the pipeline
Date: Wed, 25 Nov 2026 13:07:40 +0200
Message-ID: <20261125110750.223628-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for exposing /dev/v4l-subdev* nodes for the CSI and VIP bridge
sub-devices to userspace by setting V4L2_SUBDEV_FL_HAS_DEVNODE flag. Call
v4l2_device_register_subdev_nodes() in the async complete notifier
callback to expose all devices in the pipeline, including auxiliary ones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/csi.c | 1 +
 drivers/media/platform/nvidia/tegra-video/vi.c  | 4 +++-
 drivers/media/platform/nvidia/tegra-video/vip.c | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index 44bd53dbbf7fd..add526de536f9 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -680,6 +680,7 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	v4l2_set_subdevdata(subdev, chan);
 	subdev->fwnode = of_fwnode_handle(chan->of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	/* initialize media entity pads */
 	ret = media_entity_pads_init(&subdev->entity, chan->numpads,
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 71921931457be..4753ca89666ae 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1548,12 +1548,14 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	struct tegra_vi_graph_entity *entity;
 	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
+	struct tegra_video_device *vid;
 	struct tegra_vi_channel *chan;
 	struct tegra_vi *vi;
 	int ret;
 
 	chan = container_of(notifier, struct tegra_vi_channel, notifier);
 	vi = chan->vi;
+	vid = dev_get_drvdata(vi->client.host);
 
 	dev_dbg(vi->dev, "notify complete, all subdevs registered\n");
 
@@ -1610,7 +1612,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	subdev = tegra_channel_get_remote_source_subdev(chan);
 	v4l2_set_subdev_hostdata(subdev, chan);
 
-	return 0;
+	return v4l2_device_register_subdev_nodes(&vid->v4l2_dev);
 
 unregister_video:
 	vb2_video_unregister_device(&chan->video);
diff --git a/drivers/media/platform/nvidia/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
index b73ba0eab5573..040776775aacc 100644
--- a/drivers/media/platform/nvidia/tegra-video/vip.c
+++ b/drivers/media/platform/nvidia/tegra-video/vip.c
@@ -165,6 +165,7 @@ static int tegra_vip_channel_init(struct tegra_vip *vip)
 	v4l2_set_subdevdata(subdev, &vip->chan);
 	subdev->fwnode = of_fwnode_handle(vip->chan.of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	err = media_entity_pads_init(&subdev->entity, TEGRA_VIP_PADS_NUM, vip->chan.pads);
 	if (err)
-- 
2.53.0

