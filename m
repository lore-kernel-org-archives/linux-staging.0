Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851925;
	b=ma4eQEih9YM8GZ3UJK20DbvFQXlotm8Vs8HQ3JpUXQfiICUrmI8WT8yuZRi104goA/VJ
	 Z4EmOoTIWmOoz93vlNxqEAJcLL/Y2q7vycm8VxeWja0zuTglDm2qataKTJ/byIMLsjcM+
	 agx0LkGU03xZ4zYeAjGRIvQl7MlnSGF9+dwLTAjDqTadF+Xeoxh92TDd8YTEcNuneG4ga
	 jGmKUTcslLFmTd5oG2gJBB0xgyOTXUNe1anOEErvnDMclOulnSsF8Pes89zguho2ZBAv5
	 jNz+aRoUK3I7vGKkjIwBTqJvzMKrEc4maS8gpigCVs1xV0vT4DeFYcG4yH3iQzCIk4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m6gUtX6ff6h8dx/Z60Kd+xo5KMp1HfTClHuuO+KE208=;
	b=b79q6exMLCY0G8ZqG8d70eC2AC4XpSXfUVhUfPu21ZNBsuojFUtKwUk4gZZ1mp7asIxU
	 dTS9+t9f7CQQt6JLm/S+lKtTt0xEwiU0sfyXdx2hVdsWffxdUPAR+HAg8pfZgNvnNQfky
	 tyhKnyAKPx+cM278YyQCzPcoAWXxeWsNZkCE+GtH3Kmsyv7HJpq5uAgw3H9nBeGceUM3V
	 mSesuj4GPFY86KW8IskSLm9QN/tGNmKnHV9XqbYB6lS0xTQgW/CL0VNblXJZnnmitunV9
	 aHi1dN0M3nczCSjEKMZ5mKuc9OPrchjinZmIorO2jeyTIBNXnXc0F8ScJfsHtjvJx+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="H/xD6yBT";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34A606A890
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA34A606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H/xD6yBT
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so95327f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851922; x=1795456722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6gUtX6ff6h8dx/Z60Kd+xo5KMp1HfTClHuuO+KE208=;
        b=H/xD6yBTJu9WzKg85ADYl/+bxNctNzkZi95a+sO6xRjCa06FtagV2vzleVW+PQoMpd
         PXdvkfLrt1YCQSZP8gq1g1C6aZsqX8ZQ/3DSb+mx2YTWgMStNiQfiMSpYXU9fNPMw7YJ
         tP3rXzp1QF+4Dpp4aNxWVoF3AUDJA8GMOoP4CfZUR/7+vnI2aXONviwJ1VEP1sfRG9y5
         roX0Kx5GodN0K8qjwUWXSZOYoZGHJYcdu2KNCucq96zRezXn0ekhi3bfJLRHf1W0DuJm
         vIp+WcJVyUbCXzGgfZjm7Qw7qJ7UrxJy9jgyVBtWe91oCRCbyoG7WQn8XUhhfzxyLE5G
         EenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851922; x=1795456722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6gUtX6ff6h8dx/Z60Kd+xo5KMp1HfTClHuuO+KE208=;
        b=QRzp+5rSX7zw0eL/7C6o6NC50qiDbUSPsk/yra29bvCr4ppg5A23taQdAo5LRBaqWn
         cGBb7UHelHsMUdVIetOzQROVTbkajTMl5MLxq9clQiU9BuwIUpzKXZrE7Wf941x6BSNi
         tRkwdT/lJM0ap0Kv479QMwr43IpjjBFBpL803JrcvywYYcynCHcsN03ejakNJKAqqaA+
         sM3eoJjAlxj9l8vAgvAzGkGMZgkTzZ+x8hbN8JEdF0nOmgYfscE3B8h8nmWJZZyoXWAL
         k9Ug0MS3ljgDV5LFAqai6TmEWoJJMLR5F4K/2jRlhOp1iZYD7bjmvPH0C9XUUEXuoegm
         Eaiw==
X-Forwarded-Encrypted: i=1; AL+hErEqxNyNoZzss6GW8TnI5n1sPd28vwxu/0RheOP8FeJF8SMUQIsSndKSEPGrrx+4NVPyfEmrt4kQw3sKOxuN@lists.linux.dev
X-Gm-Message-State: APuU4Z8+Iehq4HqbG9xAK8ofvXAD9bKb2SysdYhRB2dL9XjMtWVg2M5o
	67Lx2Z0tR7wCDBVQwleW/tGTq2l8trKk0iPGXdLgCZPLPauIDYbTc4cb
X-Gm-Gg: AZFdTZeB5ebpnjYWjAOjEKLHbXkbhBafCzOamHJH9ytfylLp4VHo7mOzYLUgdeKS3UP
	IBkXcCGCFQ1cyTW/IQ0pr1BKA5w9jtJ8LLCEhkbQ/8W+qRbjHFWWYVjKXkfoyMc2OnudCFlQ6Kj
	Pv0WZYGncAY8ZDnF4XcKyLCl96pT8/Ffyjp0y2uau21DR5hrUm2l7zXqolDmvyuLDqwkCQT5gNT
	Thf4X7klx3caCFFikpo4RIJRDsEKjHxIHBMwDQPX1DZcsnWssSisbKkDOhpQekQLtVN2LDLqxlO
	NPv9KDGvGaeFDnbFEm9h/J6qmKpJ/uPd5EnsEsYnc5KWR+EjC+VazMmNxkRMfDnXRS27z5Ssife
	0oU5u3kPtGBRgj7xjsoEo9RbEuCxKibZYDeZaDdWJdv3jjgNWwgjYIc7wUHekYlREWTuT5Pz7xT
	o//OZ+f9/H8JQh1EO9pVyZ7vZ+xh7b+gk8aX1GbX0LzSn7kQoAAmZgtZnKHqdMWyClAhWadZnRQ
	Hx47D8gEdONIIY3hctO1cXWhdA7hKyfMGPWhDaF7xh70f5iiOI7wLbOKAK7/xaIz84jAUDdqC7y
	/kzIG44uVd+RlAwrKI/r7O9E8U1mEH7jA1Myu7oaxw+Otw==
X-Received: by 2002:a05:6000:1862:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-49c7439bd78mr26344360f8f.44.1794851922165;
        Mon, 16 Nov 2026 09:58:42 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm24171374f8f.3.2026.11.16.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:58:41 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 1/2] media: atomisp: Don't enumerate frame sizes the preview pipe can't output
Date: Mon, 16 Nov 2026 17:57:49 +0000
Message-ID: <20261116175750.21905-2-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175750.21905-1-volodymyrchapman@gmail.com>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com>
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

In preview mode atomisp_try_fmt() limits the size to 1920x1440, since the
preview pipeline cannot output anything larger. For sensors without crop
support atomisp_enum_framesizes() however passes on all sensor sizes,
minus the padding, so VIDIOC_ENUM_FRAMESIZES lists sizes for which
VIDIOC_S_FMT returns a different, smaller size.

Userspace which picks the largest enumerated size and then checks that
S_FMT gave it that size fails. For example PipeWire's V4L2 source cannot
negotiate a format with Firefox for the IMX175 rear sensor of a Lenovo
ThinkPad 10, which lists 3264x2448 and 1624x1216: Firefox picks
3264x2448, S_FMT returns 1624x1216 and the stream fails with "error set
output format: -22 (Invalid argument)".

Skip the sizes which do not fit the preview pipeline when in preview mode,
so that only sizes which S_FMT can set are enumerated.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795) with this file built out
of tree against a 7.2.15 kernel: ENUM_FRAMESIZES for the IMX175 now lists
only 1624x1216, and Firefox 160 streams from both the IMX175 and the
OV2722 front sensor through PipeWire. This was build-tested on top of
media.git next.

The problem was investigated and this patch drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Fixes: d86c33af672d ("media: atomisp: Clamp width to max 1920 pixels when in ATOMISP_RUN_MODE_PREVIEW")
Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10..046a95857 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -532,11 +532,11 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	struct v4l2_subdev_frame_size_enum fse = {
-		.index = fsize->index,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
 	struct v4l2_subdev_state *act_sd_state;
+	unsigned int valid_sizes = 0;
 	int ret;
 
 	if (!input->sensor)
@@ -546,8 +546,24 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
 	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
-	ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
-			       act_sd_state, &fse);
+	for (fse.index = 0; ; fse.index++) {
+		ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
+				       act_sd_state, &fse);
+		if (ret)
+			break;
+
+		/*
+		 * Skip sizes the preview pipeline cannot output, for which
+		 * atomisp_try_fmt() would return a smaller size.
+		 */
+		if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW &&
+		    (fse.max_width - pad_w > 1920 ||
+		     fse.max_height - pad_h > 1440))
+			continue;
+
+		if (valid_sizes++ == fsize->index)
+			break;
+	}
 	if (act_sd_state)
 		v4l2_subdev_unlock_state(act_sd_state);
 	if (ret)
-- 
2.43.0

