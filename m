Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604912;
	b=eCHpiTMmnPe/dcR8EPdLKQRtxIvo3iQHNUIcB83AXFAv4FeatZzEXq8XTf3SoasMcwJZ
	 RCbYtx3lcS6OKnh8gl7ZN8rhzlk60o0buCxr15lzt5xHy6ERDlOV+bUnn5S7fwCvKSgac
	 +4TgMu8hqKmBjIAdc7zjdI/DrizEgl2DURfaIt25rc7Kv1MGKVm1ohNqZuYOZtY5OAxF8
	 cIdEl/xZhza29ou+g/ifW49taZnkCoaQdtKV30N7mfHOjnTPXUzAJMHqw72oeHxJ6n6lU
	 /cDZ3z2kVDCXCuqWTVLlsIZ1Bq68TzidS5cstK8Gz6kotWEMpFeXexLE/le5zl8dMFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
	b=0ZFyxkeHn9iS+8hbgIVLSmA8PE/29KNg8Fv3c6XO1gwRd395GspKerh20eDql3dVQYU6
	 A/57voZjVuRU8hqFutHZctwZ/3EZ2Cuj/l0MZlEnOW/9kRrhGdt4UMoDGXm/8G9unHzRt
	 2186xJIDuTqB79XnaodhJ/jjReAc9KAvsUccbNXm9Zv2bokt5shcsCalwQ8HoB8o3LJn3
	 K6VlIcq6ghuZEv7c9EhLRov5CqfGEEQ9rth1cgutKwaWjV1qlTUh0hjvhtBC5q+JdYc6J
	 1O7TYYez83X6q+J/LT1D2/VPHzKaZ37vNBCsR7JCQpbDkQJo53xfozriWAP5Fw43XEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1uEnbiM;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A1606A6BD
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19A1606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1uEnbiM
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d581da0aaso782720866b.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604910; x=1796209710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
        b=r1uEnbiMh9E/1KbYkaI5kpdrcgXc0MVsM1GnE9ib2oeUMIrqoweptueDnIz1wI0vWR
         fZbhYHTkK9/yBjLG/aiPzJLR51w69bK8iFeDji955D47vbTn4CYUCF688zbb4fuS5f4A
         wROnWoKzif17k/vhUD4mOWv6Z7iIHPG3Pxt4srgXNF+7jUqVqNlztMkifcmXgTOWung5
         st3lgOWz+IwaZ7w9c+AQBUxdXzZVaJ7BVpedayY6E6MSnOK5oOcFLeXrEnInjwG7Z1HG
         aeePDLEPMU1UHT3+RdDnBkiYqXG5t8WZekqNeUVHnZdgRYgqhmIECjmcIsnOj9mteNcr
         H6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604910; x=1796209710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
        b=F1DwdTQl7RI2MJp4U82ZhBwMDuMlimbOuF2usj+mlx43BcoJhppYR+KtrfIoWBGWel
         7EW3OSXtU+2DNbjaWuGHiCOkyZK4dRPcKrXO7Zx2KHowYrJOEfaKC3uEZr23+h9E5Ist
         KIZJqpUTZ5DGquLtcbk5FjMQA9NZ4SIgMrXQ0N6qMdKTNnappPPNYa/9v84qI4dJHynZ
         KGux4zroB9vLG9XW4mzYzTFYl4d2sp4i3eHfpvOF5zohH15kKYfYZy4tmYloX8WGz0VY
         O1QMJ4XGHHNVjtE0jTMtyalq+yhZus+d5DvJaW3PS/SxKEcPdu3cdGny3I80Dt5dyB1A
         nB3A==
X-Forwarded-Encrypted: i=1; AL+hErHGolsLWcK4axMPH2nVd2+Bm1N6u8EPYYwfTpa+AA4nyUJFeYZJGFZGxmZ+UI08+mj2caFp0Ld4g0R6w0Zm@lists.linux.dev
X-Gm-Message-State: APuU4Z8Su1ssUlNCo4fVdOVfo2PmOKga3wSwspLQUrit+MT3MlLqQKP+
	JwQY0/gpKcKDbTGxSIW+uxTF6HJLDNvQN5pKYE03lzakEl2MKGJyR1k6
X-Gm-Gg: AZFdTZdRIJSivWs7VKFfFh2ShmxJSLycPV6rIz2ZEGTUVA4FAzAmqZSIL6VZ3M1eY/k
	g0+bpX/PXmuzZJTHu2P+5dGL0uj1qHrsM5JHdyJJCrPPLlgQg7Htkslqz7IWtTbxsGHkiw73RDP
	hnHNxxExn1kmbibAQSk4c9A9PImpg5/ZNM4ZPX2QzpjBEWAWvnQ9QsWXzH7XTAgBXoHjM51EsCc
	n7jOqmhZLTxD7neaRiQK2dgMtPjR3u4Wr09yJHuoiW8FNRyY5T3UL9UL2uqN/Gjn0U0djAU16Oh
	JlxqO8s/kXNL/Jg678PX4WkdP9cMzD7d+Nn+6NiT+IMkQBwppEwQkpM+mor1oE/0gI8GjtLsb6a
	v6CTd2XoKl0EVgEFLPyyEnn4BHUWkl/2WiFasfOkx7mIa3sNlfE7DU8R9zhhboTfRRFiOXA5EYM
	eVO/htw/kmVvrj5DFdJ0g63iI+2VnO1N04A7V8Ndi/h481uo1t0oUjAyUrEHGKkE5yZUhTY2TJ/
	K7C7+cZFcWcbo3XcRZbasGbERfkETFk4N5CIMfBzUh92N9b7H+93r6Rko481MTwoDwc5w6gud+i
	4F2x0R84cNXPCJU+3DdVDzsLKbhzTzheIWsFove5cqTq6m/5PjkQVZnQvxFUm0Sjcp6Gr2ptSCF
	iH3PWBpuyrw==
X-Received: by 2002:a17:906:5593:b0:c40:91fb:b76 with SMTP id a640c23a62f3a-c513ab48008mr1115543266b.33.1795604910057;
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:29 -0800 (PST)
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
Subject: [PATCH v1 07/13] media: tegra-video: vi: Report stepwise frame sizes instead of querying subdev
Date: Wed, 25 Nov 2026 13:07:44 +0200
Message-ID: <20261125110750.223628-8-clamor95@gmail.com>
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

Update tegra_channel_enum_framesizes() to return frame sizes supported by
VI instead of forwarding enum_frame_size to the remote source subdevice.
This also requires switching to V4L2_FRMSIZE_TYPE_STEPWISE with a step of
2, since Tegra VI requires sizes to be divisible by 2.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 23 ++++---------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index b523750725254..ed3e1e91baf12 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -311,29 +311,14 @@ static int tegra_channel_querycap(struct file *file, void *fh,
 static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 					 struct v4l2_frmsizeenum *sizes)
 {
-	int ret;
 	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-	const struct tegra_video_format *fmtinfo;
-	struct v4l2_subdev_frame_size_enum fse = {
-		.index = sizes->index,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
+	struct tegra_vi *vi = chan->vi;
 
-	fmtinfo = tegra_get_format_by_fourcc(chan->vi, sizes->pixel_format);
-	if (!fmtinfo)
+	if (sizes->index != 0)
 		return -EINVAL;
 
-	fse.code = fmtinfo->code;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, NULL, &fse);
-	if (ret)
-		return ret;
-
-	sizes->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	sizes->discrete.width = fse.max_width;
-	sizes->discrete.height = fse.max_height;
+	sizes->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	vi->ops->vi_fmt_align(NULL, &sizes->stepwise, 0);
 
 	return 0;
 }
-- 
2.53.0

