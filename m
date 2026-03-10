Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40DF3D091D
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173131; cv=none; b=jr/AzHO37BwGTP65MYljtx8h59XC1KO+rzQzM2OxxglJ6iRrkeOs93mejcFIz7ERPhxORycS0cYGUk6BWw5Hdo6oh4YMeAXW2eEy781dTMkp9Wj4zGKbb/5zhJ3JjMO/9zuaFEyTljh9vJS7v+bY7HOF3NrmKRPBonA5JW4s9xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173131; c=relaxed/simple;
	bh=Z7KkLhRFeePaDbwSTDbKrcgBLW7TjWvswDGzCPD4kT8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ssAsJqjV4EHs7OuD7gEfevI3CeaWEFFRFYWLuO4shxqRsONlMHtxNk49PifA3UMYpOGA7pyThXWGSuFWTwrllBJWLr4HsecnVDIepHp9H5CV1mzEBtjU8FCFBDe+tGwGxJSaj6tF2t/vZyxH1ydCIXIqk7fGTZnKbZ4gdeYlSoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fizOCbfX; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fizOCbfX"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-829ac8d56c5so3914857b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173128; x=1773777928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=fizOCbfXdqX0upQjevAEfuqTRHd+2bZaLGVcA6GlZhHxzKBm9fAXAllsyPNOlVR47T
         VSIl1Sgi9wzIMcs86snqv9yiu/BslmyUcdLgH9PMqiXS+9WU5P53ZhHNHFUdkmJXvlzp
         uvYNko8h4biLpc0geE1zkozmzN5z/9eLEwe6tWHFSuuIGbmhEjMA6DoG/WezeZyC/sY0
         Nn5e7iX9s4OffETvpICIWAVhGM114Rpt2B6WRDwt0l6UBuf70CN1lQ6wl44FpwV3vOVT
         G6mpeuDPok2vKL1jRSa0V6+nUg1wrxrRvoObA97BzN5lMVckPSwRbbajAecNQRDp6lMz
         WyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173128; x=1773777928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=KbXhXQch+2FvcExhDRqtzqXg2LO6RB/i75pp0R5JJL2sAUNYT8IHWRLliagQdrjF6H
         GjAwM7mQlQFiZzUm5VNZHRAdPP3WtLRk/Y1nSlK5aXXMbgTki8FwdsXIqg+Kv0vcahpF
         ps6ruXlvcWfSjryHbHJwwXNzwvQz2iKs7k51iHyqc2OBfeR47PaoYv/8NI10Rr4Pkesk
         JvRVIASF4S9vOzl0PXnM1S/rm7W7AqtlQ3DC8XXDs/TTgEudE1GeGuw+FBB7V2HQ44eu
         xVdzwjFxc+6MzWyrnVT9F0jB9N44E3mqjIs1Ak8pZ7mHKrCMs7qa2SuY9etBadLk7Zfv
         Crcg==
X-Forwarded-Encrypted: i=1; AJvYcCXD1XTiK/jWHVYMOYZfBtmQSaqR4OArgAp4RNhSfNh+I+krLF/v6yO9Ns8e0MaIS2mGQmLA7HOUM2EURSyU@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvz5YyPdAi9U010iui77MfytqXCewbECSMnjgSrQJeOtRyA0M0
	cpAGUJBU4NsQ4dum6zaYiiNgba3r6ZRbCrzc5uaZHRnFfn6CXoOXz1jn
X-Gm-Gg: ATEYQzwkMbjUUp+BuFMIsX8nH9qx6E3ByiEih7IrxotimBBtGvSM0A1fbUV44RhjuoT
	6jDh5kK78BK0Doh8f4bWN7RroQ1Wizvj1hRqIg0Bj7rvXbIkqnYKewBtFQ/UfLkSJ/PXmRNa2Os
	A3CNGGLBglPb/+d/YWWan5+q9gs15T+r+MXZEx+t00ja7Etwm12LsI8m39sKnitWEsHNcNLYA8t
	a2JghMYePmKBVlcPB30a2c8AjTBckzjK2jQX7O2S0m6YsLT9RyF7Zt/eYoObKmy4JoRnTM5XS++
	UWKhETD8eJ6XxykXCllZjq+FWsOe/PMLyvPo0fMPHKfz956SOW489URQEesoWbkwP79ly2Z+UqO
	hsnKbIN6eQIbZStLYdqi4uRQhKoPZuev/pGHxSFzhcHIZgJycdf4zq4CWHjli/kIagFwiiYyOQj
	Hi3TdhQ6lw5EXQLuaTUPrF8+yg/LgWOWqBlm1w/qHMoMB3p7ZT
X-Received: by 2002:a05:6a00:4fc7:b0:829:8bb4:1030 with SMTP id d2e1a72fcca58-829f7104ca1mr127969b3a.42.1773173128160;
        Tue, 10 Mar 2026 13:05:28 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:27 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 0/7] drivers: Simplify cleanup paths using __free
Date: Wed, 11 Mar 2026 01:35:06 +0530
Message-Id: <20260310200513.2162018-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Hi all,

This patch series replaces manual cleanup and explicit kfree() calls with
the __free attribute from <linux/cleanup.h>. This modernizes the memory
management style and simplifies common error paths without altering any
functional behavior.

The __free attribute provides automatic scope-based cleanup, making
resource management clearer and reducing the chances of missing cleanup
on early returns.

No functional changes are intended in this series.

Testing:
  - Compiled with W=1
  - Build-tested on i86_64

Based on:
  <linux-v7.0-rc2>

Feel free to share your valuable input in context of the cleanup API.

Thanks,
Sanjay Chitroda

Sanjay Chitroda (7):
  staging: greybus: simplify cleanup using __free
  iio: ssp_sensors: simplify cleanup using __free
  iio: st_sensors: simplify cleanup using __free
  media: mediatek: vcodec: simplify cleanup using __free
  media: chips-media: coda: simplify cleanup using __free
  media: allegro: simplify cleanup using __free
  staging: rtl8723bs: simplify cleanup using __free

 drivers/iio/common/ssp_sensors/ssp_spi.c      |  9 +-
 .../iio/common/st_sensors/st_sensors_core.c   |  7 +-
 .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
 .../platform/chips-media/coda/coda-bit.c      |  4 +-
 .../platform/chips-media/coda/coda-jpeg.c     | 39 ++++----
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  3 +-
 drivers/staging/greybus/camera.c              | 27 ++----
 drivers/staging/greybus/loopback.c            | 35 +++-----
 drivers/staging/greybus/raw.c                 |  6 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++------
 11 files changed, 78 insertions(+), 197 deletions(-)

-- 
2.34.1

