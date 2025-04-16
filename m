Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388841F8937
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836129; cv=none; b=BvSTNtjMrOgiFlatotzPvl0rKpYwX5PLV6HWwkB/x1OqfzrQL9BJO+3txjsMSIPOzOiQmBD4GgZfUvkYuK0BnzSiyF4nXbjFmKE3OAjHa10aCRLATo197gozxwOWkNTlsQCKDQerRWO5eX+lKytusD+HFu2ejCrcKwitRu5Yuqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836129; c=relaxed/simple;
	bh=isd3pWKNkrhji+qFvUAUdB4tZj2kAOCHkG7qUxql/Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sS8fnJsBhuRU6wuALrdyrnZ2+VIF65hjEBLPbNKZk9350ITXHPmt40l3CIvTrW13MH/pFGj4AT/Fktxs1VdSMcNzdgGBwBNdMq2658WRRyquXyp9oD4XnoNUUcHERtKgaCN5ry66fk88GD4JdhRVpARwItLY4mJn3fDGaDX0P50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=A95VVSCc; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="A95VVSCc"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22928d629faso999835ad.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836127; x=1745440927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IhFC5zP0nN1As31BXZj0zvD7HqsSqRg0k5dUe1wvE0g=;
        b=A95VVSCcH6ow5e0dAjU8vr/9t1EwXsOT5SzgVmYbhl0UmNT92NiQV9sV1wsUpR0Oxt
         owyLh0Vu9k6FFokJLOmRyJWC4eHAL4jL+oPVXyVobWc3jjQr9LZ25QGXwk7usp/N+Jqa
         GnPyd9mS78mIs4BjDjp/q3tpOQCiFwciVA+mizzWJRdChHLFMSC41rcI/m/dIomMuyn5
         6h1nPcej1by/e7SkZQfS9Vn+WdBPnPIS90DQfzsiea5CzrM1LsX9V3Oaw6A+wtNa/4R1
         ejytFV9TpcYm7rDzsVX/v6gaieS4yoSNKJa3+NoIYrQntYHZ/KKg2stQOzXMgu+aA2JV
         f2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836127; x=1745440927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhFC5zP0nN1As31BXZj0zvD7HqsSqRg0k5dUe1wvE0g=;
        b=ivwn99F/qbm/dZcN+UbCxTLKu6h/8v+7hpIU1RJfwrUWg/32bC0Lc2FCTRAgZz3MXd
         joaNJ8ScBzOBRLIYN9DGzIEd8537O3pbkJcnXEUWTjJMwLa1s09gtsZp70HlcebXdYYI
         S1y6bkPLvNLTXpigoIEANVPoChRTF2n5omrrMlLkyC6GGWdIENNKlG7CyhA41aq0jjzk
         iJbdkl8NSX56eaBkOCAf1wKBgNeeLFVFYBh99pd/xpJ5OVq9l8nlX85ev07YB0Os052y
         qJwjFWWuhLai8k96xU4OhgmzX0dEP+AlTj/B263XG/5T3c5/LtYFMNzXVkgMNXFbWLit
         KtVw==
X-Gm-Message-State: AOJu0Yz1kW0CLmu3zfA3XzOzp/zsuPpMuLdTnVtIuMglMSVw2zHCC1si
	1qq67OPMMZpp6/wZM34kTEl1v9Ig42LoXgFwNxRVB/y8EGTMhGzHS8QS92P1Kk6pG6KFdNsLhtE
	=
X-Gm-Gg: ASbGncuS4IZhQsmCV21wpO4BDVSS3B6V8jFp1ureH13drqMdYnw0vaxpnnOUGlU3Ztb
	iE/Mu14vG/vrHSk/P6CxtAMil8SHetv4Gq0srrDKDl3qVVjR3RU1N/rRw0clb3SUgAVYvgVtIar
	b92ntMH/OTPUO2G0TZCUKp6UrCUExDQ1KahZxzJ/O8GOfrTSgt0mD/kDO5gvkxRByrZLxPEijZV
	ZEELyrZRVtvI8c0JTucnAxqajtpT9PKYWTwUbljc3+KrrF6uYktEsxtq2sbSr54Y66hlVEOwW1k
	1+rCTNuRzYJGMCV4WqpeWYbNguDm+UMvQwc1s2MhJ7lz8ajlkR4XAJ6PORz3NT84kzkOhRe+vbc
	L4O5QTw==
X-Google-Smtp-Source: AGHT+IGvO1pPtoCMh1G8ZobJNDUhVfmiaAosvQAjes3PNqavxN65KPJVMCnf89ttFZeJegPK78M7Jg==
X-Received: by 2002:a17:902:f68e:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22c358bc257mr41543505ad.6.1744836127500;
        Wed, 16 Apr 2025 13:42:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5de2sm18854845ad.133.2025.04.16.13.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 00/18] staging: gpib: Removing typedef of gpib_interface_t
Date: Wed, 16 Apr 2025 20:41:46 +0000
Message-ID: <20250416204204.8009-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

* Patch 1: "struct gpib_interface"
	Having the word "_struct" in the name of the struct doesn't add any
	information so rename "struct gpib_interface_struct" to
	"struct gpib_interface".

* Patch 2 - Patch 17: Replacing gpib_interface_t with "struct gpib_interface"

* Patch 18: Removing typedef for gpib_interface_t.

Michael Rubin (18):
  staging: gpib: struct typing for gpib_interface
  staging: gpib: agilent_82350b: gpib_interface
  staging: gpib: agilent_82357a: gpib_interface
  staging: gpib: cb7210: struct gpib_interface
  staging: gpib: cec: struct gpib_interface
  staging: gpib: common: struct gpib_interface
  staging: gpib: fluke: struct gpib_interface
  staging: gpib: fmh: struct gpib_interface
  staging: gpib: gpio: struct gpib_interface
  staging: gpib: hp_82335: struct gpib_interface
  staging: gpib: hp2341: struct gpib_interface
  staging: gpib: gpibP: struct gpib_interface
  staging: gpib: ines: struct gpib_interface
  staging: gpib: lpvo_usb: struct gpib_interface
  staging: gpib: ni_usb: struct gpib_interface
  staging: gpib: pc2: struct gpib_interface
  staging: gpib: tnt4882: struct gpib_interface
  staging: gpib: Removing typedef gpib_interface_t

 .../gpib/agilent_82350b/agilent_82350b.c      |  4 ++--
 .../gpib/agilent_82357a/agilent_82357a.c      |  2 +-
 drivers/staging/gpib/cb7210/cb7210.c          | 18 +++++++-------
 drivers/staging/gpib/cec/cec_gpib.c           |  2 +-
 drivers/staging/gpib/common/gpib_os.c         |  4 ++--
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  6 ++---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |  8 +++----
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  2 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  2 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  4 ++--
 drivers/staging/gpib/include/gpibP.h          |  6 ++---
 drivers/staging/gpib/include/gpib_types.h     |  9 ++++---
 drivers/staging/gpib/ines/ines_gpib.c         | 14 +++++------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  2 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           |  8 +++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 24 +++++++++----------
 17 files changed, 58 insertions(+), 59 deletions(-)

-- 
2.43.0

