Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6F75809
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543339; cv=none; b=qx1mfxFHV3UD9KQmDTmOJ/1Z8BfFRdrvney/Vs6dJeh/DswAoUim+so3EAhUTmQY3G9vTMae4dNMema+2/cgtb03ojhD+Vo2pNuTnikC5c5d/0GpKkb6yShCc7oZU/XqNeRnRlo/MuJP8M8u0Zkb9n40rPrpgNpzd9Gw2POtoMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543339; c=relaxed/simple;
	bh=FnsURhbwub914yAdhXH1FXah1Lu9rnIP4/mLkjigKiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQtIv91CuCuKnI+FtG6mCMyxjYKhJUzUuZdbkHmIWoxQShUkBcJVauOoKc2iPCjxvib+WoD9wZzbCv2LWlBafXuDEeGU4NxbAMUCWlXGVRBzq21by4ELt1uYsR3p/C0sSumxEVmRk+0Smtqrz5KI8BRby1poo8hsvfmq+r2TO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=Vrq7To7X; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="Vrq7To7X"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49258ac7294so11978255e9.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543337; x=1783148137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6URRVOLLPbDGmOPQIy9/O+A7E0jEC0aohmFeB/EeHoE=;
        b=Vrq7To7XC8AfqYSBIDLsPF8li411YjPQZA9Pj++2MJxNs6tWE4R3WfSJuabcJpokTL
         Yz9X/im4WweM8DFSZUvvbXzIxHNOsjObcwUm0PDIWNORUp+fpsTVNi2NrA4B+dRNJDfP
         u88RacwZY9vL0+46whjtrEqMgXkP9F8shoduG5WC+h3/a2mDeZUlLd+m9i94QIP8HzKQ
         ECeqDGHF2C8olgc+4H4f77ogDBVarMPIeygSxFVRQdiNb2XeXQdAvLCOe7bbfjDwX1tf
         xT3IEPGqit4Dyg8nWNPV0dj34FsrmJjCB+95YAaA16xJxxyMnMV2wr6mmXV9bpi6Jeb/
         O/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543337; x=1783148137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6URRVOLLPbDGmOPQIy9/O+A7E0jEC0aohmFeB/EeHoE=;
        b=Lw903nOTh46umu7yuN0O0dtI5YS7ncQBbNVcvpou99h6h9GUhrGrj6c9aIaO/CB43t
         nVC+eA/fmZo7RfCtwr2VlotDkPgE957TXCB4cSp4CqBdyZdvVsT7QFXxWTg3Kh3mWIFu
         3GUDx8UVAVTHk0D+HtPZzwWlOLJcoIV+y39Qg8mPNt+ZhyXbN6hjwMYjtMn54xxAkFHI
         T1ALWU82bmFAsGakjSOWUsinE8m6QTcgpb0LwJm5dZGgKIazsUTMK4YVB0MtRbs5a58S
         sbWTkyCvvFqsoh3giQ+LW/ZGWc4mHvA7tH36mhAoXxg+VjS9lupviqFeD0HvOEayzjYt
         2baA==
X-Forwarded-Encrypted: i=1; AFNElJ8tHJwJtukdSprFUO5cM4GvlhhmLf5iYPGyIsU8HCk+MksYByOD6LfpbnxdVXe+Hxot0YHnh1yH2d2iJodx@lists.linux.dev
X-Gm-Message-State: AOJu0YxVZzUxQHs9TZIFpxycrbFSMIQBcgWnrkUpqv9w1r7iNBVZLKXq
	v4QkSyLe5ebNVVYHobXFJwwFBoLkqPS24cSUIP/+aJY83Oo4ZfjwKZhxURFA4MP4IUcT
X-Gm-Gg: AfdE7cmZhAn4xjtkiKKaiva6/9e/jmJZZNiTXuIN74G12a9yzT6YjTFnCdBmFrP7l0G
	miQNmKFAw6s0TV/opTPIAMCLIKJYWQJrHyi65PvNrIb46GLehPecVdbv+dOFh3CASGlTSrmnr73
	/mgPbn4KKCAflzm8/6tLEFv5duO4zWDV/9q5mZkKu7lOjKis4kOT9ow49OVCk3Tk9dnJjH8kvUo
	JoEXILe3R/XTgfMJ1BQnjUMuizeUYxm/umPvFD98Kbq0/a0AzvuDQhbyNS0hUjL38fjrUHPHYtV
	8vXx75PUIGXD+4HFkLfdi2p2Chla6CJ1QmdDlbAbA1tbE+4NrILAqDHCB9F825QEuftlfsjGEoE
	usSbrP9jFpTgSyCj3FU99Osv2vI/XWDl+qA0d/bNTRHm8jCpm0ZJ+QzOwf3CM2nwUyERSTURBQI
	xD+Sy0Q4VQD6dXcEBh99Mk60EGVFTtjhRUt4L4QeZHNfbljf7u8B86Hv3fHFEsulxDG206oVMSd
	sbxZrTq1bDhfcZ+x6BhauxTEbvsFLyO0rg=
X-Received: by 2002:a05:600c:820a:b0:492:6eda:4296 with SMTP id 5b1f17b1804b1-4926eda42afmr59822545e9.8.1782543336727;
        Fri, 26 Jun 2026 23:55:36 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:36 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 0/2] media: meson: vdec: fix two more VP9 reference-frame lifetime bugs
Date: Sat, 27 Jun 2026 08:55:32 +0200
Message-ID: <20260627065534.88527-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reviewing the earlier VP9 prev_frame use-after-free fix, a
Sashiko AI review of that change surfaced two further reference-frame
lifetime bugs in the same decoder, both rooted in vp9->prev_frame /
vp9->cur_frame not being managed across all decode entry points.

Patch 1 clears the cached prev_frame/cur_frame pointers in the .drain
flush path, which frees every ref_frames_list node but left those two
pointers aliasing freed memory; a decode resuming with an inter frame
would then dereference freed vp9_frame storage in
codec_vp9_set_mpred_mv() (use-after-free).

Patch 2 guards codec_vp9_set_mpred_mv() against vp9->prev_frame being
NULL, which happens when the first decoded frame is an inter frame
(malformed/adversarial input, or the first frame after a flush). The
function dereferences prev_frame unconditionally, both for the
use_prev_frame_mvs computation and for the previous-frame MV read
register programming, so the NULL case is a NULL pointer dereference.

Both issues were found by static analysis and are not yet runtime-
reproduced (Amlogic Meson hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Doruk Tan Ozturk (2):
  media: meson: vdec: clear stale prev_frame/cur_frame on flush
  media: meson: vdec: guard against NULL prev_frame in
    codec_vp9_set_mpred_mv()

 drivers/staging/media/meson/vdec/codec_vp9.c | 37 ++++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

-- 
2.53.0

