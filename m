Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016B73FC1
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 07:27:03 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id w4so34409427ljh.13
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 00:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mDTHPcAeze7GuqTFf7iUzU0Ra0uK6CJMs05qWwtQgPQ=;
        b=XCsV+xe2VKeCxurdqvIahXVQVzBjDwZzUZjzAvtSXPXz7i1J0LJdV28tcFZQbU0T/Q
         wd4wTigTfYyKSMnqYRNKkuMtVBBgcES70UmxHDBafzxgZYfq4j4qUn4emDbIwGhUPB4h
         8rv6mlG9WaUHjRklgTi++rJ0SM1GOUwzouHaxhSfgI3euN1oG7Ri9hn5i1ahIrx4Hsrs
         2UWd2O/00oTTUsOAhP/L0Y9aQv9k6PREhqWDC8wA18ar4kjLycc3WkFMlI8vkMy1Iu4B
         mU+VkmgBhzr0yVGnXKRjeI/EegAg0ilUh6mD/EzyZgtO/UgBN1m+GvhZmN3rYDlt1wDp
         XnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mDTHPcAeze7GuqTFf7iUzU0Ra0uK6CJMs05qWwtQgPQ=;
        b=SmqzkRN4B0Gp7jPEDaDWkBS85lIygvhtD5SY4V9osh5qsWweK1g9mGOfbLqA9gjrxF
         OFVLu07zKC8mfD2YWcfKKJKOWko26LIe+KFsuKgLqQ70f/+gdS6/Qq7XUQ8ki5g9tb/g
         jUJGoxiP//t8WcGjpE6rVGBL4q8ptZaGovGB59OteFdbrqyHlt9cVPGbIyPiXInfARWP
         nvocuDlWXIyKr6RWpjBABg4MDe+Qw1vDjcwjJ+Hq714fv8HumzGNffKbSMasU7rX1jKa
         INz46eykMMwQKeuea+lcLQASRA4xqjEzHHZIwk70VLpi4qL8vWz1ryBVZ8c6WeOjPoJY
         7m0w==
X-Gm-Message-State: AOAM532DKxvf8JlLkvI0SOtwEpuxw/0ptwPHN1Rmn8fBMWrCrnK2vW6g
	dhRdTYALZ6izWIqSbMdRjUM=
X-Google-Smtp-Source: ABdhPJw0wywnOmt+5s6vZqNaK/gf21or5oyvVf0BWEzgFYeV3kI70ispgn5uWDgvEmMKUMPq7xsx8w==
X-Received: by 2002:a2e:8457:: with SMTP id u23mr23578950ljh.3.1629790022108;
        Tue, 24 Aug 2021 00:27:02 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id z4sm1666203lfb.284.2021.08.24.00.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 00:27:01 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 0/6] staging: r8188eu: avoid uninit value bugs
Date: Tue, 24 Aug 2021 10:25:45 +0300
Message-Id: <cover.1629789580.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <CAA=Fs0=gX66TW3qoHYWcoSsvai6YZn=U81a34V45oij7NrMJrQ@mail.gmail.com>
References: <CAA=Fs0=gX66TW3qoHYWcoSsvai6YZn=U81a34V45oij7NrMJrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Greg, Larry and Phillip!

I noticed, that new staging driver was added like 3 weeks ago and I decided
to look at the code, because drivers in staging directory are always buggy.

The first thing I noticed is *no one* was checking read operations result, but
it can fail and driver may start writing random stack values into registers. It
can cause driver misbehavior or device misbehavior.

To avoid this type of bugs, i've changed rtw_read* API. Now all rtw_read
funtions return an error, when something went wrong with usb transfer.

It helps callers to break/return earlier and don't write random values to
registers or to rely on random values.


v2 -> v3:
  1. Fixed OOPS in usb_read32(), caused by writing to u32 **
  2. Fixed style in rtw_read32, rtw_read16 and rtw_read8 (Suggested by Dan)
  3. Added error hanling when usb_control_msg() returns ret != len
     NOTE: Dan suggested to add this to usbctrl_vendorreq(), but there is
     pending series, which will get rid of usb_control_msg(), so (res != len)
     check can be removed, when Fabio's series will go in
  4. Removed RFC tag

v1 -> v2:
  1. Make rtw_read*() return an error instead of initializing pointer to error
  2. Split one huge patch to smaller ones for each rtw_read{8,16,32} function
     changes
  3. Add new macro for printing register values (It helps to not copy-paste error
     handling)
  4. Removed {read,write}_macreg (Suggested by Phillip)
  5. Rebased on top of staging-next
  6. Cleaned checkpatch errors and warnings


Phillip has tested fixed v2 version, AFAIU

Pavel Skripkin (6):
  staging: r8188eu: remove {read,write}_macreg
  staging: r8188eu: add helper macro for printing registers
  staging: r8188eu: add error handling of rtw_read8
  staging: r8188eu: add error handling of rtw_read16
  staging: r8188eu: add error handling of rtw_read32
  staging: r8188eu: make ReadEFuse return an int

 drivers/staging/r8188eu/core/rtw_debug.c      |  79 +++-
 drivers/staging/r8188eu/core/rtw_efuse.c      | 125 +++--
 drivers/staging/r8188eu/core/rtw_io.c         |  27 +-
 drivers/staging/r8188eu/core/rtw_mp.c         |  70 ++-
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |  13 +-
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   5 +-
 drivers/staging/r8188eu/core/rtw_sreset.c     |   9 +-
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |   8 +-
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  21 +-
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   9 +-
 drivers/staging/r8188eu/hal/hal_com.c         |  23 +-
 drivers/staging/r8188eu/hal/hal_intf.c        |   6 +-
 drivers/staging/r8188eu/hal/odm_interface.c   |  12 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  33 +-
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   6 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 285 +++++++++---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  27 +-
 drivers/staging/r8188eu/hal/rtl8188e_sreset.c |  22 +-
 drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  18 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 439 +++++++++++++++---
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  62 ++-
 drivers/staging/r8188eu/include/hal_intf.h    |   6 +-
 .../staging/r8188eu/include/odm_interface.h   |   6 +-
 .../staging/r8188eu/include/rtl8188e_hal.h    |   2 +-
 drivers/staging/r8188eu/include/rtw_debug.h   |  13 +
 drivers/staging/r8188eu/include/rtw_efuse.h   |   4 +-
 drivers/staging/r8188eu/include/rtw_io.h      |  18 +-
 drivers/staging/r8188eu/include/rtw_mp.h      |   2 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 179 +++++--
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   3 +-
 30 files changed, 1143 insertions(+), 389 deletions(-)

-- 
2.32.0

