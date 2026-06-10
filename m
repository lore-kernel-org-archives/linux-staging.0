Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1236D2D877A
	for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 16:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110151; cv=none; b=sBXyPXnX8WnCiGPGUhwBQrqpnFzy50NMCGtoW+Xg5l53DdWf6d0s/ezCqBHukPfKdtMYSwW4j4eMiURZqPe6CJKuyN2NrHv4zbalcNjNjCMCAf1uj247SKzWps2Wn9zMGDPWOfDi5VNZrAi99f1iMkdqJznONXaIocwBsZudgl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110151; c=relaxed/simple;
	bh=0BdLQkxHN4COZJDGg/Dp5Lo2uSOTcX5WYl+MpUrQY60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XXwoVe5k4LwhBiPY6iB+ewK3fIyQp5vFJmJ5+X1Tm9X8dPV5QDhAtvbHp5tvyjL9hZDDZC1o1BmnpOzcX1MC67ioK9GYH3RjRwEyW4wk6kbDO9LfNOmbFN569LAiiNlpIm4POGXAfIRvB3LCKDHMnnb7brqiXXs24pk1wpXX/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9Dtx+jK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9Dtx+jK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b3637b90so60628195e9.3
        for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 09:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110148; x=1781714948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xmZOajtGMWq85o0vR7aIeRgh0GUAaSMaYR5OIw0N/tE=;
        b=h9Dtx+jKssOf3bsMmg50la2JW22M48BzW2/jP7n25Q8z4EcleZJUUQLuddMWKngywk
         T7gwgbmg3a/EJ0Vu40lq2AG31LNYQu4TsAlanlM2QIHZcPHXQWQTABMgxWoEYDKTJmS4
         DmS+5UFS6madTyTfrgqbHhdrPuHA7ikHJfNJFgUZPR847703MBS1CwZZTQfj3G0xy5yw
         O2SKvS9sGEANuUxiF10eCOcklSLB89JfDosyo2zPOr55i+iDT2koKrsRCrWXwG2ioTLg
         CS4NikbYE7X3yZkSKS7llkaRWr9iKBXWdi6EP07kOXcTcQJDUTG0Rhcjly0ZLHvDDwio
         hm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110148; x=1781714948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmZOajtGMWq85o0vR7aIeRgh0GUAaSMaYR5OIw0N/tE=;
        b=MHqgqoD+V347gIH9lBJ8d53qmW+YSHhBRE5OgnhSC4/iExSaI744ZSPatM0j8GXL1d
         3H8zjHWv1gD1FafwRv69M+pLDgmG1AlxmoMw8zVtCwsU56YnJD2RcdQ0a+aHGf0IIYK2
         /v3GaoTpPQmP1FyIAAd9iaXSag7+bwtgZUFa4vFqHxpNX49tY6BR6QLpnQwyCFE4hbwU
         nfWX+9381q9HtWlRJ6RygMCSH5zYth+8YFxRJQdz375UBu68ASxN9TcP+n+EA77spaqv
         shhA4OI/MXeD1Sp3hQA1bVG8nyqDCAlK5MmXDBbPWPKMQ19dUPppCPy7BqKh/TovoJxi
         6QEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/f+ouXvs898QbkWzCGNqrjLN2ComrHzw3ykSBwi3usEptF6nSrtoL/BqCWcAjph5Ntc/RNEORUuz5tAv3S@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4he12CxwOIO6Wa46daePtrrP1sNp1+ZkR24to57XRmBds/roO
	PEEUBDfHz7EGjxNLpgIfHpVGdI+FqXPRiYy9nfX+Rr35WmcVXRAohOk+
X-Gm-Gg: Acq92OEZNi6Vor8LQJBcWtP7aWXJH9G6eA+duZL2XSBKLW/xNaDfRDpzt0+6srdhhwZ
	5tTR0zxQuWAso0OUSbKGUMHMFxiZK6nZYPLH7uABPmzHLHXses5ElQO3BAVG7GazXAbSZ9BlTI+
	iQ/eN8Q3kiZJeagjLB5HCe26B2XZOHrj9Ifhz8HWtzaejWWLmuUkw5dmxZmhnAf5Yx0h47aq+2V
	y29W07rPJ/JLlk7U0eMe+jINvRmL4jtxsLYzRXZ4gXcjYfkyVkrIh9tA47x5wRVi8Bio7M20Auq
	yaYAyHuQoAR+/gOlvFqoevCoteKVc6S9CT80XoG4iikBNSrn+Uqjs6S54qr4uezQyeMLOoPq3+H
	hrrmvGTFHxeTn+BM6n3UDMz8y3Wu+J997p0WcdabLDwlVyYEw0k2bgKD5fyHGj+R7vbwd+XtIAQ
	doZi5zT+uSC2qQK4WQsoRx2Vfv+yVJg7gC
X-Received: by 2002:a05:600d:849c:10b0:490:b58a:e6ff with SMTP id 5b1f17b1804b1-490c26e1aeemr285070985e9.22.1781110148220;
        Wed, 10 Jun 2026 09:49:08 -0700 (PDT)
Received: from omarchy ([212.58.120.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e28416desm1761735e9.1.2026.06.10.09.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:49:07 -0700 (PDT)
From: Nikoloz Bakuradze <nbakuradze28@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Kees Cook <kees@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Nikoloz Bakuradze <nbakuradze28@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: core: avoid NULL pointer dereference in c2h_wk_callback
Date: Wed, 10 Jun 2026 20:47:54 +0400
Message-ID: <20260610164755.49626-1-nbakuradze28@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmalloc(16, GFP_ATOMIC) in c2h_wk_callback() could in theory return2
NULL, which would then be dereferenced in rtw_hal_c2h_valid().

A 16-byte allocation effectively cannot fail in practice, but add an
else continue; to the guard so the failure path exits the iteration
cleanly to make the code more robust.

Signed-off-by: Nikoloz Bakuradze <nbakuradze28@gmail.com>
---
Changes in v2:
- Dropped Fixes:/Cc:stable per Andy's review (kmalloc(16) effectively
  cannot fail in practice).
- Switched to Andy's else continue; form inside the existing
  if (c2h_evt) block.

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed369..8d06b9d0e9bbc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1708,6 +1708,8 @@ static void c2h_wk_callback(struct work_struct *work)
 					kfree(c2h_evt);
 					continue;
 				}
+			} else {
+				continue;
 			}
 		}
 
-- 
2.54.0

