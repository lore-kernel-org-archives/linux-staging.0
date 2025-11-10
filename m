Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832EB305E24
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770319; cv=none; b=AgK6ZRfC9DTmbNKPGthAeeZWz1paF92H/8EcmMm05Mv/0zxoUXZGpwvtPx5rw+nxVP4kbL4e8BVB+j8R5BbeFoqD5QVc5bilsP61NnTKwPPpeGwMsSgjVW9jN1v6Y207s0fbCkAoAdqIyYp4I4aXF4EFqHQPh0jXCyHzt9/AHvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770319; c=relaxed/simple;
	bh=aLD2D0olzp2rcAztgjBQdCgFN8e3WMLIVjImKI04C2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sm5geErfVjSSgl4X1W9GROe9sCzmvUC8etPLAC1QSWVumdegdOnREnNqagrZupqwh1HQUkJt7P8dSgTyz6PeNlONes2EoPY0JMAwAO8w7PY1F3pHkJ0o+rIxD2reVc2gB4NSWc3OGoSkhfL+u1yPMUjHUpUg2DcswR7vfYyE8Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdFeFIsP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdFeFIsP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4710022571cso27579385e9.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770316; x=1763375116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBA4uwpmBl+qsqpl8AZmHXAXU6/+um7JaHGAPG/1dCA=;
        b=BdFeFIsPbnCfJJF5W5C19d/Lpb0iOMklid7L39Q4cNqf/osrrSaDP/9XtOrngDlA+A
         TJWMHBda4FjkqXf06MhG/bGr3gXqi1E4D2cKJZ5+KJJoIpQkWtcIA3VfPGkRVdTKOcXP
         wxLPLidzP/ZVZL5Q0o3LHx1TW/gM/layf+dqgVt5Ydj8DQDPYjyoLHNj9zixZXunkUAZ
         5r4PGnPodLKtuzOQTyVeN92Onti+A2I4t+TXnb8AgRDXcy0o6RI3aYOEZGcNqQ72ZdgE
         8AoxXJBdqZJf+CLQwQz4Bbp6DSyCPMgpsNdZcw2GCjlYW7baPDO3kgaZ02Y8FBBfpfmn
         /pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770316; x=1763375116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBA4uwpmBl+qsqpl8AZmHXAXU6/+um7JaHGAPG/1dCA=;
        b=nlpo2vheZOYk6537ID/yj4AJ2hyveSt4CJJgOMNROuZKFMFMrULDrSHh02euvuMnxm
         mO4SqRjxvBOvaOf3fTy2+Qe7sZjQDdvZSUaB7k0D5T8tLmson6GyeBKOoIWEV6CtdjfV
         fVc00Yz9R/t3YMBa2kA6syhcle4TYirSZciFXwJCCh0tl56UiwvcwU12Tn0LDDxdv2Hc
         Co40oDnghohiuoN2pDE8PHlZUuHDa2fpk6mZW5PoHqctAYYXfrbXBh7SXAvwZeKE5i8V
         c4L9fH+P8lpqok/vrQAXvo2EwC14NXWfXrsP1mosMA/N1+3iw+Ze2PBFC5EUGnXG2DuS
         7PZg==
X-Forwarded-Encrypted: i=1; AJvYcCWSjaZj/WKjC6HzTEtb9L+PSsZTbwhkoIRYcWaciT88tNqkvQ79ujE6pfTgmxupXq8qmtSLDbPNiMF/Tvs+@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhscq8SF3PBHa/LyX4bhRyDzJLRqzFIVmCB7JgQc/0VOSiXxqZ
	8lLb1lPqwILeM0mBo4t0JR5ARnKwYdO/+s9PqspYj25GVmbeeBZbEncR
X-Gm-Gg: ASbGncvmv7i3nWXsu6Dsb9kRxCW3jS6eyGtM1Qv7wF5rGuaLwHA2pmCHR9Y1ST+17Fn
	PTOxBS1UXm+PZ5zzyz3BFSR4yWfdPfW7N9pB2UfdbVTtZkUevK95KZgw/PXCaUzqmgblQLIqr5W
	kwfLnJslpBUtqIkuZqJ7VlWTBmxtoMkeDMVgjYEcys3/rIzi0ELxzC14Rxkz2L+cPluwunfnGxy
	s6b5mAujB6u+j4Mp1HPDveaZZXaOG01XNHIC80pmv8wlfxt1FL6/CfyVWqqGvRIJTIYUbAWV9sx
	Hk57Wjzv8uzOzF98/dt4Yd/FggGsGTQJAwdHYjw4gGOlcRJX7WD1nVc9zt5A6QOkvBlvmmMuW8L
	B78Jok+uomf+eud8V9n7PH2JPU6eZepYTAIQtrsDUy9KloyyaQtjoVWBTHjGEK/2SDo/o6okKiP
	52W1XgV9m8F5k9+NpWW3cd72NGR1E=
X-Google-Smtp-Source: AGHT+IE9THz4YepjyBGe60Hg4foeS5X3azorWVxFKMDWSHbOw5ZEtzUTUpwVySzL5HQNWgw0Gj+nEQ==
X-Received: by 2002:a05:600c:190d:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47779c78b39mr42351535e9.30.1762770315492;
        Mon, 10 Nov 2025 02:25:15 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:15 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 00/11]  staging: gpib: Destage gpib drivers
Date: Mon, 10 Nov 2025 11:24:56 +0100
Message-ID: <20251110102507.1445-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is for moving the gpib drivers out of the staging area.

As many changes as possible (patches 1-7) are done in the staging area
to prepare for the move out of the staging area. Patches 8-11 do the move
and enable gpib in Kconfig and Makefile in the main drivers directory.

The MAINTAINER file will need to be updated when these patches
have been applied.

Patch 1: Remove the gpib option from the staging Kconfig menu
Patch 2: Remove the build rule for gpib from staging Makefile
Patch 3: Remove the gpib/uapi directory from include search path
Patch 4: In the code change the uapi include file paths to <linux/xxx.h>
Patch 5: Remove comment item in TODO file
Patch 6: Delete the word Linux from gpib Kconfig option title
Patch 7: Add SPDX syscall note to uapi gpib headers
Patch 8: Move the common gpib/uapi headers to include/uapi/linux
Patch 9: Move the gpib tree out of staging
Patch 10: Add gpib Kconfig option to the main drivers Kconfig menu
Patch 11: Add gpib build rule to main drivers Makefile


Dave Penkler (11):
  staging: Remove gpib Kconfig option from staging
  staging: Remove build of gpib drivers from Makefile
  staging: gpib: Remove gpib/uapi from search path
  staging: gpib: Change file path for uapi headers
  staging: gpib: Update TODO file
  staging: gpib: Change gpib Kconfig option title
  staging: gpib: Fix SPDX license for gpib headers
  uapi: linux: Add common gpib interface headers
  gpib: Move gpib drivers out of staging
  gpib: Add gpib Kconfig option
  gpib: Add build rule for gpib to Makefile

 drivers/Kconfig                                    |  2 ++
 drivers/Makefile                                   |  1 +
 drivers/{staging => }/gpib/Kconfig                 |  2 +-
 drivers/{staging => }/gpib/Makefile                |  2 +-
 drivers/{staging => }/gpib/TODO                    | 14 --------------
 drivers/{staging => }/gpib/agilent_82350b/Makefile |  0
 .../gpib/agilent_82350b/agilent_82350b.c           |  0
 .../gpib/agilent_82350b/agilent_82350b.h           |  0
 drivers/{staging => }/gpib/agilent_82357a/Makefile |  0
 .../gpib/agilent_82357a/agilent_82357a.c           |  0
 .../gpib/agilent_82357a/agilent_82357a.h           |  0
 drivers/{staging => }/gpib/cb7210/Makefile         |  0
 drivers/{staging => }/gpib/cb7210/cb7210.c         |  0
 drivers/{staging => }/gpib/cb7210/cb7210.h         |  0
 drivers/{staging => }/gpib/cec/Makefile            |  0
 drivers/{staging => }/gpib/cec/cec.h               |  0
 drivers/{staging => }/gpib/cec/cec_gpib.c          |  0
 drivers/{staging => }/gpib/common/Makefile         |  0
 drivers/{staging => }/gpib/common/gpib_os.c        |  0
 drivers/{staging => }/gpib/common/iblib.c          |  0
 drivers/{staging => }/gpib/common/ibsys.h          |  0
 drivers/{staging => }/gpib/eastwood/Makefile       |  0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.c   |  0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.h   |  0
 drivers/{staging => }/gpib/fmh_gpib/Makefile       |  0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.c     |  0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.h     |  0
 drivers/{staging => }/gpib/gpio/Makefile           |  0
 drivers/{staging => }/gpib/gpio/gpib_bitbang.c     |  0
 drivers/{staging => }/gpib/hp_82335/Makefile       |  0
 drivers/{staging => }/gpib/hp_82335/hp82335.c      |  0
 drivers/{staging => }/gpib/hp_82335/hp82335.h      |  0
 drivers/{staging => }/gpib/hp_82341/Makefile       |  0
 drivers/{staging => }/gpib/hp_82341/hp_82341.c     |  0
 drivers/{staging => }/gpib/hp_82341/hp_82341.h     |  0
 drivers/{staging => }/gpib/include/amcc5920.h      |  0
 drivers/{staging => }/gpib/include/amccs5933.h     |  0
 drivers/{staging => }/gpib/include/gpibP.h         |  4 ++--
 drivers/{staging => }/gpib/include/gpib_cmd.h      |  0
 drivers/{staging => }/gpib/include/gpib_pci_ids.h  |  0
 drivers/{staging => }/gpib/include/gpib_proto.h    |  0
 .../gpib/include/gpib_state_machines.h             |  0
 drivers/{staging => }/gpib/include/gpib_types.h    |  2 +-
 drivers/{staging => }/gpib/include/nec7210.h       |  0
 .../{staging => }/gpib/include/nec7210_registers.h |  0
 drivers/{staging => }/gpib/include/plx9050.h       |  0
 drivers/{staging => }/gpib/include/quancom_pci.h   |  0
 drivers/{staging => }/gpib/include/tms9914.h       |  0
 .../{staging => }/gpib/include/tnt4882_registers.h |  0
 drivers/{staging => }/gpib/ines/Makefile           |  0
 drivers/{staging => }/gpib/ines/ines.h             |  0
 drivers/{staging => }/gpib/ines/ines_gpib.c        |  0
 drivers/{staging => }/gpib/lpvo_usb_gpib/Makefile  |  0
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c             |  0
 drivers/{staging => }/gpib/nec7210/Makefile        |  0
 drivers/{staging => }/gpib/nec7210/board.h         |  0
 drivers/{staging => }/gpib/nec7210/nec7210.c       |  0
 drivers/{staging => }/gpib/ni_usb/Makefile         |  0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.c    |  0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.h    |  0
 drivers/{staging => }/gpib/pc2/Makefile            |  0
 drivers/{staging => }/gpib/pc2/pc2_gpib.c          |  0
 drivers/{staging => }/gpib/tms9914/Makefile        |  0
 drivers/{staging => }/gpib/tms9914/tms9914.c       |  0
 drivers/{staging => }/gpib/tnt4882/Makefile        |  0
 drivers/{staging => }/gpib/tnt4882/mite.c          |  0
 drivers/{staging => }/gpib/tnt4882/mite.h          |  0
 drivers/{staging => }/gpib/tnt4882/tnt4882_gpib.c  |  0
 drivers/staging/Kconfig                            |  2 --
 drivers/staging/Makefile                           |  1 -
 .../gpib/uapi => include/uapi/linux}/gpib.h        |  2 +-
 .../gpib/uapi => include/uapi/linux}/gpib_ioctl.h  |  2 +-
 72 files changed, 10 insertions(+), 24 deletions(-)
 rename drivers/{staging => }/gpib/Kconfig (99%)
 rename drivers/{staging => }/gpib/Makefile (92%)
 rename drivers/{staging => }/gpib/TODO (56%)
 rename drivers/{staging => }/gpib/agilent_82350b/Makefile (100%)
 rename drivers/{staging => }/gpib/agilent_82350b/agilent_82350b.c (100%)
 rename drivers/{staging => }/gpib/agilent_82350b/agilent_82350b.h (100%)
 rename drivers/{staging => }/gpib/agilent_82357a/Makefile (100%)
 rename drivers/{staging => }/gpib/agilent_82357a/agilent_82357a.c (100%)
 rename drivers/{staging => }/gpib/agilent_82357a/agilent_82357a.h (100%)
 rename drivers/{staging => }/gpib/cb7210/Makefile (100%)
 rename drivers/{staging => }/gpib/cb7210/cb7210.c (100%)
 rename drivers/{staging => }/gpib/cb7210/cb7210.h (100%)
 rename drivers/{staging => }/gpib/cec/Makefile (100%)
 rename drivers/{staging => }/gpib/cec/cec.h (100%)
 rename drivers/{staging => }/gpib/cec/cec_gpib.c (100%)
 rename drivers/{staging => }/gpib/common/Makefile (100%)
 rename drivers/{staging => }/gpib/common/gpib_os.c (100%)
 rename drivers/{staging => }/gpib/common/iblib.c (100%)
 rename drivers/{staging => }/gpib/common/ibsys.h (100%)
 rename drivers/{staging => }/gpib/eastwood/Makefile (100%)
 rename drivers/{staging => }/gpib/eastwood/fluke_gpib.c (100%)
 rename drivers/{staging => }/gpib/eastwood/fluke_gpib.h (100%)
 rename drivers/{staging => }/gpib/fmh_gpib/Makefile (100%)
 rename drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.c (100%)
 rename drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.h (100%)
 rename drivers/{staging => }/gpib/gpio/Makefile (100%)
 rename drivers/{staging => }/gpib/gpio/gpib_bitbang.c (100%)
 rename drivers/{staging => }/gpib/hp_82335/Makefile (100%)
 rename drivers/{staging => }/gpib/hp_82335/hp82335.c (100%)
 rename drivers/{staging => }/gpib/hp_82335/hp82335.h (100%)
 rename drivers/{staging => }/gpib/hp_82341/Makefile (100%)
 rename drivers/{staging => }/gpib/hp_82341/hp_82341.c (100%)
 rename drivers/{staging => }/gpib/hp_82341/hp_82341.h (100%)
 rename drivers/{staging => }/gpib/include/amcc5920.h (100%)
 rename drivers/{staging => }/gpib/include/amccs5933.h (100%)
 rename drivers/{staging => }/gpib/include/gpibP.h (96%)
 rename drivers/{staging => }/gpib/include/gpib_cmd.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_pci_ids.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_proto.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_state_machines.h (100%)
 rename drivers/{staging => }/gpib/include/gpib_types.h (99%)
 rename drivers/{staging => }/gpib/include/nec7210.h (100%)
 rename drivers/{staging => }/gpib/include/nec7210_registers.h (100%)
 rename drivers/{staging => }/gpib/include/plx9050.h (100%)
 rename drivers/{staging => }/gpib/include/quancom_pci.h (100%)
 rename drivers/{staging => }/gpib/include/tms9914.h (100%)
 rename drivers/{staging => }/gpib/include/tnt4882_registers.h (100%)
 rename drivers/{staging => }/gpib/ines/Makefile (100%)
 rename drivers/{staging => }/gpib/ines/ines.h (100%)
 rename drivers/{staging => }/gpib/ines/ines_gpib.c (100%)
 rename drivers/{staging => }/gpib/lpvo_usb_gpib/Makefile (100%)
 rename drivers/{staging => }/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c (100%)
 rename drivers/{staging => }/gpib/nec7210/Makefile (100%)
 rename drivers/{staging => }/gpib/nec7210/board.h (100%)
 rename drivers/{staging => }/gpib/nec7210/nec7210.c (100%)
 rename drivers/{staging => }/gpib/ni_usb/Makefile (100%)
 rename drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.c (100%)
 rename drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.h (100%)
 rename drivers/{staging => }/gpib/pc2/Makefile (100%)
 rename drivers/{staging => }/gpib/pc2/pc2_gpib.c (100%)
 rename drivers/{staging => }/gpib/tms9914/Makefile (100%)
 rename drivers/{staging => }/gpib/tms9914/tms9914.c (100%)
 rename drivers/{staging => }/gpib/tnt4882/Makefile (100%)
 rename drivers/{staging => }/gpib/tnt4882/mite.c (100%)
 rename drivers/{staging => }/gpib/tnt4882/mite.h (100%)
 rename drivers/{staging => }/gpib/tnt4882/tnt4882_gpib.c (100%)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib.h (97%)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib_ioctl.h (98%)

-- 
2.51.2

