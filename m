Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892F33F482A
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944532; cv=none; b=aU8ct6Q9DYsvzDEKtfd99cY8KMdlRQuz/iDKx9wGdymurjWc55a0uX2KcfiI+/WsgC4VM7s4C3YysFjf3Oad+Q3z3Gf88UgRlN/LHT1y1m+qnWnEhaqqf8f0P/dyziqURortVE0HAuuL1IQ235lqtoO53evS0Jf867/IiVIkgO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944532; c=relaxed/simple;
	bh=K4ILPUNRBeoP2Zur+TEHcw7nDTxcQwJCcj7zlQ3bEUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwfVUEJT50/UqofGRggNW1l5b/AcbvcMRhMBtpFl8yuf01BqdQ7HduzyWKTCJlJLi9RWa2Pb/PACnjlfzLsRi77S4cy9V0TF8OWjTRRNUCdHNBoT5h9/2OYXZyIxjwGTWoHB/bDdRrAuX6ubpzuyPsQSiY5V+CDZrPEockH8JN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgSWj6l7; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgSWj6l7"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e041ea211so552051a91.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944530; x=1784549330; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FR0HREIu+ElJTqYD8DnR97TKZwOpP6adDHM14P7pQGE=;
        b=pgSWj6l7NRo24QlYTnMHU95uvXZx5ovTaEU+hpoe2VXgBicl+uuxE+pq6J4GZBsXWJ
         Zz6w2HwUmkogz5rkb7qsCsOkOAmr3wHs2nEr+cmzPt4qTlg/PRSZIM1Icp6tVbShFvMo
         5RD3dnOVY6HenmZJkFoIcfuGYa7/Ivq0gQk1FS53Vs4llnFb9EGueqpidduK0Ynuf097
         2V+7ELo+KWg9IGgxfJK0vrr9UcwCtZCq2NGc4n0PDKFghGSosKedSTV4OGpjpYXinU2r
         1wwXUcRZt4zEn1OIVW2T3hP8PMOGMNmsnxQuxOEXmfu1E6kBg+XxjF69WkQBw3uIktKR
         QIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944530; x=1784549330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0HREIu+ElJTqYD8DnR97TKZwOpP6adDHM14P7pQGE=;
        b=AR+DBkwy0dP4C8thpDXG6LSHyw0w3YNqOrpW1/LGnPksupxfhWTGgAsiYIhRtIegJL
         XJCZ1yBiRjrn0AGhQlF/IieL/oeW+9ENX5GFPVxjrUe5UC13TJJG0jOFjYDwnJwAiOhy
         2D45mVSqKb8fIgasXWZ48j149kvTCaQPQ/cwkKj5aVbhpuG7YXzhbLgmvJmf0fkQIC1m
         cpM8wvlejcpxfkvZH1Qk2qAQMZS7kkL/zgIZGfxrRQISGC83kykKKnepkAGt5H3g5KvW
         fNu/dU9yoWIfcSQGqdfZJB5Qoc+PksYj1X1XOpv4yDsG4y10Y49PMqOSEEuOke2R/GfE
         r7LQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Ev9XMjXSr30XudOjEaA6bXUpztmq5ebQm6ueTzPbU6m1oBD/Gl40k6WzXQEPcSanOzL9jMj6+CP8Q133@lists.linux.dev
X-Gm-Message-State: AOJu0YwqOlJPnTtAIn0FxrLFvvb1ulEnaOeY1e3eUr1/GUXsR1Eh12hW
	0WbL2ATM9SRVWjh3st4QqglGMU6XfTUekYWf1kU1Wv7kUvi126NK15N8
X-Gm-Gg: AfdE7ckvkGH8dTQKJEHA1/joDyaNfYb8DJCDxOOEjwdu4lU0pSUrjX8akmR0kNcGhEJ
	14Wcyrdb8csm70gjMPAnfrJ510UYxTHjetVCez7ZSankridWZC/Pty8qIH+Yaw2Dq2bwz7F2MCb
	LjIr+lFc44QFriqjL2Diy6Uf3cZKkZcAyKHaQ/ND/QVSl3IfTLFsAR6bhwk0SGOw7amQerYuHtX
	Xm9noKbptuewIkD/9R/pqg4Zi22p0AUZaZ3HpYSLa8FcjmOrrtgARUBa5IKpdhDgJQAPvzE3ONE
	/UsKEmDWubusn1bkmUyUN65jZMrmskj6Aw0/HKbpVGR/rBOFltiU82iVcxc+mtOBJhTxB9zaEZJ
	X3UgNBEEzzYDD76yKtKskSL5EX4gsFYlgifkITNFCKwmpmcnWfglgTOYsRTxqCbSl24q51IL1de
	eVLCDBjshn1gYTnB4Lbdbs/t8qplM29Go=
X-Received: by 2002:a17:90a:d64c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38dc7296c33mr7622430a91.0.1783944529816;
        Mon, 13 Jul 2026 05:08:49 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:08:49 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race conditions, and stability bugs
Date: Mon, 13 Jul 2026 17:36:55 +0530
Message-ID: <20260713120840.17427-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses a collection of critical race conditions,
memory leaks, use-after-free bugs, and resource management issues
within the Amlogic Meson video decoder (meson-vdec) driver and
associated components.

The primary focus is tightening session lifecycles, safely synchronising
the V4L2 m2m framework callbacks, hardening work queue operations
(esparser_queue_work), and correcting buffer validations to prevent
stability issues like KASAN out-of-bounds errors or stream-on timeouts.

Summary of Changes:
* Race Conditions & Synchronisation: Fixes multi-threading and
  execution races across stream-on, stream-off, job abort, and
  teardown pathways.
* Memory Lifecycle: Eliminates memory leaks and use-after-free
  vulnerabilities by safely pinning, canceling, and sequencing
  device removals.
* VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
  parser, properly tracks ongoing buffers via atomic counters, and
  prevents invalid memory writes.
* Platform/DMA Adjustments: Adjusts DMA segment configurations,
  canvas handling, and buffer sizes to match modern hardware demands.

Note on an outstanding issue:
An execution deadlock occurs in the driver workqueue path during high
stress or long playback sessions. This stall is triggered when the
Amlogic hardware internal video FIFO buffer becomes completely full.
When esparser_queue_all_src runs, the capacity validation check is
tripped due to a design limitation in how buffer exhaustion is handled.
This blocks progress and leaves the workqueue worker waiting indefinitely
on a core mutex lock.

The resulting hung task call trace shows the worker thread blocking
on the internal lock:

Workqueue: events esparser_queue_all_src [meson_vdec]
...
__mutex_lock
mutex_lock_nested
esparser_queue_all_src

I have tried to address this issue, but the underlying deadlock persists
under extreme conditions.

Any feedback on this new appock is welcome.

Testing was done using v4l2-compliance and active decoding pipelines
on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.

The v4l2-compliance tests passed successfully via:
$ v4l2-compliance -s -v -d /dev/video0

Pipelines were validated using the following GStreamer script.

[1] https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5

Previous changes:
v6: https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/

Thanks
-Annad

Anand Moon (19):
  media: meson: vdec: Fix m2m device lifetime and cleanup path
  media: meson: vdec: Fix STREAMON / STREAMOFF race conditions and
    session teardown
  media: meson: vdec: Fix lifecycle leaks and race conditions in
    recycle_thread
  media: meson: vdec: Fix use-after-free race between teardown and ISR
    routines
  media: meson: vdec: Fix race condition and synchronize esparser IRQ
  media: meson: vdec: Fix race condition by canceling work sync
  media: meson: vdec: Refactor esparser work queue and fix teardown race
  media: meson: vdec: Fix concurrent execution races and unsafe teardown
  media: meson: vdec: Fix vp9 header update failure on invalid payloads
  media: meson: vdec: Fix race conditions and leaks in esparser pipeline
  media: meson: vdec: Update core m2m stream state during transitions
  media: meson: vdec: Coordinate m2m task execution inside async loop
  media: meson: vdec: Fix race conditions in job abort sequence
  media: meson: vdec: Correct atomic counter placement in dst_buf_done
  media: meson: vdec: Fix concurrent firmware loading race and hardware
    timeout
  media: meson: vdec: Configure DMA mask and segment size in probe
  media: meson: canvas: Fix Use-After-Free by linking canvas provider
    device
  media: meson: vdec: Increase VIFIFO buffer size to 32 MiB
  gpu: drm: meson: Fix DMA segment size limits and maximize allocation
    boundaries

 drivers/gpu/drm/meson/meson_drv.c             |   6 +
 drivers/soc/amlogic/meson-canvas.c            |  14 +-
 drivers/staging/media/meson/vdec/esparser.c   | 127 +++++--
 drivers/staging/media/meson/vdec/vdec.c       | 320 ++++++++++++++----
 drivers/staging/media/meson/vdec/vdec.h       |   8 +-
 drivers/staging/media/meson/vdec/vdec_1.c     |  16 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |   3 +
 7 files changed, 388 insertions(+), 106 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.50.1

