Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E4C38C2DE
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527382; cv=none; b=CqbBXkrTJ5sRunHCkAkrnJBd/su19lQOs86p/Z12QNCMzOlAwXzXwPsP6nwS2m/MunCWze+SJGsfHmIN+Bd8GBD0ESQt9iP3k/s4aorSNuGBVWhL9ZiRNUBZcMxeh3a0D1/PVYW/+EjXsA6g1p0sgOCy13KZCcF2x5/4racrh+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527382; c=relaxed/simple;
	bh=uTDxjcMD0sqeD8HnRLyVfNwbzvAjPF4iDYzatfrGujQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhCY/LA4guJmGBcB5A8V0Io+HcWUpIH6nNPbCCj0XPESrq2L6rtc9MVd+voblTyBFa61PNGWiNjg6hHYLJ1J2cdqDT9jJYi+ae8rzQmUedx5hynVleZGW6AWGy2w9eod9GPXJGQLm534aDO+0/1HU/eAh0izGeqbtpT8RJcrwVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqFdP74T; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqFdP74T"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-389e139ee5eso89746921fa.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527379; x=1773132179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ggm5W/tKu5AuAHRHgAxgCfaNNqewzCUye92Dt5QC9CU=;
        b=cqFdP74TghUiNCPxG1qt+BIhcRlOnDRXF3g1iq/mFBy+kSG8DKe8P1iAWpNTqr3GaW
         tLvJMtsH20Gr3cEb03irOzK94ncmpqwsT+fjs9F3jakNWwKE4D6H3fs3eqP5Lz2cWzSY
         7QTkgtWJ3BFpkotLd+XmbaQFfC2iVvxyTTlVWz7QlGeX+n88yGOYKi7J0v64SsDEuRml
         r/6wPJ2Sx8wrPzKw6qT6mHuoXXvAYk9k9RhwrlIPYUW0awK7x8EWaGD+yIT2jpHuMSTw
         fUcEIqy1+Udv/c9VD6MLJagiB40HYvFX/ZmBE1Fing+AEM7gvgXOyzhv7wqaJf+/itG5
         ZT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527379; x=1773132179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ggm5W/tKu5AuAHRHgAxgCfaNNqewzCUye92Dt5QC9CU=;
        b=XTvNodABcW7EeV34qrnTaXz/SsjEFj95t8wpfRGghQvN8XG2dfKTzLq9tCUEo9D6vJ
         OWIitXapfdP1nVT4VTTxyAQm5S6tpMbjV48UDn00smqROwvD3BrSdaJMvFqiEMoQGjnV
         s2p9arztCqvxrNNVSwhUOARXSCXa4hGYfdBE5GBNpwYMweAPm8OoiNzF7aHjpX9zTOfa
         CCWx1a7yQgJrqE5JQUtOirFfn9eX/vV09HXcWypqv0sNCN2kC6cZgwqK7ZYFKvLnivPl
         uQxSeRlRPx8Rec51IJpi2ik1uTWQh+VKikXcvFpzxq4G42fl1Zmterd9Na7AUhrvHgUH
         arYA==
X-Forwarded-Encrypted: i=1; AJvYcCWgBSANAVQBtKRjirTzNbLBAfOgCBPq7w5tGPTppI53lYGtST14PfRCoQ4OLXYpWk+7qQpo3zKtJTQlu5Rf@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+gfLOxBJqJo++kojQtNMbrdsJGU51r1fo3efh4+46gN4TH8xZ
	FdeN16noT5lSgcf0B6kn0fnrE4fQmc+jr5CGcFuQwJyqN3O/3BUltxa8
X-Gm-Gg: ATEYQzzeeb+KEIcC77ZVR6ETyIGzS5+QTCGS77mktvhpQ+y5nDl6QkINr5m1rWY9dpm
	nqftM7VfDZXX5p1hZIMkpT5ZpbtAfnLs97WsySuubzWVkYLbDfQswUDaDXDaRd4lz3DSfmcsVT7
	S+LPfuT95jr/Bmw7Ym7zgO3k1+4qd2x2lLBMqpCKme9JuUiqWHQVs7xwxLsWKbZbjh6pyRdULkv
	PqvddyRUVbLw74XlYv24C1uRZqgTw28sKpllsE3uQKa6BDcheaJ1dqp275diO3qNPyqBUQt6F9l
	Q618GGQVLeY6TpGKK/rLFaSq95AjIJJrTuZXxe2XPQLbpmNwiiTn3aS8NCvytRSgi9pqRQicYW6
	us8Blq1TV14MKb1aY6rOSTgq/NvMHRlpDeKFy7AN57KhE7JU4TQcSnIIFRgBEUU95yra/e6vEWK
	iHqvssHFtlA8HS0TPmQJExoxc=
X-Received: by 2002:a2e:9246:0:b0:383:7f85:8eef with SMTP id 38308e7fff4ca-389ff356ffbmr81095711fa.29.1772527378501;
        Tue, 03 Mar 2026 00:42:58 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 06/15] staging: media: tegra-video: vi: improve logic of source requesting
Date: Tue,  3 Mar 2026 10:42:29 +0200
Message-ID: <20260303084239.15007-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default tegra_channel_get_remote_csi_subdev returns next device in pipe
assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VIP
or even HOST.

Define tegra_channel_get_remote_csi_subdev within CSI and add check if
returned device is actually CSI by comparing subdevice operations.

Previous tegra_channel_get_remote_csi_subdev definition in VI rename to
tegra_channel_get_remote_bridge_subdev and use it only in VI driver since
core VI driver does not care about source and does not call any specific
functions.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 16 ++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 14 +++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index bcaea20c3025..92078a1f9a4e 100644
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
index 19eebfdae221..7032c733577d 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -160,8 +160,8 @@ static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
 	wake_up_interruptible(&chan->start_wait);
 }
 
-struct v4l2_subdev *
-tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+static struct v4l2_subdev *
+tegra_channel_get_remote_bridge_subdev(struct tegra_vi_channel *chan)
 {
 	struct media_pad *pad;
 
@@ -182,7 +182,7 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	struct media_entity *entity;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev)
 		return NULL;
 
@@ -204,7 +204,7 @@ static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, true);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -217,7 +217,7 @@ static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, false);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -1631,11 +1631,11 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		goto unregister_video;
 	}
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev) {
 		ret = -ENODEV;
 		dev_err(vi->dev,
-			"failed to get remote csi subdev: %d\n", ret);
+			"failed to get remote bridge subdev: %d\n", ret);
 		goto unregister_video;
 	}
 
-- 
2.51.0

