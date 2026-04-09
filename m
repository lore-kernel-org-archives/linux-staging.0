Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4416C18AE3
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711096; cv=none; b=NqODxAGaW/TmiEwThg54IUoggXBWMDY8wSTjKiZAIxOchaR4xCbWZbIkYdLSrteWl+fuTfIJwH8pm17Cg92bjwASi4mU866/Q+Kwkd/0QKJWWHCZcU/QMjO/yPiI0pW4gV9EhaJQplWfUpdyjDf2ewHGo+LXGCQEt0t1dy/bro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711096; c=relaxed/simple;
	bh=t8moLJZz/gnig9u7p8ltNT2PI6SpB9MuwwqBjFfgWfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icLprAbMvxUVEXGzM6Ev/0TogrQDOtbrFn/UglVxYyYWdKPPeckzwKmlMdy5BTyTcJEs/wZ4mFN1R0pZO9+GgGklbowAs1jFH6OCUyvhKHGO+kbQaBDmzAz4oMQRhjMqFXBcRiydxjDd3T+vD+rh+w7DoIgolcWl8pgmqt3xvS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uph+YQtH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uph+YQtH"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c76b6f9a50eso231497a12.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 22:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775711095; x=1776315895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dyEjqJZ488fN838HcmfB5zIrn/RmpbCbwDHqhWKG8P4=;
        b=Uph+YQtHMn9juoJzBb+TUc7RRqWIc0r0viH6W9ZGwH6oEPC1QgeFV+Djsvc+LnVWID
         ImEBdp+vyQHsONhaxrMxG2tlovxEn/sCZYlWDkisaa/xwRJyFTb+pB5Bzpby/o2sTB/h
         ZbjKczqTGnLJWlOBYKej3tBKDpWNzlOjzGLkNaTpOwrQvSFCUOeM5zluwNP85ufKBisf
         pvNiaSxFVRMxQbdmJgbxMXjQsLMGj4zswTLbOKqEk8vWVfjs4EkGZkdkSv1e80tIobzS
         w1VbGNwMArsoPGFr/L/QSuKbBuqli1tq56l9O46GVn2MduZu6gT0Q31vj0/xleJVhfod
         OyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775711095; x=1776315895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyEjqJZ488fN838HcmfB5zIrn/RmpbCbwDHqhWKG8P4=;
        b=O+QGN9vpFwxYhQz2QL65Yie7+9LICcMZDoaA+WhI7K9d1dslIwAwxLL50QkNY0NdyU
         BQ8l9MMaqgvres6iblKrYyPjAOBgyMxxwVZt+LuDS3J/q9PYmSbAh+wMie0dTDPBjZsy
         WLNr0vAH0+y7EwgWF5Rtm8A0pnYFaL1tnqDpYvVKE7bRYs3ImP/KfKswhvOvpLoqeWev
         Wc1ec9lmXdPJF1/ts8U9nihUAPRmIX2ADtIFXEvHo3Uz0LfAXhzvkYaDeWn2BAJI1jM9
         UlrO6XCcDQordhsnmFSLxOyVAUb4rREmgha1i2332rNyfr1i+ApuWuOheFeza7E4yza1
         baRQ==
X-Gm-Message-State: AOJu0YyDu59E/hsMlcU2BN2synbEsm1o1g2JYsUiAszbb7XCwCtYXH7H
	gUitycavNIkFeW0ggrQvrJgLXpaRIDtULO9zYjKlCkGWJl7nVqTvaB0fV8/Gwg==
X-Gm-Gg: AeBDieuQNFJcrwrArGau1JBC+AMSHIM1EqtSzs7h+6sgm7WkjFWFCEeTMeAP+0tunqM
	O9REyGTopIZtetieCP0Uq/pM6S0d6MFnlT3UDbgqfSoS2zsRO5T2tQ/WLIX3Zu3pEnAlckNrTd8
	pMy65pjbYLI7/KAEcx/5tzZULZYZcpbuO6ogWfdlzLS0xvv4RGYosnB0ljFDS6pQodXInBqaYuJ
	2kxo6eucoY3O/ZQBo0njJveXZZlMRnAbaLw0c8QpbGW8rivJGfR/sO5aqtocFv3nf0/px1W+fyA
	nbXsmQn9f/r8THaN6tv5MDyPlQw41NSei8438WNwddh5hu0VLB2RseZ3P6nLENuWHOHsgrIJp+S
	KPynDCKIyhUc0IO4Yg798lUt3Bv3JvldDf2hJBy68CLE8kgbBYv8nmUciY6+YWlbimMRk7jp8NQ
	klPt0evhuuX2idlZ2LRSqGMz/w+Fs/f7hJwaMAiVjSulJa1vz5yyaFxw==
X-Received: by 2002:a17:902:8f91:b0:2b0:b325:7491 with SMTP id d9443c01a7336-2b2816be210mr205561835ad.17.1775711094568;
        Wed, 08 Apr 2026 22:04:54 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2b27478945asm291061035ad.28.2026.04.08.22.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 22:04:54 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v2 0/4] staging: rtl8723bs: coding style cleanups for rtl8723b_phycfg.c
Date: Thu,  9 Apr 2026 14:04:48 +0900
Message-ID: <20260409050452.97774-1-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinemon Tama <osjin83@gmail.com>

Changes in v2:
- Split the previous patch into atomic changes as requested.
- Separated type casting fixes from line wrapping.
- Simplified commit messages by removing redundant bullet points.
- Updated Signed-off-by to use real name and new email for DCO compliance.

Jinemon Tama (4):
  staging: rtl8723bs: fix spacing around operators in rtl8723b_phycfg.c
  staging: rtl8723bs: remove space after type cast
  staging: rtl8723bs: wrap long lines in rtl8723b_phycfg.c
  staging: rtl8723bs: remove unnecessary blank lines in
    rtl8723b_phycfg.c

 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 65 ++++++++-----------
 1 file changed, 26 insertions(+), 39 deletions(-)

-- 
2.53.0

