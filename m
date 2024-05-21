Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0321422C7
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716302206; cv=none; b=KXSxqoEuxeoBYsVvr+YSmMjsxZWChwNARaJ0IBURwM1Tl7ucUnL9C4TqDfNjTkINfnJfM5W/GBOALcYvpNRUuC/1nmQ1/GefAoeImxNyB1q2nYiCj4hexrJkymtKxFaa1QvX3WbmeQyX/vQoLmE65q4i+c//qBNuFMy9Q21NzMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716302206; c=relaxed/simple;
	bh=RkxcTAGiypwdS8ks2MdXm+0G5zezjLyPmKlm8b5l57o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oEkpYbSWAyktK6ILm4ExXceZNqmqhHCJZxaA1MkbShODj1SLViy8IpYAD1DVOe/ps1L2rmBcrzYW3qeWtn9ug3NfACrwiPxgkFBeYBcQ42von53RGDRlTOkkDl+T9jlxQBpgfQUOLF8cVTl2dfQYb3NBGCb0M5l/ZJWO8gfKPVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duyIdaAV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duyIdaAV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6f45f1179c3so400431b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716302204; x=1716907004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BynBJz4xedvnT0nDFPYWUwNi7+Io9mNGTAt+X4QFG34=;
        b=duyIdaAVbL0BCSAK8k89Ssz0/Ukjbl4BnGH7ozZi1nRQd/O0R6x/iL9By3KvMHj1PV
         j556zf+NpFTGqYTbr03+SUVGYVUapx2WGle1s9DKdx5D9FvUsZZeQtOzrl75FAzEc/8T
         yqcR/aTOzdB8tb1tUjwinIfMRxbG1Ubbf73QZS2zGo8K2I5ycy9zxoWH/2K3EaRilhe/
         8PlBd0PaSgAOidMtYtEUPIF3F0FkJShSzPIKqTzfvaFzdNLBup+6YiNe1hDDyODyYNGr
         /WZywSt/Earhpg4VVduruCxxeox2fYxM9En6hJ5ghpuKei87YUxX9KmBwxMzZLtzcjPG
         Ct2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716302204; x=1716907004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BynBJz4xedvnT0nDFPYWUwNi7+Io9mNGTAt+X4QFG34=;
        b=X29cuId8ARveIjz9HVRm8DxcCAKOm49vXiPpEBfqg7YI9niLqY5/cKNrEdVikC596t
         QJNRuO5iTDWQm6NB0vwfob61JiZZO7QGFZ63mtSLuPQeRiCEz3B0xYhfpgLSYooJTEwD
         U04LF1PmJ+syZFnMQqVnLxnf+E9lZ/qKpXLRVDJv1L+qXxcsigOwfc11rO0MpX9Src9T
         7dra2jKrfWz+/6X1Ic6nrlpO8odcZ7NiDjvwgZngPKsU0SefDu0ZIeqm7saZs7yyqj3B
         3WXJFD82uAHUKxUzpjuWObIruuV/bueaSR6V5TN1a5NJX9/1pSy6WtwPxQzgIxXnY8zk
         vDXA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ei1UwQNdIqF53BUiFkUVdUBDBgJ/FVjNtYgOl7HvsjucduO7cm+BAgUIwupXVQBboU7ESMyb9+dW2Z7rb9DSPgAmjMPiuSDeJGUBKw==
X-Gm-Message-State: AOJu0Yzy9HokZyjEKhrK3Q6Mc1jKlfeOMoLRxJe6f0pAlLsI6C8eN/Eu
	auGfBmdskbSSp4+DJZZvrAfFvXqLILp8K1vcYIrWN6fOiEO/oyDE
X-Google-Smtp-Source: AGHT+IEhHkXc3gEQ/59qxMkeqDVXPHb5xH5G9ULXkpNkxZMVvu+VESyyg5CeRR2jEObc9IE9uXY2jA==
X-Received: by 2002:a05:6a21:2782:b0:1af:b80e:5406 with SMTP id adf61e73a8af0-1afde0d4d1amr27260112637.21.1716302203457;
        Tue, 21 May 2024 07:36:43 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340a632823sm20886815a12.19.2024.05.21.07.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:36:42 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	rcengland@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: Fix spelling mistake in rtl8712_xmit.c
Date: Tue, 21 May 2024 20:21:17 +0545
Message-Id: <20240521143617.53139-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled aggregation in rtl8712_xmit.c. This patch
corrects the spelling to increase code readability and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index d7d678b04ca8..12f2fdb1b3cb 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -247,7 +247,7 @@ void r8712_construct_txaggr_cmd_desc(struct xmit_buf *pxmitbuf)
 {
 	struct tx_desc *ptx_desc = (struct tx_desc *)pxmitbuf->pbuf;
 
-	/* Fill up TxCmd Descriptor according as USB FW Tx Aaggregation info.*/
+	/* Fill up TxCmd Descriptor according as USB FW Tx Aggregation info.*/
 	/* dw0 */
 	ptx_desc->txdw0 = cpu_to_le32(CMD_HDR_SZ & 0xffff);
 	ptx_desc->txdw0 |=
-- 
2.34.1

