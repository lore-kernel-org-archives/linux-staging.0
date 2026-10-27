Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142511;
	b=muezHFDCao6iKDCMTlSwq5pxSqFuTYvhZqFQ1B53V/CyH7ShX+2QEREnEwIaoPpxWtlb
	 4vQXQOCQxgzucoCltxxkrCfw2DmoO0Mr56h/hSRo5CDJKeYW7fzvtzhsZpckJmhPSbJA6
	 h4Nk/OjHRG24gIKeCb3n/rmOGslGwOhvvbnUkjqXujEUPDkFqHnBfU0fR2DLKTuR/DhS1
	 RFP8y8ZTEhGasWk/nsIYeg+6fNRXAO3iF3VpCvqAksOm8N4Pm+p9Lw+xIz5m/Td2E2XN/
	 p5g9ca/IK3WAV9GC9x13JKvoGjszXgcDTbuV2vidr6acas8uZdR273WnAoevlDF0nQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MMuIgB64ADt+cztY16YzQdSqp2JNpxBylsF2Y/Dr7t0=;
	b=TVNHRf4YsUU2ySc4215nlqXBfY0dc5unfLB5wBdFHvaXgrxINZCAa8XN7BTA/f56cl9Z
	 2QfsKGGgw7z/Rft2wXgmn6BVTCKqAhPfisABuO89C1Wx941OuflXNY8t3cbKG8lh4sVNr
	 aH8lsZTX7BtLBnY8+14WxO08eAaEKcFf6tDy4F+ZfA2uzZOZkuQ1eLN13ZoB2uVw4mQ/l
	 oGLFug/EPkddJWixAA/SiTfG0HXXOfpBCstdoRGqgsAEkgKyGsNv9awEfy7J6l0i8H4Fp
	 Zv77CKqW9+joKhmmEyQ3ohyKPXjHliteUBTsqG5lExi0C+RDPe5Akosm59xXLxlO/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENFERNJB;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAA8606A31D
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 23:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBAA8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENFERNJB
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so3019215e9.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 16:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142509; x=1793747309; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMuIgB64ADt+cztY16YzQdSqp2JNpxBylsF2Y/Dr7t0=;
        b=ENFERNJB4byE6PVff0/K0J3yptpYFdl5oqQ09OBymtIg4Ktu72ks8y16ju2C/+F2kO
         fDnnbTgUNeTxJkUOUIOuyyo5tPIQrR5HJGUws9Nijx8ipGCGE9nrV6/WRfOKPTUlUc6p
         UkILkysAl/4k4e4+0exIPJClQ2tNxeR5/0bwqjnaRAUdYfUOJm1eUSuu82paKvM0ZFew
         j+OG7Io/rI+gRqF8nrsHuYBg4Yjh4gwyoQ0mml2UqeBBMJmFy60bqAO6uI6ahXTJbiDI
         p3Qnpe0M5W5zZlv4sByBC2qQ5orjqb9uBILiDqJOSK+ug7jJj6tJAXmYw60sHIxndikT
         CQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142509; x=1793747309;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MMuIgB64ADt+cztY16YzQdSqp2JNpxBylsF2Y/Dr7t0=;
        b=Nto4k8B7WtJhYCj88QU46aVWS1mmfQsgzdqEeBR8tz6aRdQpka++ctcwCviIvs+hUS
         mAsEF5P9Oc86E3FUtEYVMM/B454gyQd+qsNyKE8vIAr5SdCQW2Do9b/0z0fT/tEGyai8
         5v/rb4kqPwD16P+sXKXnpbCSTObLItMGZsHTfkSRmy5OEWbw9o0OXKefNbkG81Lptoie
         yLVa17DbGAxBW8f9jX0zM3gnTM5K9HQAn7j7s9nA2aVykuC0swHQQjJWu59MI1lc6nvJ
         qb4GEkWVzyoSYR+oB5HxSqbjcOc5uZ1+B49GP4wW+v9ne2M4FtrP6ip784y4fl2zY1VM
         X0AA==
X-Forwarded-Encrypted: i=1; AKwUvBwLxYZkRP2aBW7TVWlAvoeBO0jNTJRh1Ok7HxZP/mOqLlzWJeamZsa6drqkNZQoRnznVzvJ45+nHtfB2NaO@lists.linux.dev
X-Gm-Message-State: AFq9FYKTvPU3SLNEZ92wCBJ4z764fb8o2aJXwcqyZ1YfjBb3ENGAD7m8
	CwfGAdciTNSz04E6M9JbIO4KaPf2cd6ZoXuoNHBK8X1oz6wvgMPpA4yW
X-Gm-Gg: AYBFou3SJNQzB7zd/lgwQ6S9QhPP9NpF7+XcDm3zN1fSr673j6zYBAXNgL4VlHxrmcf
	7PiK1rC3PHaH+REahBmFclSJQjtgeTfb5DfpaZDzy+LzraaUiMk8h9ECaUuv6rtaKaqznnQTwrW
	D9pyMyWqcmumAZhqBbiKqclNZ6AzOUGWAE/4MrKiOg2h2nB2/0WTaw/m1X+ocTYbe3Am4cdPxHW
	LWrECmkKOpINrRoQKnBjoGQg3Yr3SvVvZPSLsGTT+P5qvXNC3uSF2YHNvzEims+Nrs7J9WQKXkO
	IrbnziKK+PMh2tzvkUIVxbOkDxN6ckcXQUD0nUf35bs3l7hoW9NPgPkVi3nD1Pqdiq2AdRpht8E
	PZFnTx8ClFVUXbhXuJt414+HpG+oATIwDV/UyuGYBMiApQKeyH1DKpDVCaahvCwIeNdPNnmG7Mm
	2TYbhUa4Txh/T/L0p3JybXUKIgxPp8sirjXO2EMdh6fPQH51kpaJcGxIjxNVhQPshfTsk4sEazL
	XZyGpU/KhQIfHIPUYoSxdUtOJHdeJcsbGazHlu4hQlkDukmZRL/zcNVdnIawSiM++wkA35rAGSw
	15o=
X-Received: by 2002:a05:600c:19c6:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a96845e569mr7992445e9.33.1793142509007;
        Tue, 27 Oct 2026 16:08:29 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:28 -0700 (PDT)
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
Subject: [PATCH v4 0/5] media: atomisp: remove the circbuf library
Date: Tue, 27 Oct 2026 23:08:02 +0000
Message-ID: <20261027230807.2407261-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to Andy for suggesting, in review of my earlier typedef
patch [1], that I look at converting the custom circbuf code to
circ_buf or kfifo, and for reviewing the previous versions.

While looking into it, I found that the circbuf API is only used by
the local queue path, and ia_css_queue_local_init() has no callers,
so as far as I can tell that path is unused. The remote queues only
need the descriptor and element layout shared with the SP firmware
and a few small helpers.

So this series first moves the remote queue handling into helpers,
then removes the unused local path together with the queue type that
no longer seems to serve a purpose, moves the few remaining pieces
into ia_css_queue_comm.h and drops base/circbuf/.

checkpatch warns about new typedefs in patch 4 and about MAINTAINERS
in patch 5. The typedefs are only moved from ia_css_circbuf_comm.h,
which patch 5 deletes, and MAINTAINERS has no entries for the removed
files.

Compile-tested only.

This supersedes the typedef patch [1].

Changes in v4:
- Patch 2: tidy up the moved code: drop redundant parentheses and
  '!= 0' comparisons, use !ptr instead of comparing to NULL, and
  return the final ia_css_queue_store() call directly, as Andy
  suggested
- Add Andy's Reviewed-by to patches 2-4, thanks!

Changes in v3:
- New patch 2: move the remote branches into helpers first, so that
  patch 3 mostly removes code, as Andy suggested
- Generate the patches with --histogram, as Andy suggested
- Patch 1: add Andy's Reviewed-by

Changes in v2 (patch numbers as in v2):
- Patch 1: keep the includes ordered by name, as Andy suggested
- Patch 2: also remove IA_CSS_QUEUE_TYPE_REMOTE, the type field and
  the type checks, as Andy suggested, and describe in the commit
  message how the queue handles are initialized and why the
  struct ia_css_queue size change on 64-bit should not matter
- Patch 3: use u8/u32 and the usual function declaration style in
  the moved code, as Andy suggested
- Patch 4: add Andy's Reviewed-by

v3: https://lore.kernel.org/all/20261027120341.2305533-1-vladurares@gmail.com/
v2: https://lore.kernel.org/all/20261014111213.1967452-1-vladurares@gmail.com/
v1: https://lore.kernel.org/all/20261012230754.1914517-1-vladurares@gmail.com/

[1] https://lore.kernel.org/all/20260918214132.1135549-1-vladurares@gmail.com/

Rareș-Mihai Vladu (5):
  media: atomisp: sh_css_mipi: include assert_support.h directly
  media: atomisp: queue: move remote queue handling into helpers
  media: atomisp: queue: remove unused local queue support
  media: atomisp: queue: move circbuf types and helpers to queue_comm.h
  media: atomisp: remove unused circbuf library

 drivers/staging/media/atomisp/Makefile        |   2 -
 .../base/circbuf/interface/ia_css_circbuf.h   | 363 -----------------
 .../circbuf/interface/ia_css_circbuf_comm.h   |  56 ---
 .../circbuf/interface/ia_css_circbuf_desc.h   | 160 --------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 --------------
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       | 135 ++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     | 382 ++++++------------
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   3 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   1 +
 12 files changed, 251 insertions(+), 1195 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

-- 
2.43.0

