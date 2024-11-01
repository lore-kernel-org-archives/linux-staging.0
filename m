Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCBF1A4F22
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483263; cv=none; b=AfYewQazSfaJY61Y7d3tlHjSneU/L6is+mu312nW06cyxvJfR2P6W0L4hUwRv3CIj4nX34Z8lutynlwQHWx5odwvCAg4vqiGQ8bjC4Xl/7MZhRcbXFYduQKrQ96Hyjq/vdgnzj1LnbjA/fBFf1ceRC73ItP4ILKjGwsFynsMCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483263; c=relaxed/simple;
	bh=ogpYD5K8PsKO5i6G7GPGCXK3XdYDIzkpQox1GZRQeIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oME4qJZfF6x2Wb5JOA0AOUQ6a5XHn4O99oPrZCe1qKIVX7Sn5fWHfdc0Mhs83OpKEQEmNCIMb0tNTSsSZuYqGL9FVYViz+ffi6GC5c018DzeXHqjJ7KuzK+/qvOXHw/SSlqocmZ1dnRd8XyRioKuUQmNu8gQKlw3Ks0Qcg7p58k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAboOy0j; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAboOy0j"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so1519187f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730483260; x=1731088060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqpqdAAsMY6Ea0B+Ms2g/Gdx1auCnnxqq5QczXj8Kic=;
        b=SAboOy0joCbS9dg/D47yy2qMCwfwIiS1fnCgxHAKGVdZL3ApbCZ6pB/wM6ypyyAK8a
         CeNV2YYFOfMnIDqe8EOaCFM/F+nWSuC8S1ItcG5945pVDDB4+opEIX+XLtTCKC7tZmCJ
         chFwSPA0To3uDzwLhHpzv0mx+tQzpa57nCPTKCOouaExPMAwGX+2jnWMIm1BGyB/gHe7
         gICuyCgVD7kh4+9ZcA2tjNWVmFjhQFW1Edn4NRkQVq9bcegbFTO3LbTk1LOnS/K6LIKI
         boIHIEDPOxowR+1undSX+AgubaRFlVIP17FFk/bDA5wx+oB2j7l4oCOk27wfVBe5h/7A
         ajxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483260; x=1731088060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqpqdAAsMY6Ea0B+Ms2g/Gdx1auCnnxqq5QczXj8Kic=;
        b=FyxM6h0URXjjXf4ry3njDJfY+u7PqVCvyyX1tnam3cJ5g98oaf4jrQfDf0JI1AQFc5
         9yFOat7u5Hl2pJ7wdV6iXfYXAhWJazp3Dhx33fiFgzaRnnC49CgwRpvXoZSNcRfiyIaO
         kC0swIVcU6hFBx7oLSnT0T2nbmeue+6EXVPqo+nohwn9D8i/oZO6NISaqbOMya+TeTca
         tXSSoLlPrqM2RIgwPUZGTv1ndX5SdU/Dto4NNH9HewugGm8bJXNGuvA2IjAodwQ/qt7H
         3kNBBU8VKH+mu4ogPEqk2JdAA8eLfF/bZHrZQKg1tpexXTDLdm6gmsSlUSqEhqzP8FYe
         h7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT9pulag+Yo3+yEU9Z9B2Sp32uW3sxh1D+5JypWV+idEuFzX/9eeWliPNphSezQU1w9cPybv0LzT0qds47@lists.linux.dev
X-Gm-Message-State: AOJu0YytBOztMB9stEyiAbNiNhPfmAgXRe+ILpfCTTEAQyAGpAYQ8imC
	WM3YQi1s4+t6IyhSQbd4E2j0mi4bI8O+WSYcotbQNCWQT9LGAGrYXBXU26/g
X-Google-Smtp-Source: AGHT+IGp6X2WRuG/2IzNPwJBQ5Vh8dtKSjI+JhJj/VcI7oAH6vhoDk+vbcGcTGmMYJC72h25Bs9yAA==
X-Received: by 2002:a05:6000:1863:b0:37d:43e5:a013 with SMTP id ffacd0b85a97d-381be765147mr6422778f8f.8.1730483260238;
        Fri, 01 Nov 2024 10:47:40 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1185b4bsm5732933f8f.112.2024.11.01.10.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:47:39 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/9] Patch set for gpib staging drivers
Date: Fri,  1 Nov 2024 18:46:56 +0100
Message-ID: <20241101174705.12682-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 is a bug fix
Patches 2-6 replace custom debug with dev_dbg as well as
            using dev_xxx for pr_xxx where feasible.
Patch 7 Corrects some errors in Kconfig
Patch 8 is a code cleanup
Patch 9 corrects GPIB behaviour

Dave Penkler (9):
  Fix buffer overflow in ni_usb_init
  Replace custom debug with dev_dbg
  Update messaging and usb_device refs in ni_usb
  Update messaging and usb_device refs in agilent_usb
  Remove GPIB_DEBUG reference and update messaging
  Use dev_xxx for messaging
  Fix Kconfig
  Rationalize lookup tables
  Correct check for max secondary address

 drivers/staging/gpib/Kconfig                  |  14 +-
 drivers/staging/gpib/Makefile                 |   1 -
 .../gpib/agilent_82350b/agilent_82350b.c      |  70 ++--
 .../gpib/agilent_82357a/agilent_82357a.c      | 266 +++++++-----
 drivers/staging/gpib/cb7210/cb7210.c          |   2 +-
 drivers/staging/gpib/common/gpib_os.c         | 139 ++++---
 drivers/staging/gpib/common/iblib.c           |  20 +-
 drivers/staging/gpib/common/ibsys.h           |   4 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c    |   2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |   4 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  85 ++--
 drivers/staging/gpib/include/gpibP.h          |   8 +-
 drivers/staging/gpib/ines/ines_gpib.c         |   2 +-
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  69 ++--
 drivers/staging/gpib/nec7210/nec7210.c        |  34 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 379 ++++++++++--------
 drivers/staging/gpib/tms9914/tms9914.c        |   8 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |   7 +-
 18 files changed, 579 insertions(+), 535 deletions(-)

-- 
2.46.2

