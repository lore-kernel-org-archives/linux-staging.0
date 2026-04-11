Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DEE2E03E4
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 00:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775869005; cv=none; b=dncHDuPl+IdSkYDglfF3uENk3u9uiK+ehZoWoVb7CtJDLSi2urZGmBcgdiWGAfZowbgpnq9Ci7cIFZtiNQgjs3RdjIJeMEgI8yORiXw+XCBUdvn6+dxfpJ3Ywa0zU6uxtb2iYhv58hnOJ05ocJ0PJKSNJwXIRM6Jn5vjH0tQ7ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775869005; c=relaxed/simple;
	bh=1r6NUx1mBz7uU53BJS3Rp8JEFf3SRmd0SDN6gzgB/gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HGH5ZytMeEJ9nQSNZnSB1uYcv9FwyCAVcOn81x4IZiw7alYXxoJpEJ7FWxq/sgyAfOr4ntgqo0n1bpx85HxfMDj3qUvbmwUQNB3fE63ryKS6LNu4EPg1xMYVU/LpocrpBnBeVGVyZHF+jiT2j+FWQsh9z0RfiBvTes9RrdUaoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY/6iaDJ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY/6iaDJ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82c68339cf0so1561248b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 17:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775869003; x=1776473803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5fMmliGav1dc37kxbo/jRmBbPOJ48pG/a6mgTM5JNk=;
        b=iY/6iaDJQlmW68PNkKeIImXJwcSnvzN+g0pTtvKl1vhSiWuvXzo1jECMTEFDO7jgQn
         5o45qyDfJmfEgOJN8CLSlRoHdthqz5LK/1m/HAZlmaRe8cvqsv2sqPGbeEoOqueCqCMD
         hhS4q2RWeOetWOxjtabbEuNCbRJKG9SnmaCP8OabXANHUjMyS8iT12mZLvA9HosPD3+4
         koTGeGqbSi9m55zC8JKGXokDH75ATfzgDVl5pK/VB2/ZxCtTAe+H/bNbDie177aWTXLr
         a41cprLoQjyuJPUoblU9r7rd0V7swVgu96c20S0EJnFbW5fVrLCK3ssvz0fB0SH0JOmq
         iOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775869003; x=1776473803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5fMmliGav1dc37kxbo/jRmBbPOJ48pG/a6mgTM5JNk=;
        b=mJc1pEWm2zjd0g5ge9IgXbBamPhtuU4ugOWxEdNwGscfGIm3HSBqRdMn26GoZFk8Ia
         cXlj0j9kwEFHpPQv7NV7OztfmWyBpEsE2vKIUuhsCH9qEkdPNRYJ9RIG8GifANhK1FJ/
         oXd66qyv1j+KFSFHO0Bz3rN2LbA3SYrmPoL4Dr0h/10ZZ4kTYkxFyGiRl60aPLI9Dc0h
         /AkhiK+3AM1RKP6pYRBkbdvT8WyKEPfNXTgEsoS359EBbVW3FnLlMe61vLhJ8G6zsWzS
         JimXFjmabBhfoRQVVEoPBR3CiOO9xElz9Tf32oCAZYvgxsou3wBpEpNr5iealQv1Ei4O
         w9aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTcOOyEYulgVojsded0FHJoy7Xx2JTmDQSRFGFMCVhOo6i0t1WrhbzkK1nzASVE4aN36+xcx3uNWJIPOil@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3wvNdrUVu+z96rjwe7k7f8GXP2PvxtBXqiX4DXXGJuUlOv/3d
	KZJl9mu1vGoNP0RmTwFoqtyd+bnMcQfbE+OIFwqI7oCAQLi+ctX0+JcZ
X-Gm-Gg: AeBDievYuYHw6vnO0qTB8CGiXGTWHPPKTSg9Z1N6dZyNjb6CGjhSb8BuljeMEpbzpVi
	oFvaycCdqHyLtVla1rit6zDVn5W0/+7AkObE31k9koSZAK+BnURgFlIk3skChbram3GGuruVG66
	Szpu9+lsx5H9QqRcYXBntfn9WXh4Bh5gtfbQLDfJghMUwC0Y6yEZ3h98d1MxU7qDsv8t+TLWZJc
	Qp/CX1n13BmqP+9x/ex4nA0NeDVZ45hkLD1wTgZCkDOQ5HZg1LIvc6ftQC52iYTZZhtet/1iOd7
	mIfHkmcxO2SRazSKIh2h1/2TRFCJV1dhVal/vvR95DamY1ffhmH7gr1h9FqfwvI+PiHFJgL6xdN
	2SUTmxw3SN5G7SoSLeXvBzh8jHnMCEMGx06VgIfq/ixwhuNi5xXXDrySkuE35jSbjRJgZ7u/V7X
	IOA20JxESJWB4+Xx+LDPK09WNTjfAe2+ZwVuTk9ED0IFrFRwGEYa2VwBv1fQtGHNNULp8DlCd9j
	/K07jhUA6tHr/QjTPU0NlBMm0o9g9Az
X-Received: by 2002:a05:6a00:3a1e:b0:829:8083:472b with SMTP id d2e1a72fcca58-82f0d0d1199mr4728146b3a.4.1775869003279;
        Fri, 10 Apr 2026 17:56:43 -0700 (PDT)
Received: from michael-mint.tail2556e3.ts.net ([50.47.84.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm4388692b3a.54.2026.04.10.17.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 17:56:42 -0700 (PDT)
From: Michael Ugrin <mugrinphoto@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael Ugrin <mugrinphoto@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation to use tabs instead of spaces
Date: Fri, 10 Apr 2026 17:55:12 -0700
Message-ID: <20260411005512.46142-1-mugrinphoto@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace issue where a continuation line used spaces
instead of tabs for indentation.

Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e0..966d4efb200c5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1257,7 +1257,7 @@ ia_css_debug_pipe_graph_dump_stage(
 					p--;
 				/* Last comma found, copy till that comma */
 				strscpy(enable_info1, ei,
-                                        p > sizeof(enable_info1) ? sizeof(enable_info1) : p);
+					p > sizeof(enable_info1) ? sizeof(enable_info1) : p);
 
 				ei += p + 1;
 				l = strlen(ei);
-- 
2.43.0

