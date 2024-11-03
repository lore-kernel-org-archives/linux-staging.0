Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A768918BC15
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730669192; cv=none; b=hZ9ecVZSph5fmZ3ay4i3GRyYiPeGip2llWcWldYH8JWQecPaGeAdLmVyLOuhRPfDJRW2cKj2FK1YO46EFGgI6/rvm8DRUBueyLig6qWLGcjbwn8hR8GjfhJUUT4qcP6F3Jg/rJJKGFbdKFwJl5Bna3Qwri2pPnSu6foX7eMK8iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730669192; c=relaxed/simple;
	bh=bdpo+Pfuv8VyaA8KGzos0qW/9dldwTJy6W19+kdX1P4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BlJYcW6hbV6ERttaMYqGwS5tcsAiQXk3aG4dCG7GhCwAdaH/kzIy0GkKghACZy8OSZe+2zpqYHyHkfmNfYvqvHTihq1wp+EjKRCN4Ff/GUrmXdG/OamJHFR4dTxRWxjz7Y/luIHoMzVTnj9RhQ4E+CpSExW3LBlrjul7KFLzUVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvGWHqaO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvGWHqaO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d447de11dso2903098f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 13:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730669188; x=1731273988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAjOK4V/qUe0b0tbcpJU9G58SdnMJIladw6oPPznhpI=;
        b=jvGWHqaOdYV/4kdE16ISrhsmjbnnaeeGSsX6jIKsFVCfxhTxIA9FJ/asu7T2JT5YV2
         aN+1ui2DM2EsyxbT7koIPO+jYlN1dLRPO+0QhHtutn6RwaOybxFSz3pnkYv8weW55QEW
         EmtjHBoCSRcWMzobIHvsn2PX4mTSZnoNF7zCwG3nARjnOjtFbuRlyuhWVCGyB9R6v25N
         mmNnlcWhWz0amcNGwc9bEBEJMcvbk4m9Jx8Y48Qhmm/iGyrNss6h0bdUiimiHpHvZ1dP
         JRwCan1QxZprn1NfmdoN0y55GjA9WXHKNyjS8wGIOmhJrbzEOQ8tu32qBfIctkSzX3gb
         ZtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730669188; x=1731273988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAjOK4V/qUe0b0tbcpJU9G58SdnMJIladw6oPPznhpI=;
        b=kXlhwnsP2PhxFQv4/+UPyUhnhQAa3Mb6c8gijR99xGAGp51u9OWM8Cp/LPFTDmdvc1
         GQ4S4LdfZwDkcjyW0p8w/RSLIjHtIFvW0JJEFi77tMaQP6NQYEmufyMk3kefAY/kFbaF
         aC7EqnGDOrUft3lsu8Tajs4h1MnUOccNL8+PWLCRJPsf6lrIcFk2SahrE4w3UBtJHZMi
         7hkiMjIauDmMThLORfBtjZr9X+/qik2l35AryLRNW1I7l8iNXzdFZ4EZYB3mT87iM64/
         T27gBpKd9ZwUK0oJSwTpDst0EPB76ZM3bMXXrKPKas/fU8CFM7tJjrOb1pouqzfIVgvs
         Dezg==
X-Forwarded-Encrypted: i=1; AJvYcCX9nbzAln6I11V/NYLA/2diGxISZ0AG1FDUOSHXbgVU9vWpZoOKr9d5E1Ix4gi/fBbRImZXf9dyCAMaWsTv@lists.linux.dev
X-Gm-Message-State: AOJu0YypmDCYMtYGlvAtmPZ6jOB7a1Dqadpshwb5Jl70XfV0fo/46/y5
	InMemJxN0bKTEq+L+Sf/skI9VeYC6qjD96bQlEwiIYk1mpo5e0eL
X-Google-Smtp-Source: AGHT+IGJF0PDNQojlT7F7yvMf7/bZNReM6S/xIsjIvLh/BNRX4JsZrc4uTCEvdgrTmkwgPJy9Z2v2g==
X-Received: by 2002:a05:6000:1566:b0:37d:48ec:547 with SMTP id ffacd0b85a97d-381be7d919amr11235642f8f.29.1730669186572;
        Sun, 03 Nov 2024 13:26:26 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd910718sm166150385e9.12.2024.11.03.13.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:26:24 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v2 00/11] staging: gpib: Patch set for gpib staging drivers
Date: Sun,  3 Nov 2024 22:26:06 +0100
Message-ID: <20241103212617.13076-1-dpenkler@gmail.com>
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
Patch 8-10 are a code cleanup
Patch 11 corrects some GPIB behaviour

Changes in v2
Add staging: gpib: prefix to subject lines
-Patch 1 Use kmalloc_array, remove blanks in commit message and add Fixes tag
-Patch 3 Delete commented out code
-Patch 7 Fix Fixes tag
-Patch 8 Split into 3 patches 8,9 & 10
-Patch 9 -> 11 Clarify commit message, delete blank line and add defines
 for max primary and secondary addresses.

Dave Penkler (11):
  staging: gpib: Fix buffer overflow in ni_usb_init
  staging: gpib: Replace custom debug with dev_dbg
  staging: gpib: Update messaging and usb_device refs in ni_usb
  staging: gpib: Update messaging and usb_device refs in agilent_usb
  staging: gpib: Remove GPIB_DEBUG reference and update messaging
  staging: gpib: Use dev_xxx for messaging
  staging: gpib: Fix Kconfig
  staging: gpib: Remove unneeded lookup table
  staging: gpib: Remove GPIO14 and GPIO15 lines in lookup tables
  staging: gpib: Re-order the lookup tables
  staging: gpib: Correct check for max secondary address

 drivers/staging/gpib/Kconfig                  |  14 +-
 drivers/staging/gpib/Makefile                 |   1 -
 .../gpib/agilent_82350b/agilent_82350b.c      |  70 ++--
 .../gpib/agilent_82357a/agilent_82357a.c      | 266 +++++++-----
 drivers/staging/gpib/cb7210/cb7210.c          |   2 +-
 drivers/staging/gpib/common/gpib_os.c         | 142 +++----
 drivers/staging/gpib/common/iblib.c           |  22 +-
 drivers/staging/gpib/common/ibsys.h           |   7 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c    |   2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |   4 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  41 +-
 drivers/staging/gpib/include/gpibP.h          |   8 +-
 drivers/staging/gpib/ines/ines_gpib.c         |   2 +-
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  69 ++--
 drivers/staging/gpib/nec7210/nec7210.c        |  34 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 378 ++++++++++--------
 drivers/staging/gpib/tms9914/tms9914.c        |   8 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |   7 +-
 18 files changed, 561 insertions(+), 516 deletions(-)

-- 
2.46.2

