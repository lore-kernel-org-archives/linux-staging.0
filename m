Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5535C681
	for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789947059; cv=none; b=HKXqRHeffXcEglM33+0ut6L3zlTpmPH7cvYiyuuWkkHd5+lrOV+i82yMj4++H7vsj6zFMzRoAocbeQEvJtOcORAy7WrAsSaqKoddXTLrplhbrBmpPL8lizfs9At3gnWHrwZjDvlKXQCFizCq3RhmS9GOP9vNqicrOqyVny9CNyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789947059; c=relaxed/simple;
	bh=xBzLiSFRPpFi5eHJMQaf6El5mCA549/jBeqi9i5UcNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ikBcR87erlC6vE0Rmh6YfE/qaHLcFi2dm+rfUJ//DYnvZb8YTiGOdvRZGmJ5ee1Ky2DMf1ewUij4pQXdxSJrFdnjIAdCI20Jx/yAqCPKrRiTCkS+RaWSump6zJOuKVQIH5oQFA2SD5wAo99VX4irCD5Ruzub6oNDhgqqtA2i1lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EebUTQ1I; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EebUTQ1I"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-39f1e0b1f21so1474104a91.0
        for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 16:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789947057; x=1790551857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLwwU/CkXnVieEg0yRQ/e+nX60mFqF83EKoVKIz0PxA=;
        b=EebUTQ1Ir8UQ/fHaALGNR5G5FOFJH8RIGJfGtjw3sb+a7D6CMwFQUJCwxJAJZhLa7A
         9KHoqRrszNmHeYe5B9fPAqD1BsXCRrMxdxgI2zrWzktQ63djFrehEQmGA+mGUh8lwHei
         GhstLlvISfHPkdyZMjW1soVfDdNieZ3IBqipsgNrQ4g3MZ9IgNdlvkSd6V79cMjfnQs0
         YLQWlPLRVtwvlCQ+qWaVZEwhL/03rc5a6qcU+9LY1LBazw4GLMl5zd4dy8+AKeRjgDqo
         SHHDx2MFuOvYTNXF/I3/Z/GzPpU0CZPOC6MW0g6ElSdsV+XCbgGwUfKl/2F50mzLZy5R
         A3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789947057; x=1790551857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLwwU/CkXnVieEg0yRQ/e+nX60mFqF83EKoVKIz0PxA=;
        b=M9D6xRZAoByVUKunXPabqEU4svXS35J9v4Jf1G82epjg8WTB6lueMNhXhFkX2OQPKF
         c3OLkpLV+CXls3mjW/NAQkDQU9DBviCRiQ/87okEaUac9oUr53S1RiGWXrKtqT+8S5X+
         jf4IPWOIph7fF6lyVxvfI6NA+rfL04YMTguXCyLXf1pdb0Pos/0qaCdg/gpSsQ4Z4U/2
         zIWtJNfyxneAlKU2AshP9TriiWLvojCDyIxnm71cUJIkCyDH/TQo4y00yr+UvOD5YVaN
         XFdUl/lHsi9ZjmvNl2vhYx/9nCxdI53EyKJazrcBnh09kom5wZoZhhK9aCfeJ8lIJ5Ge
         Dw8g==
X-Gm-Message-State: AFuF++kiZ5buE5x1GSvaLd1qV5J0QpfqScPsQHCEfcB/+M69MYMFWRy0
	533RyvgNoiRrAIO5PVfncpbI8fvrA/4BVG7Urxa/3PGTAB8oTm7gN3bY1JLjwNX0yaU7Ig==
X-Gm-Gg: AYBFou0dZ/aPhh6a2paYfPl4TPcVl7PuGosdLAcpI3EVsXdOamSLCLlOd+QuPPdFnDK
	qSnvsD6u8pJK0bEimz84PEH+LLhnYhV6uvqgN4NLTPHS/G+EknvgorAbOsT3+zEqtcZAtq3FM4b
	pjoCtSYJ/OcF1GSVYXzis6Ox4a2iRNgy2lXgxYv8nD7r443jvyZMdSozgZtyKYkQQetm8mTXbgE
	i+EQ3hvVi5j7mHWF1+lrrr0A0N8aW8KKVnz+okCNMm5DfewUhOZln30T1Xm4tKIyD021daU5VJo
	2QUA7QJ+l4pTNfn2hkuw5dQRhpTJIXAB8/G3JW39Q9mRFHKmMib1cnC2rje4nq773JfcIzTue0B
	JPASEuqdkgSAfu8Fpta4+ucM8mK8iKx0MTKBMGPRa1+DsyEriRFoLk2oogy9zmoH3ZCYkwiOJnL
	gvo3iwH56cPit5OycPAotxctOtnGEj4JHkxlQzfHuW1Hg02b6SYxRIM86i3d0nVgz+XXAR9SYut
	7OVH6xI7KBKnSwhPKFKLiiqkZnjGg==
X-Received: by 2002:a05:6a21:329c:b0:3dd:a197:ede6 with SMTP id adf61e73a8af0-3dda198133emr7558120637.53.1789947056707;
        Sun, 20 Sep 2026 16:30:56 -0700 (PDT)
Received: from omarchy (ip70-189-221-239.lv.lv.cox.net. [70.189.221.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33188f76sm13398672eec.21.2026.09.20.16.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 16:30:56 -0700 (PDT)
From: Callan McClish <mcclishcallan@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Callan McClish <mcclishcallan@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary NULL check before kfree
Date: Sun, 20 Sep 2026 16:30:40 -0700
Message-ID: <20260920233053.2311209-1-mcclishcallan@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kfree(NULL) is a safe operation and an explicit NULL check is redundant,
therefore it should be omitted.
Detected by checkpatch.

Signed-off-by: Callan McClish <mcclishcallan@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 81d9e713fc12..6aaa07813d46 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1748,10 +1748,9 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 		pxmitframe->pkt = NULL;
 	}
 
-	if (pxmitframe->alloc_addr) {
-		kfree(pxmitframe->alloc_addr);
+	kfree(pxmitframe->alloc_addr);
+	if (pxmitframe->alloc_addr)
 		goto check_pkt_complete;
-	}
 
 	if (pxmitframe->ext_tag == 0)
 		queue = &pxmitpriv->free_xmit_queue;
-- 
2.55.0

