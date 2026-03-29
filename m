Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3240227AC45
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 18:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810164; cv=none; b=JpUmxTA23BaQsA3nxn4kdFZma6xkPA2EuJF4rh3jzUrOrusWUSej/7+XJ63DiewQiQVHaTJMX8isGRVFpeCvGFfZZXGFOXb1/ZAcYTNlZ3C61+8XRfx7OvT/7Tu/hHMMltrBxwtLKGI/N/CBOIvEySY7OMuV2rTAQX5ka6iqVmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810164; c=relaxed/simple;
	bh=PTmpHgfaMM35AZI86bZDv/99vbhobrELHOSJAkuhxT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McmLYlXAjuCWgAATRET3hP7fdIUGQS8zjlCZRD/RSmkOkWVLcP0eN0T76rZc/qDNWGmUZfC4eMITWr/reWKLYFobMfxRDYcK64zcUHSjYv1C6GszaFxVpXQPIfIkJ2z+3nhkAwUZ0/Yc6BDWFc0BcXjKsLlDUUkV5JYoQtO3buM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYReqH7V; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYReqH7V"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b611274bso2003885f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810160; x=1775414960; darn=lists.linux.dev;
        h=content-transfer-encoding:staging:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hzi7h/Q5ebO8HqMydwyfYXKSa0XEheo26fHTfI9VIY=;
        b=cYReqH7VOyVidi0ZObNMtRE0ZwqIfkNedZUFDTjew7828xZlpVzinvOaHuWyGSwQDu
         c6KaUL6DM6yqiNK6T0VRufTCn71v+WRGLraY5fKP3GJxPW3MEBRGC6VNfF505405lPWy
         emGODOhHaQiG+B5m9Q7BRd4A99cd2tBVdEfopq1Ib3193IhHLE95pyDYaOzhKeHexzAu
         ubZ6WmGLwSmQJzhpx60Dj7b2g+4joRguFsLyg7Wq3nsFZ13IY/gFQDxptlb+jHWSpc8F
         LgW5D8FQ644nAYcHKIeEAp6K0RkJEeE0omLsLDXwll5bc13ZHUFBgJ4CJPoFRnIpwx53
         Ly3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810160; x=1775414960;
        h=content-transfer-encoding:staging:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Hzi7h/Q5ebO8HqMydwyfYXKSa0XEheo26fHTfI9VIY=;
        b=U9NWXrXG0KA6I6FQHf+GVH32FBD+jCXhFrEjHfnLSVne5gmW6llIlTGMNvlYJBuxMh
         dyi9EGqFkuvSk9T2srsG63VsMwRnpr/aJgnPJ9ufLKsDnxCSYmZDSHg/U7j4PvdDpPpv
         klS1RDq13oDpCJ11N2jfjwK4ioL/dZHot56BjqEgTENzLZEx53b9FMW5Berd2T58DzHW
         xx/6+2w/+oz2dQjeQjKEO3L3JoMsLoGhxxaH+R8JOM60JELzk/o7iNJY8DwvyuqmEBl6
         AoBmtjr6tMHX0isl/HaFZpUpGQmoj8sCK1R9K4IgGVAngY9XlaFsHSOQztHrb03slQ8I
         qQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2osDCen602Gs8esC7/Vu/njuVuPn06WZ24SI0/t3XcewPEbF4QPIg+9wNRUJH1DO8538j6LZjnI6EHzSt@lists.linux.dev
X-Gm-Message-State: AOJu0YwZjWjvLn9LNSEwVQTQk/WowHd5/nctuYFqWdt6J4IqcWiRrbxc
	FNKB8qokaXBreZS21MeQYSw8rH4YjWbLeXcxm7uozmQoI1gJnABq+9mO
X-Gm-Gg: ATEYQzzKs1FBY8HTfFYry2roNTpnuqEGPDb5NmhtdEOLMGjWvitiQ2oNb+a5fAvMSnx
	3O1tzi/UK74pKXPTfCSWkrLo4aEQ+dEsrWRBnramL3IcVXyYG7Y3Lme4jcG6qSoqgNGeM5i31Hh
	BSTozYafyXaEPzyjYD6P3+y8tMdC3wg+Nz3HfFbCA/CqnVzzNv2DanVZy/ELoowBNVuC/jbDTD6
	3Cb0BoC+BNOU1/pfpkfETM8QcaxTN5zinP43lCQJZedo6cXXyV9m1A5RrV7PJXtUb7tHNH6xs7Q
	sg8ZYMO6Gkh4ns1SDO+cAL5DiBigQqBd+HnbEYotwUnlEmBg1Y2ExXQlvm9H1CESFOJXMGPdLiw
	Q3SI4Vr/TRfDs7xg5enimJefE8HvDnfaQRsvaUJ/ptWKast2L/TGT42F0s6w5wd6v8yopGys6Fo
	MzWcB/bcXD09btV+4WhX6apSkeJnQd+oZ282S+vNyobQL0fiDeNpU=
X-Received: by 2002:a05:6000:2903:b0:43c:ff58:35c7 with SMTP id ffacd0b85a97d-43cff583754mr1794804f8f.14.1774810160347;
        Sun, 29 Mar 2026 11:49:20 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:19 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 0/4] 
Date: Sun, 29 Mar 2026 21:48:06 +0300
Message-ID: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
staging: media: atomisp: coding style and typo cleanups
Content-Transfer-Encoding: 8bit

This series addresses several minor coding style issues 
in system_global.h as requested during review. The previous consolidated
patch has been  split into four separate logical changes: 
SPDX header style, blank  lines removal, block comment reformatting,
and a typo correction.

Serban-Pascu Robert (4):
  staging: media: atomisp: fix SPDX license identifier style
  staging: media: atomisp: fix typo 'uninterruptible' in comment
  staging: media: atomisp: reformat block comments
  staging: media: atomisp: remove redundant blank lines

 drivers/staging/media/atomisp/pci/system_global.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.43.0

