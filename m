Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C2841A795
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467077; cv=none; b=p5BDAVAVUfziFnNl+eXEHAwPvkX67tWZmtj+Mz5vs8h2+7QzhmxGFHEOs64KiejbYPIo4T9Dy1nSjbBtumoIlAM2Gkz8lfdspYOFLyXUW4w/89eyD5SlqJ+4UclSde/tSs4SsUoUZmGcqQJyrYwPKz8mmuSA0PeWU/Q5sDX36Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467077; c=relaxed/simple;
	bh=CWjz01IGEO4DhBFkusR7Nz1l/h2qMp9orMij3MJtNgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BhbbjFt9AFGeq9eo4n/oSed8zB0SZqATxP9sjqkPdHWElsz/wOWAZkT4QCylf16TPRBET56C3p35fOi4necJIM6Xh+N1uqwQFPfBHV463QQ7GKXDKLbVbRiqv2/dVal+1hiAIp1JpNfnT3H2VWVhN2HOLyvfqxXh9oISYWZWeCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rpHNdO+a; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpHNdO+a"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so2225120a12.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467075; x=1790071875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sq/lagHSdcuwlRE6xG/AIJTxTk05xbO2fOWH3pVtZM8=;
        b=rpHNdO+aPlvlGx5oeMdZDgr0ED7l8/isHkyPoV0ID7bracmIzE+ggt6YRGMBHzi4JX
         bn94x9UPmGL4PwevzVs1aLk1aJHS4d+X1L/QRTy93TuaJys4HDU6nB3LlRHVct8qf6A/
         H43e7+EZncfGQcTrrH0ueOKn3x7C3xYeBpZVdpb8CpQ61Z37YD9dJkti6JgRs4jdIiIw
         WR+P+sxQgVCAP/gcJoTX+w8mvvSL6ptPFe/xSSRWMxZW14kcrA86u1f1hyHDyL/HWKFq
         NW8tMZmD9Mk3Q/XU2kOmghysRJg1xOn7jEaHZb7YssYvrIKneN3JPv88BRfOFxXB7uTS
         I/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467075; x=1790071875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq/lagHSdcuwlRE6xG/AIJTxTk05xbO2fOWH3pVtZM8=;
        b=M5qSuyeEXElYA/H4aw5yqrT347H3iK6MOY32uKRauWlRoKSzk7AydtYannVxcUoWnZ
         pyVjAViwS5PiiuYgIWwsx6X2PMsPBo5df+4Kg5GGpR5fezJ5hnfr7oGiH8hDXeEm3JyN
         sjW5ytnj8+7TFepq95xevdpYUhF9IFJZpOTUC+sE1g6iGdAHAFRnGc93HhsKUChDyC1T
         voY2y21qWJdFzORnOK7pMLHDgbLink4TqnNuA4Ee31yNgf0ARGXx/xFVyYW9a7xv86nH
         Pb1pxLt4pfv040hJ1EmLWA1A6jznulA9QN6DXtPQuLCA0uT2DKwi++OLB2Q0+P/w13zB
         OBgg==
X-Gm-Message-State: AFuF++lP0cWDFCXDzytyzS33Qf3rpS5k5scbN/C0SzZj4KnWRf9bC4RZ
	/+nWakc2cTuDp4u6Sb9xf5xUY4O3CCNSaP2UmO9Ezw/T5/eDmXoFp8D4uAAHTA==
X-Gm-Gg: AYBFou2Ckid0zfMj+V8cfHOe4x+Xq0i+o2nDUmOkWJMO+5w2dK58Ffqzx5Xsp0GmTdS
	tJTEgy1fUvbrt7D36nFMX5zj3yQtVv3N1614EFHe7vnWKFxYV30yVW5kRB38wzYRsdgu9rDXp5o
	cvLq68M2KvF0ZjIDZt9YW1cOj9MoaY5/oa9yCYcIjc9MhTRefvOsRYPgrdtmGDxkR9h3eTWydYS
	zZ2iJ4L67wTHphjEfwq05Y6RwG+6Rz6oenGuJpEsOXN6JpYIcCmCBUaCLsA/ljP9pO2JXNP9yqW
	WtR05eS274hDtrdvWpf8FL9k2o1tJBnGBc/LfbMJvyNxjRRqiH+oJSuW1QPYUyKLqiI2M0Y6eSk
	9Jnumz3ru86bvKOiUNfuCVNsF/BcEmp/NvUjUrpdNv6Ht4FlZuFMZIzUX8+BNnWDY4fq9OyrPpu
	fWiJoOY6p2I6MsqKjNW3BN7RAmX/9RPqvIWPYQNZQNSatF6MLK0ebgrzh372kpjH+U5tTPdKlFS
	WW6DXN2+9oWVETZQqtmHvvYjM5kjXRNX2NYRlv/bjfuI883977zqpLBKdCiuPr2om92Zapkv6zU
	/cq6KoVHI64lxgLt0r0gEWSo0xue92QhDZlKL221EtruolI=
X-Received: by 2002:a17:90b:3b85:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39debdd9c94mr13483292a91.0.1789467074668;
        Tue, 15 Sep 2026 03:11:14 -0700 (PDT)
Received: from my-oracle-VirtualBox ([106.192.128.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f06423sm38610336eec.20.2026.09.15.03.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:11:13 -0700 (PDT)
From: Manish Shah <mshah3409@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	Manish Shah <mshah3409@gmail.com>
Subject: [PATCH] staging: fbtft: remove prohibited spaces before closing parentheses
Date: Tue, 15 Sep 2026 15:40:56 +0530
Message-ID: <20260915101056.66210-1-mshah3409@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove space before closing parentheses in define_fbtft_write_reg
macro invocations to fix checkpatch errors.

Signed-off-by: Manish Shah <mshah3409@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..409770891c54 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.53.0

