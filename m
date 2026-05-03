Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514171EFFA1
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 00:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777768918; cv=none; b=X/ehgqBDwF+8hX60kYTiUJ92UQIV849jqWNn90940R8KL68x030j2JIseEqZwgBnqpdavDFbqtx2m/Ri/3Auu/HE+NzxerMK+aermmSx+25gkYmPJFrFlqWa4Dn1oAy8vdh/cUgC1VMuohqp8E7Akf+fGssC0/PJQHQ7IoJSafs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777768918; c=relaxed/simple;
	bh=WB3lzlErDkBJ9xEtQJqPpE6XHiLn7Kp9ViRAVVT+cXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XiojFJRhvcRaF2uM/XpXo2HOXJTqHwSB7wh0wF5rDJ+KALV1+ZZ9PJpPZWh4uqWl7b6UNfpnGydBBsXvB2VfQa87g8QNeMyspaWGnM4WTYpM9rYFbkIhpX4s5QCNDGQyZPfkyiZRKZwl742yQoBHKNdbElXyTc7EzLT1ZXHt4RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=I/mhVJWx; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="I/mhVJWx"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56f6afbd205so1570439e0c.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 17:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1777768916; x=1778373716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9IaLFpZyhk+IxeOLET4Cgsc2RWloxrUQgsSuokmv1s=;
        b=I/mhVJWxAa+boVAEq4L0O8uq478YiROW7stPnbL2QvOrZszQKNqif2bOtSK0tA14hM
         WWbW8K6EqeRF7WJ79S4CKUnJj5pcVTdRjdromGPPYIHVz4TCzcRueTdiFysNUERLkWqB
         VBXc9Q+3MLp0VG8Ny63GVyHnHUReEEDRcrrufOn06Flv7cfKPhzhTVA9mP6Qv0oV3WPD
         B+ApYL9L6pb1Ufr3PNmVtY7DBL4KVQ7Hc3TlQ/Oma4IAoj0rPjqipxO0PuUWD1c3NHX6
         pGm7rWAPGJSUyGta/4pQ52KSTt4igsya4wasGXeLHS1xcLpcZ5tGoAcdA5cQzilO9a5x
         gpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777768916; x=1778373716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9IaLFpZyhk+IxeOLET4Cgsc2RWloxrUQgsSuokmv1s=;
        b=Y5eCVBJQ0yZVVxYS7I+wZO2dKX9b4kyxhyuaQLQP1Tj7rZc+WrBd4+3IjGv1VSYYZ4
         AgC40tL0xHXw71w2E9qB7eCVm+Ws6or6hX8HYO2obmCi/eFOl5GbE9uvgseZSoPD4Zq/
         g2EjCNec2YA+5GzbBNdOs5sTX5SJrPp+npAaPPC90SeruuTSau+2CR8h6nES2RINxme3
         uh7Zyc8nJR7pXKnIuIoLVZtr6k7PPxESb05qgFZ+vK5BnRVd5pvIrclcik41ulnteqjL
         ELh1qLwkUl5VenRBM7j9FSaiiGiKhkeTCdUrSZ7zTGCVytXue0upcQSbQLKzWLj7yf80
         tRQQ==
X-Gm-Message-State: AOJu0YxnCHAg3ZziUubY/IIrUPAZp0xThyWYp6EEI/2IkD8jguzIqZ8x
	P+t4pM5o9WdzRYjUbsBwDSAadLkXawFTBaHYr+3qO5PlexsPSlK2HtEf+0IB9dLj0Xw=
X-Gm-Gg: AeBDievk+KDdbljINv8q78sWpR8VA/cvNb0EiNN+nmQ7EcJyGde9GiOaOOEbWV8JXu/
	5EEzfbYost1vdeQqSXLpc4aaN6jjQrDixF7xJqQ3lfP0onsG4GU8qkLajQFDIC7om4yQl4KQjA8
	asZxRyDtPJTBIu1lYi3EAZYsW5pPY4enrveuH7pVrVEy/SaEPhXugoQQ2MlWxkvrpkL6V0DQeE/
	Qr6/26Fj0GR60fQgu+Jp5/TMoz2Ga6xIqvqk4c288tLTUbMcCveM1fQBMgl6Ip1un4BC/2Ph/om
	AQgS6eCrzsTiYAobpxFcv4BJ2L9zfiPJWCeEvIC/kCSO69DAwm0eKbKK3AE6BuEEZreAghoBLZO
	pFJlyyY+6VWNXnfEJK8GYRDy6b3cBiGfSwk8LU2/Cgnxe7WYaqkIkAqsWU86WNvsEVldtOcb5MY
	ZOAGQ6ZJsKZN++H7i8n/W2oVm+9Z4O1VUkKOyLx21capkOtcLERIDPdOJHrLJ1/hNNH9Aue5Pmv
	PTMXdVG8pRyxl2j83strkZdNFJiq580fRmkqg==
X-Received: by 2002:a05:6122:d86:b0:56d:3451:4cc0 with SMTP id 71dfb90a1353d-5750c279e1emr1685868e0c.7.1777768916170;
        Sat, 02 May 2026 17:41:56 -0700 (PDT)
Received: from localhost.localdomain ([95.214.114.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef15e0sm3815758e0c.17.2026.05.02.17.41.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 02 May 2026 17:41:55 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH 3/3] staging: rtl8723bs: fix block comment alignment in hal_pwr_seq.c
Date: Sat,  2 May 2026 19:41:52 -0500
Message-ID: <20260503004152.66767-1-francisco@maestretorreblanca.com>
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

