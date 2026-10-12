Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AE03C3F68
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846520; cv=none; b=iz60ZcWjlPlTzukGykTI1B4pmEH1xkwhU7R89xpE1WefFax7URhpREbJa62/KpVXrhFrIHYvi2UrqrL8dUbtwEVW0YH+Niejwfmy17GrttsWiLJQgKm7UTnnoF8vuWekPWtYqx9ZvbBUQ8bo24X9oyfVxaz7yVvCvgxbWvWRqZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846520; c=relaxed/simple;
	bh=YRnZBWvvoL3gZ0b5c66VN59LYucaM/WJXc9j8W0cOFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jkzjFqPFj1IV5VKzrQfHvi9shbaro7/pUlkV5S9iHNUIw5bdcx2mF1xK3Y7kbP+vU7+Ri3cw8Ai/8np093YBiOawebtyFXIpqi74/swQdWDgGyRbLFrHnEFDhZokqW3Gvey8x11NDSJa3bIKsrZMIJ4nFZrqP+4hMwod12breP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNW0yCpE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNW0yCpE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so16659745e9.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 16:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791846515; x=1792451315; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJ9Nma4YZ09TsegjNcwlomId4OFLBG68tURqtwyiYzk=;
        b=CNW0yCpECTAC0jX1JerN5es7PgyDSvuV0IkZs6t6BMFWiSY7LNKr83bFCcb+frLctF
         cc9KwBkdfzpDfmuxC2Vg8Cd7XOR2PHu2LZDrgSUKcty1VBAnr1bNt3MF2/kx6uaL2+TG
         xh0v+1bwla/jngmSj2pXnyzvKkKco1th+CgkKkm/GPkuJy+Itbck6dIw3pW+K8k3Xz5N
         U1HWWhsJhJ1y738LWCExAfwiZp+ng92SzGlJnEznnOGu3T11MavyKz6P+/2I3b9h4v9g
         uCzfTLozyt7WfHsdEivlhU+TuL/9fc3WVSSiuWLSFXrSJ27YDp74mzNXoCFXe8kzjm91
         P20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791846515; x=1792451315;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJ9Nma4YZ09TsegjNcwlomId4OFLBG68tURqtwyiYzk=;
        b=iql1oUFRJqTPy9adZ+sTe5zk1eT2jAmnw/93lE+PVJfjl+N5qOfYMSHoYdvXlxaCDe
         dURz582vwmzvHNi/z1+aopeCCL0Kvw6n9Co3x6B5TVMtC9Vcbp/W/XN6MwjRz5wZQl8Y
         pZsd+W0e3UPkHq3nJbDLn7zvdmQlgEsPk+OQActG0TA5lfDcXmytyFis4Ys1S8xN/p2b
         iPGxg0sjSz7NipzmtJUVoaCOgBPxY+TiWuVZlcsrLRi6eeCQRiPzgKT4QFgshF+OX+IS
         HU0ggtBrVfF2kDjoGgZR0AbmDbT/910vrxG+Yu6xHdF8MWjVB5K3r01dCQAVZKR0vYzj
         otcQ==
X-Forwarded-Encrypted: i=1; AKwUvByQTAco/j4RSuLSks9Yy4vZBGP4cVofdXCP+npFp3s66j5WiAKlMfhdBMi4T/pzgzlQs2FHSY7fHdk24vCj@lists.linux.dev
X-Gm-Message-State: AFq9FYJTUy2Czo/CelTnumTqlvTHYviWmH7FRoeyWzV6kO5o3A3ECKfI
	eyFAJ1I+XEYYHYrdrvacpAlbORpq7OclvfuTgiTIb5bEtuTGvYp0jM4Q
X-Gm-Gg: AYBFou2TUeB6mnPyKKBAD6OCRniOMs0ilwYhMeI42vVPWUO2ZTcXazu9QjBsPUOtAVH
	3QogvWtG/j3zTPLCuG0vYAnLpWAMbajK/rgUu92LPjSwOZYVa3pDupty0roo5LmxPP/GVLVC1aD
	JZJzUPw9cL0U+Ke22jxGDyArnfwMWN/PRiJYsR0SVaWLe4w6K0NXiLthx6p8M6cnmWYD4BildHT
	AKv52W+UDUgoljYcqZ0dt2emplnwdTxXd5LdB0ixso3OtVrCl5K4Diyc/bDoKsFHgkvLQX0fiVv
	XCfjLUmzIWxLvVXfsVQ5kzTNUrSGXUXmWrq3+2vCEq1mRY3mG+KVPElr7bsEGS5bbBG5jIgpAIx
	E2rFv+aQv96GgpuDOtMDMpQA1HcaD8OLD1vUBksYAj3JI0NUqyD1nYqrbZWRHKA6HWfytH4ZW27
	NUD0+CAmcofe4vKh5Xnb0dBGl1G8DUeMejLULbPM8DvsAj7tDjjnQMB5bSBU7Jw+Ao0ITOsZlZW
	TKOx0KY/xgBBKYhKyjvFQ==
X-Received: by 2002:a05:600c:4ecd:b0:4a1:96cd:2f60 with SMTP id 5b1f17b1804b1-4a19ecf4c20mr85630695e9.3.1791846515354;
        Mon, 12 Oct 2026 16:08:35 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm1873928f8f.19.2026.10.12.16.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:08:33 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH 0/4] media: atomisp: remove the circbuf library
Date: Mon, 12 Oct 2026 23:07:49 +0000
Message-ID: <20261012230754.1914517-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to Andy for suggesting, in review of my earlier typedef
patch [1], that I look at converting the custom circbuf code to
circ_buf or kfifo.

While looking into it, it turned out that the circbuf API is only
used by the local queue path, and ia_css_queue_local_init() has no
callers, so that path is unused. The remote queues only need the
descriptor and element layout shared with the SP firmware and a few
small helpers.

So this series removes the unused local path, moves those few pieces
into ia_css_queue_comm.h and drops base/circbuf/. Please let me know
if you would prefer a different approach and I will rework it.

Patch 3 only moves code, apart from dropping OP___assert(), so I did
not touch the existing style issues there.

Compile-tested only, as I don't have the hardware.

This supersedes the typedef patch [1].

[1] https://lore.kernel.org/all/20260918214132.1135549-1-vladurares@gmail.com/

Rareș-Mihai Vladu (4):
  media: atomisp: sh_css_mipi: include assert_support.h directly
  media: atomisp: queue: remove unused local queue support
  media: atomisp: queue: move circbuf types and helpers to queue_comm.h
  media: atomisp: remove unused circbuf library

 drivers/staging/media/atomisp/Makefile        |   2 -
 .../base/circbuf/interface/ia_css_circbuf.h   | 363 ------------------
 .../circbuf/interface/ia_css_circbuf_comm.h   |  56 ---
 .../circbuf/interface/ia_css_circbuf_desc.h   | 160 --------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 ---------------
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       | 139 ++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     | 112 +-----
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   4 +-
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   1 +
 12 files changed, 148 insertions(+), 1033 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

-- 
2.43.0

