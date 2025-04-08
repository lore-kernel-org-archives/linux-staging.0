Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362CF2192F5
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150846; cv=none; b=AMHGRYdB7t6NsGxe5RBmTaXr2NAWB/ivQrRX0b8X3qZ0aN2UZg3zZZ1m0nCq50rhFqAjKxNvDDePqmpd/AeDcHfLipuofjLmMNPIHZfcryd0n1Q4Je75doECRfgSK455Jb5gJaX+iXb+WSvTlc3whmy5wyfbPfTS1ZV975Y38I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150846; c=relaxed/simple;
	bh=cxWJJW6iOVtCV/sX6/XqOnZuW8EhpYkJUMrCYLKUeuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oit0LWCgLIN8JDG+/Ahsink+/iYrNthud1yZTr54wV0TPXopKMsCnWfL4Y3rPwTzGF5+hufZiLkX0Wvk+Wx7QeT6oyNfFx1Jlx57Pf01/9GiNgKPSXdBpmDA3AN3hV45v6AL/PEyKrDtYBx8fj21cQO51tfL3Ny1Lfc+LypoC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ClnAGtM0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ClnAGtM0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227914acd20so1042045ad.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150844; x=1744755644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yhG8C5ejpfVpYqkFNhT98j+3YvAHXJ2l2yaD7JDk9k4=;
        b=ClnAGtM0OPNf7P23+piJVM+Nccn5VzgjFy8B4vroyDwzpmA5UfxhdSx3+hZzZlCxkv
         2V+zSrxR7DdZjxRNYgLD4AoAuaYYXwZbe07C4n6EixjkFwAxaszgjR/PqqZeGVdm05KS
         5ckU2SW6RLTF96PQXuWtMgv9i7fQEW7nB/ycsLAS2KPEVrRULtX4Yj0QhH/TLUi0IGcT
         /f0PlJPO9rzTeNaA/taYo/dxKbZZSrNZhXsrh30mSwPMqNdhYynP+SS1eHrzaR5x38Ky
         xLy7IdTjku2Cz2x4oGW6Uo1+HPvNXlbTia/ZWQ9C/zP92zBaAJLGW8IeIedNGxXv01jT
         ++nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150844; x=1744755644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhG8C5ejpfVpYqkFNhT98j+3YvAHXJ2l2yaD7JDk9k4=;
        b=DuyK1bhVJUGMDsyF1XR7T65ZDxsZB9QR9NapYFCHmIsoM3Fle+H8tb7jcITSKsriWb
         ds6APW0PKyPLmSMHE8Bcy8niJBV7C/pxIjtk6SvDpcULFApkYkw7YP4LxAUeYUDAV313
         3Bi9OFwjn1wgx7IX16OMnbriMVQj/Au3nQEYt8hCZgwEe9yU0QFvhVcPgXO/arrnESiY
         UJI0aoQ8Fe/Zu4LFK2FUn05Y9VdlCIv6dGcovW7IbAhxcEYsDIk3gn3zceafnCcP117v
         C7rN8RoYP81sLQbbHn2ICVSFzyAPjenOFi8Zio+fHR/12ezp4jASp1XPIyTa68D+E/rB
         u0hw==
X-Forwarded-Encrypted: i=1; AJvYcCWMBH34TLIBdnGqD2slRURNKk0YV3j/BQY0BBiwTCJhkIdahzBy5s1Aox7aldT3qG3KtukgSpB3tOTF3uUK@lists.linux.dev
X-Gm-Message-State: AOJu0YxXXIIs2yrxBZDu8ARyNmMAfy+WvgweaH+6jv8/hvcEU1tCmqyW
	cgTIsei5WjSZedrgiFEhAEJdfDY3cesmuiPk+T9B4Jnp7h96U/O0pE5kMxQTIw==
X-Gm-Gg: ASbGncspkuq8KnwdYhLv/ClS4WO83M6WjKR278PXfr+9iSuJHMeXkrWZSMQcY3Nk6SY
	US2WrhST5n1AZxIUpYD4+Q0dcq8+rEbW5Gxqo2BYxzK4yFcgAx8uwhxT920fh1kCSs9WX2Vkec7
	j9ZfrvU3bWtxHCC1hdWCnwjD9Xch9HaT00lV91cT+xKb1c9o45st7gh9dSBxvgzLSHn+2K/A6ep
	rhH1kD/GF2PlxA22+8olCSahW4wIH08Zs4csFvYqKqbqdnXkeI1GZDtI6C7j+MLaAAMyhNjprQB
	0y1RPaE2VePkt290a1HBY08L0vzTTnS4JIkwcGhjz9z8GNmpsKhkC+4IjFtRj6mwpnn6D3w0bgW
	GS0Io3U6vGQ==
X-Google-Smtp-Source: AGHT+IHLscTrVUYfDcQXA7Opeg2tJl7oeC/Viijv8pzgdRWjRL0M9eLCdJVck1yS1ndzNzFctgKKVQ==
X-Received: by 2002:a17:902:fc84:b0:226:194f:48ef with SMTP id d9443c01a7336-22ab5e382aamr75996205ad.13.1744150844381;
        Tue, 08 Apr 2025 15:20:44 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b2f31sm11460775b3a.135.2025.04.08.15.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:44 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 00/14] staging: gpib: Adhering to Linux Code standards
Date: Tue,  8 Apr 2025 22:20:26 +0000
Message-ID: <20250408222040.186881-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches are cleaning up the gpib driver to adhere to Linux code style.
Cleanups include:
	* Incorrect CamelCase
	* Lines exceeding 100 columns
	* Improper SPDX comment
	* Fixing an open parenthesis alignment

* Patch 1 & Patch 2:
 * Fixing Camel Case for Constants

* Patch 3:
 * Aligning an open parens

* Patch 4 - Patch 9:
 * Fixing lines that exceed 100 columns

* Patch 10 - 11:
 * Fixing Camel Case for constants and having duplicate constants resolved.

* Patch 12:
 * Fixing Camel Case for constants.

* Patch 13 - Patch 14:
 * Fix Improper SPDX Comment

Patch
Michael Rubin (14):
  staging: gpib: Correct CamelCase for EVENT enums
  staging: gpib: Correct CamelCase for PPConfig
  staging: gbip: Alignment should match open parens
  staging: gpib: common: lines exceeded 100 columns
  staging: gpib: nec: lines exceeded 100 columns
  staging: gpib: tms9914: lines exceeded 100 columns
  staging: gpib: ines: lines exceeded 100 columns
  staging: gpib: pc2: lines exceeded 100 columns
  staging: gpib: tnt4882: lines exceeded 100 columns
  staging: gpib: uapi: Fix CamelCase and IBA Dup
  staging: gpib: uapi: Fix CamelCase and IBC Dup
  staging: gpib: uapi: Fix CamelCase and IB_STB
  staging: gpib: nec: Fix Improper SPDX comment.
  staging: gpib: tms9914: Fix Improper SPDX comment.

 .../gpib/agilent_82357a/agilent_82357a.c      |   2 +-
 drivers/staging/gpib/common/gpib_os.c         |  22 +--
 drivers/staging/gpib/eastwood/fluke_gpib.c    |   2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |   2 +-
 drivers/staging/gpib/include/nec7210.h        |   5 +-
 drivers/staging/gpib/include/tms9914.h        |   5 +-
 drivers/staging/gpib/ines/ines.h              |   3 +-
 drivers/staging/gpib/ines/ines_gpib.c         |   2 +-
 drivers/staging/gpib/nec7210/nec7210.c        |   4 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           |   3 +-
 drivers/staging/gpib/tms9914/tms9914.c        |  29 ++--
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |   6 +-
 drivers/staging/gpib/uapi/gpib_user.h         | 146 +++++++++---------
 13 files changed, 121 insertions(+), 110 deletions(-)

-- 
2.43.0

