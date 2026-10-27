Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102642;
	b=3LhNVX5nsJctS0CsPLnWklbOVnIVzFW0DzFnC+Bewk/yzcPSPIM2HdYXTxJ9i9ULGGxe
	 mHcpLvJCiHRNWt/5SgKUUyto6UgM/IBSJ+s8oIDYWG/vGGio/QIxU9MSn94r2HK4b5QKx
	 BgfSX1XeUArUa8/eAs8WjWVx6Bg066ZXUPbT9Iv3Mo+87TyC6mxJN7LdW86LgzIPpt/Xx
	 GwmIk8pF80m6PpI2EFdVKV1SHFDyNw0a2Ilf2J+9I6cL7BE6jb5d0rUh47r0tFQ46xVsG
	 HXLel6ewZPGU3fjTCDWqulsG9YK/1gMssfveaJ0SEbglAsyiZMYxQFBmvrLJ+lsqR+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NZRI7OXfrCuhmjB2P6fSSq6CZTi7xapgTlqibVa79fI=;
	b=GD+tkj9ZsxQW1V8Plqk8DG6ZS9JVNAfHt6MHZX4DF07HFMRbXVzLH4OSQJFo5OKKwstn
	 /ssp7fnXIAgCwdLisQ1A3XQThKkRdAqo1jkBOrKVal2Dk5U7xkfHN/VfGJR0H+H7Zg63v
	 9mB/MYsmrqtCRnyC3/+EWW950JY9aDEk79/xE7l+rUAH4Lf6B2iDAOlSSMcpnf2kTft/s
	 OOYPmhllHs8W8g6+zL+WcvG2Yfkg2koCpF50G/Yg01Sm9gxoFqjrNgONgMpgrl5CbUOwh
	 DTqlNCiY1xwkchEQX0igW7fcAI0kmod5TkMeEbU2WMOsFFATJYSW2Ye1tSvrSqFP2sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FftjxsKG;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1DA606A322
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 12:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1DA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FftjxsKG
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso4360886a12.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102640; x=1793707440; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZRI7OXfrCuhmjB2P6fSSq6CZTi7xapgTlqibVa79fI=;
        b=FftjxsKGXBV6F2KR0fFVM6AnEyNhSQq0Fg34WdIkzM7XZAYszPIaN8t3Hjx4q5MK9C
         tbVM92k51GkDRRGW//INhMaVloxp99YGO6G8R7YVCupn00mHR/WxrB32MXrVTGo/IxfI
         sgPt4xJSSB4BiXQQIxrmGnEqxs5jlloRmF/U/LqQ4W1JIbIrRRajo+NejrzdiZwRyAE9
         +fUL4L3jNEfO8VmgeYnQ6RqIw5TGqzUUYK0gBTWUPE8pvHKBiew7D8szIf/uV7ygP6UW
         9eiFJRk6jJyOykHAGEveGDgRli4N+HpC3ab2xaqKHbMLZx5Wc5XRfghrlZ/HhJDQ9HKw
         Vw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102640; x=1793707440;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZRI7OXfrCuhmjB2P6fSSq6CZTi7xapgTlqibVa79fI=;
        b=GClc0CEzRK0p0FVBVmJWOP6mC7B6jdEuq+bbxam4Pst5ZhrymBUU43ZvNyoPrfs7DM
         Kay0x6nXWA0AXVw3dJ/9B2JL9feENuxxOzASm+m1/qacq745HmW7flrYclu5A46qTlBz
         tpiAAlLCj2XYgFLYMLfoMOw5nFQbYX6OgFHI6O6K2eQk1/E4A6haAEH4mkyZLEHtbEOD
         lc/DOlXr0xf1dl7lGoOZJ40Q6D7ruVjHIilkxlnX+x/5n7RG1bNZyNhEKtTWZ4xtmdjQ
         aUsq3C671paia9oBrscYvlQervOV/KmcmSG+AvwNq3WUngX98Ph0m4dWweZz2EVs1UFv
         nV3g==
X-Forwarded-Encrypted: i=1; AKwUvBw2iXfwT7SST4qMNBtQoWBMb+g4M9Kh4kel/hUZzpy3kMLPgT7UpDGf0P0WTPUs6k4W2z7sBFl7sNcc+few@lists.linux.dev
X-Gm-Message-State: AFq9FYKSpgynIFet2Q6w8wKVV3stbS05JRlGkWkj6FD2fMU9PCNfO62b
	IBGyNPz26f1EGikCljSy2E8tn0DJHqswiSVUYKzLFqq92BjRP1mYsLc46q5OoQ5iANA=
X-Gm-Gg: AYBFou0P08q3oKxbYyvHZB7wl3eVwCtjS0kGvXDP9cM8B78NSOAGCsKHynR/zn6Z4HZ
	qwtfkU9fqdNThR//4/uCdb7UNa7Ik2waB5kZk9MEYc23DOrZuN2v/qGZ0Ai7XL92rnp/CNJkXKi
	WXbC7sT5Qj18SMDFchZD5hQHAS4ci+rMyVue4fmcH8nyRuDoaueoTIjKL1ThEUW4zHUc8xECCvt
	LhhHDKdC9whlrjY1TkPak/hDWpYYf7bEXTquPs2491G1Z+2CL6V4P4fsWBEleYZ9qTn4jsCNiTA
	4K7SqGtvVbimL852gn6XYx6aaHmazfz7KMzMGORxTyzr+Qk2omg6gcc20y8tTy+cSlMAPTzJfeG
	XVs8MFR6TmIwiduqQZZgc4EO2ZkVSQ0Mu+fzNBWFvcBuQvMELuMt++8krv2HSSf9zHzdRU4ZIy4
	DlOI2DYgC1Ijy66ufU2t6j1cToprPmPe9st74KhbCJULjhS9gBvOTZ8t/FQ0f+6xQGAF0u/JDHX
	n1orizwnk0K0AMTVs2bYhaob+pzmGjr050LbdIluDLiicwHeJW+8yloVaABAZ1l+/TpNYgKHoiI
	UHM8
X-Received: by 2002:a05:6402:3d9:b0:6b4:2b7:69aa with SMTP id 4fb4d7f45d1cf-6b442ff3197mr7230849a12.34.1793102638778;
        Tue, 27 Oct 2026 05:03:58 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:03:58 -0700 (PDT)
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
Subject: [PATCH v3 0/5] media: atomisp: remove the circbuf library
Date: Tue, 27 Oct 2026 12:03:35 +0000
Message-ID: <20261027120341.2305533-1-vladurares@gmail.com>
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
into ia_css_queue_comm.h and drops base/circbuf/. I may well be
missing something, so please let me know if a different approach
would be better and I will rework it.

checkpatch warns about new typedefs in patch 4 and about MAINTAINERS
in patch 5. The typedefs are only moved from ia_css_circbuf_comm.h,
which patch 5 deletes, and MAINTAINERS has no entries for the removed
files.

Compile-tested only.

This supersedes the typedef patch [1].

Changes in v3:
- New patch 2: move the remote branches into helpers first, so that
  patch 3 mostly removes code, as Andy suggested
- Generate the patches with --histogram, as Andy suggested
- Patch 1: add Andy's Reviewed-by, thanks!

Changes in v2 (patch numbers as in v2):
- Patch 1: keep the includes ordered by name, as Andy suggested
- Patch 2: also remove IA_CSS_QUEUE_TYPE_REMOTE, the type field and
  the type checks, as Andy suggested. I tried to describe in the
  commit message how the queue handles are initialized and why
  struct ia_css_queue looks host-only, so that its size change on
  64-bit should not matter. Corrections are very welcome.
- Patch 3: use u8/u32 and the usual function declaration style in
  the moved code, as Andy suggested
- Patch 4: add Andy's Reviewed-by, thanks!

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
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 ---------------
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       | 135 ++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     | 369 ++++++------------
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   3 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   1 +
 12 files changed, 248 insertions(+), 1185 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

-- 
2.43.0

