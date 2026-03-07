Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5D2DC791
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772892600; cv=none; b=H9PYdoxmAqYrmi6mQAVRD1SdocRLArlMShOs4//xLSs9zoIIZ1g0BbtXRpqmQcW3qNVDGgbEuUZCKOJyshNS2OQXEYF5h2Fu7iqGVNUcpKPDJnasnT9vPOSoypCH52Rv3EoDotEa1PLZzT3h+259pAzF7GQwGGnQ1b+elXFrt/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772892600; c=relaxed/simple;
	bh=qfNZK7OKfdk8GWFT6wD1okk83+5D6cuBv4lkRrZcPMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oW7DgYE7nrdfAEDPjNcs+vUaz82tUm4kYs3FeoJcHCZiW6ZLGsmzE383ekhSCpB9TA9jyOnpF0TIaHVitcTWm650s527VwkbEmQRLlsLNDdWXr+3PCINRGXF6wDPZQv9R42ckerxhLEFXJc9/Fpbh3Sx+N0QcquLUhJ+d+ydJgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZW9jxRk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZW9jxRk"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-829a9c03780so1344733b3a.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 06:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772892599; x=1773497399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7N0QqzFbD/9A3TW8k6r7rSKceuZFkhFZWJIDLDu9eA=;
        b=LZW9jxRkm9ivcsOLrPVU357LuuZre2kjjf/TbW7iMQyd5jXP+QKGoYfhN2d19EfnHx
         t9ztJ25gevEXaa86PRU/sve9YV5s+dFMDEP1sikQDTtqvyDkOCwknz3oE3pwJh4Osbqp
         SPJMq+aI8pIKgIjkBUmFIE5G24/4O+eZzE1Zm53gr4HeRAiNoY3lcNzajg9d4Sk1ppTj
         qTR9DwtaPO+JsBVK3y0fRtzj/PKpk7wImY7SHBWAyIdxyNnA/Pleg3ghIZ2V+V9Y+MGu
         oi8RcRK41haBgp0Efmi3a7X48KAw5d5LpGAOAVGJi/ybTy2+Dk+i2mohF1Vq/zZcBv+L
         fajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772892599; x=1773497399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7N0QqzFbD/9A3TW8k6r7rSKceuZFkhFZWJIDLDu9eA=;
        b=WvAH6RyHJslOqSCuW8rKnrPIMJQndlOekChy6eD+UXXMoaaAKO/iYK4Vb+8LtkaRNf
         GQxn6aCWafJNjMHTQ1X+YK8RlklWp/X/pPsvP45KdP+mLm8cvipuHYHQ981PdXfmZ2m3
         VhujHjuvXuVH+NaTzd9tMcVgi2JNi7H/a3tLIX97rAbp/XLdhc3EjU8+DAsm7GWwB2ji
         iUy0xavU9bH1MwZ7Pb6LyK4uZUg22g00W+TtBb9jHEcBoKaMkXXSrlkGmQFfHi0DBHuf
         MtdQcjZVcolQ3Q24HRrBHvTcLXb51mNdFH/GmDAoPUQZD0pX+lhBr8tvpFcvAFOA7US8
         Zs6g==
X-Forwarded-Encrypted: i=1; AJvYcCVXDwm9dlwdjKabFeD1hzmc83bBhfkQcf9igm6IpxUiNR4eoOgLFhde/d8oZwYhFMC3sb4ZJIQ5K+p6OPLe@lists.linux.dev
X-Gm-Message-State: AOJu0Yye4PXZGaVNbOXwE4glJQxp/XKZ7XrQBkzdGt9fS4uOeuFPQrgZ
	71wHihaSq3Y14DTQB0AOSi3CjaCRdFuIdX478dwVq9jDLGuRsSUARH+U
X-Gm-Gg: ATEYQzxE8LesisrvUruStk7MQnM8YFsrVDI4GZSQPGOH0dXuNNpnk0bYgzl6WnElKBA
	x8zGMOAO9It8/jwhM6Lg0b17MaxD2hBdGfcdxNkL6eGJAjZRilw6ON0eLveY3+urxZEANFyfseb
	MTWqIU1XzTdoAne/h3M8hKaE7azhWliEh4RvFVGjavhd9KvPfqQW4lqI+XfLcDIcxhDY3I5FGt5
	/IAg5b1wRisJilSj3Uq/y8E0d1M++pLU/ZOZ7Nx/JhW1gRlgVBSHgbYJgxuQN1ld1jYEvf3HffR
	sMOp5LBLSF1UrX3qvsBpQBSJsA0gfrIPvjFj20ifPT/cj0GiVwohxkxah0A/PPTuSSN5S7NgQ2m
	uB40uvYDAas4rN0RhS+az7JSXJRNV+eKWydEnfWJ2bs4UpDD3FAiaeCjpjBSkbrsPBkrcsVUhCK
	YubpJZhIXgu7FccHFB2OVCRbtlJ8kyLn91qYo9wHMCatm2+7QWQ5/Jmb1Pjorr93FxGUblsifoj
	IfbmJoVEhzvMTIwnBK0bzaR
X-Received: by 2002:a05:6a00:2d19:b0:829:883c:1d53 with SMTP id d2e1a72fcca58-829a2f13e5emr4949756b3a.31.1772892598565;
        Sat, 07 Mar 2026 06:09:58 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.81.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm4784965b3a.29.2026.03.07.06.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:09:57 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: 
Cc: Rachit Dhar <rchtdhr@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] staging: greybus: fixing checkpatch issues
Date: Sat,  7 Mar 2026 14:09:23 +0000
Message-ID: <20260307140930.1732-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes some of the checkpatch.pl checks
highlighted in greybus.

Changes in v4:
- As per the suggestions of Greg K.H., I am removing two patches
that added comments to mutex declarations, since it is hard to
verify them, without extensive analysis and documentation.
- The patches were sent out-of-order previously, so will
try sending them all together this time.

Changes in v3:
- Added cover letter detailing changes made in subsequent versions of
patch-sets.
- v2 patch-set was only emailed to maintainers. The email was forwarded
to the lists, but this rendered the patch-set corrupted. v3 hopes to
correct this.

Changes in v2:
- Split patch 1 into two individual patches 1/4 and 2/4 to keep logical
changes separate.

Rachit Dhar (2):
  staging: greybus: fixed styling issue in fw-management.c
  staging: greybus: resolved checkpatch checks for light.c

 drivers/staging/greybus/fw-management.c | 3 ++-
 drivers/staging/greybus/light.c         | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0

