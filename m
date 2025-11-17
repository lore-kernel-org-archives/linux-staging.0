Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DF523A9AD
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390430; cv=none; b=plRptkwCayBPAxEdf8n41ucW2L72kGugV4NFqinXOKP4X/ntMG0WZ6/ht7ix/QnLlZ4qfxx9kfvRz1I60G+rYZPT94qap4jBnbLmXpTx0bx81IzIRgDik/zLRD6Uszcd/lWpX4v3NFtX7VkdcuQUmjRzwFxumjf890vpQGKsK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390430; c=relaxed/simple;
	bh=HzZS7RBNOc4a1Le3DL4kg0m7yS5TW8IuHZNWdKbj/O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVu2WjRfWrn1kbEoJrxDLfqzpufAI0dQ/8Co8HMda/90zf3xI7GEyhk4xktZCbs+nz7jmCm/P8xsjVm71DOzZW0cZa/YwRUYT2WwLCTAG2m6YzQPBq/6kfRYxQ+WSvC/HvpA312gCc+f5fLpXFga4NtyABNJyb4hLdILdpGTjqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCEpL8i4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCEpL8i4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429c4c65485so3695554f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 06:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763390426; x=1763995226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=65p5NSyo+YW+QKVpkeyAjsajbkj9XkTeb+3NX7vI+4M=;
        b=RCEpL8i453LISZVQNJjTpzvUheuX9T4/z1cQsvgN3R8kMnccyOAJkCFViCpAR1GANW
         jFK94CK9bZ93UvJodVeU1RTkWFIXSw3x+lgoO+K2RZc17eudvgSzQIIPw5K6XoDMkLfa
         MkI9QrWV4ROipkIzkjI6kf4KadCDnjBLqI71MOGw6FXBaRs2cM/FB0utHHMqxYCJSXzk
         yVgpsd/V20sJYpadIaKmj/AgGjQIbmjjJZOOoK25vfzQ/L7VDndea/0uN2fuGmBjEHZq
         W0K+WSw12/e0CCvVoK/I2RQZh1Daykc3tfafNn569BuS6PP28rV2G2X7S0BJc4UIBDHd
         JC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390426; x=1763995226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65p5NSyo+YW+QKVpkeyAjsajbkj9XkTeb+3NX7vI+4M=;
        b=rby9X5grRBsA9rrXGetwP2ZYi38PCpvV3VFw9YUnKO377zu3wCKm+GemYbC4PFxScs
         x753vmsBBSL84+Tv5a8btXH3lH1tTSBQ4ETrMHxgo6x73JYcXnjBhA2Q5rEPSZ2Q4mJn
         DW2dACPNgAxnX5lPDHPPeuB124SN+owPjZseov9pFcCZZsVQ3csibFkMBXaUqtL0dAjC
         cfNJvi0y9ifiou4GDsVjzYIr2VEkjbaQk7tihNsm33s1ptw1juimj894UMoHRiuaqwdm
         E00sAMaNwZYnI3X9v3GPZ79mRWfBk7/dMBzuXRudv+YrOcgkQ64pjhqgto2dKFbVjvXi
         5jbA==
X-Forwarded-Encrypted: i=1; AJvYcCXsSZ++C2MC6zHHkCCBhhOjgObPCjl/IEa6pvTplLqi8McBoLgTqCjFuNl6h3Sryzm+m2S+5Zka6doRSl/p@lists.linux.dev
X-Gm-Message-State: AOJu0YwcTFV9HiJ0rw2wEy2tA5F2Isx3qt3cYe9hQNUMBMPTMMAFPHMf
	O4CFDJhx2TSNXg/9WW3YqrKEurNg7sgMcViHWGOaGDnbhDzGLOsnedkp
X-Gm-Gg: ASbGncva6oSYdg8FrYiY3NuKbI9+dajtu8oKAjdQMdso1pmQ1LVFugxGEZ91DDmIA3X
	2kcOwQWl7giVxWcJi0gbjGcUuaFpDCVyJyT9+CPzpopzJ6NwONzEdo1iuE9ySuLdJ2Zy0XeccEe
	vMze9KeXxqYp6eYcrO1WOlFMgWggkBD/HR6LZUX0901c3xAC11sOQAN7msKZRIJvpE4UlkAs4Vw
	Q8MiewvhHQcD9J4hMs75tqSc4LB8xxCjampZ3g/+V4OObvlBjcNVYnGP7EFbEbye9h7Lbx84GbN
	inbI3MrdHjLeheBL99Xu4elRabj9sErkNuU4iJZYl6FMk9AtOyOmd3WUFgyapM3ZsCkbyl01TIV
	qI+3JnSlqOhN3k0cOkgqLI0ZBSPkzN7duYCL+Ix+zemT7OdGGbk/3UY3A9FHpGQ8itBuKcR/vnY
	2O9KtVXSYJgIRpVR5a
X-Google-Smtp-Source: AGHT+IFHHI1xb5aszDWP3dFKQUUHP3wWY7MAkSIwVsf3ehWD2Rw4/NR4AE3AFQgzfU/Ay4riQ0uppA==
X-Received: by 2002:a05:6000:1846:b0:42b:396e:27fd with SMTP id ffacd0b85a97d-42b59371fa3mr10963142f8f.38.1763390425947;
        Mon, 17 Nov 2025 06:40:25 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm26788218f8f.41.2025.11.17.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:40:25 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V4 0/4] Destage gpib drivers
Date: Mon, 17 Nov 2025 15:40:17 +0100
Message-ID: <20251117144021.23569-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is for moving the gpib drivers out of the staging area.

Patches 1-3 make some preliminary changes in staging to prepare for the move.
Patch 4 does the move and completes the destage.

Patch 1: Change // comments in uapi header file
Patch 2: Remove comment item in TODO file
Patch 3: Add SPDX syscall note to uapi gpib headers
Patch 4: Complete the destaging of gpib
      - Remove gpib from Kconfig and Makefile in staging
      - Remove the gpib/uapi directory from include search path in Makefile
      - In the code change the uapi include file paths to <linux/xxx.h>
      - Move the common gpib/uapi headers to include/uapi/linux
      - Move the gpib tree out of staging
      - Delete the word Linux from gpib Kconfig file
      - Add gpib to Kconfig and Makefile in drivers
      - Update MAINTAINERS

Dave Penkler (4):
  staging: gpib: Change // comments in uapi header file
  staging: gpib: Update TODO file
  staging: gpib: Fix SPDX license for gpib headers
  gpib: Destage gpib

 MAINTAINERS                                      |  4 +++-
 drivers/Kconfig                                  |  2 ++
 drivers/Makefile                                 |  1 +
 drivers/{staging => }/gpib/Kconfig               |  8 ++++----
 drivers/{staging => }/gpib/Makefile              |  2 +-
 drivers/{staging => }/gpib/TODO                  | 14 --------------
 .../{staging => }/gpib/agilent_82350b/Makefile   |  0
 .../gpib/agilent_82350b/agilent_82350b.c         |  0
 .../gpib/agilent_82350b/agilent_82350b.h         |  0
 .../{staging => }/gpib/agilent_82357a/Makefile   |  0
 .../gpib/agilent_82357a/agilent_82357a.c         |  0
 .../gpib/agilent_82357a/agilent_82357a.h         |  0
 drivers/{staging => }/gpib/cb7210/Makefile       |  0
 drivers/{staging => }/gpib/cb7210/cb7210.c       |  0
 drivers/{staging => }/gpib/cb7210/cb7210.h       |  0
 drivers/{staging => }/gpib/cec/Makefile          |  0
 drivers/{staging => }/gpib/cec/cec.h             |  0
 drivers/{staging => }/gpib/cec/cec_gpib.c        |  0
 drivers/{staging => }/gpib/common/Makefile       |  0
 drivers/{staging => }/gpib/common/gpib_os.c      |  0
 drivers/{staging => }/gpib/common/iblib.c        |  0
 drivers/{staging => }/gpib/common/ibsys.h        |  0
 drivers/{staging => }/gpib/eastwood/Makefile     |  0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.c |  0
 drivers/{staging => }/gpib/eastwood/fluke_gpib.h |  0
 drivers/{staging => }/gpib/fmh_gpib/Makefile     |  0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.c   |  0
 drivers/{staging => }/gpib/fmh_gpib/fmh_gpib.h   |  0
 drivers/{staging => }/gpib/gpio/Makefile         |  0
 drivers/{staging => }/gpib/gpio/gpib_bitbang.c   |  0
 drivers/{staging => }/gpib/hp_82335/Makefile     |  0
 drivers/{staging => }/gpib/hp_82335/hp82335.c    |  0
 drivers/{staging => }/gpib/hp_82335/hp82335.h    |  0
 drivers/{staging => }/gpib/hp_82341/Makefile     |  0
 drivers/{staging => }/gpib/hp_82341/hp_82341.c   |  0
 drivers/{staging => }/gpib/hp_82341/hp_82341.h   |  0
 drivers/{staging => }/gpib/include/amcc5920.h    |  0
 drivers/{staging => }/gpib/include/amccs5933.h   |  0
 drivers/{staging => }/gpib/include/gpibP.h       |  4 ++--
 drivers/{staging => }/gpib/include/gpib_cmd.h    |  0
 .../{staging => }/gpib/include/gpib_pci_ids.h    |  0
 drivers/{staging => }/gpib/include/gpib_proto.h  |  0
 .../gpib/include/gpib_state_machines.h           |  0
 drivers/{staging => }/gpib/include/gpib_types.h  |  2 +-
 drivers/{staging => }/gpib/include/nec7210.h     |  0
 .../gpib/include/nec7210_registers.h             |  0
 drivers/{staging => }/gpib/include/plx9050.h     |  0
 drivers/{staging => }/gpib/include/quancom_pci.h |  0
 drivers/{staging => }/gpib/include/tms9914.h     |  0
 .../gpib/include/tnt4882_registers.h             |  0
 drivers/{staging => }/gpib/ines/Makefile         |  0
 drivers/{staging => }/gpib/ines/ines.h           |  0
 drivers/{staging => }/gpib/ines/ines_gpib.c      |  0
 .../{staging => }/gpib/lpvo_usb_gpib/Makefile    |  0
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c           |  0
 drivers/{staging => }/gpib/nec7210/Makefile      |  0
 drivers/{staging => }/gpib/nec7210/board.h       |  0
 drivers/{staging => }/gpib/nec7210/nec7210.c     |  0
 drivers/{staging => }/gpib/ni_usb/Makefile       |  0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.c  |  0
 drivers/{staging => }/gpib/ni_usb/ni_usb_gpib.h  |  0
 drivers/{staging => }/gpib/pc2/Makefile          |  0
 drivers/{staging => }/gpib/pc2/pc2_gpib.c        |  0
 drivers/{staging => }/gpib/tms9914/Makefile      |  0
 drivers/{staging => }/gpib/tms9914/tms9914.c     |  0
 drivers/{staging => }/gpib/tnt4882/Makefile      |  0
 drivers/{staging => }/gpib/tnt4882/mite.c        |  0
 drivers/{staging => }/gpib/tnt4882/mite.h        |  0
 .../{staging => }/gpib/tnt4882/tnt4882_gpib.c    |  0
 drivers/staging/Kconfig                          |  2 --
 drivers/staging/Makefile                         |  1 -
 .../gpib/uapi => include/uapi/linux}/gpib.h      |  2 +-
 .../uapi => include/uapi/linux}/gpib_ioctl.h     | 16 ++++++++--------
 73 files changed, 23 insertions(+), 35 deletions(-)
 rename drivers/{staging => }/gpib/Kconfig (97%)
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
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib_ioctl.h (90%)

-- 
Changes for V2
Combine patches for Kconfig and Makefile
	Patch  1 and  2 -> Patch 1
	Patch 10 and 11 -> Patch 9
Add patch for MAINTAINERS

Changes V2 -> V3 Combine the destaging patches and Kconfig title
change into a single patch: Patches 5, 7-10 -> Patch 6

Changes V3 -> V4
    Add comment patch for ppc64 build failure
    Also combine patches 1,2,3 and 6 into a single patch -> Patch 4

2.51.2	 
