Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2D2442B2E
	for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243203; cv=none; b=RJWCaUQkAp/liciE/u7Ig8Y8DEW1baITZhR40NZc9QpncpER3V3K4Qv8HGDBnpK01vsLjFv0CnoU22GMOYy9OoFKLO+nFV/OSBF46jPUREOfOIyUsHj9P1Y1SOlg70dYIt/l7HZEISEc9Md4+O2XQn4O0G+zp++yhH/Lfzbv9LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243203; c=relaxed/simple;
	bh=w2UNwByDqxajgodIRJvWK1xHMSTglvfbTlyR0XEO6WM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kl65JH3tdUVga9s9IOHoDxjXtBbbpqU/Tv69tVPL1K8NAxFIsqYzjE2KhuK51APpult35Yrl0Qmr+cRD7p4OZXl+m8Gj27v0sxYDVzr4vJbMIHaU4sgFEkB8GWxnzXsHNnQyPWlHnBqRId6m/KN+Z9I/RgR3If3wXXFxL4OtxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKMl5SSJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKMl5SSJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc891373e0so946415ad.2
        for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 09:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787243202; x=1787848002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCo0FN/b32Haxtl0Z/7h5MxCz/K2NNpx7/lpltGLY70=;
        b=QKMl5SSJQmIr/7KTtV7UyNKjaWgsic0tzKT/j5/F/7rXNhPeO/NoIS1WS/e8e4WK9H
         A8ekOW8ibARh16V7fMQVVjlYHIsm1shDflAtilsWtoL+LgXN+j23ZH6pOiuIn6o6fCre
         9303mlAHbzKrnl88M59m6SKIBZmpj//iMox97+eE7gMPUnNmQWwCUsFtFZwUaCRvu0s3
         JJ7Aee6ED9O0+BVP7oh/lfY39zIak6atm1ZW9b/QH4F4d3AZnz+5DxEe5FdfYX1s42pL
         nKMj3dBJayZtyYa1s0K1zPpm/9cx6Z56CJaB16O95C91xP2Yk5i+hSpnoZGs4iOmFZ9W
         XbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243202; x=1787848002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCo0FN/b32Haxtl0Z/7h5MxCz/K2NNpx7/lpltGLY70=;
        b=ciUziS/z90v9rzAvRrr8IXw5G+QjqSEsmEqkWHpWlpq95lXNWL7zV6OR89wCUY2e46
         /S/QBqLU2aPjJjeeZcssPUjl9nhUlypAWBvvK8NaOCqWJibr2c3J/Aa6bR4LupAS9XjL
         citi8HZjWk6lqIKXOjou/1VcWpLcTn1r0fsPADDlV143m4kNPAZ8bdb0sISKgfbf34FT
         Szpg0ktrQcDCK/cP8MyZSf3jARo8WfViblankqCCD3JeMDDs45T8Gpnkuz8lkIdDZI6Q
         9dvuZiBLV3aowDZ6vJKCs1ELI8+ye1QbUO0cjbPZc+7rk9TPXYRXEtSATEmWu0UU/OQo
         L1Pw==
X-Gm-Message-State: AFuF++l4/SbK4tkL0fajBvbYrB9wNJnV17PjN+5DhD8C60fkJC5fcFAC
	rGe9JDkncNpaPpbpzwisyxWyYvLpcZzYqg1Z/UdIrHseGO0w9so0Hygy
X-Gm-Gg: AR+sD11phYsQJNqJrXfAmXyEe3ZHQhr8W9sqilB9GDjUx1sSrlUUMjjrBi7gtVDvY24
	5hO1GNwZ0slYCQWfKNWi7T7LrSTnV3FgSKlaFmbSh6062Zb1BKbq/myfpG/82j1lI1xiLCG7+Sh
	KJX5j43kmMnyQHozGIci4YtKxYCTI997PA+HBNpJ/WKwBl+VkPy8aDjc52W64M/GbbPk+i6G4kN
	ow6/kZg70Oa8g3xl3zu5iZIqCvrxL7b74GwTat4+69vOvNZfPbV76VAMUpXvOXESjsjpeIBBmc0
	YgKW57BwOkiifWiyYh5nUkyt+RUNjmu8+FNBnpXs8Ppbp7xP4tw/fNycOmwxnXf2YR9sT9Dv80/
	NXu7vNelkdKG2vWCHesHmBpwxoJsr2mkR6brnrkdFRWxrcuiZzd5/zT9SAxWBhU1kWWz4/cIo82
	Econu9d/zQlxW857g1iE87DvxxkoHBZhGgA4Ae3bX9CaoTegI4/StmfbgG/nJTI7bZRAMusVEpa
	i4GbLQ=
X-Received: by 2002:a17:902:ef43:b0:2c9:b8b7:5d27 with SMTP id d9443c01a7336-2d5fd5ff363mr271895055ad.1.1787243201598;
        Thu, 20 Aug 2026 09:26:41 -0700 (PDT)
Received: from localhost.localdomain ([210.97.54.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d555f2esm9330225ad.5.2026.08.20.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:26:41 -0700 (PDT)
From: "myeonghyeon.park" <myeonghyeon.park@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: reorder conditions to avoid else branch
Date: Fri, 21 Aug 2026 01:26:01 +0900
Message-ID: <20260820162601.74952-1-myeonghyeon.park@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning:

"WARNING: else is not generally useful after a break or return"

in core/rtw_recv.c.

Return early when the SN_EQUAL() condition is met and break when
SN_LESS() condition is false to eliminate the unnecessary else branch.

Signed-off-by: myeonghyeon.park <myeonghyeon.park@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7568fc514d7c..5776d0212ab8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1782,14 +1782,15 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 		pnextrframe = (union recv_frame *)plist;
 		pnextattrib = &pnextrframe->u.hdr.attrib;
 
-		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
-			plist = get_next(plist);
-		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
+		if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
 			/* Duplicate entry is found!! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
+
+		if (!SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
 			break;
+
+		plist = get_next(plist);
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
-- 
2.52.0

