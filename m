Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EF01D6DBF
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222198; cv=none; b=S4aer0sp+mOxUBr+uePIfsXePTYi5lIdBFhC3C6Z13V191gwKpYJ3F+X5xOr77ppLcyiGc8dtjE5Xj2EMTBRb/WdX6/mbKvN04NCVGlJ3JhaIz7Yob7+bBEyF7Joc2BmIdv3ztjEEEUNmfAzDB2/obUcpHvs5E1H9HSK8skvWMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222198; c=relaxed/simple;
	bh=csD3xSMbgrDPv5RDbSufZkLmV7nSPfQVdf+sgWjlRKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yu4iAiH1QiXRLmzYOKMxUvXpPnFJsD92QGUtuv+cXPAMXLy0mPmgSNcfXhOxZFgqK0KEshwXuN3OB3EKz5rRoEbcaNfuuczXA8ZCSqe111S/QuBUHCkU18t7HSQgb/Kz0bs7UKo+wa6RA/A3+TLBtpULjWr+t5V0peEG4KhuBfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=haO2aBA2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="haO2aBA2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2240b4de12bso96056255ad.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222195; x=1744826995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYrGToWVdj+sV2ioOcCHVAVkWswfBeGzYQuytZUWl2c=;
        b=haO2aBA2QNFNY2HbGI2dFYZjxKFmLPP6RxgD9lIFjFmoT2oqW3k3dXCqECl3ecusiP
         jlQhFsRGSMnW9QRcJSi5EOiZnqXS8B98tJiREEwfiXCq8MjvjJtqnDIwR0UEiBfvpQeq
         SAc/O7MEkb/2B5n0S6421QpoDOVJfaVCMlo2FHfH4b0toFHnG14Pzo3yIzT/+V3OX6yu
         dtpayIlmtP0b1mNs/Odkw+j+wZQWY5PCqy0wKRVC4X3bTLPGMNRKBC3LhqSG+tmVW7UM
         yNUHBtJ8z+5sA2LBJjPJdgNU10Cwmb9T3maaWdzicEQzTT2q66TPDTDvTBTpbZMjO8OU
         cItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222195; x=1744826995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYrGToWVdj+sV2ioOcCHVAVkWswfBeGzYQuytZUWl2c=;
        b=X1fxK2bLysSo0ZlYlyzI14p9RNpWx+sDGKkJQhqGcN76FDY6QelMila7JjuC7reSAw
         ixcNsMJXDioivwq7pWP43TvEFKN5f6L00crVWL/FZko42zePV9/QBG7kPWfnJvz0Q0ql
         svlGmScmt7OX2GUWDznH+/jt6mtDrx73pud64q0EIz/mFAwcRFni8XEzqp+4WJMHMmDS
         kF6LgYS278tbZmGvfQMFEMsUW2ka73+p1zveSvnTu5euipVSIhnJOQlM89703oFshMAR
         Z+o8KBbMMRymaXMKglCJ6Lztofl+nazUKDDJlwjzWyU1DxIEAD57b1mVjmsyjA0omAnA
         Pt+Q==
X-Gm-Message-State: AOJu0Yx7adLu0kCtHOLwrfPXfELV5D8Bd7LS1MEpDwesSQRITyvpe92J
	BcFLzhJKBj+TyNkl0KowsYqx4QjpA63UqQ7Ai6DFKTZWvutSGKjz2jVyZyv4dQ==
X-Gm-Gg: ASbGnctZR1sIE4LiRk3vzGb8D9BiXLbM4Mp+HXl4NvY2SkZhHIX4BQZ4qvv8j+qha2E
	6DBkgTsTSaLd9LaxWB/Q61uSWpNUfJ1uHBLLRN29i3NxOEaUAgVhw7T/oeHKgWGWhWhbtzJ+J+N
	SZsVBISEYwi1IW1xE+yKVYNegrqM6JhLjOPqqPhbo9cQOPeAeKTSkwZi+g6JgAmdz/lSGO27SE4
	I9On3VM6o9mm4edDYUVC37M5lBNzTply7vBKwaeWOa6tSTe5IYaXCK1sb99lr1H7iVvQ2lwAWUf
	ZMH7GXsv4BUBCbQFMz2MY7/1z2MObn3ICrT0rqRhSS6PTYBWaLDfY+ryt5Zn9dYXRbbm+Gh99/v
	lZyzhEg==
X-Google-Smtp-Source: AGHT+IGT5+uwOr+yxY/pgNk55XEAsRW4cr1nQCtxEkyrOG2eZh5gneJ9m1CIWXdz0YIBy7sb9vS8iQ==
X-Received: by 2002:a17:902:db08:b0:220:be86:a421 with SMTP id d9443c01a7336-22ac3fe6feemr61587985ad.38.1744222195517;
        Wed, 09 Apr 2025 11:09:55 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d4659csm1717653b3a.65.2025.04.09.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:09:55 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 00/23] staging: gpib: u8 over uint8_t and u64 over uint64_t
Date: Wed,  9 Apr 2025 18:09:30 +0000
Message-ID: <20250409180953.398686-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preferring u8 over uint8_t and preferring u64 over uint64_t to adhere to
Linux code style.

* Patch 1 - Patch 22:
	Reported by checkpatch.pl.
	CHECK: Prefer kernel type 'u8' over 'uint8_t'

* Patch 23:
	Reported by checkpatch.pl.
	CHECK: Prefer kernel type 'u64' over 'uint64_t'

Michael Rubin (23):
  staging: gpib: cb7210: u8 over uint8_t
  staging: gpib: ibsys: u8 over uint8_t
  staging: gpib: fluke_gpib: u8 over uint8_t
  staging: gpib: fmh_gpib: u8 over uint8_t
  staging: gpib: gpib_proto: u8 over uint8_t
  staging: gpib: gpib_types: u8 over uint8_t
  staging: gpib: nec7210: u8 over uint8_t
  staging: gpib: tms9914: u8 over uint8_t
  staging: gpib: ines: u8 over uint8_t
  staging: gpib: gpib_ioctl: u8 over uint8_t
  staging: gpib: gpib_user: u8 over uint8_t
  staging: gpib: agilent_82350b: u8 over uint8_t
  staging: gpib: agilent_82357a: u8 over uint8_t
  staging: gpib: cec: u8 over uint8_t
  staging: gpib: gpib_os: u8 over uint8_t
  staging: gpib: gpib_bitbang: u8 over uint8_t
  staging: gpib: hp_82335: u8 over uint8_t
  staging: gpib: hp_82341: u8 over uint8_t
  staging: gpib: lpvo_usb_gpib: u8 over uint8_t
  staging: gpib: ni_usb: u8 over uint8_t
  staging: gpib: pc2: u8 over uint8_t
  staging: gpib: tnt4882: u8 over uint8_t
  staging: gpib: gpib_ioctl: u64 over uint64_t

 .../gpib/agilent_82350b/agilent_82350b.c      | 22 +++++-----
 .../gpib/agilent_82357a/agilent_82357a.c      | 20 +++++-----
 drivers/staging/gpib/cb7210/cb7210.c          | 26 ++++++------
 drivers/staging/gpib/cb7210/cb7210.h          | 12 +++---
 drivers/staging/gpib/cec/cec_gpib.c           | 16 ++++----
 drivers/staging/gpib/common/gpib_os.c         |  8 ++--
 drivers/staging/gpib/common/iblib.c           | 12 +++---
 drivers/staging/gpib/common/ibsys.h           |  6 +--
 drivers/staging/gpib/eastwood/fluke_gpib.c    | 28 ++++++-------
 drivers/staging/gpib/eastwood/fluke_gpib.h    | 12 +++---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 32 +++++++--------
 drivers/staging/gpib/fmh_gpib/fmh_gpib.h      |  6 +--
 drivers/staging/gpib/gpio/gpib_bitbang.c      | 20 +++++-----
 drivers/staging/gpib/hp_82335/hp82335.c       | 20 +++++-----
 drivers/staging/gpib/hp_82341/hp_82341.c      | 26 ++++++------
 drivers/staging/gpib/include/gpib_proto.h     | 14 +++----
 drivers/staging/gpib/include/gpib_types.h     | 18 ++++-----
 drivers/staging/gpib/include/nec7210.h        | 33 ++++++++-------
 drivers/staging/gpib/include/tms9914.h        | 24 +++++------
 drivers/staging/gpib/ines/ines.h              | 20 +++++-----
 drivers/staging/gpib/ines/ines_gpib.c         | 22 +++++-----
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  8 ++--
 drivers/staging/gpib/nec7210/nec7210.c        | 40 +++++++++----------
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 16 ++++----
 drivers/staging/gpib/pc2/pc2_gpib.c           | 16 ++++----
 drivers/staging/gpib/tms9914/tms9914.c        | 34 ++++++++--------
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 28 ++++++-------
 drivers/staging/gpib/uapi/gpib_ioctl.h        | 16 ++++----
 drivers/staging/gpib/uapi/gpib_user.h         | 26 ++++++------
 29 files changed, 290 insertions(+), 291 deletions(-)

-- 
2.43.0

