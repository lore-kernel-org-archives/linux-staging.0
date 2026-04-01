Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E8C39DBE6
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070902; cv=none; b=qiSasSCtm9M4EcXsKtR+fjNLP9JUrgA4jSwmRXqqly/h/yFKtyYyHacyXwB94Cuor7QhNE3urmbinAIbCZAne90G6BK3zIBSftMKPobCfR5QnjX00I50k7lKXCgZ2AUgtKgdSLEPbXBoULk8tq8jifoTBhEFPtVyog6RjON+NR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070902; c=relaxed/simple;
	bh=aOQvwFmNxOkcH3hY6TC/0qXbXfPYEsiczqDbdm09a6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVAaXhrW7c1cmfDG31PjD4WKkaW0D0PGFxGeX6B1cNhncgBQ7MXwWykEinqJzyVnPJIJbwD8GyCg05clgoTKKeNu0nrVauQr88F2AttDvtr/Qpcv9FX+kKcNX6Kt9lCT6kq1ZU9DqQumEmioA2E9b1U0dphyVflljymcVK7Z8zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNAyNPF5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNAyNPF5"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a133b686f7so194274e87.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070899; x=1775675699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a53m1M0yPC+0hsBR8rulFA+iVXVX4Qv0HU8oZpgQDvA=;
        b=nNAyNPF5f8/4NWkS0aay42PkYX0B6b9yZrZR8xVv7Hd67Fos45oPHgRNW+0zZLI3P4
         PxAiLnVo/SnJq1HYqVNtpDK/UUBho56dfz/+Z0Sut8/fonVQfNqA8fXrpzB/r8CyXsqm
         /0r+qMFcpA4IhYuH0VSNEQl6yFotlKJxCQVsh2iRTRY07+01vZubQ9bo4GF42NY9v9qP
         DDrtewfBcHvt2ZvzWJuI4CEC2fBhLhO/iUnQXXtmhKnlreOhoZ15Qi5UDKWOOTpOdrM0
         lWWenVyD3b6pD+3Tp6TlXCl2/q1c0W25dI6II2VnW/OI6PnjQMBq9DQtPnUYGv9PC736
         zNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070899; x=1775675699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a53m1M0yPC+0hsBR8rulFA+iVXVX4Qv0HU8oZpgQDvA=;
        b=d63sXRBQKEZ1jJDihvJO2/+EJ9WiuAtHuD7qQuN/uCKookL7jCsaprwa67Eu53gnx1
         jDad/R/SYgoML+PjkLGZLyVtHke6dQ4ZZtVm69blzplNrYuwDUWMNp7yP7x9X6B5skQq
         cBDb+Eo479R3HOy5gWK3SFGJulCb+zVQGEQe9Uk9t1p+TJCARiN3pw4tcuFJ/M9P9zgD
         et7h+OTUYPDdNDb+adT0IJZiq1f/HE90YgPZczV2qv5zFalWh2/5kkazto0BctLp2lJA
         xRV3ahIQvcwFmSmQ4a92ToiMhapuSO+6eOyvqqbm/caSIdBCyXAa7eJv3W4NeheDfxKH
         hyRg==
X-Forwarded-Encrypted: i=1; AJvYcCXSE9eHG/cG5rv9k9yTbsbebxIxVjRVIay+LOsriZXeuzo80ET9rvbjpOr5BHS8DydBgXqlAkxkDuFpJmZR@lists.linux.dev
X-Gm-Message-State: AOJu0YwnYcqOSogm+UAnYc5GorQiqIJ/I/WR2uqvp1B4KCQl3lvtGf8G
	k53mZUzvck4a8z43/YmdAS/VNWwIu6GzzpcLVA8h0860mnt/YtjwhZkd
X-Gm-Gg: ATEYQzxdn/gvAouI7ss5Avt9qxDCUXIQ+0bUu1QU4qw1X5q2C9vAS0SvUrtj3Qlz3ki
	SSO8w9ielb5UFHXq4DP7AK5YM8c1wilSvqS5f0DFJWpsXoDVC+KRKluxRE8lY7VbSRjR87eFR40
	fbCXe5VBOjCfHfKZ8ocAgmqUDken1PRq/OA21dMDJ9mbrwVuhokpoXUGB4gqW1Crm44fr8lpuCT
	KCzMQopC9/4hhUNodr4RrP32X/ttgJpjRK9WbPSz36x/mhWUh1lpplMtpNgR9ZQIrdrm2JP3Hjf
	uDlCKW5PLjAaPmFt0FJRO+2YxMwmQ1ljCCQNRaWD1/+Aki8EFWM9yzH4TJcLUYOr2QITH613u3Q
	z3+sg+HP7wflgUqOlxP5UfuI9XNHUREEkl5PQLKUiBRIhQ+LnY9C+v0uybcr8nIABJmd/4idpiD
	W0xnP+ETw8ezzN5T6z0QXuDTRLIg==
X-Received: by 2002:a05:6512:3b87:b0:5a2:78fa:2700 with SMTP id 2adb3069b0e04-5a2c1f3c4d5mr1943599e87.23.1775070898394;
        Wed, 01 Apr 2026 12:14:58 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm141855e87.60.2026.04.01.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:14:57 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Date: Wed,  1 Apr 2026 22:14:40 +0300
Message-ID: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

From: Samuel Holland <samuel@sholland.org>

According to the documentation struct v4l2_fh has to be cleaned up with
v4l2_fh_exit() before being freed. [1]

1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff0e2..1d2130f35fffc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -391,6 +391,7 @@ static int cedrus_open(struct file *file)
 err_m2m_release:
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 err_free:
+	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 
-- 
2.51.0

