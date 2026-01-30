Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D12837F0F5
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777400; cv=none; b=a1JNdPovC4mTgHGIt1wOknTrUgmN9F1svefhGADth7ftXA1bq+q5qOmH6ZcChRW1m5tSz3mvmP8mm73ElBbgF9KjxVC6v8OItQdkdle0o56iz97eYc3XOF+EBx2neXx6dFqTx0WroHBIvSHy/2E17noBsAnVAZI/LyJlzGWuRxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777400; c=relaxed/simple;
	bh=/SlcgcoXh6qESEbxV+NcpVqvXpkWkqApdJg+bzGWNTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OxvKMBzFpJ78Sk8Pz9eL3J88Rnjh4+FGVhUrYiySvwjgCkh6aoV411QxFpdjkF/psxMLX+z2sMvXcO61sTNDG5gAPYGnq6yyK2bGHh1TdvR9bOCXYt4yXrbiNzs2q7PvjJ7NJ+tRM9q4e5FZKZe3P0/zZ3xfp40+Y03Q1hpPFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH+jdrGm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH+jdrGm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801bc32725so15787475e9.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777397; x=1770382197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDyuTxJQ2wPWDIlHnScBHP39ldpO6z/HRmLWZsSUiWM=;
        b=NH+jdrGmqenn3/Fb0YV3INLlk9iMPEP83EpSf3CLsoOjyRzyfXXB8vEHNpbzLwpTX+
         SINgqDUWGIbEpWfyn8Dv8NkXRaTk/Mwg5gsFlJcCoQZ38Ar1Y2u9JTVLJ28zlsj3MjsL
         CEML0TpR1aqAGXKbMdJrBdZqtiuyQ7O458pVqaCJYzkPjhJ13xQb2GKHv5gupx0Suf/o
         CDzUOwPuhXpIAdPKaY08KRZ2fEJg6mnqZUNCikWISsjmi9OQWgCN43eLh1MqsB4iamJC
         sjVLoL1quCfskelhlPfCMzYmS2GY19M3ovDwmD34+ELqzaT8OBR3u/BpPl2lbyH6JG85
         52jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777397; x=1770382197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDyuTxJQ2wPWDIlHnScBHP39ldpO6z/HRmLWZsSUiWM=;
        b=NuzPDl2amf9gtDI+/eJF4hpG+0gn/+nTt/cJH6moCMX/fj6453kyPyFzy5DJ8TylMm
         VsPb1rDp46SpB+cgJYMzOBBE4Tspny7Wm+i5/3GDgibjFwHuFdzuLCJKgvmiLwXy3ig0
         OfW1mcc8yXdTArcJZ0g51Ot/0MniNSiiBxC7/BJeG52x3G/XzbtyW4Q+yMcz/9ZYl37P
         MnDrZ9UoBykS90G9/sSUsfoprKwhJESAyzpgwpFMSLP9GKoSTtp9mEb0WW2KS3PsXLUz
         Ptgx2zlO5R21v8h75IQswJbFfDdb00OeHnn+Vkc1pJWsHJe55vH4yG52U3HY0Dzn8q2U
         Qs4g==
X-Forwarded-Encrypted: i=1; AJvYcCVkx615yDS3CWNAkR/NuRv80IXS+8GY1nkc+UYBNkW0rWncHB59bIYtaguntpG9E2j934p1chFCz3bO541/@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5jKxyAGa/2g/exyEEo68yXRAYFALN9jw/SQlfmbI105QytovE
	z9lsl3rqAXanrIoXEqxvrnB6WFkGtENj44gcmqL17lXSxariuvmDhEQU
X-Gm-Gg: AZuq6aKYnwJUt3tVSmkMQHcRqOS/bB+MC+OaT5Zadlit8ybudcYeWevftI6so/Bjvbg
	s4afKcOgcPhtc7FctLyFKj4f9i5ZwtAE3EOTL6MTohjZuREGyGE1Gd8OiI4DaI4PxSlBYMU6xR4
	e/xaN+OK4CICBccu1bEc27C4ezcU8W0wBcKfOK4XSvw5b1GTJYVM5hEy+F6WWT4tR8PERh9AaLX
	0d0bXMRNSmOOnWCsGqEXQq4cCdMAhn8RcJEzB5XH8ZOvKKKG7etNHM2rnrqzzgksmC3amrpJM2G
	6jEXLYTQo6d3G/VMLcxHZkedR6CZhtE2zgPnnnfFUnq4anxVYoPM/vCdJu2E3ijvcXquWUcMipv
	bihco+ysCbvwW3jWkNRutWBi53OVcMquv0deESbK1vDtrHhXz49vNrmcaOBxEAacUyMBtIlBq/I
	7V9cjuUxMOx3c=
X-Received: by 2002:a05:600c:a00e:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-482db4bda8dmr37743845e9.16.1769777396741;
        Fri, 30 Jan 2026 04:49:56 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:56 -0800 (PST)
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
Subject: [PATCH v6 02/15] staging: media: tegra-video: vi: adjust get_selection operation check
Date: Fri, 30 Jan 2026 14:49:19 +0200
Message-ID: <20260130124932.351328-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During __tegra_channel_try_format, the VI (Video Input) checks if the
camera sensor driver provides a get_selection operation. If this operation
is unavailable, the crop is set to 0. However, if the operation is
available but returns an error, the VI currently fails.

While this works for simple cameras with a single pad, it creates a corner
case for sensors like the mt9m114. This sensor provides the same operation
set for both IFP pads, but returns an error when get_selection is called
on an unsupported pad (such as the source pad), causing the aforementioned
behavior.

To resolve this, if get_selection is implemented but returns an error,
try_crop is now set to 0 — treating it as if the operation was not
implemented — instead of returning a failure.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 4b80086f8c05..70a84158b589 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,17 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret) {
-				ret = -EINVAL;
-				goto out_free;
-			}
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.51.0

