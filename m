Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604909;
	b=Hn4H+eqLGwmWUbmdtrea18y46XuT9Abn/p6J1tHH8wnYeZbPzmOnB+gdvM0bnqbKeqgm
	 0oVedgJ/lahElLzIljILpIL+sXZoz2AhRL910QDzXw4zFdn+ri1wskX8Bq9Z3gs3RcEff
	 DBuwYxbFVwftrNpoqNTjCadjU0rNMuFNVR5LBIMdximAOmTRa7qq2QbfNgGEtiZHDlHaE
	 D5LJ8UUecIHM9RBO7FmotxK9BBtUEm/mlgbt6+HEd2atFvBWybM2KZr0KRYRWdpBem8NN
	 UwRfh3kqCAKcuSyalH70hbi25EQ2W81t5hgZ5njfytTBwUZ7PQeCAzbfzL51Zy4nS6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
	b=5nbLKfL7SAoDuIzNFPMqQQwPzXUys6u0SXN3ou2vRbVVj5y51hkLzt9gxmyDMPoeUFr+
	 U/dpt3dDk8XUYmOZDbx/r1T5q9uzTqrgv6vA+h+rolPj0Jj/5oRPxWEbqy0ZR7Rhx6AmO
	 8ar1DEjAc6t0daWLdHm2+3u6yIxelmRi0VTY0TE9h3XLCEbrDGzIJRZq56tnha6NxJT7W
	 7lvi7MZX8iQEae1Qqj1szhspE8UtKL80YQtWwhN6Nvuj4h7VXdRPUk9cUoo1hJ/G0KFHl
	 gh61nciyfanFVQ79jOkz2osAebwoWON03LG/JVWTu6IHzReYqDM8w8vUxkCeShPXfQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBtu7XzP;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAB0606A6A6
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEAB0606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBtu7XzP
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5188e4980fso54300166b.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604907; x=1796209707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
        b=eBtu7XzPJKc/nhBba/xMqhWGPVB3jLS3WjixIysG23DuMhNsYaBCZoOU8Pw4zQtuQD
         fbkkk4v29JbfGP8dn1Cmqm5IOOfLdupgQv6R84AT25SFvLgI3kzZDvNBG7KJMqPsMtyn
         ooRY/tKENKBcsI8wZ4TOxgo4K87d1LvH1CmRbGpgUdox9/3AKVKvVnxLcSmqD8bcNNEZ
         KfpAC73Byebkws9w9gTi7cyC+0mV3VgGAZsxZOrgSPK8Y9DW4AH3gclFpMdocrzU8ji9
         /3PRDbT3UOeZDLPlPtKxjQJuvV8JlCTn1kgwZgrSf931lgXN80VCqo+iKgjxjXrlmmHf
         S13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604907; x=1796209707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
        b=WdQ/2riW5nr8Vbxwt64NgYZDp9RO4rkWP2553GVbAWlE5y4OaP2FZEbe5srMPmok8O
         CcaDSEW/P4WZUP981jjzf2uWhHsvRqeyJ6kGeJUh/TbuJtYveBykhFJP1mc1QgUoyXzg
         wZj1cU/jtVbZDiwCnVmj4fnYnIWaDp8+R9DWA7xm6NvFMJRfVehStOiVQkIxYgmFErXx
         AJsPMUtOdAGpFPC7SbLtn19QCu0LTYlL9/AY83HYYlVbhmmse40TUHOKUGc3ZzqSEHp6
         Nxn2w41sSMmHBb4xJ7rzf7Y63cvIVAP+U3aCHawXdSVgMYN2oyBCeiEzsZVvOcbimDEA
         Pang==
X-Forwarded-Encrypted: i=1; AL+hErF26fpUU/nvIVJw7WyT0dbO7poSPB9QxGOZTxenp1WS8BWzDIVaNjEyKq76sHuevG7C09sB3iWbroP17TVe@lists.linux.dev
X-Gm-Message-State: APuU4Z+nxRYFHDY9c/nuz3XJfGpwmDSKTMMl7CjdMfQHhS+Q3RJpN0sF
	jD9C7M/29B34WlDQQQDmCgN+ZXMF2hOBku7Po/iXU1oZErY3GWFCJ+fr
X-Gm-Gg: AZFdTZe//Cr6tiCUYjYgVaUMqAIeApCE85H0AJDRdzVE5qrYP0HP6oi52IoWuJcDMZL
	86sN0veplQCVbPeINJw+erHjbcL3pGQyEab/Hkx6IHVhzvIhBRcdPvvOgc/SNQf5pQwNFKN1Zy3
	mvKVfII0L2+AVKfR4ujWGQBzAVWlXEkZLYceS1OU5U2GNfdem5IFzox9Ol/1QbiPswsEk5oi4lC
	fNiX0Gi9htpPPJXf/Ixo33QrVTtbB1l72Jd5XMNuZpWxvx9ZgXCsbJLNrqDo831wz6lYcpj/1OI
	ElvX5eJfex8V32NdHww+KbI8gNYzDFEWkmGkDRT0SaMf/aiGUBCAG80G6FRvKddg1RtzPf3hz6x
	DiaSwcGcMxiULiVUmy/wBTp1sJXRdNJ74b/TsSi2ZD1PXgUe6kyBTLmWISk5rfAMWGVLadbn3cL
	YIt0HvmxnAzEVuhKXYRVviB3pPASx3Xzz3hjyckd2aB6yNV/Gm2Poa0vFHYC5ae9BII/3hykJ4y
	ZdXfTygz4TIhjML/ycuDtFmOpL0cpR0xUVG3gv9yhpGz+HITIcBe9aZEcTXXsn39td/iz+4cmXI
	HF+vpLlIE6Iotx25FJgn7AddqirTaoa61g3IAogpDG0dKeDydrLxR20URRkgt69tCfZ4tJAETSC
	KPCaaoRrxLg==
X-Received: by 2002:a17:906:115a:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c513a89ec1emr1095743666b.24.1795604907065;
        Wed, 25 Nov 2026 03:08:27 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:26 -0800 (PST)
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
Subject: [PATCH v1 05/13] media: tegra-video: vi: Implement link_validate for video entity
Date: Wed, 25 Nov 2026 13:07:42 +0200
Message-ID: <20261125110750.223628-6-clamor95@gmail.com>
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

Add tegra_channel_link_validate() and attach it via
tegra_channel_media_ops to chan->video.entity.ops to verify that the
remote subdevice pad's active format (dimensions and media bus code)
matches the channel's configured format during media pipeline validation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 376f53f44b90d..5b38bae648686 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -558,6 +558,46 @@ static int tegra_channel_log_status(struct file *file, void *fh)
 	return 0;
 }
 
+static int tegra_channel_link_validate(struct media_link *link)
+{
+	struct video_device *video =
+		media_entity_to_video_device(link->sink->entity);
+	struct v4l2_subdev *subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	struct tegra_vi_channel *chan = video_get_drvdata(video);
+	const struct tegra_video_format *fmtinfo;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index,
+	};
+	int ret;
+
+	fmtinfo = tegra_get_format_by_fourcc(chan->vi, chan->format.pixelformat);
+
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret)
+		return ret;
+
+	if (fmt.format.height != chan->format.height ||
+	    fmt.format.width != chan->format.width ||
+	    fmt.format.code != fmtinfo->code) {
+		dev_dbg(chan->vi->dev,
+			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			fmt.format.code, fmt.format.width, fmt.format.height,
+			fmtinfo->code, chan->format.width,
+			chan->format.height);
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations tegra_channel_media_ops = {
+	.link_validate = tegra_channel_link_validate,
+};
+
 static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_querycap		= tegra_channel_querycap,
 	.vidioc_enum_framesizes		= tegra_channel_enum_framesizes,
@@ -836,6 +876,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 		 dev_name(vi->dev), "output", chan->portnos[0]);
 	chan->video.vfl_type = VFL_TYPE_VIDEO;
 	chan->video.vfl_dir = VFL_DIR_RX;
+	chan->video.entity.ops = &tegra_channel_media_ops;
 	chan->video.ioctl_ops = &tegra_channel_ioctl_ops;
 	chan->video.ctrl_handler = &chan->ctrl_handler;
 	chan->video.lock = &chan->video_lock;
-- 
2.53.0

