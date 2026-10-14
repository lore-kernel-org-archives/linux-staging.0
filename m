Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A185C4E0212
	for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 11:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976360; cv=none; b=lR4eC/C5JY2GOQUe1kA6CqfLaNaV/5fB8J9OdJjAgOcJITxY/fjJOflvg4EJ7vL/qKYtAjFfnYAVnFXy2C2B95e97WxIn5pr+qL0Xw04q7SRM/inxOsxT+11Wx5sT5Nx7zbrtRYhvPQudmV8zmpIrWK+aZsU82L3axLsIE4q6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976360; c=relaxed/simple;
	bh=TYCh17IzdfTqL8pvaT+GV1ivRrEDrSwahRIe1yk5/NI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A5X+a5QLMWPaBcdp24YuvBTgT1FRIsZYRKjmv1XNtNd4YjHMp7x8cMBXjGgbw6RylfZcjyo1hFicMzizK1K2evYXIVMJCtsXA+Q/k0W4wz7u+PEEOMg7Wy5evRbXYXxQMYV3ZGsMG/VPFOud19ndIFphKz0fR9lr2SAKu3vK+HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJvoXgtQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJvoXgtQ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so31768465e9.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 04:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976353; x=1792581153; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsaJRaFTcFa+k4eyPw8A1pPOAH2MrUoTczDBOfy0KPg=;
        b=jJvoXgtQXhk1hnaVslpDlyh3wV6QM2t6ChA29EoZ6R6ikMXMIRoJzJA5X9ELmg5fsh
         rJIFYr8rYtIIRTAP96zJgbZTj+snb8KICX4aLNE4ta/ImaF0F9aU8guuXs8cV96eMjac
         DxEAtBBCaISD8JEbReDDkPkD/PwphLrbatiEf+/jNzWhm9qV7wF6NGIWRcEM0Nt+ebTN
         QiHfasMY/xUXwQZdW6BFex3ZePNjIflxWPOztYTRpwwWRkf6KZg3QhARxfocOzTbQcrX
         epB4FX7v96GxTL+1n3zePy1B9nM5fMMiP7SxhLqUWL8+awun+hP70GOOnWpOTElSGxDH
         3e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976353; x=1792581153;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsaJRaFTcFa+k4eyPw8A1pPOAH2MrUoTczDBOfy0KPg=;
        b=ELTVrrfwIL/qftKVZApx7KE4RVf/EV3wBnzhD8s3JdBle70DDi8ydfLAOCWkEpTKv9
         r8hBOtxuyLZFqK6Z+Y1EHY8b744MyNaBeZ58+Tv+4IFk163ee3ozqkSQsA4K30/EgXLq
         Ad4VFUrD/REtt1scn0dNrynbEFOLb5VIBfSoxXeMASQSUVwvhaqG4tGiW8limf5g2mzQ
         2ykDuw/b4jMnwqPK2ze0Ywute81e9vj/kqwkcDkiImPHRf7Q33SlJGjvZVxfJf1iKGEm
         7seKBCTH+tMgCxFDGCiSf54uTb6zB4QjfX9UUaNEKVozeb6Szf6kN8g4F1RRmCut36aP
         ssXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWY73dhBHGIs5teJKiCmhIua6OqBVOlFCRaLAVP+Ms1vBv3aa3vrqhleA9vN7tUeMj+ZzqlP6yqMvo26SD@lists.linux.dev
X-Gm-Message-State: AFq9FYLfE3xjFJzGTsPEQGqEDgt5HPpgcLwAzU8r+3O30v3u0KXKbaoz
	SYw3pqzWyNdPBqn6q7Z0Hvp/dn9sbZucHi5FDTfeLNkCcZlcChYTz2Ak
X-Gm-Gg: AYBFou33tunQzTG0Plm/peVEW7Yz4epvnK0eH6XuuOML4rjQux9MB/UKTh+FRTzw7GP
	6ubmjrie/HM3tl2aGStqjD8DrCPKdJA3lDOh3IFgCxIFOXqyxIFr47PghE9nnfrofFlh3dFBxC7
	SMkT3LwUmWPTmnaaqHrHJoGPUo3eGJtkd1b3JdaZzPdXolOVOacLbSaFl5dZt9wuTzaG49C24Y9
	gixb5syPouW8rHWn/A61eRe2Bsn3GioVh5uvUHCsZVfGzKf1eTm2vrzn9p+5dHJCDHTFUPOcOel
	4Vd0F+a4XpvyJG0ltmzdNJIAP0XxtwezjEqUmWfHj1zskZe3g3oKA//kPwj5/8SjMzLOgJcyhan
	o336ay3MuQhrkWt3o6p176JnsZDMQQrVZx5HsVhtnQxe3ftYgW/d/sI+Wv280BMpoo0aiPaUn03
	ZcKQQSbPyVmberG/MsjHUa+5wnpaC/XPFCjGIX15FlGu915ZgTkb2R79yCsjZ0zBkLIHcZ50qCT
	eJS8K4cNk1HoJM5irdEJw==
X-Received: by 2002:a05:600c:6990:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a18e49c43bmr309909955e9.6.1791976353342;
        Wed, 14 Oct 2026 04:12:33 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48deeadc0b5sm1846481f8f.6.2026.10.14.04.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:12:32 -0700 (PDT)
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
Subject: [PATCH v2 0/4] media: atomisp: remove the circbuf library
Date: Wed, 14 Oct 2026 11:12:09 +0000
Message-ID: <20261014111213.1967452-1-vladurares@gmail.com>
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
circ_buf or kfifo, and for reviewing v1.

While looking into it, I found that the circbuf API is only used by
the local queue path, and ia_css_queue_local_init() has no callers,
so as far as I can tell that path is unused. The remote queues only
need the descriptor and element layout shared with the SP firmware
and a few small helpers.

So this series removes the unused local path, together with the queue
type that no longer seems to serve a purpose, moves the few remaining
pieces into ia_css_queue_comm.h and drops base/circbuf/. I may well be
missing something, so please let me know if a different approach
would be better and I will rework it.

Compile-tested only.

This supersedes the typedef patch [1].

Changes in v2:
- Patch 1: keep the includes ordered by name, as Andy suggested
- Patch 2: also remove IA_CSS_QUEUE_TYPE_REMOTE, the type field and
  the type checks, as Andy suggested. I tried to describe in the
  commit message how the queue handles are initialized and why
  struct ia_css_queue looks host-only, so that its size change on
  64-bit should not matter. Corrections are very welcome.
- Patch 3: use u8/u32 and the usual function declaration style in
  the moved code, as Andy suggested
- Patch 4: add Andy's Reviewed-by, thanks!

v1: https://lore.kernel.org/all/20261012230754.1914517-1-vladurares@gmail.com/

[1] https://lore.kernel.org/all/20260918214132.1135549-1-vladurares@gmail.com/

Rareș-Mihai Vladu (4):
  media: atomisp: sh_css_mipi: include assert_support.h directly
  media: atomisp: queue: remove unused local queue support
  media: atomisp: queue: move circbuf types and helpers to queue_comm.h
  media: atomisp: remove unused circbuf library

 drivers/staging/media/atomisp/Makefile        |   2 -
 .../base/circbuf/interface/ia_css_circbuf.h   | 363 ---------------
 .../circbuf/interface/ia_css_circbuf_comm.h   |  56 ---
 .../circbuf/interface/ia_css_circbuf_desc.h   | 160 -------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 -------------
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       | 135 +++++-
 .../atomisp/pci/runtime/queue/src/queue.c     | 413 ++++++------------
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   3 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   1 +
 12 files changed, 270 insertions(+), 1207 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

-- 
2.43.0

