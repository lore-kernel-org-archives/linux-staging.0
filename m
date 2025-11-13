Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D835D333444
	for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030749; cv=none; b=upc58wHhaOUe9PyCKdzPAbm718rjZfZzrID6r69XRhBKPBt6YbafNJ9r1YfvlN676Yy1A0tUcK5JtVLB5jNA4t4IURuuLogVrCUlXIwl1LtfDIOkD0022nJuguqLxTrXiypX2mwyuEcXprjUPlx5iV6/chpw/i7B6zl/tXn3jVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030749; c=relaxed/simple;
	bh=vwKxN349ATo3V2sNVJl1gEHvQM6lroaY8Zc7FhvHnWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mb1bX20c8wmx6eOzv8FVn5zuWxIhbiNb29FcIMa32G8xUGBASoVO79MWu+FGlqD+F0yAKqsFNe7t4LLF/J3c8pfI3jau6sL9K5ONbyoN2zkv3G4iyaLYRyiUd1r3pQ82gH5Vce0S5Z0db/HI/0W9BX4AAYQPW91mThDjacrXUzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuT2aBU8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuT2aBU8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477563e28a3so4375075e9.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763030746; x=1763635546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztWyJTjfbAQ+qY2kswNUdM+lwH0vxOrggkmQeY3FcnE=;
        b=QuT2aBU8aVsodeNuaWLE2Xivz2Sao1tpG7253w6xRUdK6rOAaN1GsjGEk2RmmBXkdt
         nsqg88jLIl+2mpz2rILJdKiZYztEY7E5C5ZuU5c+SXuGeo2EZbYyHMfssqf4/c4ZqLGt
         P+nwoUVdUMZaBh6cNOKzMEiSuKzJlxRXAGnHbhkZHXQIwjWxaCtEvcW0eoNpq9TNbayo
         hNkGGZ7X3hZ5tvIkxdsaOseSCPF4rccpE5l9ZTi57xMfDK4sAPz5q+IUHvoomeaBSB0x
         dF4ZiAGubdAW43wnTh7CJwoM6ANdniAIs6WWyJWWxl3Z2/frM3XNNQ5h447o+CNVghki
         Qxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030746; x=1763635546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztWyJTjfbAQ+qY2kswNUdM+lwH0vxOrggkmQeY3FcnE=;
        b=SLt2t0HygmsuaQpg+qcE+DJzjOSaFRN2cpE1sNmTCvc48/nmmvh5hrJ/9m5p7JzyCy
         OjoD/UYibadHuH8oMmoJ4NpYojM3/v+8dS6r8stETt+BzJWNKYEMIzY2lZxBGMYnty16
         7d6eg1naXLJNZAhrFZ8viToWl2eIwXBhaUicaOLk6bBieHFcJxD/R4EMP3sNQM8uWtzd
         /QrrBmpDaRFAEQaL6UOpAH4MkB3EieJbLc4Po8lV9J6hrYfKyP+XNqnAbMco7n6P3otp
         TuBJOTzvK3rivG37h2CO5ogaANrE3C7nLi97g76PQtJ5HmSuDDM1GSaQ2h3BB2Cvegei
         hrsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaKBkrO4cbBZKkaIpfYbe7zL8vcTEIJBTd2fHym2YH/slSJ3NzzHuSEBcWS72u57+vx4ikbhG6fW6gFCJe@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlf4yYJtWKqC9dFVoehSDmsnXZ27KMrKPUNjipiMgAlkRMvqr1
	3oVrgR1EFWoa4Wzy8bB1/R2xv9yMpMtdWQRdnnVZ0uVbJqDSv+z84PYE
X-Gm-Gg: ASbGncsY8OR1xh7/gFHJu6eJkjQmhKKTNMBIMl3hDiVYGWZAjh420lY0E2P4LJSJGvC
	NTiPXDRgmkagwFTCrVpXuIRfp+Ll1dVN6H0Tx3hbLVXyO67V2CWr4pvJgscdkeYb0FB4IE16QTr
	e8gLGohN/tnmqVd7wul/e8HNzm1n/Y4msm+hQahl2aVnBowibnWvxqcLvL8sabnBKueVlSO5Iz0
	NkBKVIFvye/flKkyX3KtwO1FOO+Pl3SDxe9lIEZqet47yRqSDB+keWpE6BTO+ePJ9bfhhnAuSxk
	UEx6Q5EYgBkxCjjPR8RWMqXst1r0GJk/TL6vinnkIctP2w26hmCy9CsxABUmrcI1DLI4SUIK/Zi
	ZQDZI5/LqR7wrSIBmIWqAef1NRA0pg6ncLAA+wHZbCub6nwWwrgIb48X+l7GR59Lm+mzu/LTSBW
	9U3ynL7dzhAV1XLOWEIBZfq1hShoE=
X-Google-Smtp-Source: AGHT+IFORQOsW8Fx4p5YWkhcYsffqQYcuhXJaRHYwuKhRNKy7wq+LEYqFg+qbBSUDuo4l/7EerKT8g==
X-Received: by 2002:a05:600c:1e8f:b0:477:7d94:9cf0 with SMTP id 5b1f17b1804b1-4778bd7015dmr22854565e9.12.1763030746014;
        Thu, 13 Nov 2025 02:45:46 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm1444975e9.5.2025.11.13.02.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:45:45 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V3 0/6] Destage gpib drivers
Date: Thu, 13 Nov 2025 11:45:37 +0100
Message-ID: <20251113104543.5875-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is for moving the gpib drivers out of the staging area.

As many changes as possible (patches 1-5) are done in the staging area
to prepare for the move. Patch 6 does the move and completes the destage.

Patch 1: Remove gpib from Kconfig and Makefile in staging
Patch 2: Remove the gpib/uapi directory from include search path
Patch 3: In the code change the uapi include file paths to <linux/xxx.h>
Patch 4: Remove comment item in TODO file
Patch 5: Add SPDX syscall note to uapi gpib headers
Patch 6: Complete the destaging of gpib
      - Move the common gpib/uapi headers to include/uapi/linux
      - Move the gpib tree out of staging
      - Delete the word Linux from gpib Kconfig option title
      - Add gpib to Kconfig and Makefile in drivers
      - Update MAINTAINERS

Dave Penkler (6):
  staging: Remove gpib build from staging
  staging: gpib: Remove gpib/uapi from search path
  staging: gpib: Change file path for uapi headers
  staging: gpib: Update TODO file
  staging: gpib: Fix SPDX license for gpib headers
  gpib: Destage gpib

 MAINTAINERS                                        |  4 +++-
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
 73 files changed, 13 insertions(+), 25 deletions(-)
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
Changes for V2
Combine patches for Kconfig and Makefile
	Patch  1 and  2 -> Patch 1
	Patch 10 and 11 -> Patch 9
Add patch for MAINTAINERS

Changes V2 -> V3 Combine the destaging patches and Kconfig title
change into a single patch: Patches 5, 7-10 -> Patch 6
     
2.51.2

