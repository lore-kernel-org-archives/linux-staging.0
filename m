Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536C329C48
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795580; cv=none; b=a31Hs7UW9bPv+CMgtuID+sEhOJN86YJBztSjua6J+iv2DMrM3Vhgt2uGLAfpIega3i4V7hNIVRdfsFd0eH5rwujc2Y3Ve7w+bdueFoClmvFUs+/zeeHj6D0NtOebBRI+Sk4xcZC1QHWSrykwV3HdNdyjMNDXiRIzZWl1NTuO+0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795580; c=relaxed/simple;
	bh=suUEAixyLNwQwY6P48zJjlni8QPhaptQqPYYM7cY2A0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Iepog/W1VnsocQvOU9yrDxhaIdEsemX/XFifLlmJyo/TzOL1fszkXWF92x2GBOU+qPJLatypHevsDgkspEl77cbRxIMBEamfefLfSs0ajLfD8Py8AS7kjOKi2VfWYztD2uybteIF+d7H4a2PAJXHZwRYqiheueEiBFAOYJvnFa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlPhfvbe; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlPhfvbe"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3967726bc47so11079751fa.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795577; x=1782400377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9KE4eh1MHmMevkzNiAWtAEr9ThKarVb6fAYqAoyKlY=;
        b=KlPhfvbeH6p+u2m0zmr9/unHHF98bZhe98siow0QuTbLqSesrm72Byd8keRjTSjaHT
         uU4w0zBkQVTlrEuA6qBoeS2F42Ggpe0woD6uD7Zl71M2v5ej83TTLyN0iHXaA5AsD5Al
         MKWuyVnQSlGVkr3tnNRq+NV8YxYPMH1XdA78rH8QG9aGCZxkOcOhHFhjNGPw5k0BR8ud
         mxAcc+dAhhosHtyH9yto/kfPcedkEYPqwrrri33B+ElWQMPtApiMu3vBRn6H/2N1JyK/
         D3OmRHeNv71ss0xbWdgsMeWJ79eHdjUD9ukXZZ+qHOYJGTR42L+snB13lNUWKYvgAQy3
         A4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795577; x=1782400377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K9KE4eh1MHmMevkzNiAWtAEr9ThKarVb6fAYqAoyKlY=;
        b=LwDhHfVgim9Jf5+Aq1K2VS3INzFUsiSCVy5jpqNvDH0cSRRdXLiZH956COpjVkpTP4
         mOpw2j9+KBdfWpWWzLq8zpWrs7UuWwHmh3QK8EGi6A/TXoSo9vlT+e49MMrH6zBgvFAk
         G5T9opW0a0FN0/CImbbWs8BswTiQTCd/axTZePO2QTgQx5Xwf+91n8JnAT742AHB3/Ux
         S3wYFqsHzVrBi/m/5FdN9SHzdCdoOMwq0bK1RwsHayIZEJmksnNI+94VUOim7POzOoEj
         bUPkdxrL7pVeHiFU7Hgq0JaBmW9+M0fXpcCItISfhwXfW1GKls725xrPVezHfv+BhYB0
         B/Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/nKI6LMgDbiLtUID92YyfS3z/loLIvgRphQVcomOmD1BDW2xLONe/kd+VRf1QdY3meyLdA0NTJrMSuAc6T@lists.linux.dev
X-Gm-Message-State: AOJu0YzWEzniTIysg69mHPrS2oIcS7st2O1LTishhO061grUBFcP129C
	/KNORVkkTdho5kFqEBh5Qh2OSR5x64myetbnFirBLEE5mn6awxIuRmHS
X-Gm-Gg: AfdE7clOCYlpb0DOf6vJoEuhLwV43mhLczVPyzhVXJ+BuCurBRbHD2wBFMs87XQld0H
	WLPaSJ7p5Bag5JW5W5bFB48zdDKzxVoPvbOrB1YhFXRhw5BHLoLzNuHarqw2c5whNn9JyBU8RZx
	a5gHP7DOfhepADPXaBzebEDQPwYSXb1PNaxSGmpyWihMkcHHwlwSZkYcds3jEXuXJbwVu4odAMC
	91KQTOOmlub2R/76YPFGxlj3yBalUdCWoRr4svbR/2gb/0l1hOGeJ6sLzYm1NmVsc9sdsDESYlj
	1jtcT4Z0N68YGvXrBejiLVNFzTLEU7cjIpD98UnrEVZYZbVNUz7P6lmBFxgIyfFRf9GUvq1oz9o
	h81Y5DKOKdjcIMIcrSi935cKNSbfc/JAxIGiH/vKvdqvjfXKrzmLngMHU51xxXiLmWynbK04tI8
	kp8jA78yNlAa847a68tqj1NPICaeNHrHWEXUFG9UjODlKhn859mE/wajx01cLTlBDJ9U/v03tdj
	+gRJxUrhFU=
X-Received: by 2002:a05:6512:108a:b0:5aa:7064:e053 with SMTP id 2adb3069b0e04-5ad562c79c8mr2444e87.36.1781795576832;
        Thu, 18 Jun 2026 08:12:56 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm24226171fa.32.2026.06.18.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:12:56 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2 0/3] staging: media: atomisp: remove dead platform_support.h header
Date: Thu, 18 Jun 2026 18:12:43 +0300
Message-Id: <20260618151246.6678-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618120951.42956-1-igorpetindev@gmail.com>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

Following your feedback, this series replaces the custom CSS_ALIGN() macro
with the standard __aligned attribute and completely removes the dead
platform_support.h header file from the driver.

Igor Putko (3):
  staging: media: atomisp: replace CSS_ALIGN() with standard __aligned
  staging: media: atomisp: drop unused platform_support.h inclusions
  staging: media: atomisp: remove dead platform_support.h header file

 .../base/circbuf/interface/ia_css_circbuf.h   |  1 -
 .../circbuf/interface/ia_css_circbuf_desc.h   |  1 -
 .../atomisp/pci/base/refcount/src/refcount.c  |  1 -
 .../hive_isp_css_include/platform_support.h   | 25 ----------------
 .../pci/hive_isp_css_include/type_support.h   |  1 -
 .../pci/hive_isp_css_shared/host/tag.c        |  1 -
 .../media/atomisp/pci/ia_css_acc_types.h      | 30 +++++++++----------
 .../frame/interface/ia_css_frame_comm.h       |  1 -
 .../pci/runtime/inputfifo/src/inputfifo.c     |  1 -
 .../interface/ia_css_isp_param_types.h        | 11 +++----
 .../runtime/isys/interface/ia_css_isys_comm.h |  1 -
 .../pci/runtime/isys/src/csi_rx_rmgr.c        |  1 -
 .../pci/runtime/isys/src/ibuf_ctrl_rmgr.c     |  1 -
 .../pci/runtime/isys/src/isys_dma_rmgr.c      |  1 -
 .../atomisp/pci/runtime/isys/src/isys_init.c  |  1 -
 .../runtime/isys/src/isys_stream2mmio_rmgr.c  |  1 -
 .../runtime/queue/interface/ia_css_queue.h    |  1 -
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |  1 -
 .../media/atomisp/pci/sh_css_firmware.c       |  1 -
 .../staging/media/atomisp/pci/sh_css_hrt.c    |  1 -
 .../media/atomisp/pci/sh_css_internal.h       |  4 +--
 .../media/atomisp/pci/sh_css_param_shading.c  |  1 -
 .../staging/media/atomisp/pci/sh_css_params.c |  1 -
 23 files changed, 22 insertions(+), 67 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h

Changes in v2:
  - Remove platform_support.h instead of fixing the macro.
  - Replace CSS_ALIGN with __aligned in all users.
  - Drop unused includes from all affected files.

-- 
2.34.1

