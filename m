Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D822F3D5228
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130209; cv=none; b=kLPqwSPpHE/eWeQuf4zn+Bz0MNbqQw/og5ZuQjEOOKXe+mQxymAPqgKTeT80U/ZWq2v8vc5MFYbKJvmyEUCTBG3i6bl3vu+T0vYkHjtY7FjBGz1Qg8CYSaNm2JXjFdQR5efXxwNp71/ggMiOO+a9e+lusxw6GQgNOLAsMM8rmqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130209; c=relaxed/simple;
	bh=ANURM0GHoVooNRqs+f+8ARB8x7dhiDKmAF91BMfaV98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dj8M8KtcgY1DmO0uj/MxFTFUGVzTCt5z+kQQpDtYO9Rhp+zVu40JBvqWwJmK+kWGRO68X+flMu8QuRK49Ap5uVoypY82TKgbLtY0/64VFS6wmM0IMVaIGEWeDcWUICY/Pe9iLe5oKyZta0gWu2SIGw14YeLJROmgaNhRmjyQRN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xd/tZ8aM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xd/tZ8aM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae3a007bd1so1048125ad.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 04:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775130201; x=1775735001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1EKK52cPN845JI1l9g9Uvh/gMYu4a0cX1z26rv7ey8=;
        b=Xd/tZ8aMaX7AF2wXAa4QgIGdL75TL9VnUb2I9IFbtX5djj2Xzf2x5uqfVWRHVEnbuF
         NPS8OLmyZGSZhsEz5j7R6R76zOn7mdTdleAg3SW+m2ZUwJiwhvID5+yUnR1ZSVSIIHvI
         zBoQFvrxf5EPHxHq80AnHfQTIGOR6+KZijMa3q9cLZTR3cBwqG50M86R4vjZvox05GuQ
         947VwrHIs2+WYHjlDXg6pXIXbBzz++FmHLsxQ6eKcnjQm7VGtc3HFgiC0OPrOQ32X9Mv
         aodbTnUSiKuwG7zO5mIehWE18irLEl6PHyWVIwO3APYrAq75f14OaaOcpngLEiAe6wpa
         zHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130201; x=1775735001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1EKK52cPN845JI1l9g9Uvh/gMYu4a0cX1z26rv7ey8=;
        b=ALwTSGChbvLyxiS1eO+7FShrYE7O45/YDAAdXc1/rQj3SoFb7WIMT9YRlIFAHOiCxY
         7zD3tjTBHDxIe0Q5CqaeqiTllTJlloZO5C4DJP3eYBl1EQx00ugE5d9BsGHcio5RXqm3
         qY4YXvRlFvYB3QK5NFMHgO0BoIOriHMKkzHWtceJEo+Fo8TOfP7aGHJeGuoky29y0fY2
         BWft5nma8T1Zv7c001iKB0akbKbRC99MNSv0QwfBx3ZoEiRnLNpHkqPFMaAF3mgDDUia
         6p3RnFg2fYcBb6eHytK/1oCEjQDfacwQY6RenailR186pZZvtSzHbit4j0PnFWoKjw8O
         RVtA==
X-Gm-Message-State: AOJu0Yx5YViP5iIcacUqntUNIVLo5PNV8Vulug3zy+4tWUamg5cEokUb
	HT89yAo3BX2dnWDk0x1VFyMsnGV7rTZ9ZURgx5INznd7F6sc2gxgjZ4F
X-Gm-Gg: AeBDiesqb8/kTGnwSGbKYL1asHnXB5o4iegTMedOuPpyfR5DMFCSxNhyJ2l2OgFvolE
	iKuM2X91Hew07ucEmat5fNfr2i3clhSPBNcMa21BC8SvK0vOLBhuUdZHYkI/9dtoxr0gqSTIThJ
	j2WMAvca0+7tlegd89rROFocnx+cvT9IUWrGuCHuOii8rGepo3vD4V41sf69VcZuZq4CQpFRoT9
	p+sg8sqwxOLq9etanxhZU5nzmQlG6E3abuDlTUYd8p2iwAYnqN7fbbWW1UAQgaVkk3g75iJfMzY
	qduaq01CaASp90uUIePAtuEbllcm37Xvcu0OT+WKvROTuVyouPfcW+Z1z88DaHw1Ovfmx4ojYrx
	z50GUlARVWyeoQ62WC7VKOZyyFMtmcQUk7p2K5wTb0O32ZOglUnDJKPetJiFhbYxG8T0eL+rCJP
	TeG/ubfJMa075I65Jgu2IGj2IV3A==
X-Received: by 2002:a17:903:32cd:b0:2b2:48a5:45c3 with SMTP id d9443c01a7336-2b269a90306mr45208135ad.1.1775130200870;
        Thu, 02 Apr 2026 04:43:20 -0700 (PDT)
Received: from fedora ([2401:4900:85cc:66d7:5e4d:2506:ea1:a781])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274779b48sm37505805ad.25.2026.04.02.04.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:43:20 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v3 0/2] staging: octeon: replace pr_* with dev_* and netdev_*
Date: Thu,  2 Apr 2026 17:12:40 +0530
Message-ID: <20260402114242.57411-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces pr_*() logging calls with dev_*() and netdev_*()
in the octeon ethernet staging driver to include device context in
log messages, as requested by Greg Kroah-Hartman.
Changes since v2:
- Use netdev_err() instead of dev_err() in ethernet-spi.c
- Pass the netdev pointer directly to request_irq/free_irq
  instead of dev->dev.parent
- Move the device pointer to be the first argument in helper
  functions
- Fix checkpatch alignment and line-length warnings
- Add missing @dev kernel-doc parameter descriptions
- Wrap commit message body to 75 characters
- Fix author name formatting

Ayush Mukkanwar (2):
  staging: octeon: ethernet-spi: replace pr_err with dev_err
  staging: octeon: ethernet: replace pr_* with dev_* and netdev_*

 drivers/staging/octeon/ethernet-mem.c | 39 +++++++-------
 drivers/staging/octeon/ethernet-mem.h |  4 +-
 drivers/staging/octeon/ethernet-rx.c  |  6 ++-
 drivers/staging/octeon/ethernet-rx.h  |  6 +--
 drivers/staging/octeon/ethernet-spi.c | 78 +++++++++++++--------------
 drivers/staging/octeon/ethernet.c     | 63 +++++++++++++---------
 6 files changed, 105 insertions(+), 91 deletions(-)

-- 
2.53.0

