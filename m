Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2292FD1B2
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403582; cv=none; b=gRYdDJxCcqfF0ZaF7GmDr76b3miyatCOt8Jic416xV0quWxgNUXdnjZ96pYnVc9XJbMjIYk4+4F8nS1VY4Gz35Aazy6AAj5x3GZagjwzjuNO/z/6mmRosSLSWJ6ri9QPalr+MKxlkDeBsmC4olw24KugIoppyuyAhtUdMSMUYvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403582; c=relaxed/simple;
	bh=h+PI68+jQ+dmIfsQUP+rIdZWQgm13N+lcyrk5B0RA0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s69j9Z7tUbveIwoHGjFaqAhF6yTCQCDM61qGZifhbp8O8ZvnwODSeoHGYOA0mwxGSpeCNtxRsaG2IKTFjg0uhJGhURoqYbRu7sHDkeKyYAzAcTcuIAGo/DU7lacCTbtjEwMx85Hk4308AWJhHJqzPVXE0hgjV5iLVY/HfXDm82o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXY1N2Jj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXY1N2Jj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-298456bb53aso51924155ad.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403580; x=1764008380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fUOOg5GGpzYO8NO3IORlT4sSo1VnzPUM2UrBOqz/zBU=;
        b=OXY1N2JjoqZ76/Jvl6dyYE6vW2mgJ3X+36GINLapz1P8/ldJymWobs97VC0DEXxWMq
         SwIu0H8zhF9JYxcjd0+7JZzWGF2aSh+5pn1B0ubN4F5Z5MyNoGAAhD8rtWrQ3xWu06Zq
         lBGCgsa4vU/UVZA5QtbsPcxlaYbnMM9K8FCtaFsSGhE9mkIL6SW92JeB0Whh5Lv1A8Jb
         +lFMVpBnOgEqaDWnMESEe/mJzlvLSTQ+8XvwP6vv5sOUtm8fC3KMQiVbDKR96LGHtgIe
         jKSOoindn+itpip3t6M/9exEOlD6HoZ5UR5JXGpdUNQ2GnCZW9JLdBKpXEbMdvOBSjvj
         zBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403580; x=1764008380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUOOg5GGpzYO8NO3IORlT4sSo1VnzPUM2UrBOqz/zBU=;
        b=O+X4ijkGVD+bXvxVScEMbMjn8Nvap/+JDbAOh1DPNuDo5r9v0ZoB2pSr++zFdeGDF7
         ktU6MDoIwVW7z9ZK87/3M0Bc/WiwpyjyvtPJmIBnq6hpCoKJi0pTTxqXczUrN2JL74lC
         b3T7YTvIn7msRB8sjN8JL7BHKRCG6/xiwW+RT/ZiBG7iDXpWv4zoJrMFQMn59XE9PJ7y
         zfitm5EcLb+z3Nh/mHk4l0GA3/yM+tu6a+PsyzneGkxh4UjFAFEdQGbyyHaAR/C+S4qz
         QhZbjOlFNdKvybi5WKJny2l9F5Hzp+zSugJKPPMK+vRYqjnKl8PjaG8U0HEkAzNm5lSY
         7ksA==
X-Forwarded-Encrypted: i=1; AJvYcCVtY8qaWcuRXmreaFq9qktZsAVlya/hu36YB3lVAg+74MCoIz8Im5b9q8YqBFFn8sjZf8KlF+8F5nB6JSPO@lists.linux.dev
X-Gm-Message-State: AOJu0YxN6ck7JanLWRtIQEOMqwq/bieXRNSjbXIB79ErEHXC/xhguGyc
	y6L1ekRqZfDGgRTlNRkFRvNQyAVBloewBMseubaIYH2xULqSEvcBxwoA
X-Gm-Gg: ASbGnctsJjptkEb1RPpg61xepOayV04iYDzjazSp2JHf4JrzEkBEaPfdx01UkbpceYY
	SDzxLBpwaDMnyGwBEeafip4mrz+Ov6ER20tF0coL/9QgCWpMwkjZHwT1udD9U/Px4UyZHwT8q7t
	aU+bJ9rYIz4jFTCZ/yGKn2LYhXmMdOsgmUe8SuNx/rw/c5YXNMpJZCS+jcQoFHiX+FS+JPftjVu
	DAi0ye8DNRIYc0gSAryb/fD/ZLy+7ASgKANd/EGRQJxo4Dbqx7gswTCWReWHm8Jfeg0szwUFqgD
	B2kqOYeWE1u7ZN7juTCVzGk4OWZN1yeg0k+24mGT0fVhPbOiiOXM6Iu/98OCzbrg3krjRT6UFtB
	m2c00CuvccvrO7Cv+rtrxkIphOgpmjD1ASvej5FokdhGpAiGyt6d+z9lyZOZBVm6vfHmlZ9aKLy
	cCjD9tTTCAC6OKs5hxLY0Sh3WVfmU6Lbz7Me4RY0Gm03seyIY=
X-Google-Smtp-Source: AGHT+IGBjDcTPMPHmmSbsyNWObzCORlsuM07yRKYVKXMPdwZOGMYJBb41kCMiHZnlJGfPjcHpqClNw==
X-Received: by 2002:a17:902:f712:b0:258:f033:3ff9 with SMTP id d9443c01a7336-2986a755ac2mr164015855ad.48.1763403579828;
        Mon, 17 Nov 2025 10:19:39 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:19:39 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 00/13] staging: greybus: cleanup, FIXME removals, and driver correctness fixes
Date: Mon, 17 Nov 2025 23:48:05 +0530
Message-ID: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg and all,

This series performs a set of cleanups, correctness fixes, and
remaining TODO removals across the Greybus drivers in
drivers/staging/greybus.

Greybus has existed in staging for a long time, and many FIXMEs,
outdated comments, and partial implementations had accumulated over the
years. While reviewing and compile-testing the drivers I found a number of
places where the comments were obsolete, logic was incomplete, or newer
subsystem APIs had evolved.

This series addresses those issues without changing any fundamental
design or architecture. All changes are self-contained, straightforward,
and focues on improving correctness and maintainability.

The patches include:

  * Removal of obsolete FIXMEs that no longer reflect the current code
    or hardware behavior.
  * Correctness fixes in several protocol drivers (UART, RAW, USB,
    Loopback, Firmware core, Audio).
  * Small improvements to error handling and shutdown paths.
  * Cleanup of commented-out or dead code.
  * Removal of the now-completed GPIO and PWM TODO items.
  * Removal of the empty Greybus TODO file.

All patches were compile-tested with COMPILE_TEST=y and all Greybus
options enabled. Runtime smoke testing was performed where possible.

This series does not attempt to graduate Greybus out of staging; these
changes are preparatory cleanups only.

Thanks for your time and review.

Ayaan Mirza Baig (13):
  staging: greybus: Remove completed GPIO conversion TODO item
  staging: greybus: pwm: move activation into pwm apply and remove
    request()
  staging: greybus: remove empty TODO file
  staging: greybus: audio: remove obsolete INPUT_PROP_NO_DUMMY_RELEASE
    FIXME
  staging: greybus: audio: remove obsolete FIXME and document topology
    ownership
  staging: greybus: bootrom: remove obsolete FIXME about SVC parallel
    event handling
  staging: greybus: bootrom: remove obsolete FIXME around firmware
    filename logging
  staging: greybus: fw-core: remove obsolete S2 Loader runtime PM FIXME
  staging: greybus: loopback: remove incorrect FIXME about async wait
  staging: greybus: raw: handle disconnect while chardev is open
  staging: greybus: uart: clear unsupported termios bits
  staging: greybus: usb: validate hub control response length
  staging: greybus: usb: remove obsolete FIXME about bridged-PHY support

 drivers/staging/greybus/TODO           |  5 -----
 drivers/staging/greybus/audio_codec.c  |  7 +------
 drivers/staging/greybus/audio_module.c |  6 ++++--
 drivers/staging/greybus/bootrom.c      | 10 ++--------
 drivers/staging/greybus/fw-core.c      |  4 ++--
 drivers/staging/greybus/loopback.c     |  6 +-----
 drivers/staging/greybus/pwm.c          | 19 +++++++++++--------
 drivers/staging/greybus/raw.c          | 18 ++++++++++++++++--
 drivers/staging/greybus/uart.c         | 10 ++++++++--
 drivers/staging/greybus/usb.c          | 23 ++++++++---------------
 10 files changed, 53 insertions(+), 55 deletions(-)
 delete mode 100644 drivers/staging/greybus/TODO

-- 
2.51.0

