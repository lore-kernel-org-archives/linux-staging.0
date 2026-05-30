Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A71C338936
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134218; cv=none; b=qO2sxnmOp8YNvljeeT5CF4lfKGoxwjnn/+WOd6ArcSNSJM+CQu08bNSh/9sWTCwxVeswli+4640ajm3rTaESQaTUekPzj2NImr4Q1Y73WjIHGYqt7fXXbroGCk/GAdmVL9FFDe9C32MPLN2cAcuOdhYA4a8tiQ4pWdTVDlCXi8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134218; c=relaxed/simple;
	bh=eN+Jb4uL3lj4tMVGOtizOY5L33OSaPS33idoHiwUrg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MY+rJE35/7PCj3vnQAkqLXy3X2Dbde+uRRx6DMr7tFLH3LhpaklN8Q1A/4t2KcDpKlVrX/Vc6GDGKT/YPLA8/Uth43xQy48FTZ+AlJe8PCDzlmwc58y9TWQkuuIVpMxj78wy59kifD6MNun7jPAwZYFgH4xKHuBAAIhsmjwkcJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9w4SMtU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9w4SMtU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf3781ca51so5982905ad.0
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134216; x=1780739016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZTtXuk8VMOe/R1MOW9+2Ia+hoeCMO0OxOU+XGlScXw=;
        b=g9w4SMtUq8UtmQdUPOc6iBZw43D8DDWJ+GMtm5McFZo2hhsEKtqz3m5QQ0jXPf7xXW
         E8+86Pa7CaROXjPiPwp+UwSN9rw9aW9/rpvUT5iCX4VSXshXv57qtSVzFQcfdGwnuiOW
         qKezQOF4ActNxI4yCaLEniPmHMBmqo1/KNpekFjyVhX1avObgJLWs3GtzORZb+IH8fUH
         UC/JUAq9uVsn8IydG5+HQxLovlwMiHbulhJlcZQgCCTPoMKVWgXflUUGu5LvAaVHqUPQ
         B8yZYbvQQw37Ekb+9lq7WYQY7CjWifoixVKKNj+jnDOTNCy9J3/y47rAJ4KwmGrjqWuN
         8KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134216; x=1780739016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZTtXuk8VMOe/R1MOW9+2Ia+hoeCMO0OxOU+XGlScXw=;
        b=rNwZvyXj046xmQvm2RKZ+DS64/LdZq4vABeQqDllzdt9RRZ7ezMSJLWPRzPnTT882O
         VdbSLpZDh+tdxKH6XLDSv19RarR9N1xsZOFXG41iy1wAF79p00pI7Pcw/TZF6M2ItYn0
         0d3PNUx+mkRnbX1veFOI8xB71xikchCgANvmCXt5Kp1zzxhEFslKnhpoXJ5H7SLKnAKs
         eUmSDhmu3L6Cc+a6H+yz91uUQtE+Q0LyxAApu3CJn0XMip7ec67hK9/WHqh7Ke69edld
         D5BCxSY8rig+MLhWl/wtJvrhvNTPq99+aG+NCch41nvijTmzotOK/38CDpuFPSU9ghi5
         cYgA==
X-Forwarded-Encrypted: i=1; AFNElJ/DaFeRXIa/nYs6B9jWrd4puVgYF/+k9vUVjRK5MwSidTF3WiBHMcpxu7FrsO3x8RovSTTRlTZucX5CCfvJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyKplIWviIFS0kZwdNqwjhdTM2cN5WhOkq2oDvvErP5UM+qBw7Y
	urb0l1rasBm/8q7X6EsF1nXTKCSeogClLHQDtnsqjUJhmVmyY/mcO6SS
X-Gm-Gg: Acq92OHJGRryP4jtFpj4gOx8tsXL9FViQbnpEjpywotvKdLI3wfNtizs3GfVFygMfLA
	hP6+zy9yzlXPwrM9d+BobJ3QM0p8FCgF4ExInoOudhx68uUj+f+KrkNLuhtOwcvcwE5tgf+f5ZX
	zp8xhRheDXT6KSIkz6+A/Xz6NXcgy6F2muJp44HVSecFQ3USpClF0r1XSNE4DyRhTjoV5caXgRW
	GVuTns0ENMcdeR5vRehw/RaqbdojjAqfAr5zuvTJpHp/1h0+J+LW0UnB/ZH/N+oIpIyt6ufDw/u
	lsNAEZzGpVColG2uzatmHuG2J1RLwqBHesm+B67+wBl+BOp/0BjJFRkrs52VHF6LmPQNX/LEn5E
	R8C+ri7XZ5N79jyyYEPV5yJVTTVhq/8NWsIlo33yAf4Ys/Xr151g/YnQuieZFm0Lh7VA3lmEre+
	fFsAUzAG1AcugOpY9fU1QnVHtWxERjuSg=
X-Received: by 2002:a17:903:46c4:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c0ab926140mr12404095ad.25.1780134216487;
        Sat, 30 May 2026 02:43:36 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:43:35 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v6 0/8] media: meson: Fix memory leak in error path in vdec
Date: Sat, 30 May 2026 15:12:46 +0530
Message-ID: <20260530094326.11892-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v6: Changes

The previous approach had some technical issues, so this new version
takes a slightly different approach, I have fixed the DMA warnings
found during basic testing.

I have donse basic testing on the Odroid N2+ and found that
the clocks are not enabling for decoder.

It also seems some Mali GPU configurations are still missing.

You can reproduce the test case using:

mpv --hwdec=v4l2m2m Big_Buck_Bunny_1080_10s_30MB.mp4

Please let me know your feedback so we can discuss and address these
points!

Thanks
-Anand 

V5: Changes

[v5] https://lore.kernel.org/all/20260525095216.12078-2-linux.amoon@gmail.com/
 
Following chamges try to fix the memory leak reported by Sashiko

New issues:
- [High] The newly added error path in `vdec_start_streaming()` leaks
  `sess->priv` when `kthread_run()` fails.

Pre-existing issues:
- [Critical] Race condition between hardware power-on and `core->cur_sess`
   initialization leads to a NULL pointer dereference in the IRQ handler.
- [High] Returning buffers for both source and destination queues upon
    single-queue failure orphans active queue buffers.
- [High] Concurrent sessions can bypass the hardware exclusivity check,
  leading to simultaneous hardware programming.
--

V4: Changes:

v4: https://lore.kernel.org/all/20260521073449.10057-2-linux.amoon@gmail.com/

Following chamges try to fix the memory leak reported by Sashiko

Pre-existing issues:
- [Critical] The `sess->esparser_queue_work` work item is not canceled
   before freeing the session context, leading to a potential Use-After-Free
   vulnerability.
- [High] The patch attempts to fix a memory leak reported by kmemleak,
    but misdiagnoses the root cause and leaves the primary memory leak
    (the V4L2 control handler) unresolved.
- [High] The driver does not verify if `kthread_run()` returns an `ERR_PTR`,
     leading to a kernel panic when `kthread_stop()` is called.

Thanks
-Anand

Anand Moon (8):
  media: meson: vdec: Fix memory leaks and lifetime of m2m device
  media: meson: vdec: Fix concurrent STREAMON / STREAMOFF race
    conditions
  media: meson: vdec: Handle kthread failure and free codec state
  media: meson: vdec: Condition buffer flushing on queue type in
    start_streaming
  media: meson: vdec: Cancel esparser work during teardown
  media: meson: vdec: Configure DMA mask and segment size in probe
  media: meson: vdec: Fix NULL pointer dereference in ISR handlers
  gpu: drm: meson: Fix DMA max segment size for DMABUF imports

 drivers/gpu/drm/meson/meson_drv.c       |   2 +
 drivers/staging/media/meson/vdec/vdec.c | 179 +++++++++++++++++-------
 drivers/staging/media/meson/vdec/vdec.h |   4 +-
 3 files changed, 136 insertions(+), 49 deletions(-)


base-commit: f5e5d3509bffb95c6648eb9795f7f236852ae62d
-- 
2.50.1

