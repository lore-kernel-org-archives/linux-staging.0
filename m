Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E1B1C9ED5
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742624; cv=none; b=YUDK+R+vzQQTKTvg2kjogSbM/f0cdRKYFCHQPUiX4bE7DAmmyP6jUkJdy95mKeTvVwKOanzHyEpyl7xrW7+NomLCYvb9h5J7AxsixvUaJvsdPsepR5lIPBYm4Tr29bw1M5EQfpeuctIoSfuZezrIFJ4Mj4CeWUnG45gts4aUHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742624; c=relaxed/simple;
	bh=5mXa1ND1V3waxOlI1xXyCccMxl7SRmuhcCww4LFlQRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KfFQjFZy+pvcPfqWUE0zhbOslAQeIdEp4Egxsnppgou4t6KiJhMM6P6PNDpv17YndgiUUQyVKq57F3mISHjscJojHkcjXQ0ICcdkhMDCrz593d5zL7iFQrzMSBm8v73EDCvZq8I5xz2G4rzeMZLumz7+tPbr7C4n3co1hTkY+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctuaU3yo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctuaU3yo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d49a7207cso2829795f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 09:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730742621; x=1731347421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUmBX0B8evIE4Q0UWEXCCXfctNNwNil7XTvRbb1SpDI=;
        b=ctuaU3yoRtXQ6QuIvAZgU7PLlgz/Qh4hIu97x4xJVw43aKGqXxON3zfq3bcJ5iLbhq
         gpn7aMbVvmmGeFghLkuBj/bBX0MO8hKhnhPAaaBPTWvoql0t7vdXELPYogcy67piCpN/
         WFDoGUZcbrb1ighjH9YGmHfHVwKX2XIquncSB2f3kZoEZq6ei6lTstyorwjyRGS88xBf
         bjJk9hlMNeuiLgInO4HlAwiXrMNJHSUqBB/hsTEzP+jcuIf3vp/tG4LrUWlRF+zJw/Qo
         kaKLKJCWMAwaoDgePURl/f5HTSaA+2QDYa6ZdTnxtrHfd2/MvvdGNnfuJOqjudLF/S8H
         Fw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742621; x=1731347421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUmBX0B8evIE4Q0UWEXCCXfctNNwNil7XTvRbb1SpDI=;
        b=TaW2xkdXw4rT8gYsQ3ULtal1MlPSKuSQSXESHN0PCBQlNSV8BBaGHgKyoAkYLEiXjf
         fstDXQbw07klyUAlktSBhDMhC+5QkhGJTx6M7lnHDSs6vnojxPnyhZOhWtl0JZ3KbHB0
         ai4jZPKKRBuN6WGqudY9WFCLpVAnRpPbhlEq5FF0tTis7QBpA+JFAyqYgWot0u7QxkiQ
         yIp1Chfmxo3dzyU+CZdTLDBqtNr4rpTJI8SMJgW53g5nDSBwZ/ddBjBaVNlVmNTezTdI
         S55eAIm7E39PF1/t3sMTxuLq1mo5nVweEsVOjBHVwx9fPqUc6kkBSq2L1z7EzNspbjqr
         uOxg==
X-Forwarded-Encrypted: i=1; AJvYcCW6X7olTodPWtrl50y8f9/LwdUj8F813BU+o7U+WNQko/fZpSLppRSBXeYCbPJqu+n10e2M9BUTjr2FhEjw@lists.linux.dev
X-Gm-Message-State: AOJu0YxEfZSfH1OtKEdRKnlYo5WTWVpP6cejqOYyh4qYThzZDOrhC5ix
	/IZ0USWL3/LzlBDhR8hbZtzT1ePg+RJTQzbMm8PLJh8wq/ceMi6u
X-Google-Smtp-Source: AGHT+IFnZNVMMDOAohnCb1dfed8YI8GbSIY3HS8oUEDhEPTqH6n4mqB+1D4kjzpaanKejXCQEdiPJA==
X-Received: by 2002:a5d:5c01:0:b0:37d:461d:b1ea with SMTP id ffacd0b85a97d-381c7ab30b1mr11347722f8f.48.1730742621060;
        Mon, 04 Nov 2024 09:50:21 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7f80sm13839821f8f.20.2024.11.04.09.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:50:20 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3 00/12] staging: gpib: Patch set for gpib staging drivers
Date: Mon,  4 Nov 2024 18:50:01 +0100
Message-ID: <20241104175014.12317-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 is a bug fix
Patches 2-4 replace custom debug with dev_dbg as well as
            using dev_xxx for pr_xxx where feasible.
Patch 5 Fixes the agilent_usb module description
Patch 6 Addresses a checkpatch CHECK for mutex comment
Patch 7 Changes dev_xxx for pr_xxx in the agilent PCI driver
Patch 8 Corrects some errors in Kconfig
Patch 9-11 are code cleanups
Patch 12 corrects some GPIB behaviour

Changes in v3
Incorporate the lpvo patch 5 into patch 2
Remove commented out console messages in patch 4
Add a separate patch for module description -> Patch 5
Add a separate patch for mutex comment      -> Patch 6
Change "spelling error" to "typo" in commit message in patch 8 (was 7)
Clarfiy commit message in patch 11 (was patch 10)
Add a fixes tag to patch 12 (was 11)

Changes in v2
Add staging: gpib: prefix to subject lines
-Patch 1 Use kmalloc_array, remove blanks in commit message and add Fixes tag
-Patch 3 Delete commented out code
-Patch 7 Fix Fixes tag
-Patch 8 Split into 3 patches 8,9 & 10
-Patch 9 -> 11 Clarify commit message, delete blank line and add defines
 for max primary and secondary addresses.


Dave Penkler (12):
  staging: gpib: Fix buffer overflow in ni_usb_init
  staging: gpib: Replace custom debug with dev_dbg
  staging: gpib: Update messaging and usb_device refs in ni_usb
  staging: gpib: Update messaging and usb_device refs in agilent_usb
  staging: gpib: Fix MODULES_DESCRIPTION
  staging: gpib: Add comment for mutex define
  staging: gpib: Use dev_xxx for messaging
  staging: gpib: Fix Kconfig
  staging: gpib: Remove unneeded lookup table
  staging: gpib: Remove GPIO14 and GPIO15 lines in lookup tables
  staging: gpib: Re-order the lookup tables
  staging: gpib: Correct check for max secondary address

 drivers/staging/gpib/Kconfig                  |  14 +-
 drivers/staging/gpib/Makefile                 |   1 -
 .../gpib/agilent_82350b/agilent_82350b.c      |  70 ++--
 .../gpib/agilent_82357a/agilent_82357a.c      | 261 ++++++------
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
 18 files changed, 551 insertions(+), 521 deletions(-)

-- 
2.46.2

