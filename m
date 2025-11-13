Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41349334394
	for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030751; cv=none; b=TPbFFIC/SKARHjcHZOlJsmrVDRhn09DGJPkUro/pEPU4yvzkGQh650HW0kEIvIiNINaPey1OLVToIKAEEB9Vf5JQomVX8tdSC+asNNqPAEK6gzNjvUA6/Tn56TKTAN7Oag7Od8hfR2VWpxjFS18KOKcYhKRBXHlyok56my+PZ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030751; c=relaxed/simple;
	bh=ckFH07UEJ/6Vn75EeCEfpSFArExjv65uHl/yV6y/LG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qwwc8rVcTvWeWvZvDmGlPbXxDaVFVY9M0ZGThU3u88OC4Gc5aPjyIoRoAw1llinV249xiX3XbzlHl/0aTYid227rKbl6a+yx568/LKsZvlkBoLIVuKWJw/78ZsWf8ZZFieJ+w4PKCqZyzfjE8TjUgQDCLyN2vp9LLT5vUqPk8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPPjgSoo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPPjgSoo"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477442b1de0so4412365e9.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 02:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763030748; x=1763635548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nmpwq9Y4K1E48WXNTAOK6Thjd08PZ+n1dzKkwN85Vb0=;
        b=bPPjgSoo4Ma0spr8oucF0JZXg92OS1zSg5mdQgGNQUmigoHfdwNeB4YY4VnTwAMyHk
         oQ15NbouTURmjxqT/D4OnfQFbOKpH1FWmFCbJp5Y2zdcZp0pPRmq5HRm1N5jBrydBASe
         gHyB6fXHH/dZ8GECC+tzfX5XsgXKdaj4KB1n3MmlIuoNqfOOJsgz5p5Nv6zduuLjnbwL
         CsRLyRpaEEFbQoN1JvnaQy3Gmh6okyUMeyDp8/4MuzDvdoQOdUQHrEnPavEbTuscg3Kf
         d6FOlk/DH8AjJWPaDkvvcGKQr4VxDquEEGA+w5JJA/rtUdADtaAfvl0rLVw1BMFiDaUb
         tjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030748; x=1763635548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nmpwq9Y4K1E48WXNTAOK6Thjd08PZ+n1dzKkwN85Vb0=;
        b=iONk9eZUhZMk/SLndyw/o6fr+gnCCW/Mijgj5PjXwd7Lpw8wSUAxaG2gwoplXCxrRe
         A0/X6TbJPjiYNt/yJD/5I7p7LoXQo7u5sf3Dpqkhw+JofNwMZq3JR/Ie0mih0dBKjnKO
         4NNwTrLLwipO/Y/LTp96FknIyz6KUhZnU/zHgfx3TnJF5vmAv8v15UvPVWdJx3sVQZdP
         MseaDbiKc+Rp2SWU/QMexWWSlHNXJ3g8uBN8l4HgY5Vsao8DjKi513ZBfHc7mVrTIO6o
         tBL81j/c1e/oht8on6WwEtnpE2/8O/NkwSMUYk57McKEtIcbMEgJ/0yp+xbE7IAIGeNK
         5SgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXizLGCdDODh2Mz3YUnzvdjyazbkV5KrfDudSvAld9GmrLgnHQ9cCRRsOQy9Zl2Chr1tYxKbqlozZ6PvP5C@lists.linux.dev
X-Gm-Message-State: AOJu0YydAXMjkV/wtUxS9bdHup2MjJQNqjRna57QKv8iaCAxqzNpsImj
	zcEMIan1pQwqi95Zl5dPAayEEVkzjr4+Pasge2+NVIdZ5NPf3Hkkno8u
X-Gm-Gg: ASbGnctqbxMZUynM2sOmHND6ASzCxqGegLWJo88Of7NuDtZ1vqiLRW7nMYKb79netb3
	bdHutULqVNcSi70DwBoKxKnR8Zwvy5IyIBLXDlPttXB77VAkQst9/tbpN8flTNzgzgUQgtk2+js
	2kcR3csXGXLFYVJv5DquoST5zsJkLxefsGWZR50ClMPLy2CcekItGhCOCDTCDF9HF2H81jsnwVC
	cpnsXEfr2fRzUtDtMuow8TIcQs8YDyM1aPpgIAw3sngH9k/9pXgp1SmGCWBIqbA6Krw1mqBQpF1
	utOsiG84/ppDkwikQkcEdlES8UKH8P3/KLoZbJYNmKsOPzV/BK4TO/JLZaTeu27lGqT3IP2Rlmc
	IhV9JnViXiBPEN9ISz76wnpQCz355nq9wEqapcaSnaXOM2HcvJF4rmjC/hPXQU+M2bR3nUbTB3C
	GMDkSOXRfWo/AcbyF8
X-Google-Smtp-Source: AGHT+IHSFATyH/pvqoLWDfUuQR+f8Hx0NgryuaxhpzBtpaYKgjM4VB/bvq8zZBEhr/Gx8I/1GLJeng==
X-Received: by 2002:a05:600c:3114:b0:471:1717:40f with SMTP id 5b1f17b1804b1-4778708e373mr56325895e9.22.1763030747572;
        Thu, 13 Nov 2025 02:45:47 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm1444975e9.5.2025.11.13.02.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:45:47 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V3 1/6] staging: Remove gpib build from staging
Date: Thu, 13 Nov 2025 11:45:38 +0100
Message-ID: <20251113104543.5875-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113104543.5875-1-dpenkler@gmail.com>
References: <20251113104543.5875-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is no longer needed after the gpib drivers have been destaged.
Remove the gpib Kconfig menu and Makefile build rule.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/Kconfig  | 2 --
 drivers/staging/Makefile | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 075e775d3868..2f92cd698bef 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -48,6 +48,4 @@ source "drivers/staging/axis-fifo/Kconfig"
 
 source "drivers/staging/vme_user/Kconfig"
 
-source "drivers/staging/gpib/Kconfig"
-
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index e681e403509c..f5b8876aa536 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -13,4 +13,3 @@ obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
 obj-$(CONFIG_XIL_AXIS_FIFO)	+= axis-fifo/
-obj-$(CONFIG_GPIB)	 	+= gpib/
-- 
2.51.2

