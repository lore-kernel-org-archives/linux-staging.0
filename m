Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E67521C9E5
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854333; cv=none; b=G56Fo4MncdongLzUpRuzLlUSMfohW/0XJ2l3ekxUCPjJ7NgAV0Ja0oPlyxYwO9NqRbJCIxXOmlbPACgp48oMB2Z2D2RXkMpZaNuO00R8uRGtWiiBhRkpqeBJ9y+am1AS4MffEzTK9sG3Hd4HVIudQVJUqX2EsVzyoFZ+ZRCCjg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854333; c=relaxed/simple;
	bh=g4Tvg2v3uaMjRivXYkTBo1k4N007uj1PtJMvrWlU9fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7JKVEErhfI8WapnuWbT4M88fYv8SL2+OUuRyN4rDpHJJQ3JhITWSU+BSeQMgtT+Q03tS0zeAZFTTzPq+8gBKdMQQaq2hP5v8DPofOuD12E2kyMABF06mScXiksAjE2fmpH725Q8eiwAKvIdtvhqFxoLEgtNmRiuVaAnPms+its=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZMrgbgO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZMrgbgO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47755a7652eso26134215e9.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854329; x=1763459129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1g24wLuzk0713nPetylKIaxUF4rWkrCCQ8cmdPQSuac=;
        b=GZMrgbgOP7cbXTGG6UyHUMI+rgqhHgyl2mVql/S5qG/6g1PGej1NRb1drKlcf3UcIg
         t993uniELsMwYCOVDioWiFQVdLlcfohnMvcpZjTzabjWc/Rh1J+kkXtv2FQ/7pBJ3kYK
         Uxb51HDijh4B8+mQrQLRlYR0QxC8s8xW0WahIwKzmA2H+heOZR7mWQmh4jn9bE8Yt/rL
         eTLS47G4GL+qcTgDmATXeQuG9i/ycTVf9yMd6DqRi5nlV7+fSSyVFgUJK3f/a9CfZ/Ip
         3rIzDqpxMGqH2C6XXb4bsM8zVl01+19lLZ/GEQ6hcngjwoSccdMmowvokp4HsLmq+jk2
         mUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854329; x=1763459129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g24wLuzk0713nPetylKIaxUF4rWkrCCQ8cmdPQSuac=;
        b=hE6Q5NvYAf0I3VGi3kozoLuhncQZ9ID4yEdjXZlQt98pn/8euZvdJ5Nmwyt9hUexG8
         hqJTtbqctkNFoFRdNhFOLhLXTF6RF8NhTIwxE+sXSzTf/45otdmf+nX1XaB+GXY7PDv3
         3fg93CxBu2GfD0kcGBZCDriQ43E13Okkku+vzwYjjfrAuTLNJgrIwnI74EoqewbaRq8x
         RuCVke8FXI4Qhwdo+vyq6+WJ+On0kfzq7s/4a25zyCWrh7cKG84gXClfoawSXZIYjju+
         iQVxpEojeQOJovAU4+cCCu7HTZbkPZ03S91fswdsSNzH9Nfzt13tAHj5WUpX8/hwctYa
         YO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9F2MbQOHJeVGIj5mR6MsxFahBvK//lmPLev9hGPX1upYpdclJ+fbswtsi2vurXV1X9PeABu+Vmx90Iy+p@lists.linux.dev
X-Gm-Message-State: AOJu0YwpSo/TpfVrwCirXhi0yRgRXriDe9IFjkvyPtXEUvqTq3O5DCL+
	OFf7yyI7PjeVg55jZRidOG6piXfKkYC1qmu3lmMOO2y9RDv2XNlnOklBIgwxug==
X-Gm-Gg: ASbGncuWTN6Fs17i8G71BSA8KLF0EOUbvqd0c3IkHb53bRAh8dZkDqKgcccYW/Y9B9B
	5/+yetoUugTj72N1UuDreBgNDRsl28tSsZ2JWWqygNcDNP7B71H2o7k/k8fdpc0nHT4MpVWcWpv
	lcNggIWnE3W6l9b242y/UffmZWqhuLCMwZFaCzsOn4h1kKARtpPkFSH9nnL+JwbZb+vndyd0Sy3
	EmAozaRVfnfykYRcMz+zv2o1K5naRrZJQhfP/spBto7/kCbCwKQhDPOdzrN301ztyGkMqISXQhH
	yBLjnoIqyu9Q/dSZVntXN2sbelqLZdRobKDa12IHhy0zJoHLT1No1L9fbddaW9FMBZRGM+UEOof
	jJ8Tzvmc9YgRK5/pLjgHeWvvF5EMcF6PKJMR22mZjmmXwmWlx19p79Fd7STDe5NlDr7W0zQf/rh
	akmcV/9TIsLjkP4JqY1toke3FGkvU=
X-Google-Smtp-Source: AGHT+IHH9CMNVraz2iiYocNiW3E37mR3fiBjV8xHSNldxyp2T4ZRTo/OOCUrEe25W1TrrO+B7vuqRA==
X-Received: by 2002:a05:600c:4f8b:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-47773271a62mr120100945e9.23.1762854329061;
        Tue, 11 Nov 2025 01:45:29 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:28 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 00/10] staging: gpib: Destage gpib drivers
Date: Tue, 11 Nov 2025 10:45:02 +0100
Message-ID: <20251111094512.6411-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is for moving the gpib drivers out of the staging area.

As many changes as possible (patches 1-6) are done in the staging area
to prepare for the move. Patches 7-10 do the move and complete the destage.

Patch 1: Remove gpib from Kconfig and Makefile in staging
Patch 2: Remove the gpib/uapi directory from include search path
Patch 3: In the code change the uapi include file paths to <linux/xxx.h>
Patch 4: Remove comment item in TODO file
Patch 5: Delete the word Linux from gpib Kconfig option title
Patch 6: Add SPDX syscall note to uapi gpib headers
Patch 7: Move the common gpib/uapi headers to include/uapi/linux
Patch 8: Move the gpib tree out of staging
Patch 9: Add gpib to Kconfig and Makefile in drivers
Patch 10: Update MAINTAINERS for post destage

Dave Penkler (10):
  staging: Remove gpib build from staging
  staging: gpib: Remove gpib/uapi from search path
  staging: gpib: Change file path for uapi headers
  staging: gpib: Update TODO file
  staging: gpib: Change gpib Kconfig option title
  staging: gpib: Fix SPDX license for gpib headers
  uapi: linux: Add common gpib interface headers
  gpib: Move gpib drivers out of staging
  gpib: Add gpib build menu and rule to drivers
  MAINTAINERS: Update for gpib destage

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
2.51.2

