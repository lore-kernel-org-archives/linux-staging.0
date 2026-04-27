Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CACD3446C8
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305273; cv=none; b=Uba2DeynKWpiX5nfTSkcB/gEaN6Up4vem6uJAoWCpP4MqI3GmIXB6I0TpIxeVm4SC9RgT+G2ra/1Irj5e65jsQBereJ/E1Abu5wycxVQYqil1aRk2//BdC9p5GWwmRqShdDoIplZBxGsBfPs2PigovngiYVGt/QuTi4hmphfUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305273; c=relaxed/simple;
	bh=QYIETYCuf4XH2n8d+qC4biDZlEAIskUJbYZoYf67LHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0WCHbA67qRuxsYolqgJ+ZpNDLHgofhCQMKN98UEDKv0r1OMbXatjUZUcxOVQ+yZ1AIK7zGndas4UUjbTEkLfF40jRNGiAucozu8vzIPJCzOvwUopSVY0y+WHRJk2ypn+9s3jFWM/mo7zPK5atosbSwl2sBb9NUgGvAGUeo8zF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OE29LrLy; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OE29LrLy"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso7030282a91.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305271; x=1777910071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tuu1s9tU3uSim9SJGKXaRXNcFSL5VnoinNEq7EZdSCo=;
        b=OE29LrLyp9qVXm2isVCeybw96UXT3nZ8wAEql4TZs225wVAOFawshQSpMQm1lAtBXC
         ZXtDcl6ZhvrSFKSWx4ZUQfLYY2v3FfE3qYqD3SITEguVakiL/wkrVTXJnwECa5i5JOSu
         Q9D8BjLQxFkMUVk0xiHnuxrFhWo4GfXCO4BwfDVlN2jVs/F+LAh+0+5RgvhTwRhZsHAF
         GXNWARwV/hUVBQEmw+7hPtw7icwAw+4nTVaqo0ETwDLSDcZvTwHpfrNS75PDTFtsTQ65
         ByVvcvMtg7TN9LiaFrEZjqL4IkClwimuvFIgt8lvrLYYWmvp927fXXbo3xj9BG7Vs8jB
         Dplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305271; x=1777910071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuu1s9tU3uSim9SJGKXaRXNcFSL5VnoinNEq7EZdSCo=;
        b=fJpzTcbwVcToGPKGe4ssS3Qds7AnFQ34Jak9DoS3bCEGg8ZoTZqO09vsYvI15wbK7V
         blK4kJAJuTxgOfv+Qc3xqd/2nVFOpRBa31DsRiiZE/iv+lCqm7lgHjcAFm8sinMeoUCD
         2AmN/odJoTHXsCXDKLMNv+cgKeltj0r7Wir3kAWTJj7F/duN5bU6oTmKZnkf3cWPLXL4
         vd8rL+FznB22NIy4P8JT/0i/5UsU8GMWlmNfnW+1u93uUS09NufJ2T0qPWiLyKfTgck9
         /wYhIcgF8PxN9iEZp3R8qifdy274z0iY/HL05QKtEmJ0q9C27EPTNpTUg0E0LKnmMEAr
         /Sbw==
X-Forwarded-Encrypted: i=1; AFNElJ+rD+mSolYbqWvpM6gSAWa+4H/Jp12NNmrODw5utyr6mk8gyzjHlVqYYcpyyGQfpX0X4XdJSqjS4wqg45s/@lists.linux.dev
X-Gm-Message-State: AOJu0YwUNJoMqeionnVpzl4RH7uqB+gQXjP4Rp/wm3u9Uaga5irwt37Z
	IG66RxfxZIB363oK/IWWelr7NzK2adi1jXVBAqGJWLMqktBX7lW2dibG
X-Gm-Gg: AeBDiesSz2y/q30xULIyCHOM968CE6FMoBT1AVQSX0PV0fRA7yFhrh1bmWH4Okt22A2
	7vfFiDRU+/nkgCdU6JLpflBSMa1uyfAbtNJd62niqpLoPWX9SvmU63hyvQ3HZolwykJLGT6JU6H
	F3ujYBpNgiqQo2MxZnv6jFzFPZDsWk7PQAzih9RJ1uBqEs3+I8o22M8KSGTMC0+qlF1T2zJKHRB
	iBZ8klVdCSdlcHiXfr26MzTdIHrIATPx+jIhx2armlxm6nqyyJlOnmSXE+Y4k3TQjq2FkqPEB9B
	4Xyrby74nxd5i7bX8GUBQxTiLn1pK/BptatQxu6jQWvSwEXXkFzJcIQCt6o2AkRwpRofyi3fgDn
	XA3ztGRl57DQiulorSD5zqtO/nY9VdQeGWQNB39aB1jtTnlxeBnWpx2N01KddamBc9Btw7NHt6A
	amvCxlPMSog/Y8YuXtdCUB5srYEtQ4RwNzYcUtHP45
X-Received: by 2002:a17:90a:dfce:b0:364:78a5:8d39 with SMTP id 98e67ed59e1d1-36478a58eb6mr5217870a91.20.1777305271444;
        Mon, 27 Apr 2026 08:54:31 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797702fbfcsm25138982a12.22.2026.04.27.08.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:31 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 0/7] staging: octeon: remove typedefs for enums and structs
Date: Mon, 27 Apr 2026 23:54:20 +0800
Message-ID: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging octeon driver's TODO list includes "general code review and
clean up". This series addresses that by removing unnecessary typedefs
for enums and structs, converting them to plain types as required by the
Linux kernel coding style (Documentation/process/coding-style.rst,
section 5).

All typedefs ending in _t have been removed from the staging driver
stubs (drivers/staging/octeon/octeon-stubs.h) and correspondingly updated
in the arch/mips/ implementation headers and source files.

The series converts:
- 5 enum typedefs to plain enums:
  cvmx_spi_mode_t, cvmx_helper_interface_mode_t, cvmx_pow_wait_t,
  cvmx_pko_lock_t, cvmx_pko_status_t
- 2 struct typedefs to plain structs:
  cvmx_pko_port_status_t, cvmx_pip_port_status_t

No functional change intended. All patches have been compile-tested
for both MIPS (cavium_octeon_defconfig) and x86_64 (with
CONFIG_STAGING=y, CONFIG_OCTEON_ETHERNET=y, CONFIG_COMPILE_TEST=y).

Eric Wu (7):
  staging: octeon: convert cvmx_spi_mode_t from typedef to plain enum
  staging: octeon: convert cvmx_helper_interface_mode_t from typedef to
    plain enum
  staging: octeon: convert cvmx_pow_wait_t from typedef to plain enum
  staging: octeon: convert cvmx_pko_lock_t from typedef to plain enum
  staging: octeon: convert cvmx_pko_status_t from typedef to plain enum
  staging: octeon: convert cvmx_pko_port_status_t from typedef to plain
    struct
  staging: octeon: convert cvmx_pip_port_status_t from typedef to plain
    struct

 .../executive/cvmx-helper-util.c              |  2 +-
 .../cavium-octeon/executive/cvmx-helper.c     |  8 ++--
 arch/mips/cavium-octeon/executive/cvmx-pko.c  |  6 +--
 arch/mips/cavium-octeon/executive/cvmx-spi.c  | 16 +++----
 .../include/asm/octeon/cvmx-helper-util.h     |  2 +-
 arch/mips/include/asm/octeon/cvmx-helper.h    |  6 +--
 arch/mips/include/asm/octeon/cvmx-pip.h       |  6 +--
 arch/mips/include/asm/octeon/cvmx-pko.h       | 26 +++++-----
 arch/mips/include/asm/octeon/cvmx-pow.h       | 12 ++---
 arch/mips/include/asm/octeon/cvmx-spi.h       | 38 +++++++--------
 drivers/staging/octeon/ethernet.c             |  6 +--
 drivers/staging/octeon/octeon-stubs.h         | 48 +++++++++----------
 12 files changed, 88 insertions(+), 88 deletions(-)

-- 
2.43.0

