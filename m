Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E02513A86C
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269167; cv=none; b=QTCZZN/trrfoa1e09sSd8vBChYmU79vkruu5nFJLbwfQRg7RRlLhwBBFaDyd9sevYChVkpeJVw6Ui07g8MF3WhN9XCIC0mhowoLqcRjZ8ndd8oKUbA/i2SWL35kMRAD0mk5ghKjRFNO67m4k0W+6s+yrS80oInHSkAMEJl4b+fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269167; c=relaxed/simple;
	bh=pyQNLTfPGn+ldunAwPjnMUlE7JDu2WIeEJbAZGDXyJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQZntGbhTXw0wnGpEJkmPGzMKRLM0lsfRA6ofHuPeBngqbEvbp7fdrGFo1YhhulU2/+/hOXj7GK6UlWH+czCqf9qCaeIoIrGjXtuH/mn+4w9CEnZK3j+Wtn6nqSQ+Z+1z/WcM7Hi4DHnCTpf65rH4FXlOPARQW1nAH9+7qQQx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6oiLfNR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6oiLfNR"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a746f9c092so4009690e87.1
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269164; x=1778873964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kfa4XkII5RKrd0xZkjGb9AuY4jmClyTMrBmaDL5wEoc=;
        b=H6oiLfNRCGJDl8CaD0EroXFIF1n7QnetsqCT6o3bDftjkoffe2mToqr27VyJZFdBFg
         0W3e4eHQifFXKZcSBsiiAYwusVrAtE/fzwDGTc5Fo9J6uL7hZGO2/hLpTYqv6XU4l4Px
         tMbq0oPdpg3vsDJmc813U2dvkgeJj3BhZJBadMSBsQ2Aly7y8boFbDt9H2ieRmYF1R7w
         kLidvRdtyvARrL04F7oKEjglYa+ZOFabNvyELMLEV124lKIRuSJsA/D65AOFePkcRWMn
         V/cHHxVzyWMwwkST64th4VDbnpHwbNUNOF8P7som//vQ+PgeAzotLHootLSwV/gPSv1R
         mO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269164; x=1778873964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kfa4XkII5RKrd0xZkjGb9AuY4jmClyTMrBmaDL5wEoc=;
        b=jEmkYskqcVtnR9Z3RxwbxIkIFGYB1fk8v1B5T96v5kk3nVQYVklycG1UuldyPWyZOi
         UnAoywISO58vAnepBYxBHKM63o02Ezdq0NtKCa7wuWhvJWWWAqkSxmlGr+ZWlc9QzLN1
         EEWxeKtPP2ABs8Npe29ORsGNtUT+GPqggvB8sSirmtD661vvjD1PsONZitw6Dzz9ihXO
         Nvk0Rcy2JqP1blgmWnwxlF+Wk7L01/aM8K+Je41xAgvoNfzUL/j2jKwLIX2towWVOIBv
         FWvYjUT8181mtsCuQ0v4uytaLCNaR0SVzRlMkswqSp57G7jzPExW/alVFoMvAjSPEREX
         PH3A==
X-Gm-Message-State: AOJu0Yxdu4LcrXdU8ocax5GnbpKR6jCZE2RyeNkr3j9qDhWWkKU+7Urw
	Jy/hRZ3OkNFL5BlSfGJJV0FeIr7xxuvdm+qw8et+4tSfkmcq/rQH1LhX
X-Gm-Gg: Acq92OEOvXvNY/Xr8FRtDS30jydfIQ/xKoUHWBIaNk97QFaGmilX6gxBfXctym2ePp2
	XZwvWs06ChcmKSAqbPRuv9lslIowJ5zgyD5ddCVttJTQBwOsHFvIPHAO+5cC0EY2JUvvQnn1y+C
	HxTtvLxRH8LDSe0EttLpx07v4El2S0sbsVyLXjpGuN16qytCPg1U2nqbosLtXasmVnB91BfrRtO
	W2CGf+zBMmwEKAeQPz2tDY4cqofzYyrqFp7apJd+YIPWiJXXe4eZkHkFTY4opoqOdF0qtG5CkBV
	Y0Y4USolxCzEv12ds6lXpHcTKEfaMcaKQ5lV6y8nNv/EIWPdiW0fQEgXi/OMfnEZcczwYL36kIT
	Phke5AQp8qq+2hwDjV4FuUu4b/0Ku9KdwCloBGtRF1zb3kyzSa+md3QHcE6swJBjdWBBiXSn9g5
	i9fUMFdJO+cXyP00LpuTyk+HoQ
X-Received: by 2002:a05:6512:3042:b0:5a7:46f9:be3b with SMTP id 2adb3069b0e04-5a899bbdacbmr2642257e87.14.1778269163978;
        Fri, 08 May 2026 12:39:23 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:23 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 00/11] staging: rtl8723bs: remove struct _io_ops
Date: Fri,  8 May 2026 22:38:29 +0300
Message-ID: <20260508193909.16015-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I don't have hardware. Tested only by compiling.

So, in this series I've attempted to simplify a bunch of abstractions in
core/rtw_io.c (and hal/sdio_ops.c and os_dep/sdio_ops_linux.c files).

In general, the logic is as follows:

	1. Functions from core/rtw_io.c (with the 'rtw_*' prefix) call
	   functions from hal/sdio_ops.c (with the 'sdio_*' prefix),
	   obtaining them from a pointer in 'struct _io_ops'.
	2. Functions from hal/sdio_ops.c convert the passed address
	   (call _cvrt2ftaddr()) and call functions from
	   os_dep/sdio_ops_linux.c (with the 'sd_*' prefix).
	3. Only functions from os_dep/sdio_ops_linux.c perform the work
	   we're interested in - they call other functions from the
	   kernel MMC subsystem (sdio_readb(), sdio_writeb(), and so on)

For the rtw_read8() (rtw_write8()) functions, I was able to remove all
these abstraction layers (this is the only place where this happens) by
directly calling sdio_readb() (sdio_writeb()).

For the rtw_read16() (rtw_write16()) functions, I had to retain the
sd_cmd52_read() (sd_cmd52_write()) calls from os_dep/sdio_ops_linux.c,
since there are no equivalents for them.

rtw_read32() (rtw_write32()) calls differet read (write) functions
depending on the address alignment. I simply pasted everything from
sdio_read32() (sdio_write32()) into them.

I described some details in the comments to the corresponding patches.

I also slightly formatted the modified code to avoid creating new
checkpatch.pl warnings.


In any case, this will completely eliminate the 'struct _io_ops'
and consolidate the reading (writing) code in one place so that
error hadling can be found and corrected.

This series is marked as RFC because I need your opinion on it and also
maybe someone wants to test it?


Nikolay Kulikov (11):
  staging: rtl8723bs: remove unused sdio_local_read()
  staging: rtl8723bs: declare helper sdio functions in .h files
  staging: rtl8723bs: inline sd_read8() and sdio_read8() into
    rtw_read8()
  staging: rtl8723bs: inline sdio_read16() into rtw_read16()
  staging: rtl8723bs: inline sdio_read32() into rtw_read32()
  staging: rtl8723bs: inline sd_write8() and sdio_write8() in
    rtw_write8()
  staging: rtl8723bs: inline sdio_write16() into rtw_write16()
  staging: rtl8723bs: inline sdio_write32() into rtw_write32()
  staging: rtl8723bs: inline sdio_write_port() into rtw_write_port()
  staging: rtl8723bs: remove the empty function set_intf_ops()
  staging: rtl8723bs: remove empty struct _io_ops

 drivers/staging/rtl8723bs/core/rtw_io.c       | 208 +++++++++++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 235 +-----------------
 drivers/staging/rtl8723bs/include/rtw_io.h    |  16 +-
 drivers/staging/rtl8723bs/include/sdio_hal.h  |   3 +
 drivers/staging/rtl8723bs/include/sdio_ops.h  |   3 -
 .../rtl8723bs/include/sdio_ops_linux.h        |   2 +
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   2 +-
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  55 +---
 8 files changed, 162 insertions(+), 362 deletions(-)


base-commit: 81f55766523e5293604cb96c5e98d10da345ff33
-- 
2.54.0

