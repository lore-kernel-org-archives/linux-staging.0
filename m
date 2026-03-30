Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF739E6F1
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 07:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856173; cv=none; b=hLdV6J8gr4A0FACLk2mk8cYOTiBCkwP5OuW8+twVC80mqC0AEYsA+oZQaiePAtVMc+2R9zGpuu0ZKVFOHDfvc718h2p0rLT218bVqIc7OTW44t6Uzk4qXPsVIHt+8xzhOdb8cqE78mpCQsv7OrWEPhGOg0MShJ+bI1pB834zua8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856173; c=relaxed/simple;
	bh=kYqH5iugI2Qn/oNsZa3uBNnIyEKEdoCOypRJz0huAGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gu5uS5tL3b30zd+oBqT0Sttw9p4xJXXqPXc0fQWunRD1yD4eqy4QUsoloCSF7aqo4hw4CaJBi5D2PbJjwvVVMHYsDJUMfLeuInQeHW4oAHX1fsh6AQorsIC05GfFg67csAm3ZqlqJBk3mHFmwApIGrZpEb+AW69v/kuGavwJ3jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rINxO8QB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rINxO8QB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe655187so53528895e9.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 00:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856170; x=1775460970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HX27mnS6MIQlAM4e5IpyBKYekAZ0hpfOWZuRBhvW9/k=;
        b=rINxO8QB/B+4C56ZHaSp/uXWx1FHJ5rmDg+g4WjqJ9bUNLQOv9zrphzowEsHo0b666
         8NtEeK8Xhv1h1Ilxg8bCtnPzbcwYz7g8K3VmVh5Y6uPx/HpIuK3Sw2HPXpGA0OXgl2TQ
         ykVmBKYID+2453AIZa9pyEhHifz5To3ymQpzF7Fx+DEdSqw9E2rNbhcwxyxnKQbo+Cfq
         duTCGIZcGkJnbKWvsuwZVq5Z0lbNJSMFYC7DmSQ/dttJ9zX87axikZ13W71JqkVNc6O7
         E9KSwVJrmnSJBc1aNGbla+R7xBJOyOHNyNXhYaGvTBZO5t9uNpqEix/nlxlYJqkWU/lS
         hgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856170; x=1775460970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HX27mnS6MIQlAM4e5IpyBKYekAZ0hpfOWZuRBhvW9/k=;
        b=XzFE8L2dOyFb9TgLBdAOqpyOZ+v640VD6wXUqTPc3jGJkfddKHVSzNpEFAyxkPa+yC
         R37G87Zsg8FMsrj7fz9YZQO/l+uFexhTCJySTfL0VVuadjdmeaXJrXhKj1E5TedYITpj
         lIxSVKZMWoJa6m9TMywqHVaPS9V4KLCNkuO+z2ufyvekARhSWwz9tkKwxLBUvMVDx6A9
         CzLptOJnLc8U2JKvJDh6P/ihvrm7AGGerbuI+fbFfADr0tvOkiLcldo20+ZVaN/D1mVA
         xPhGlID/arDlFmJA9YFM5iDe9faMalopkloJ/yvT5zb+82JpXWeJ18R7EfODh5A/IiYr
         YJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCWiZadEPKZUUcAZ7h0NURnDOxisyCTrDvPdI29049mJeeYix8Z+iP2XAow5GqfXTq4mcAvy1u+A073PMusI@lists.linux.dev
X-Gm-Message-State: AOJu0YxeoRzYwkcJhQdWUNsH2rwZr/PvaKgAF7zmAY2m3VrSooKY6icU
	vZ9rLGuc71iD9xwFxTjuV5nPMgJ0DtKvWh55U+DTwN/HNK89/1atzONT
X-Gm-Gg: ATEYQzwHRMsQSmBpQxydxSPyPD0AufrgER31Mi8mGAr9eUs+fsDoC4C7RsY6xIWHd1A
	pY89nEVhivzfz81GJJ03xFDK3GO9daNLbKtc4v3iwVKiwJ/TcTFZf6x5OLgRGvHvH4+n/twlaG9
	joLKMqG8sBE/ADvIKAcSnsNEvlHwV7uXhvF8aunCwPbFdAT2zMt+WmRpOM7F3vT2XB4gBDV3FWo
	+wjFL4bXB5P+w3xVPlwbx/Jdm1PgCTZf5KcIRxggMem5BvTcZvsWuUVhiGUz+QMwlcnJeNlhHvA
	xbpTfl65briZYKnn+JSeBq5CkxzSuPzAnYo7r717K0gfpV6WMl+i08nr6P4xX6iZ20b3hVjptUf
	AhWUvrWSL/al0L3u1r7SegH3P2AxsePLmG1FlWQBOKlOz6L+LGQ1cSMYSLWEcpDiMpGyxaFEZLW
	zGtNVuhok3PdaG4yYc2tuLklS0EgpAFB4YbRgm+DEzCYX/E5Jb8UU=
X-Received: by 2002:a05:600c:450a:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-48727d774e6mr199493235e9.14.1774856169983;
        Mon, 30 Mar 2026 00:36:09 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:09 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	d-gole@ti.com,
	m-chadhry@ti.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v4 0/4] staging: media: atomisp: Few coding style fixes
Date: Mon, 30 Mar 2026 10:35:45 +0300
Message-ID: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v3:
- Added a descriptive subject to the cover letter,
- as requested by Daniel Baluta.

Serban-Pascu Robert (4):
  staging: media: atomisp: fix SPDX license identifier style
  staging: media: atomisp: fix typo 'uninterruptible' in comment
  staging: media: atomisp: reformat block comments
  staging: media: atomisp: remove redundant blank lines

 drivers/staging/media/atomisp/pci/system_global.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.43.0

