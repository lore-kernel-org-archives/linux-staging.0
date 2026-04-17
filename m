Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F93A1E531
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406329; cv=none; b=UaHPPuJaxecPUpm57TxKK9wgdqqFxyVVpZaDgB2RJ43okVyUQWZWWMBDiFdWMdsmatiKiXOE1mN+EiBaccDFg561Zyd+wzmWTQPgiXwQ+QY9P42lQ7toFstUPg6wi5fUF9azT5ceUmx4wyd7V59PHi7bUD8glOtd2UYfYkPW/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406329; c=relaxed/simple;
	bh=enX3UX6zWol/qG1cKHurOsAFJF/7bCld3RxJCzgeQks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n18EIwEXZA+o14tHxYQyFCkuUKJVixA3Usr7Htbi8geyhzQCbP3BnPI3l1ULjb0QXSq0RyVsL8zKd8tkHuxvtsJWOvyoF+mQUf02dfMC7qpYknP1Zg8l5+JtGWOSPUX3r31h6JPByjaZj6a606Nmui366Ohkmvv7urpeUsnPLvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eA2zqIMm; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eA2zqIMm"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-953ad5a55b7so176759241.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 23:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776406327; x=1777011127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRYLA9ER3MjltMtOUVebb6AW16pTPY2JdB3R8WgouyY=;
        b=eA2zqIMmQwt0bM0ATDewA+FHiPKwhNh5yzvW0paGtCkeBpLNuU0ntPX/+s+RTdNaHs
         +L8WMys/1isVx7X+O4iuK+POPWvH28zayyuIimtxxRPsjowLkCUNreJGvHstp7vL9dfd
         gnFXSRem4b4s0ml9y70T6nUrVDmwBKkdp7jXnILO+6/oCx8AegG+1RmuDaCKTCaEeoC/
         Wgzli/DuKhCriDjfopHIaOEMVdvJ3v6MBfBQksUhDkXwhaGGRuHJcAyHBsLqedhnmxYZ
         mDCCbGLfLM0wNczdiPkTnhJxh/qGE/kiXSaOyWx17xAtZQWwiycV1RPp86eeBcYPpivD
         jfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776406327; x=1777011127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRYLA9ER3MjltMtOUVebb6AW16pTPY2JdB3R8WgouyY=;
        b=O2fQ8qmDSgQquVDhH8S3fk9KuZFp8Fa/Bc/87cVfLH4HO7EHk0wcBU8U9hTf1OvBGH
         LE1f79JDIhKVQMcCV8MWa4nMW6yk+cr8cbg+PqHfUFTR2MjuqjpVvLwMQb25fdOopCZF
         iJg3SikMSpPvpjXXro34SHWUrWBBCUmmP3OxPLRDnh+FJrPsFUinOr4blGnkPmRTJQ8/
         5jDbANo3763ja3VU3nUqlCC06OFyp4yQsPgINIQ6Zp/xft0JvoZZR4kz3GFRidcgz0QX
         OUkHNzsUXJ3EmeBquL6etVdUvHPfypiDH7pevVFwqcyN1bYtBNShUGwJOZ6MC1F+PXrV
         fa0g==
X-Forwarded-Encrypted: i=1; AFNElJ+jzLqT4V5UgEAO/eD5sU9iFpNWydGYnTa7XiFq61vXGZ8AwuPc+ZdpzWd0Gm5BGGb1Jqd5OC5ceGSmOHao@lists.linux.dev
X-Gm-Message-State: AOJu0YxDWnZWlg/UpAcbZeZdtgLOFiP1LOiJSUhiJz1iAuo899InrjLY
	HdaCyn4LxNwqFODHwq878m+QaZNRICwwJPQEp28gd2pCpmhwwGjbHxJE
X-Gm-Gg: AeBDieueVUA88V2TNtY4UPqaTvBXXAv0KSYrc4QiJFpwIEwQXHmYVoaS7A4LHGiL5Cw
	hod3Go5sjHWnIZe6UsQGgssLDrHsw/KoA6JGty3lbou+Ia2cFwWyJFUd4AcWUGr5Bxqfr1E2k1A
	c2hXOVBdD7r5hsW3DR5U/vsu3c7VP/UE77SX/vMdOFFBUk3U9x89Hy/4vJ3kEIPoYezUFql1cb3
	Q8/0pLMHwKWCVKXbK6tb6nm/lm3cH1m3gGpG/xudQvWu7sdUP8GsiEkNeQI7d75KrJYboaDVR3K
	+EC94uvLZDH3fknVZihocBkBV8VLe7uYLTLo/YlXlQ+J9pBzskrooOHUNVVycNPmDjVGWb06lcT
	t/M5pM5U+dJHWUeqafmLmrKnUMGkLQqlWN6fthgXDlXHx3SFVLZdnbVIQzaQpMplzqOgAu8+Xu5
	WxVMKCelwW1QNOxmXJxme9fB8s5/TQIhuDBDik30tE2tWMefEUCDcR
X-Received: by 2002:a05:6102:f11:b0:5fd:f2ad:c653 with SMTP id ada2fe7eead31-616f67c7a25mr577174137.16.1776406327249;
        Thu, 16 Apr 2026 23:12:07 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589093a8bbsm297947241.3.2026.04.16.23.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:12:06 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v6 0/5] staging: rtl8723bs: fix multiple security vulnerabilities
Date: Fri, 17 Apr 2026 07:10:43 +0100
Message-ID: <20260417061048.62484-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes five remotely-triggerable memory safety issues in
the rtl8723bs driver. All of them are reachable from the air by an
attacker within WiFi radio range, without authentication, via
crafted management or data frames:

  1. Heap buffer overflow in recvframe_defrag() when reassembling
     fragmented frames whose total payload exceeds the receive
     buffer capacity.
  2. Integer underflow in TKIP MIC verification when a frame is
     shorter than the sum of header, IV, ICV and MIC sizes.
  3. Out-of-bounds read in portctrl() when a non-EAPOL frame is
     shorter than the 802.11 header + IV + LLC + ether_type.
  4. Out-of-bounds reads in three IE walkers (rtw_get_wapi_ie(),
     rtw_get_sec_ie(), rtw_get_wps_ie()) due to missing validation
     of the TLV length byte and of the byte ranges touched by the
     subsequent memcmp() calls.
  5. Integer underflow in rtw_wep_decrypt() when a WEP frame is
     shorter than the header + IV + ICV.

Each patch was found by code review and is not tested on hardware.

Changes since v5:
 - Patch 1/5: restore the "/* memcpy */" comment that v5 had
   removed as drive-by cleanup (Dan Carpenter).
 - Patch 3/5: drop the unrelated cleanups (ptr = ptr + X -> ptr +=
   X, inversion of the ether_type == eapol_type branch into
   direct return NULL); the patch now only adds the short-frame
   length check before dereferencing the LLC header (Dan
   Carpenter).
 - Patches 2/5, 4/5 and 5/5 are unchanged.

Changes since v4:
 - Patch 1/5: collapse the identical cleanup sites in
   recvframe_defrag() into a single out_err label (Dan Carpenter).
 - Patch 4/5: in addition to the outer TLV length check, add an
   inner bound check before each memcmp() so that the OUI read at
   offset 6 (WAPI) or offset 2 (WPA/WPS) stays inside the declared
   element (Dan Carpenter).
 - Patch 5/5: tighten the length check to also cover the 4-byte
   ICV, so that the subsequent crc32_le(payload, length - 4) call
   cannot underflow length - 4.

Changes since v3:
 - All patches: add Fixes: tag pointing at the driver import and
   add Cc: stable per Dan Carpenter.

Changes since v2:
 - Sent as numbered series with cover letter.

Changes since v1:
 - Rebased on staging-next.

Delene Tchio Romuald (5):
  staging: rtl8723bs: fix heap buffer overflow in recvframe_defrag()
  staging: rtl8723bs: fix integer underflow in TKIP MIC verification
  staging: rtl8723bs: fix out-of-bounds read in portctrl()
  staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
  staging: rtl8723bs: fix negative length in WEP decryption

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 70 +++++++++++++------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 51 +++++++++-----
 drivers/staging/rtl8723bs/core/rtw_security.c |  6 ++
 3 files changed, 87 insertions(+), 40 deletions(-)


base-commit: bf9c95f3eeefb7fc4b4a6380cc23f1dca744e379
--
2.43.0

