Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1F3859C1
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777414; cv=none; b=bwvIIl0NQXLtZFMcW/UjeLuQhwtvzqz44F+vY8JUu7JnygqUz1O/b6aRW9fPrFZaNoZMg37KH5I4gZF9PY+N/GrlKhDuqnQchlxuXvWGTR7w8OYgmqze6zPNSMURyvB5hECWsEpAY1dMU3OhBI2eTf6NSxxzR8TfV0PE2WQ61os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777414; c=relaxed/simple;
	bh=1gog1afMORIsIGPfEuVIVFQI1bsAxNOV2bdjIS1D/tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFAebFRmQdIZH9hZOExxtaINnchDEETFlsgY40LfMnQnZd53ycSIZf0m3URcUKPuJMj/zSB0UCq86elPH1l8pyNMFirSl2v4xRxsaLaRwvntLyCcrf1n14NR5Ml9xfku49JHDK1+3ZWTTc7klAnt25Xf/aKqMlLgl8zsv/HTKcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6an4JCw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6an4JCw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so20048985e9.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777410; x=1770382210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=j6an4JCww6tJ4FF71pu5FOf8usnKlC0lCqhNK6iod8bUuqAXuz9ekJkG3R/5Ti9Hqx
         YMUWM1SIiCYPtzqsMOsgBL7s1YD0rTl9Gfkas5C6tpk0WB+mp7yP2RkPs6MGseUUqjDL
         teU7ZBi4p+v/ufV0FZm5/clrLdme8yk8IA3vzcBv72+RhQYNLIXw+5fHfIIyWB3DEc9x
         88m9dMeT2d0TpysRinZ8NQL8t5CqEdQlOpKdTQRdBczzVeWfHzWYbxtM+rQk03SqOyf8
         2SvvmyOxB4YxiW1AlA+TWtndbLcjX1HL4XACO1DNIx9u4T1gQ3DK+2LssKloak11iJCH
         r5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777410; x=1770382210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=YrbiWHdlJpmwQB54+ZJtkMVaIwgA5WUANg5qknfk2R8OMTZy+FeQQX1jlThj9qqewh
         Mh+0Imi5mRHaAYkPfN4kHzA4mon3xYalbOcn6Zf7BdzLWQB7u/wxvrxlSidSxYRS1cMo
         qmE2OF0nzJB5bemIg8Yzc6eEu+6DRDIBgfGycGOLOSNSHwSVT0HppgfoowIlSH3ymCvc
         ulWnYlazu3t7NlMOBIw8p/nuXVC4UvkQ3dT/W9eKanOxcXGYxuPOYOSQFa2vDMHGtXmC
         k4kvQlSmydFqDi8WYdec3uHSok9yUo4YdgySeFTHD4KimbocRAzRYjlOGq9Xf+EuJBNX
         oSVA==
X-Forwarded-Encrypted: i=1; AJvYcCUgh/jfco/VtAWNShVY2Wdx1cf5KBUybMoXn4imptHpZfSRNVKXzG5ybaK3HmofJhXLc7XaTp9in/TLyGWL@lists.linux.dev
X-Gm-Message-State: AOJu0YwJxC52xgqRAWHq0bTH5EZwewC2uBErFYTHMsC9eMrK/NYLhVVe
	4LXg0EjkeDcDGCk1abTHVw/V0sGh6bCqL2i1nXS7KYWONTu1R3ozp6+j
X-Gm-Gg: AZuq6aJsf8yoznQRuyck3Hgk/UZMDQ9Y+tIrLXYlaHh32ahykMF2a5BBNXPS8YmA7RL
	27KUIa+XRw3UjzIhA4FfgscHlnSx59oPEmEdxJ/85/cXT4TZr7JUe3/3PgARGqpzuwhQXICx8ni
	/GZqfzwfTfMb8DePsJtFh9JxJSNWlK7O6aUOgzG/JZtCGys0nLECQxJK87sfzlFYFua73eqmpz1
	u7aZY1FfS1rq5US1eeCjiS4faVFmD7EdWsJ22StGOCuJ1MVgNGcSDA/2IiVqHznvRoHVF3lRTwK
	9xDtoldXLXEulJtMkosXFZ8feXbQmY/x3RxTvGt8V4OGD+4rdm81NUx4u9xJdadd99yZV1S6bRw
	Uagm1ukFQeuaDruBdyHTy13WEKFQKWmRQPTLqNw0RCcjklwxTFBH1nqx6q3hGXNYkHr+A43ECNd
	2oNRrld6fN5hE=
X-Received: by 2002:a05:600c:a4c:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-482db45770cmr35972115e9.6.1769777409790;
        Fri, 30 Jan 2026 04:50:09 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:09 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
Subject: [PATCH v6 14/15] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Fri, 30 Jan 2026 14:49:31 +0200
Message-ID: <20260130124932.351328-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 36a57078d539..1b8f2a2213f2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.51.0

