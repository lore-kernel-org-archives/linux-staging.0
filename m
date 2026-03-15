Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73340202F70
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 21:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773608766; cv=none; b=XZJMYygPxIcm0PG8UpT3aXQDviOyWc28b2lEecqM6Tl9UZe5XVolXuv8pPbVBF3xKUNuwgN+CrlYH23fdPPeBo87KLJH6p3/IDV2czui5gE/M/xVt9nLRUp5PNIueilGQKuLlahIFIUiqMxoKcQpnMpocd/mAGHG1WPLipGmcr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773608766; c=relaxed/simple;
	bh=ZmC5QDQ6RYY7l1CBHzXWz1/WDIaL5u8oAeAbtlDgAyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAlq9ufFlLmFtEZiUhGf49mEu/+ApOJaeiiLWaiWNx10qHFeE51ko0uPaqZ893Lc1iRckwUx8coJIymMKmtiahrSZDXpK3AtCdwjokNwaB9amKPRH9Gu+KXb8z8kStObSKjweOMpMTByngRv87iHLaBIodNtLD+Ovnjt2reiRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUpqErJ2; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUpqErJ2"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82987437624so2033119b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773608765; x=1774213565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QV8DaRkLjjkDu/K38ZU+4J/T1rKtFK0I8SCJdznFjyg=;
        b=AUpqErJ2xIejuVFTXB6vVcYaRfyhmxj1KrqhoPcAmWqxzXFy6zujm0fLHG+GNz1XEL
         J6ksxcaAkM38cvgY77jidRWuUEEdYXZgp8vTJXq7MOtgG9KMQTNrAbXCH/VILSe3pquu
         fSLoK4EEwueUZyAkShurWYQlwbEcAWIuo0TrXhfjUO6M1sGOI81+lzs/uXrm/z/d3t8p
         twlNqlZoqi2feiv1qjNncEBTy4NNAWmOBzijvX6z/u5Ulzb0tMHZFYCfRW5naqY6c6dU
         /BaqEtpfHnAS1btjgGz5jGd8iNxWMVIG6EfKeuTt9lXHc2QWfl8v06ONH5USDhSWib5q
         G46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773608765; x=1774213565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QV8DaRkLjjkDu/K38ZU+4J/T1rKtFK0I8SCJdznFjyg=;
        b=MvFJYzipy88rGsHZsszDuwR/kruP2QMbQwvRm3ZpIh21R5yBLyzjNp3aHLsD2XBJ/H
         EUgtqgnS39QfSvvNIgB3wrNAtbYQS1kXBCsOvF8pAhuNh+TUq5L4lYwitjEIFxd9k7pq
         XEpn7I+0AeISHr6zTVhKvJtrmxVFuGl8AsV9HB48ZCAuk/QytugW7NGETlL9qZNl6t1d
         9Ozd5pLNkxMCk8NaF37xO1EcDrKlVRWnsD0lN3A0Y26UhsLDTppuY8WYwRTuyFoAYAPS
         qBrwu8u3yU6ZTotHc0WPFgdpZu8PeuRUygAlNX8yrtsN9PHJy/WlYx35XnoutZ0zwZ/d
         PO1Q==
X-Gm-Message-State: AOJu0Yyqi6GNNfa55jH/BeoZrTJ4oOUN/m0Krww5lQEqOilBEUUXJvrZ
	QuggVZyUY/5GDKKgl8mD9DOoypJHhiXAnGBlP9vZoG+90Uehymr04/Yh
X-Gm-Gg: ATEYQzzWwDX5KEcpSFfP0Ggs/wab8FiKZzeuMJvukC+FZI35Q7MqWax0mhTJm3rJTas
	nhx7gsEi4B3GvjsO7CSwz4WAg8l4VlHLJ8oNEXvgqoK1fR3F6JKUhhIimnrAzOS8vkpydKby3Fu
	wmtJ8GHqw9szfd7BSEhofpJv/Lbzg6X/3jwtw2uifSa0idjdn484IxNnKlhfpFmG/4u8/l6go+b
	DG8HnHHkFBsljSig65Xbz2JvjsaKkDn2v3SqDzzND68C9SWkr9njRszyAnVYyNKRDjXTLUCtt9W
	yT05dlvk7jdFAT2tVqI5st/bSODska8csWTAWr1Sh70d0Cz33ealU+Rrx6+K271HHTTq3omvM1T
	KK+CxGRW5HLYEGVT1Guku/dJU++Fvn9MYkdzDoX5w0dXKMLBcOPNCPCPu4ZmWpR2LkIdxXJ1wlT
	/HKIcyXr6cUKkYhMl8dWK4+ZYYS72HU2QRHR8OlydWx3OZ1E8=
X-Received: by 2002:a05:6a00:1783:b0:829:7b30:92f4 with SMTP id d2e1a72fcca58-82a194794c3mr10062406b3a.16.1773608764708;
        Sun, 15 Mar 2026 14:06:04 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725e05esm13675506b3a.18.2026.03.15.14.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:06:04 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v4 0/2] staging: rtl8723bs: Cleanups for rtw_xmit.c
Date: Sun, 15 Mar 2026 18:05:48 -0300
Message-ID: <20260315210550.6058-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series cleans up rtw_xmit.c by replacing magic numbers with
proper macros and updating the sleep API, as suggested by reviewers.

Patch 1 replaces network magic numbers with EtherType macros.
Patch 2 updates an msleep() call to the new fsleep() API.

Changes in v4:
 - Fixed commit message line wrapping in patch 2/2 to comply with 
   the 75-column limit, as suggested by Ethan Tidmore.
Changes in v3:
 - Grouped the patches into a series because patch 2 depends on the 
   include context of patch 1.
Changes in v2:
 - Changed include from "" to <> for linux/if_ether.h.
 - Sorted includes alphabetically.

Marcos Andrade (2):
  staging: rtl8723bs: Replace network magic numbers with EtherType
    macros
  staging: rtl8723bs: Replace msleep() with fsleep()

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.53.0

