Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AB826E703
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797561; cv=none; b=m+ZGRb5ayX7esOclT5IA5qB5VX3iWBre0pLvDbJLK0G9/ccvPPBqYr2ibpa6B30W7jfEZnGqG9OQmdueSI3mkowlYoj/2oK8TU4WhD1UNh0E8sN2gmpShrhGedIB1tiS2jHTmMqcsyydIxL7MrA+Yp2k7yhJ6hPU5yCoLrsf+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797561; c=relaxed/simple;
	bh=rvkRs/hHcWN2Hv7kuZnjCZWnKxCN2Fp/ZNHwmOgmHao=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RP5bKrQscJkDSXKGXYTbXCM+ltfm+XotqPuOA7LX+Y7zU0Qt4U6+HVfbUWjgCqmominW+6h9bBGM/sDmg3R/BQ4dYYeIeSJML6RvpyoAhrdASB27YJz71s9YxsA4pn1YGMBRpdG+4OkcPmX9yqD2kTL8GVptuBG7zcEC+8Rlwqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ip1vY7UF; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ip1vY7UF"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b869d3582so13155085e9.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Sep 2025 00:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756797558; x=1757402358; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tDIao9XUepcqrCjhRvfzY5Z5X6vXPs4ReBppcxWOCqs=;
        b=ip1vY7UFcG6m623Bg+VfaYahVo3leRRVXAfbuZnbfIKfV290GoOP7OtDWEKQripeSn
         wWMq6TmcB3KWG0CzH3l7nDmg9wWY++cAQMEF5EVWz7CnoHy7NGB4v0ZKgowYy/Y4EP4f
         LjKSoMOdINEHxN6gaXO4WkXSLrUHLSh5Nj4TbOenyrJ36h4C7m7zbhM2DoyUWnt/Sryx
         iuAyHegVDmZsjJS0V98Etc5yeZJ2T2F6Lu12c6NqGVqpy6BvCCA4HymgjRjuDGbnKWsg
         pxdRZnQ9eJB3HS5bFYakX37VlFKheYA+JzUbfWQcRUlQQLaKxmzLjb00wlj2Ae9i63vV
         UKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797558; x=1757402358;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDIao9XUepcqrCjhRvfzY5Z5X6vXPs4ReBppcxWOCqs=;
        b=d4VF9CMj3gU3ZoAwIFqHym5Rase2zzEuQmDc2KHr4cFPdh3G5wb0g5ZL4870ZtymcK
         e97dvW/Qr4GQLizLZoG6+5qQ65+obLDVhIJQ12CpJYbQ010TL8acWWNSCSzZI9iVR0uJ
         jnmwpEbJ80RFBe87cKvBs7nBvCLOegzt0/Dy4kJ7Jt+7M93RRTr9eBlAJ+CEKoobAhVF
         UXLJEvUnFzlVRh4EwpthyzMm9eupv7pkrkEF4MnG6bnh92xuePVHV8x8nZPsGtqMvs6X
         y8wHZyi+Mom50mesHeB9NYxOZM7tcsKcTya1vWEX409d0mttytJh9l37KoAmV2uBpjCZ
         s0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUtGlNq9bOfCG+MLba2TRgEN6tLQmOKYZeSDrEgrizAUbTEsBWSjQLL+GpCcHDdsOqPv2LW50qU9j4Ybqc4@lists.linux.dev
X-Gm-Message-State: AOJu0YzibHVGUGjXB15mNTu+qObLTJKFiFqyZpKL5dCkgJUXcXPMk/RE
	QtUr/NV1QmKSgDYFKD8Zn7w9Uif+VTnEVj+BVJ2UojF6+WFAco/2FNdPYq+W1hs6yFc1gDZNytd
	nXohU3M+KOw==
X-Google-Smtp-Source: AGHT+IHSqK5iPFipnfJUNjs1NPHxkOC7yb3uaQ9NzgXE72/2G1oKfT4pYd9K2JEATUQ2mtLCAbIG7uuqymu0
X-Received: from wmtf7.prod.google.com ([2002:a05:600c:8b47:b0:45b:89e7:5038])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1994:b0:456:18f3:b951
 with SMTP id 5b1f17b1804b1-45b85575580mr85979125e9.15.1756797558265; Tue, 02
 Sep 2025 00:19:18 -0700 (PDT)
Date: Tue,  2 Sep 2025 07:18:44 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250902071847.2330409-1-abarnas@google.com>
Subject: [PATCH v2 0/3] staging: media: atomisp: Style fixes for vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Style fixes for pci/hive/isp/css/common/host/vmem.c. First patch
triggers check issues in checkpatch.pl that are fixed in the second one.
---
In v2:
 * remove unnecessary line break changes from second patch
 * add patch to remove unnecessary trailing comments=20

Adrian Barna=C5=9B (3):
  staging: media: atomisp: Remove typedefs for basic types in vmem.c
  staging: media: atomisp: Whitespaces cleanup in vmem.c
  staging: media: atomisp: Remove trailing comments

 .../pci/hive_isp_css_common/host/vmem.c       | 111 ++++++------------
 1 file changed, 36 insertions(+), 75 deletions(-)

--=20
2.51.0.318.gd7df087d1a-goog

