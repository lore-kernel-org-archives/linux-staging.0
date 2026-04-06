Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6BC2D8DD6
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513656; cv=none; b=kPhLpDArNKlJaxSleDBfb5dd8xFUJC0CH2I62Tgv+sFDsl2BAG4VHNSjmYLteI/+NmB0AyLFSMfB7bTISMBvqaZsKYXXqAo3jUKLZzRPDT7uu0PAVVurnPajKokqIP6dCsn2enJHrP4W1TmCk2J9ah9E7czhsro7tNMdCQiBGjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513656; c=relaxed/simple;
	bh=IyzDmVjeEnRf6+N6CScLBbeU8C6QP2hQxk/cAXQX89Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ta9zJBtRsnzzeqywhufjM0hLImBbcZ0ThbFlDVcZgsfiSag4uYL4skRUraCKoD8QtwUJNMxGgwaadPQWKYIFWD2hh76QruZD4vbrCUeSY72rMOoY/lr28egnPZgTONY/1YMLEyH6a0oW7kwP7PwSdy9qaAq9CxmWD8OGlHE8+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIkmidw6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIkmidw6"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so5400494e87.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Apr 2026 15:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513653; x=1776118453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs65Y7SOJhiSPJ4nfKCjyK6aCu/upRFc7BfzdjxKzvk=;
        b=XIkmidw6CmlSgFABuFnpVc6jvHTO/aRhBTjk284ZRBD0Pf6jkCn6SsWDiG39V1koiu
         e8E9jJoLuHOeAVWtWVrNpYr4a4xXPmBmALJUA2yfg0Bb5LQUB7X/kVOu9dWKp9pPd/Ts
         Tt09LnIaTebsXqxXUEz6f54kSNnTnzQ4EGAq+FBC756KzWAsZbygvpDSmg/48pYR1baA
         DpdaJqFYEPLqjdto4S6GUKln7A+cmcQy/DPRDXcX9Bqva0T4sejDKwwy1yuDM9Rhs+r4
         1EEmZ9/jMcbtkouqNHaDEnh3322xE8MwcWbLj1RKUJ5k4YewKqDnjsd27pQatCszAvaE
         CsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513653; x=1776118453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs65Y7SOJhiSPJ4nfKCjyK6aCu/upRFc7BfzdjxKzvk=;
        b=jYm9NHlayhdEo5Mt1xNjrxreTMZk450evWHU/emZ1GhiE3WnFPdFMPQIYLQP7IMOwv
         0q5atYJpkwGAXjyXyGPtdOokP0hTbUJOgoc7VLnJQsxNalouReXMwknvCyoGYuLfGprX
         ntb+dw8DmVO9dGlyRMd5c24WxbmiGbsIPuzMHhzurLadkPFp3kt7Wp0Sez4Nbqqf/uga
         msejyfC4zhW7570z+CI0rC8XpmGrAmUf1FdvZ8SZ5XEkXtBDYv8zQoqzy9NKP3VHPy3I
         hWMVxW5U7eZj8KrI3XiaF7QG8wefkWvifQuz1iWozaCD69noxx8NnYuFH8g8aKilV7Yo
         TNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC+LxoucEn8/Od+VSwG2kzcR4uSLJaKM/ddH+BxCC6enxsJXfxJ0gYV2e3gfQf4zx0ktiF0IARSNGLsU8t@lists.linux.dev
X-Gm-Message-State: AOJu0YzcDa6eqyEqNyvWy9a0m6xQyz4M6ZtJNst2kw50a7Kosg7mdDeQ
	VYneXlGNV1pzFDtcI5EXc2ZrEhFeHfZbPYfX5WAajByUwcI6KpJcIhgh
X-Gm-Gg: AeBDiety9VDGYTn+ZFh4Pe+YrE/0eURJ7bhVoijQfzatkxdZqa32ZIf35Y4Pd2JAj0F
	mWmwmvWPuTm9D/ARa5nbe0xdhviJJtqmrV9atIJsnKEPAgl20qY+SqSQ0gINjpURuncQxFiPGPB
	Yc37YlFmgJVEKa5FyW2sIZePn7JwifrFANnWvO15dm6LDb7IISNHp5rzqjfHIMxPJ7Xlv3vp0ml
	5t67e+OLFVDgjwM1VjMzDNX1s4SAXsJnNrR/ULu7P1s40aErW39qdqnMSPTKLNKMYJwZV4qTmRH
	ZSYYo4Mv2H6hSqTtpIzHm+9f9BYkNVUqTaE4dSvhgw0WK6l9PniQYeuf3NcuxmHl9NSdJEIiygK
	wxhr7hX4ALh4EVWJeRK/heiqzpmzF6jk5bgy6nQ3jPeCnmd+ty0ws36I/NF3foDJqXYS8V03err
	4HZdZ1GSoiPVdtoboTgECbJBE/6A==
X-Received: by 2002:a05:6512:1151:b0:5a1:448b:317b with SMTP id 2adb3069b0e04-5a337591959mr5666904e87.42.1775513652798;
        Mon, 06 Apr 2026 15:14:12 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5f90sm3738693e87.49.2026.04.06.15.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:14:12 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
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
Subject: [PATCH v2] media: cedrus: Fix missing cleanup in error path
Date: Tue,  7 Apr 2026 01:14:02 +0300
Message-ID: <20260406221402.3721777-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

According to the documentation struct v4l2_fh has to be cleaned up with
v4l2_fh_exit() before being freed. [1]
Currently there is no actual bug here, when v4l2_fh_exit() isn't called.
v4l2_fh_exit() in this case only destroys internal mutex. But it may
change in the future, when v4l2_fh_init/v4l2_fh_exit will be enhanced.

1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---

Changes in v2:
 - remove duplicate 'in-body' From: record
 - add details to commit message

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

