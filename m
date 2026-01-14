Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403A434F46C
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384199; cv=none; b=A+hZbRp/6TdcPvikguAfs5G5Ks/rVF0Bjvr6zP/EIuQgwaCJoQK4raoUNmLzho/RluOe7nFfgAWZK+N05srCjoO6NRkXQKUesNCSEsbk6aU3O5ppmfKipjvFiZrlEpAMz4TAeR13QCE9LoZ5sZldqB4k9jkm0Vo83Pu0YKTKmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384199; c=relaxed/simple;
	bh=4b43Fc8NB+77nXnam4S1w3oE23X4wpwyRwO3UfTOWfw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PujnAuX2TdK/w98/PjvUreBS05D0nn7/BHsn1rIr3jzhPMDEXpZW2pObLznbm7t+ALVP3yEiecAVnZYiAZpX29ZELfij8bCY8DsbYkDKbtQqbQ7KpDar7d7Fbp+4dQLn4IX6zmeLJ6A2dhY8xswPUDodqGy3DYf8ww1SpC9EDrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExZAaDdD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExZAaDdD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81f416c0473so3093302b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 01:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768384197; x=1768988997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQHr3s/60VkZDDmZFTKfvgtF4EJU+U9sf2P8D98RcRw=;
        b=ExZAaDdDxuDN78HADhjK7g2V9jmtLtzI+ggz5LjXMnmXFAi1Y1xGJ7e5HohZgEqEAi
         b2z3Asb69lB8HxNe5shYnnUz1+61V/eOw9Q0RmKWWTO7UH9X038NxGLPiCyQtZpdghbQ
         1j1ipDrx4Naj6+P+5lFFZv5p7ZwpzPjWSU2HHnRlVqniqsfh+vr7YiOA2L8sWcnmkcBB
         BVGrYBXrTCpTuBkdtTBKZR7hvA5/0ZnRbm9p4mGvZVlsXfaj+xrBlgjZVn66tAIJwpws
         9o68J+XeJ8HMVotXrkBDxHq0yz1irktIvw8daSwsy+0ElaCL188ECiw6BpoAOsFfSNH9
         iriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384197; x=1768988997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQHr3s/60VkZDDmZFTKfvgtF4EJU+U9sf2P8D98RcRw=;
        b=PpPoXiCfTF5ZmqKDKGaFcdqUTxf8lD47S13utaHRaU49pV8XmTLNyLiajsLq1dmcAc
         sKqYbcSaQ+xSY09oWwlhLpLQ2EwJ0VPiGOb+jbkbebnR2XpBbkJRxtdu13uiyExQaMqL
         nb8ADy+2N8yu0eMvlPuWWHsMMkw2jR70vo6PebyH2zZ+b78K9qVTY4zx578xLIDIHUDW
         OodPeGqEaoYAcd6Qd4foSy4MlYfdIQMr7hx1S3FksdoMbIMIdgm+TOiBO/LfQRcOfG2K
         sUovNelfFxD+FmCHmGRJxcj1UnxIVz7y0qSYzQwjBNVX1+E7JhRful3nAWehGhP1rpqj
         0NYg==
X-Gm-Message-State: AOJu0Yy/uFz6AfgYknuh+jgW38TIx1rRvZ4NPrG9n7Z4yXclJKdMQMtN
	cEwh7vUsQWVe5g17Ot5jHeduCvlYZW1DMA2lEcdg8zHPyUAY6JZuO9P3
X-Gm-Gg: AY/fxX5NtJNqKfJUaduWOZTAJtxnpN440gwJW04YZf69eRxi52EFwOk9ivDfvrkDcX3
	BohUkG5t9WvhwO13Nvzqhmhip0Vx3RtL4OeA28EElsplWFppG5D5Tj/Cbep9mpefmz+9i1csI4P
	vVBLqYfJDsgm/YHH/MY3ntFglA5DKjZMfdo1PeSMeN7rXiVzesZe+gwqPcOCiw+Sn+2wenj3DcK
	JfymDZhXLqEs07rMaNANHYZuZEar79006LfBkDSxTqLvNvedFhleNChz+CG0pxLtuguxQdJ7KgE
	dPp4qDZc4DUFwrxEiGwccq/FL/ZEXiWuYT9yi/v8thHF5DpzdhX9/4f69OtQAuSVfjRuMVkvbWK
	96jeb9Nmn4t3wKktkvplu7XB46T6KEiDk6QVF8vFUVg4sDbEi98exDQyEGkCNnpZPehkTC8jPNv
	lU4xJd5ZPEQyUVZ4SZOCXdFxPi8h2vnaPgR+ZaBlFa
X-Received: by 2002:a05:6a00:801a:b0:81f:4208:2758 with SMTP id d2e1a72fcca58-81f81f9d635mr1675564b3a.33.1768384197482;
        Wed, 14 Jan 2026 01:49:57 -0800 (PST)
Received: from debian.ari ([152.58.176.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f43dfd462sm10201075b3a.27.2026.01.14.01.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:49:57 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ArchitAnant <architanant5@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: fix multiple coding style issues
Date: Wed, 14 Jan 2026 15:19:46 +0530
Message-Id: <20260114094949.14825-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ArchitAnant <architanant5@gmail.com>

This patch series fixes several coding style issues in rtw_cmd.c
identified by checkpatch.pl.

Changes include:
- Adding missing spaces around operators.
- Removing unnecessary blank lines.
- Fixing alignment to match open parenthesis.

ArchitAnant (3):
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: remove unnecessary blank lines
  staging: rtl8723bs: fix alignment to match open parenthesis

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 56 +++++++++++-------------
 1 file changed, 26 insertions(+), 30 deletions(-)

-- 
2.39.5

