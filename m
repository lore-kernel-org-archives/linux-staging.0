Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921554219E7
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 20:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777667540; cv=none; b=MqeDwc6s83DV8jPL2i+pCr2PWbmUmbhG5g4RdsJwJg9BgCeL1MO0i73dpLcAKI3Bkzbg1S2AlP19o9Y2im5yRb2DEZPtRzcDhH1+WyiDI7GEDObLABF8FaNUu9m2xFDmZ/kudPncVv++OXl+ndQY1iox8yb/jxgaJSISoY7GW0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777667540; c=relaxed/simple;
	bh=CY5pib6gsyLnYAgGsr6BkpktNQm4OcgtfKHGal8nuQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxEIxjFqO+hB9t5GtPfI2XRXdiXr2k2zZJ2Jcw4C1gg8FF2EUd/p1X0YDQLYBiHIUz/s82BlphvnjA6Dy9sZbBDDdTp+C1HD1+h2uGi22OyV4YkpwJiYlVrg5lDtRju84i6m9KTtDRPWRVmBOreYzk6L/r8j30CrtEDknGrRMMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxnDlMYc; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxnDlMYc"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-36505450d0dso519451a91.1
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 13:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777667539; x=1778272339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okIm2jI9kgSMPvyEfWv64gIQ/4sWbeBaAQC0+G9pQd8=;
        b=SxnDlMYcqFwGOxNY1L/pSXROuW022EKbNKNTgWHdY//0AqAW9oOZsdpp8gabLLGVbz
         x51BxH6zKkXstZp/t4PqZwNm8hEjjlcHhSb+KWDBZ/PeABfsfzU3fiRVUnE0puV0Ln5Z
         F54DspmyfZcqeFfXl+OpGxhuNCYCj/zyxoSsvF4rQSEJMtmRa23EY9jh893WyPm16q+e
         7ufdhPfuXMPBAUtM8hp5fIlUus/0S1cCnPthUzU/EFr1Ji17OeEgMaQilgACsPsG5uMb
         ijnpncENhxJV8fM81xU7yXGKhD+YE52Fe+/PibDIacGvpH/VdveyNGQy0GHXOSXdSYT+
         XD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777667539; x=1778272339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okIm2jI9kgSMPvyEfWv64gIQ/4sWbeBaAQC0+G9pQd8=;
        b=sNCOYv8xG+wJYyOLf/6xr5c4aDSCoxuBEejiA9EFrC4AxSxMtjEJu6H4XSAKLh+y7O
         VZ4eKD0Euiu/75p5CtGw2uUjIIwa4m+7z1M4VQiFfIVlbt/rP0ow3md5zQzZ4sSKU6h0
         DCEjLfODL2T3klimnN6m6PAtqA2qpU9++2CaiLQW0b7FoUkBwi+ZJtVHcloL3iDb6myB
         SfYuRkzyKuWOdPC7p9rbpE9500cwu1WZhZxDtPZztbAWEo0b9V+CqSI0gVLwjlxhbKAk
         AZl6uo5QUqD7whQlScUSRSP0oo8kBC8jWBZEm3JUpoYpTPsePR3y1jPHcGoirmeNV4Kf
         pYLA==
X-Forwarded-Encrypted: i=1; AFNElJ/h9VHI8mirLruDDUh+S2bGeV2F2X4fe751/t1S08P5HVYMizt7NP3cJbQ32sqv7WBTWv+NULO4Fjyq/pBH@lists.linux.dev
X-Gm-Message-State: AOJu0YwaTUBV7z3QrJ3PTzod0C0Dawo+NVIhNQmI5qt7a6kfxrJ3DJlX
	Ffpbua4pLm9sXIxDFfe5boseMqgP+msyVrofJTrHujQWN+JXsvJx/pusJixTnGhnqZQ=
X-Gm-Gg: AeBDietCnIJiAr047diwDISBUIzmpt8zxYUuWlUeREPwi5U4eD1FIOqsEUFBaFFNaWd
	mRDbZR0rMXkPbZO+jnD+/ynjp3Snoae5MAKGS+tFjU6e7wqKoZyOAOXBIv+McGe5CYu7TUSP4vA
	7drtmBqGqtC9bB861FRYqaCjOmGGSSZENpie5zN2nH2rUUFfGq7IjAiz0R9j9kE06/lQPV24LgY
	pTDzUf7lBRJVNveQmExnmkuBYkRb95ZdnB1OH5+KTpOKHhwnxFUKdDx3fprEzLR5yC9/6Jk74SC
	N10Vb4uaIkV5tTW/d3FWzoTSAklWUdd/RZCmhwGxVCN957RUPDGDOXPcLAWisj4yVx/0IW6wEVC
	wf35Pr2gC2GPkNEbIXW75buG5hHsJyunUwJevG3+QMW1XH7N9EssjdwNQairEKyJjCvz6dnpO0h
	tBGgyis3aF3iG44YWYWYtZCkZwg7lT4mOVKbhSgUTE5kEtVc7cGmQ=
X-Received: by 2002:a17:90b:4ac2:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-3650ce83a97mr618316a91.18.1777667538924;
        Fri, 01 May 2026 13:32:18 -0700 (PDT)
Received: from horstaufmental.lan ([159.192.179.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f47f1f67sm1306071a91.4.2026.05.01.13.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 13:32:18 -0700 (PDT)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	ignacio.pena87@gmail.com,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: add braces to if/else statements
Date: Sat,  2 May 2026 03:31:19 +0700
Message-ID: <20260501203121.227992-1-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds missing braces to if/else statements in rtl8723bs
to comply with the kernel coding style and improve code readability.

No functional changes.

Siwanan Bungtong (2):
  staging: rtl8723bs: add braces to if/else arms in rtw_efuse.c
  staging: rtl8723bs: add braces to if/else arms in HalBtc8723b1Ant.c

 drivers/staging/rtl8723bs/core/rtw_efuse.c      | 4 ++--
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.53.0

