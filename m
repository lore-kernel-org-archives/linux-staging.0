Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604911;
	b=bGVuAMLKBnT2iJOALNc8GrqkQKhcabBXvKQOTLVlXwYT5vN3Yc6ft7vN9E27JYFrDwqJ
	 l3RX9DBoaSooJrDZNAWkDBZ4O21GkZtDJ7qeEEzeKTs8C7o0BdFoEN6z94qRwZV6iUZwR
	 7vZXl8dReAq/jYu5d2lIEGGjY/7JLqpfKU9ILX3diAZontFMgck9lxo/lrx2XZq3yJsrP
	 QU/VIKHPVzu0YDp69nbuNNsIK9nKI0vLMz4ofjKQZg6Mf6JHUaXd8+x1avu7R+bYgFQA3
	 hzI3XtM71l5NKh0nkV/vlIACalZSd9rZ5+t+dufLRi1OjM75dx8TtxuSG4itSTK3nAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=clKaolZwkMSTHm0nujES/qrJKyQ4xfGXj1/wJaiLO4U=;
	b=DE2eT2WOontKJamLSfE1IPrsJIpjg277UCmc3N5aAF5JBzMis9+tF9VC4CQAb6zM1TSg
	 cEakpCwnWwxiCCj4lU0D5N6Gox4Mk64k/KRdoSe3FQeiEtj/i4Xv/kZjl2FLspj1+R3tA
	 6njwAgsI8hGA7TUq8rBcFOUSWsImU1p2kdSx8eX9tLghN9PJLY8GSx/D2eH9aypfxvuzW
	 BgYarM1OCsC9B+eQH96Mt/lAXTWcg79MWXJknzMSh+DZ0inXyknhjSa8G8LtEWGJLsRmT
	 e3joU7ltTC+J7KWhNRT3BKpz3YAFFhF1ZMbP3YND2Jn8zCfOTlFDHE99PM12vLf0HMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEzq52RC;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420BE606A6B0
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 420BE606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEzq52RC
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5126505cb3so723492466b.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604909; x=1796209709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clKaolZwkMSTHm0nujES/qrJKyQ4xfGXj1/wJaiLO4U=;
        b=dEzq52RCP8hqiLeeejIctH1i+/KwhEkDCDVqxhCwyu2M3kJhsjvvVsU118+QP5z9iP
         kISvpMhI8daBXW59957Vw0OOW5cPj9CWhuwsz9zN6NjDbJkxeXsI6I7qJaX7HCF7bU82
         FYxgXMh4xeXv1s/fNS/uG8ruGaXSomnUCBcks0MYqeZD9OZy131DT70A6sSinbdnRPqH
         +N4ycAtxD7Vj+Tw17Oud7QVZu7Ch1D7GzAuJDIVCaD3CudcOK+z+VTNiwyJQ1B754HBb
         1fewehcK+S95A9VDMrJMgo+z1RPNEoQW9OeK4vtizvHjtCwdFhG49Qrv1QLwab2Hu6Ry
         LvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604909; x=1796209709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=clKaolZwkMSTHm0nujES/qrJKyQ4xfGXj1/wJaiLO4U=;
        b=iTtALnXOlU0+xHsryZKu8pd8w2JwOEW6cyu6EdV9wOYQ5UTSvYtyN3MxsEDzDi6ZJ3
         s7UF2emFFWVYQt4vXEimVbe4D0N/4Zb4bh28jcrlMPPByiQEwMGjJe1iZ7HUgIj3YtmY
         W7ba6QKwZxVrK3L5nE50TLG5lJ5W/PKUy9rrH+RYh56syLN+3Vs5VG8UCA0pjGAM2GQu
         y/N3EZJDr+UoVcWUDqSYADbZFOYsfRM03HpK6ziAKRNQsSGmuOY13VzbutFCglyLFVlb
         wz6lbjxPmhR0iVEJCQ2KWdiPbFG/H7k7FQcL2Hdg/6cNpG1neJmqN5if2zBo3MhdfZtt
         qabA==
X-Forwarded-Encrypted: i=1; AL+hErEJZ+3r+N9W2MBiNfobVfaJeijCMBf1YaUZI0yFAW/vDMZTbDSDb0hQ7yBorxuYXfNBtmNxQ5xW3m2o4jto@lists.linux.dev
X-Gm-Message-State: APuU4Z+fUd+Iro7anrG93Bx3k3EDSQX1zFw22vAyLQHAlMWHhXl/KTQx
	wsOq1ikPX9RX4yJfaqf6byH5kk2b5PVbF/Rojzh6YRM6zHh2SmIAuGcTIKLX2w==
X-Gm-Gg: AZFdTZeVThFSL7HFY3FzRBx7RDP3n8SWFjL2fp9k4cpCwO69yBoqnqcnjshxNilHmi9
	2Rx4vu8+aHdCXRYU6wTBPUJi8DHs/REJxEyz1FUnYZvhK7ahg1iny3HaBI5hqtBuVA4lryP3TXU
	fvSLCG3BffdkgGYNe8OwoZ+GNIeR9F7pSbDtLTtqakVmiKL5SuQO99no3zWfHe3ex9yoHO1RZ6y
	FyTnmwf3mmisMRdPKomArajqkPWXq+8bKooaYMX/RwukG/Ce9WAHfqvsdttudmH8RYl9zOQAz1H
	XKRv8zfccnX9n6A5TB+qBUrFSow/TPou0XYlGDG7gRn6llbLHe38cb4ThxZocZmqGjygV0pMWFh
	IpL2JJvJRdSL7DdhycT9rTSNeyctl5LZ4yervQpXg/b4J6QvjKy+yNJr2hrdTWe835ym9RHMEPL
	9aMYJnKqmda8++we8kchNj9JqOc9uMbQ6PhanW0Fk9Z++Gvkj9fRNjxnD7kim5uA4qO5sP0pEU0
	8qL5SedfIYeotOnvMe3/oIcGdcoFEY5XY2YjrUxoRMy/rLQ624upyY8pbBdE3YmIfKfSpABUNYI
	8c+lnwz8c0y9CxmHOLGvuYl9HdXigtEA5Kre4QmUwGBT0vJBz+5loxlc8SO5v0fx2RzwpYs2erX
	Zcos5//UpTQ==
X-Received: by 2002:a17:907:1c81:b0:c3f:7e8:235d with SMTP id a640c23a62f3a-c513a4b0ca4mr1423432066b.5.1795604908565;
        Wed, 25 Nov 2026 03:08:28 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:27 -0800 (PST)
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
Subject: [PATCH v1 06/13] media: tegra-video: vi: Populate stepwise frame sizes via vi_fmt_align
Date: Wed, 25 Nov 2026 13:07:43 +0200
Message-ID: <20261125110750.223628-7-clamor95@gmail.com>
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

Extend tegra_vi_ops.vi_fmt_align() with a struct v4l2_frmsize_stepwise
pointer so tegra20_fmt_align() and tegra210_fmt_align() can report
SoC-specific minimum/maximum dimensions and step alignment directly
instead of duplicating limits.

This will be needed later when converting the remaining ioctl operations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../platform/nvidia/tegra-video/tegra20.c      | 18 +++++++++++++++++-
 .../platform/nvidia/tegra-video/tegra210.c     | 18 +++++++++++++++++-
 drivers/media/platform/nvidia/tegra-video/vi.c |  8 ++++----
 drivers/media/platform/nvidia/tegra-video/vi.h | 11 ++++++++---
 4 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
index cdadff98eae75..f8d2b5e1b4131 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -447,8 +447,24 @@ static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel *chan)
 	host1x_syncpt_put(chan->frame_start_sp[0]);
 }
 
-static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
+static void tegra20_fmt_align(struct v4l2_pix_format *pix,
+			      struct v4l2_frmsize_stepwise *stepwise,
+			      unsigned int bpp)
 {
+	if (stepwise) {
+		stepwise->min_width = TEGRA20_MIN_WIDTH;
+		stepwise->min_height = TEGRA20_MIN_HEIGHT;
+
+		stepwise->max_width = TEGRA20_MAX_WIDTH;
+		stepwise->max_height = TEGRA20_MAX_HEIGHT;
+
+		/* Size must be div2 */
+		stepwise->step_width = 2;
+		stepwise->step_height = 2;
+
+		return;
+	}
+
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
diff --git a/drivers/media/platform/nvidia/tegra-video/tegra210.c b/drivers/media/platform/nvidia/tegra-video/tegra210.c
index 82d054c9c34c5..90d984790696f 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra210.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra210.c
@@ -229,12 +229,28 @@ static void tegra210_channel_host1x_syncpt_free(struct tegra_vi_channel *chan)
 	}
 }
 
-static void tegra210_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
+static void tegra210_fmt_align(struct v4l2_pix_format *pix,
+			       struct v4l2_frmsize_stepwise *stepwise,
+			       unsigned int bpp)
 {
 	unsigned int min_bpl;
 	unsigned int max_bpl;
 	unsigned int bpl;
 
+	if (stepwise) {
+		stepwise->min_width = TEGRA210_MIN_WIDTH;
+		stepwise->min_height = TEGRA210_MAX_WIDTH;
+
+		stepwise->max_width = TEGRA210_MIN_HEIGHT;
+		stepwise->max_height = TEGRA210_MAX_HEIGHT;
+
+		/* Size must be div2 */
+		stepwise->step_width = 2;
+		stepwise->step_height = 2;
+
+		return;
+	}
+
 	/*
 	 * The transfer alignment requirements are expressed in bytes.
 	 * Clamp the requested width and height to the limits.
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 5b38bae648686..b523750725254 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -441,7 +441,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		goto out_free;
 
 	v4l2_fill_pix_format(pix, &fmt.format);
-	chan->vi->ops->vi_fmt_align(pix, fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
 
 out_free:
 	__v4l2_subdev_state_free(sd_state);
@@ -495,7 +495,7 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 		return ret;
 
 	v4l2_fill_pix_format(pix, &fmt.format);
-	chan->vi->ops->vi_fmt_align(pix, fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
 
 	chan->format = *pix;
 	chan->fmtinfo = fmtinfo;
@@ -531,7 +531,7 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
 	chan->format.bytesperline = chan->format.width * chan->fmtinfo->bpp;
 	chan->format.sizeimage = chan->format.bytesperline *
 				 chan->format.height;
-	chan->vi->ops->vi_fmt_align(&chan->format, chan->fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(&chan->format, NULL, chan->fmtinfo->bpp);
 	tegra_channel_update_gangports(chan);
 
 	return 0;
@@ -845,7 +845,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	chan->format.height = TEGRA_DEF_HEIGHT;
 	chan->format.bytesperline = TEGRA_DEF_WIDTH * chan->fmtinfo->bpp;
 	chan->format.sizeimage = chan->format.bytesperline * TEGRA_DEF_HEIGHT;
-	vi->ops->vi_fmt_align(&chan->format, chan->fmtinfo->bpp);
+	vi->ops->vi_fmt_align(&chan->format, NULL, chan->fmtinfo->bpp);
 
 	ret = vi->ops->channel_host1x_syncpt_init(chan);
 	if (ret)
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index 46328e488aa38..ac86f11588f95 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -45,8 +45,11 @@ struct tegra_vi_channel;
  * @vi_enable: soc-specific operations needed to enable/disable the VI peripheral
  * @channel_host1x_syncpt_init: initialize synchronization points
  * @channel_host1x_syncpt_free: free all synchronization points
- * @vi_fmt_align: modify `pix` to fit the hardware alignment
- *		requirements and fill image geometry
+ * @vi_fmt_align: if @stepwise is passed, it is filled with SoC-specific
+ *		alignment restrictions and maximum/minimum frame dimensions,
+ *		while other parameters are ignored. If @pix and @bpp are
+ *		passed, @pix is modified to fit the hardware alignment
+ *		requirements and fill the image geometry.
  * @channel_queue_setup: additional operations at the end of vb2_ops::queue_setup
  * @vi_start_streaming: starts media pipeline, subdevice streaming, sets up
  *		VI for capture and runs capture start and capture finish
@@ -58,7 +61,9 @@ struct tegra_vi_ops {
 	int (*vi_enable)(struct tegra_vi *vi, bool on);
 	int (*channel_host1x_syncpt_init)(struct tegra_vi_channel *chan);
 	void (*channel_host1x_syncpt_free)(struct tegra_vi_channel *chan);
-	void (*vi_fmt_align)(struct v4l2_pix_format *pix, unsigned int bpp);
+	void (*vi_fmt_align)(struct v4l2_pix_format *pix,
+			     struct v4l2_frmsize_stepwise *stepwise,
+			     unsigned int bpp);
 	void (*channel_queue_setup)(struct tegra_vi_channel *chan);
 	int (*vi_start_streaming)(struct vb2_queue *vq, u32 count);
 	void (*vi_stop_streaming)(struct vb2_queue *vq);
-- 
2.53.0

