Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F085D506
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daj+yebY"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so3698697a12.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730482; x=1699335282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BN5lROM9MRyHGe8lVBr4I6TzwXVR+UBWrkwp6izM3io=;
        b=daj+yebYXze0L2RNp5D+UKVCpb3cNJRV/MYBL/wN9FYEMUxJVQlK/biWcddg3GGui2
         4Y/8OxwYhSjgqwza0qjtYvn8Y9Apv8M4VWUQOHUvUMPOf+QRZqybynasi2F5VKVbkk3p
         ROaHD9ZaqOg89YNvmlUC8+8kDk5rGr1+eZ4xvQ+CnzfMoFDRVYHVHyb1/3YjTSJSOIj1
         lpi/GJi/tPe0e3Hn00Xq5aFIzA489mBVPf3mPaxR7whe9v3eYKBp9GZ9wP3nLpBLjyDS
         wcGxVInfb2BLm5g2NUnQkiJ3EDaDdcyJnmXpKsI5iy+9pZ1nv8tIqJDeG/ivshfbG8Sh
         B2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730482; x=1699335282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BN5lROM9MRyHGe8lVBr4I6TzwXVR+UBWrkwp6izM3io=;
        b=eLCwZZ73ftnbvDa+IZy1cCsCs7nviYPPpzi51MR75ywv7bRI466/VycwOdgiut/Wm7
         CwbHlVp7Zt5rVBssWYFIOP4nRrXwJ+syzuQcP4W6edqS6/08eKDGIvOHr1ucY3DMS9FE
         Y72TCjQWw6dPLDirG0B8PKyt5TvYcyyCH/xjxtXtTGuwT8cGz48oRb76Y8H+/m9Pinub
         OOuAQjm+43LQBp1T8kNP61I79Oz2aL1JT2qkux8ztiZVLuOAtV/GWPVm888lLoD+cllB
         9dTUSiNU231ZR+06KLc/MxqfBEF03F4aYnh6iNZGfHgDecAbx05doJP0f77m+aL6yTdr
         AWrw==
X-Gm-Message-State: AOJu0Yycbzc+V++x01YrKFCL/14k/DTsdNDbKcPggKYVdrhBMyQzbZaL
	VRw8dQI6ASeAkuzPWlAE4Vk=
X-Google-Smtp-Source: AGHT+IGf9VcGJPPZEtrLQxJFWuMROjez46iQ3AkTREovi1OE/PIr7vSK5gqd4mwN1RkF97rXemc0LQ==
X-Received: by 2002:a05:6a20:6a05:b0:17a:fcda:4a6b with SMTP id p5-20020a056a206a0500b0017afcda4a6bmr11077930pzk.13.1698730481554;
        Mon, 30 Oct 2023 22:34:41 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:40 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 00/11] Type encoding info dropped from variable and function names in NIC driver part2
Date: Tue, 31 Oct 2023 11:04:23 +0530
Message-Id: <cover.1698730318.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset series consist of fixes to issues found by checkpatch

Pavan Bobba (11):
  staging: vt6655: Type encoding info dropped from variable name
    "qwBSSTimestamp"
  staging: vt6655: Type encoding info dropped from variable name
    "qwTSFOffset"
  staging: vt6655: Type encoding info dropped from function name
    "CARDqGetTSFOffset"
  staging: vt6655: Type encoding info dropped from function name
    "CARDbSetBeaconPeriod"
  staging: vt6655: Type encoding info dropped from variable name
    "wBeaconInterval"
  staging: vt6655: Type encoding info dropped from variable name
    "qwNextTBTT"
  staging: vt6655: Type encoding info dropped from function name
    "CARDqGetNextTBTT"
  staging: vt6655: Type encoding info dropped from function name
    "CARDbRadioPowerOff"
  staging: vt6655: Type encoding info dropped from function name
    "CARDvSafeResetTx"
  staging: vt6655: Type encoding info dropped from variable name
    "pCurrTD"
  staging: vt6655: Type encoding info dropped from variable name
    "apTailTD"

 drivers/staging/vt6655/card.c        | 90 ++++++++++++++--------------
 drivers/staging/vt6655/card.h        | 18 +++---
 drivers/staging/vt6655/device.h      |  4 +-
 drivers/staging/vt6655/device_main.c | 18 +++---
 drivers/staging/vt6655/rxtx.c        |  2 +-
 5 files changed, 66 insertions(+), 66 deletions(-)

-- 
2.34.1

