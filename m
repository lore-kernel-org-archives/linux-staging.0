Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3F0204F62;
	Thu, 10 Apr 2025 07:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269122; cv=none; b=Mc7RZKv3CcS818Do3T8Mmm+qoslcPomnsozlLicmg1TWcXtTDnEmQp/FSKd4vrI6ZBcX1PWDNRY3phMBGLyGnUxtoBG15jU1zgt5hgCbXR+gsYluwUDbsRK7FHJqXTw0J/C8GZLFTN1JFtC9Tq9058V6qU7PT4u9R1AMtttEgmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269122; c=relaxed/simple;
	bh=qdUhPT6eGfT0vIbSxltjK0R9yFEXKwiQasxtehgDHDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MKdkf3LmvL+3KP2XO8RbvK4XXdBRXo9tqJ5GC4ud531sMccdv/mf9l67o+R+u79QGSz9LuKYnyvOIyJvTI5eFKYDvaEpde5kJqmP9KchUYvwlUtzpxJkdBd77GT77Owysl86/fo77eo4Rl2c9w073zA8orAb2RnJoJvMoR188VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZNFc7lS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZNFc7lS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso3163685e9.1;
        Thu, 10 Apr 2025 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269119; x=1744873919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ondpv9wHHmTYRLHYVY0yID7V1+30O6BjyrfMe2qOvA=;
        b=OZNFc7lSXlycSfulNFylElSjlbTChIvpL02+kGU9vu132p4Cj9rEwCDqjZJJ16eiur
         Uhqv3uDQYQgTqxV+D50HO7pfmWWuS9rUnesEY1R1WcTrEra44EfVynGZJkvbRInGst3M
         015p/zpCFUrSEl3XUZ7+qHHaepXWw8dBHc+W0O/qcfxbX5MxTIr4IQfEqQ4SniC1muZ3
         lGIatbpWsVd7VJGremoP5hHevi2E8IOI+i50uCDJhwXX5EjrzsNqlVLIrK8upmxKOAuG
         o2hh9tQsfAvTF0ZBjEs/Imgs4i9IKWv/07m7R5dxfwy5dMmmRI0n6QMCC5eve3vyBHAh
         h7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269119; x=1744873919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ondpv9wHHmTYRLHYVY0yID7V1+30O6BjyrfMe2qOvA=;
        b=jNCcU+OZFh3KlhlvxMK/wPDwXQDd+R+awUakxCn8aN8Bb70Dy5udhptUXbCVwuODxs
         OKFzFf3vMDEIEcfnCPZq5Ly4VhkwhN4r4KQ/rURwdXG0zvF9o+uA+ftNmTCwZ4BR4wGW
         hbMHl8xeZKF1jUfD0bORsF/1qo1iBrFX675j26wfubgBIFFqM2lH9knATIC3ZhZTrdEV
         XK762dou96SDN3W133qu+EjkTTl74XwWtkiLXTMiEakrRw/VcYP2GIUCqd6t4mVCyZu1
         cT8i4V3po0TbRWW/P1FhU0ejMo0l5kdjdfAawy1G1VNRF+giJ/4WVcseA0/dD/fo7xo5
         lD5w==
X-Forwarded-Encrypted: i=1; AJvYcCWdODPhwNp6VmNcTbMeD5pkloZ0FADxcRHRr5i80KCHn9VT/azyreI5J9EAgZYS5L5LRqnnueznOVjY@lists.linux.dev, AJvYcCWgEgMDBdd7Pvp/kSfg1LXPH2FjLYNapfhFXqEcUppavuNuy/u7ZxBIqMmOuCypCDRlZBrtYRp7YnZ53OGp@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7gLTYN5akHkfD248pT19n4NHpEw3xYWNO+/f7efYFpPxE68xX
	c+whhGwbrlUa1l6n4I1b2dY9YZ9/l/7f+x7aEZaLqPYHZnmH13p3KZPihqoP
X-Gm-Gg: ASbGnctEpv169hTYeK+vmXyonaK2V7PO2HkNKn90pZQsYU+Hx7/I7cTpDCXkqMBgPbJ
	MUo3K1RG1AJeouMvPdjSs8WdOXffcQq9dD/YAJSxLBF8xRj49kMe/yLk2ydp1wd542CubQYyj6J
	ezC/bgkYdVh2qyPbAhJvW0qzv+0NC4J3c6ntj5mI4koK2ieMyXAyJhTocP5dGHt3+UQXk09mRhZ
	2W1cBooF7o8ziPA+B+cg7BPjnAo56KHB7YG4MLd0hcoCj8Ubil/Q0Dp3uJbYUyQjCI0I+oBfM5L
	Xicisq/UuDyhEIHeE+Jp2W85YhdBeb3efuBUhw==
X-Google-Smtp-Source: AGHT+IE2t23L8KCF9LY8XznMfXd0MrqX83Ivoh9mbFLU7queTYe+OxbqO5gxjP5+x7MP2C1m53hiLQ==
X-Received: by 2002:a05:600c:3512:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43f2d7e9229mr12823845e9.19.1744269118691;
        Thu, 10 Apr 2025 00:11:58 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e90sm40831765e9.38.2025.04.10.00.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:11:58 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Improve code readability in rtl8723bs module
Date: Thu, 10 Apr 2025 10:11:49 +0300
Message-ID: <cover.1744268316.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset aims at improving code readability by initializing
variables at declaration.Key consideration is made to ensure that the
code is clean, maintainable and easy to debug.

Changes since v2:
Avoid refactoring the code in instances where comments are left dangling
and in instances where refactoring introduces a checkpatch warning "line
exceeds 100 columns"

Changes since v1:
Avoid mixing pre-initialized variables with not-initialized variables
and handle an edge case where initialization is made to function call.

Erick Karanja (2):
  staging: rtl8723bs: Initialize variables at declaration in
    rtl8723bs_xmit.c
  staging: rtl8723bs: Initialize variables at declaration in
    rtl8723b_hal_init.c

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 81 ++++++-------------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 33 +++-----
 2 files changed, 33 insertions(+), 81 deletions(-)

-- 
2.43.0

