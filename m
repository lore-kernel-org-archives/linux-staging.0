Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00BD1F3BAC
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 00:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777769889; cv=none; b=POsUlHGV7xV6zQMFxClsOW0XQX6ZH4tCH4JXOfK3lpfssQmMTpMexm/5KbPu+645zpr1Q77DoN6wpvltV0Qa+kcLNojVdyG3CWaZNYbDXrRuHh+N5tZJkxBSuledt96Pqsg6vW7WyAbQc1ESACBgOPf/H5ySkVvjIDwc8eYKkjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777769889; c=relaxed/simple;
	bh=AhpSCviznKoY2yGSf99ogcpPMMp5mJnaU3+12jCiw+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ghksRZ+v/be+6uo67glBRayZD+paFotanMeaOoyqtXEDUUs+pjUZDQE5MMbCNost3zKjlktQXKvJ7O6k/VdIAZau9s1RHzeABA/fVH2x/0f+R+KNW/58wZwIGaZKmPmqY1Jbb/4ltJ+x+ervU13bRkFDNt4GqqGamFq4wdr946o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=tLq8k3yi; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="tLq8k3yi"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso1038488e0c.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 17:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1777769886; x=1778374686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZvu9orYbRflFagi+IIOZu2jKDi6pNH8ZaOyxN4G8eA=;
        b=tLq8k3yiZPnf9by+5kXY2iuPEKuFUv9qWa4FnvIQ12+OUYiaO8ZrqxTJh0FzE1RGzj
         /LRHLLRYDQRcHY8M63RkjugYkkeaPqxBxbROO4a57cBrJKpU9ueZzlugpisBx3evyoa2
         OJ3KxKjKPGZYfgBibgOq5bMTRoNyWHxhH/Obq3mXtzM/Rn6UcEZf5qkc0X0hCBWZ2WzP
         d5oHk4cmKAotphgOovfql/FGvsRXfpSKfcgtQviR9mz6AJmJ/gQQV13569HXkBKfai4X
         rX6iM3mbzw398HYnRf9jr6JvcQitb1rU5kds4z7R3jxevpo4sUeZs60FV91LjqzrytxJ
         nqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777769886; x=1778374686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZvu9orYbRflFagi+IIOZu2jKDi6pNH8ZaOyxN4G8eA=;
        b=gYF2YAupLI8hBJKguoILcU1kH7PXBH/hYbti2paTX4cMHQyIuQJIckw1cQ71+7uat9
         VFQNtf057UxdT4yNHaoNKJYflBgR+siHdXxLe0vd0BQGWhdLmh5mUw2Xj2OagbE+e1Df
         dcRzCz5JGMF0UfUTJrFOAhPtrXzVWjKoIL1Yav+pTpitbUFu/ENrNcAsxvkbJRc3gj3X
         RalepyqafeLFcTl6RaQTD+Uoyqyvz3goVG5YeUHe94rmQy6Iq6smnCDrfN5eGuwqSSdj
         G1shy9Ayg8H6ZlQ1QVutDQOZP4M6EfRkZcuLU3x4miIleSmiC9bUtCmgQObVGdADWwB9
         E/mA==
X-Gm-Message-State: AOJu0Yyl8Q3SX02kUShZFLr0K+EpPfRIVCufwnitUq5SX5Y4mEgF8V0l
	SoYqTM+yP1OdlsG52rqqm/lssHpx2BKDov4qS+FvyzkHn7hBGF4ud3yq35zG47D/tPc=
X-Gm-Gg: AeBDievioOC0Y6hgT47Du0T9J2DRcYP0zc0Ri50lUROvvWxhcXIBkjNEcrpS+GxgGCl
	KHB8lqNBSmehdyzxwq2BDj2o/4C2KyG5CyuapGKyQ2HfPvU0ObR2qUFZoUXpLz30DyGYEOj9Y02
	LK8/zOrUzxEe2iGNRDplwx0nLoLpvaNMjjFRHIVeOccjDMCyY20eZu+5VdCQM1/G4QdjC2jEjqR
	6lKN66CCmiQhndEXQ+lDQyEOnm3xy1PfmmEdtaMu3O4gv5cuH5kQtifTmELuwR0LdcL0PrjFnz9
	na1ajqChL7Ody4B+b59hp8DcZlxLVt3ipebgE2YmiQoYt3K1W9SzuFJqqyvse6gCB4cDhlcSXZC
	+R/EOiLm2c6h4eEet9fPj/D2NLgfz2m6ZtSvxqTrsNF+zNeIzHG/i+iJKRCRr/RYYR5b2gFjLnD
	IwMKJh3q3MyMArdKs4+xDSkubum/Ih+gOBr8yzAxg67Mp3x3kFmP1KoAp11sIW/zC/9a9sS5NrP
	r9/sWDCfdRavDOo99MVpNSYEUSVTGS0fynQBw==
X-Received: by 2002:a05:6102:3e23:b0:62b:148e:9d0e with SMTP id ada2fe7eead31-62d8548e09dmr1793507137.9.1777769886306;
        Sat, 02 May 2026 17:58:06 -0700 (PDT)
Received: from localhost.localdomain ([95.214.114.12])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0b49973sm3425515241.11.2026.05.02.17.58.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 02 May 2026 17:58:05 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH v2] staging: rtl8723bs: fix block comment alignment in hal_pwr_seq.c
Date: Sat,  2 May 2026 19:58:02 -0500
Message-ID: <20260503005802.69046-1-francisco@maestretorreblanca.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the multi-line block comment at the top of the file to follow
the kernel coding style: each continuation line should start with
' * ' and the closing '*/' should be on its own line without a
preceding blank line.

This fixes the following checkpatch.pl warning:
  WARNING: Block comments should align the * on each line

Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
---
v2: Resend as individual patch, not part of an unrelated series.
 drivers/staging/rtl8723bs/hal/hal_pwr_seq.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c b/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c
index 2438931ca51b..0b60eba128af 100644
--- a/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c
+++ b/drivers/staging/rtl8723bs/hal/hal_pwr_seq.c
@@ -6,16 +6,14 @@
  ******************************************************************************/
 
 /*
-*
-This file includes all kinds of Power Action event for RTL8723B
-and corresponding hardware configurations which are released from HW SD.
-
-Major Change History:
-	When       Who               What
-	---------- ---------------   -------------------------------
-	2011-08-08 Roger            Create.
-
-*/
+ * This file includes all kinds of Power Action event for RTL8723B
+ * and corresponding hardware configurations which are released from HW SD.
+ *
+ * Major Change History:
+ *	When       Who               What
+ *	---------- ---------------   -------------------------------
+ *	2011-08-08 Roger            Create.
+ */
 
 #include "hal_pwr_seq.h"
 
-- 
2.50.1 (Apple Git-155)

