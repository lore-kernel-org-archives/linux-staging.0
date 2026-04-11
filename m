Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DF62ED17B
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 21:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775941896; cv=none; b=MRAGx1HMR6BXeqzIHWSYQ9q3bOWO3UPbbawdPvUgR2uwEZo9wl7D1e63bjYRckiSEr7OMRgP1W08VD7AxDxxv3h4uRHmoS63HK5WO8mH1OgD/oHGtoVuQZYcdoAibAByRNTW0Rx0lVs8p+zgl7sb3IlVxxB1JVEEBtnz2lXbjLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775941896; c=relaxed/simple;
	bh=gi15hcyqfgdadvIhdvu5Qn7qP7o4w4fImY4nXxFjqQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sEO8ZBkHbWop7nKv/qYCVvN/JZMqnfzhUD+9zOJ5M400rrU5cCPOcpRH+ZNIVUFJSjq12IzicVYKXSkqVIJ96nBEpPBKEGd3hKKfHj2E717bOhd8/8CwJEv00tD9JCwIF+yblpxx3Pni9I3yMeZ25yNtzCX0QI5MZ2BFLk2nqQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGjGVK+i; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGjGVK+i"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66c24b42efbso4842325a12.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775941893; x=1776546693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sJmPJWyRpJ6XpOWhqHf2lRa3H2nAMFw7nJfxUU+y3o=;
        b=YGjGVK+iDbQ/Wfp7AIL0SRezchNRcfci9YaWIwDfExWOgfUMY4ZdWtJprUEMIeAFvh
         vS/KANn593HbvgIw+xWi0gOfphmsxUb0+boqVKKmMrEvg3aAYJvkVl3Y+DeAB69kFpdy
         yjpzPlfd+dJikhUmvfkmF1Vcjn1doO+gBJDbEdv/0r3GsMIgPw79NDx5/SkAIFdqhQVm
         CS5v22RTK6pwxEmHs1Q1uuWBlH0JDAEPycHu7rZgld2dSyE4gejFa2629ZxwJjG9qhbv
         njlYZa3JAyX8hKxEngV8PnQUKZL9bOne3BvEQiTKwZUjcalSTvI8kFYl7jMCiqaOXy8k
         xaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775941893; x=1776546693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sJmPJWyRpJ6XpOWhqHf2lRa3H2nAMFw7nJfxUU+y3o=;
        b=N/izsCz4x/taYbOL5kaEpg2zG6i+gsftpMU5PZ/5AfhqysmgkcADhLbq72K1qWJboG
         jWK/IhRyqPDJVOjNgxAI61lOpJVufrsMYUBz4D+aHuRo9ymCcsiBICHXfexAhO3O8xuh
         vNplhDZjr7S0AOaW+OnTfXvcrEim0FQqxWqyMEnAqGit31JkstCscCgt70xDPT2J7h3l
         m7Lby99prH6gVo1A6ImQlYVov5hOpXeXysMvpPjoTfn4TK8rqnXY/joQx75uHqFqPvDj
         t1+8BJBJCSvjkWRT0wosRteXIygYMv4F9f+UzlKl330wqpYf1F11/q5oj4Pn/DvIgwtn
         Da+A==
X-Forwarded-Encrypted: i=1; AJvYcCXN6XfBeVBrblIh6h3l7MhGxmVPdzL006hCSfp+cdff57o2i9RxwZ9UeU+dp0MwqmQw9AQzMZskxsZArsHa@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/+2S9NaTMQat1VWrxU6gSZ2moVIIJw7X8MJA87c3Bfh/0KNUP
	JOqUO68ieURMJXCwaFy1utOPuBXOhlK8ntkdhK6Csk3yBy350ZG6N1+U
X-Gm-Gg: AeBDiesLSiEX0zIL0KV2En33gYUFskzCpkTxPwmME4IJKz1crNCZ8sR6UzCDsOjsbyJ
	GQOZtKbnfoyRbKT9Iml6g5JT2Z5nyUs2TLWY9io2i295vGmiZEeKgX8/Onhopj+0AS12Yp8E8Cq
	Xm/t6L08Ln0W59c4BQC/0TL76CaC05ySijPw9Ac/eZ16H9dt+WbvxjdBAgKzdJh8o4S6eTgFK7O
	KKM2jyzgJw488rHXKPJszmoBEgJDGhe3VTXSA9Hcyipc9zvg6UX9UEPwQTJto5JJ9oqU5kXmN7J
	btevZW7zjD1xC8Q5P1KhOJXOr6blE6ZM0JwoscCL/GPnG15pzoZjMeNcEBOISYY362rSN8yBHE+
	hBp20zH7Zfi/k2iZqebhUZNdv9SW+B25MBLOsDdoOsgBiF160zycsj3ZGw+EvtRJnrd8OOTkblb
	AeOvoBK2RtvUPGqEi73ADXljS+8QcBIMalxpZUj55ea3+tZguJtjJPaajm78XRKEQrzI7UyvVaE
	kmR0diY9ijDnBR6SLZXdaBTa+Ff/dIb0HfWI3FrSKc03zzACo0z6IPRxkoVWVknrwW0YhzV/0ql
	meEGiA==
X-Received: by 2002:a05:6402:280c:b0:670:64fd:2301 with SMTP id 4fb4d7f45d1cf-670795162d8mr3722324a12.15.1775941893193;
        Sat, 11 Apr 2026 14:11:33 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec8asm1511110a12.2.2026.04.11.14.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 14:11:31 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 1/2] staging: media: tegra-video: fix wrong return type in tegra_get_format_fourcc_by_idx()
Date: Sat, 11 Apr 2026 23:10:04 +0200
Message-ID: <20260411211006.150782-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is declared to return u32, but returns -EINVAL on the error
path. Due to implicit conversion, -EINVAL (-22) becomes 0xFFFFFFEA as u32,
which is an invalid V4L2 pixel format value.

The caller tegra_channel_enum_format() assigns this garbage value directly
to f->pixelformat and returns 0 (success) to userspace via VIDIOC_ENUM_FMT,
giving applications a silently wrong format descriptor instead of an error.

Fix this by changing the return type to int and propagating the error
correctly in the caller.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9c0b38585d63..afc7327ef318 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -77,13 +77,13 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 	return -1;
 }
 
-static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
+static int tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
 	if (index >= vi->soc->nformats)
 		return -EINVAL;
 
-	return vi->soc->video_formats[index].fourcc;
+	return (int)vi->soc->video_formats[index].fourcc;
 }
 
 static const struct tegra_video_format *
@@ -395,6 +395,7 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	struct tegra_vi_channel *chan = video_drvdata(file);
 	unsigned int index = 0, i;
 	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
+	int ret;
 
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		fmts_bitmap = chan->fmts_bitmap;
@@ -405,7 +406,11 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	for (i = 0; i < f->index + 1; i++, index++)
 		index = find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index);
 
-	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+	ret = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+	if (ret < 0)
+		return ret;
+
+	f->pixelformat = ret;
 
 	return 0;
 }
-- 
2.53.0

