Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AFD2E7379
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048576; cv=none; b=TJOsWKAtgvu1SaDzcPMxzWJTVAwzOY/Qcdgnys5A4pTvAgEKRvvxNeJysSNCTlPRzkVM6yblieV/BxiKRkwo6BQ4cRKcKyZ1XkHkclSikpGxp1jh7HVgRgnc/IImvfMKt8fnjISQSkwVh53DNj4ZYn9oW4OlJery7HUR82vFhD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048576; c=relaxed/simple;
	bh=/xihopsvjGQfp08w+/2UGsYNeSjueCmPGTgDeAyt+Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3T06r8B9YU4fAw+1SwzgRiSiBCrL6vPAUJ87s+PgAYB0Ea8kPNR84jlVVRAIebknE1gm0X4LJO+rJZJnvzKkGUCgRL6nTXCjkFM4mAGThGgsslAGOYLv4cKnRFjviNI+laamyjIjTHGuiy+o9HvsOnfHOPkSKrm3ua7W2Vc5hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSUEI9Js; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSUEI9Js"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-68c08bfe5afso930326a12.2
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780048573; x=1780653373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/KT1dGhkezUA1Zh5oggRdnGpyCK+fZLQrOtpleXTHoQ=;
        b=KSUEI9Js4TFA8jioL5EO0V8UGfaLzbATfywu0kZsmkYv/cSnY8mieIaEodN5le9sV/
         878eKC94GZvJEB02CsofggMQ1wAMAM/Cko81yoEHcH8LI2YQtPJk8G3WiTFhNhqcfF88
         Cm8hQE3rbysBWtgBzB8/rVSXAviDSGQsqmXVMEkYXXA/NDKxPePuOUIl5McKI9HnVV5I
         siPxE1L3gobY6mx3TL/mxDWJ7ECsJD1p2rnKpLqeqgNwXsDeUcph8Kx3e9j5upJScsJf
         rW9MptQJB3hXX03I3Uu+LbN65prIKLnXLk0Ax0p7Vs/SdDWOJC3guaL0Vk9B4WNwNxRb
         uSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048573; x=1780653373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KT1dGhkezUA1Zh5oggRdnGpyCK+fZLQrOtpleXTHoQ=;
        b=LUhOC7HeKg2tVqQ7fzgssmHxDTCj+MNuFKSTxWyfA/Pf2vgv2mpqay56f2MCjbhtQI
         aUlsnQ+BegeidYwc0SQf9dzUfSpP7uXv8VDVVFehFw6Jh5MF96m9VRPiSo+rqZ522Xbz
         AB02GhMRU4B7/GOp0bGq0209K8MUNnDzRv2EghTF09gmFem/nqS2yFWZEE6Lt6Z4FLHg
         7LJwM+woMbe0TfgFgsr6d/5M9HioRMUKiglnrcQhMB180oB+kp1MkM/LCEvXcZ+LeQZ7
         tbCl4xZwPYWeYJst+UTf7+Y0dW/TwHvBa3Y48/uZuK1PEWh/sJxck7OY4BqyqzHlQj2d
         W/iw==
X-Gm-Message-State: AOJu0YyAsDgWtCHwZEECU3HPgSxOyXuJW2pfsTXqHVuXrwWfzBfakypU
	6E8Cgtv6Zw2ab631HRzYum55xwDuB15jPPh+qO6KU8THV4c+x2PEydk=
X-Gm-Gg: Acq92OGfyCBJH73ZIuqNzmHOPo9k0hfg6V4eYRzh2KM7UR939coedN088vQfyOk17Cw
	0/nx1JwzAQrEJKbtyCv/e9kpSucjk6zDnxYWzCYGPajK58zm55I5PKD36af/sTUUT+l2BHUiWJY
	BoFpdDjQCYTNseQMbh38iJ+jLe5i8u3Vu551x1OxWG1eaaQp5HJw636i11d4Ssot8pjOcgfywQs
	nI3TVjeNgFr5HdIywcmlpHCq/QSblhC2fn1Is+5yMBiUfW+luMLCR2U0TJ+6B1971xhaxAehCG7
	/B4dwi/QgBBRcz4sC+tVqpCoyAj5nT9D5N4ksLpdw2Qb+NYLyce/TQLNXprbfjWW6pQRQqOPJ6z
	U84QwFhTY7EB/nwjQx25WUnlOCAupYmCQ05r6Ku46VwrJV/775RQ+YCZjd7MD6aYnDSoQtpONoW
	qRRKBodXk3tMdhgcysZL86U17J4iLB8Zb/ZsC4/UpJYekYGQWMa5GMd6e3xKw=
X-Received: by 2002:a17:907:a68a:b0:bd5:2a43:b471 with SMTP id a640c23a62f3a-be9ccb8b34cmr120191566b.48.1780048573106;
        Fri, 29 May 2026 02:56:13 -0700 (PDT)
Received: from archlinux.itotolink.net ([217.196.163.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de53dasm52479366b.14.2026.05.29.02.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:56:12 -0700 (PDT)
From: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8723bs: clean up coding style in sdio_intf.c
Date: Fri, 29 May 2026 12:55:00 +0300
Message-ID: <20260529095503.130909-1-phant0m.mail2023@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*** BLURB HERE ***

This patch series fixes several coding style issues in sdio_intf.c
reported by checkpatch.pl, including unnecessary braces, spacing
around conditional operators, and formatting of function declarations.

Changes in v2:
- Split the changes into three separate patches as requested.
- Fixed the sentinel entry in the sdio_ids array to have no comment and no trailing comma.


-- 
2.53.0

