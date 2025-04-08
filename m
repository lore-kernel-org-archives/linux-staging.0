Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF0142E7C
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151825; cv=none; b=UAx1td8Anw8w/+f2VvAdgalleTSFxBZkRQqv6iYLg0lyFI3ddGyD+l299AC6U2D7dXpYzgctiK4pcOvEJSSevmV9sD/dw+ZArPM/Gs1i1JF6eMMX9Zszv/q7wWFjL53tNJr6aodAMIRSjNBsE9SX8oBmCNWxSdw5JEgNi2A1ZHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151825; c=relaxed/simple;
	bh=W8mcQh3ZmLOOqUw0pQwZjxi7DB9VMzXrDl2urotDVQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzAPM2wH5ElhI2zvPZUydspD/hECjyKtv3dWFETlNWIAbNb3SKgKVmPwM4BrkBYIPoJHhSbOjOX1Ty73ugtdDzaSGmJ6xP8WuyKh6jdvSDdvcjTn/DRzxxet3dOqf/K+FDBSmTEyjG8kqOIxRrCDy/cApOqHQ7lNWMluQOSIDx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WypcRs0I; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WypcRs0I"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227a8cdd241so71219125ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151823; x=1744756623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=djup849pfpUwDc+nIoOZqJLc+04WNO/1d356og/BnVI=;
        b=WypcRs0Igi8KDVmN9Ys3cDb36EjFPaQbfsuksXVDNcvTPm04JZJmmmpNpdv83wvZp8
         ovxWBQxGivzNhUPdyVoA8rulamMpfBvSoAvofTWQIgA81+3EUa6eWDJnfbrpORW5v41I
         arc8txA/WOEde8/l/HQn5M/GmrdTDZ2B+eTbBmOikvA8rVjs3RB8iNs3fZR8eztVzrXU
         afbkijBhn5zUG2htjM7AA9BzuG3/jGeCc2cezOy/B7jStdgf4Xv+MosVAlOATg05Z8Z0
         xix7ub+J6DOya1TFl5A20cD81QaN27Wpe7GE+J8SHWn3tio5Kazto/rgLsdn5XdvUY85
         sF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151823; x=1744756623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djup849pfpUwDc+nIoOZqJLc+04WNO/1d356og/BnVI=;
        b=ID1r2jbRcbexqKSEOcpH5efTjLTnBh2jVvZWrgn6kbOo7AKDI1jYOMZLPFOSyI7M7k
         10JUkBRRN/grMBBm/w9zLn7ZBM3C3CEhEAOcel5Jlp1om/fqxiCH1HlX+LCOdwdQq3BY
         vWrYM6ef42fdXAZcGnaxKmT42UdimVWHjkQkeL8FCDsqiEJofglmNAORwiYSu7nHpB2k
         Zz1BoOdFwmbWAJYmsvQIFPRRl+La1OZIfBcwQ8ymx+O46GqeXhYyaAQ0JaCrc+5Gahnm
         K4kHOdkKQVoWRBFtWlk8aTy7dI9B+lFV9VIanQLSSx+7618E0+mHh8TuSeboRS/uuUa3
         MwyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvne1D38og0El/o9FbdvUrDzvQVvkOkb1QOK6wTskswWoj+YAm5ru1wdG2HFsJrejT33RGaHX1bkYm87XR@lists.linux.dev
X-Gm-Message-State: AOJu0YzVFqFUp02EY97K0AMcKhpQfalbidZEAHM+AJDOS98WtCFt9nY4
	5kZwq+w0OE62xwxr6s+srILEXfyqg0NbnU+atn5wTwflUHUenFr0FGTICYtLXQ==
X-Gm-Gg: ASbGncvOGlDV0Xz8HtMsJSGMGR0MUQWmiwDr0tcVDjBpv5bbq3yESZrRHLC49JAHuHI
	5j2qZyA604i1KvPBRnXpy64DANhnxDDrDM7cEBtvaSFYbxyKzMQaSdMvtygoTomBquxJwO92BCV
	HY5C+PDmkikZaHVOCxVesRVGiQpAthC1FfiBb+ir8f+mVz7tPgsz/PpWDYC6PL39/B+7BJx7+jD
	N9XFfiQSVqc8NMWmXSy2CBRfbOV1+86L7LWYF28n7uVt3zVXFJOfTdroLMb9AY/vgccMu9PLUt1
	8bvsi1gznS+aZjAxmCCWPh+TXcbSuH/f1p27fsF7oDX6iBdO1b8irVZ/kEv7n5e9bbGb+UH78ke
	9uQWNXlcQUA==
X-Google-Smtp-Source: AGHT+IFoC+ycacdqJ0GJ8O0Y+m7ZEKHT6NqjdT697VABH348dSO8i5PlEDCHOP7yiQ32COa57ZCdaw==
X-Received: by 2002:a17:902:fc87:b0:224:c76:5e57 with SMTP id d9443c01a7336-22ac2a1d993mr10783375ad.39.1744151822871;
        Tue, 08 Apr 2025 15:37:02 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd568a6asm41233a91.1.2025.04.08.15.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:02 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 00/18] staging: gpib: Removing typedef gpib_board_config_t
Date: Tue,  8 Apr 2025 22:36:40 +0000
Message-ID: <20250408223659.187109-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

* Patch 1: Adding "struct gpib_board_config"

* Patch 2 - Patch 17: Replacing gpib_board_config_t with
            "struct gpib_board_config"

* Patch 18: Removing typedef for gpib_board_config_t.

Michael Rubin (18):
  staing: gpib: struct typing for gpib_board_config
  staging: gpib: agilent_82350b: gpib_board_config
  staging: gpib: agilent_82357a: gpib_board_config
  staging: gpib: cb7210: struct gpib_board_config
  staging: gpib: cec: struct gpib_board_config
  staging: gpib: common: struct gpib_board_config
  staging: gpib: eastwood: struct gpib_board_config
  staging: gpib: fmh: struct gpib_board_config
  staging: gpib: gpio: struct gpib_board_config
  staging: gpib: hp_82335: struct gpib_board_config
  staging: gpib: hp_82341: struct gpib_board_config
  staging: gpib: gpibP: struct gpib_board_config
  staging: gpib: ines: struct gpib_board_config
  staging: gpib: lpvo_usb: struct gpib_board_config
  staging: gpib: ni_usb: struct gpib_board_config
  staging: gpib: pc2: struct gpib_board_config
  staging: gpib: tnt4882: struct gpib_board_config
  staging: gpib: Removing typedef gpib_board_config

 .../gpib/agilent_82350b/agilent_82350b.c      |  8 +++---
 .../gpib/agilent_82357a/agilent_82357a.c      |  4 +--
 drivers/staging/gpib/cb7210/cb7210.c          | 12 ++++----
 drivers/staging/gpib/cec/cec_gpib.c           |  4 +--
 drivers/staging/gpib/common/gpib_os.c         | 28 +++++++++----------
 drivers/staging/gpib/eastwood/fluke_gpib.c    | 12 ++++----
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 27 ++++++++++--------
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  2 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  4 +--
 drivers/staging/gpib/hp_82341/hp_82341.c      |  7 +++--
 drivers/staging/gpib/include/gpibP.h          |  4 +--
 drivers/staging/gpib/include/gpib_types.h     |  8 +++---
 drivers/staging/gpib/ines/ines_gpib.c         | 23 +++++++--------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  4 +--
 drivers/staging/gpib/pc2/pc2_gpib.c           | 12 ++++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 12 ++++----
 17 files changed, 91 insertions(+), 82 deletions(-)

-- 
2.43.0

