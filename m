Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198037BE92
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998839; cv=none; b=Dg728YBjEcE3prSZIWc5EPvHoSl+E1m2Brt9cpOQPj5nhj7XPS59jdUqD/PMBnyNZwE6hKRv52ccBPLPICq87u5Oc/s1nYAropztdHY/6wjnoCQD4dYqJexqXkxqWgWdZkXos6sF06F5Wkk2lfyyB4xRbNhtcuGR8XD0eZ3uH14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998839; c=relaxed/simple;
	bh=QUwUL1mFpD9rizbPyyjS9idAlYL0kfRBv2ugXaIjMdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3XftgLi901dGNEJNwdtQ0FvJ2VY1wSYdKnw1uVVzUsKQRLVAMfxMG7P/u1Sqwxa/MHqCzLdI87iPrDO2FOqhm0tsqMJm0+3JjjiWOdrHZQUyHofRMqRHa2ytTySxu6zYf1meVyqOxtOR5J9W7pn2nJ2nkg2hGZ2CskSnT/mgqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9O5lQtr; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9O5lQtr"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso2273467a91.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775998838; x=1776603638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWiTQ3kIzQcCpnWhmreVQorYaFpYz2jftg7PoESVPVo=;
        b=L9O5lQtr59r6Rtkb/7vOr5o0TC2wcLpO+8BSlwiCJIBHoRf6o9DrumgB8r117GK4vA
         fGu4QAI+RmHGohAKQ+dt4vAC+cAs8R8iCAiW7sGB2cTulFURkDveXG+6u+39luQ8hslo
         Qf/UdYhIjhlVOgaKUO9Fk/BebHDwG3N+bqVC9uXIDlkArFXchi6mJ++wsww/XdPtdVHo
         pe9iAv0HK5Tn3ifnY5UAzK9rVXGK5BxDqYPrJgaRUOIYfD9rPmJvHOLwIubW9zrm7/xa
         NB/RhA9ODJ4+dpUuG/o9gkPFLodLJTS+znlR/ffMi03hhOVam4Xipo5+GeN/6Bcuy6qL
         AfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775998838; x=1776603638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lWiTQ3kIzQcCpnWhmreVQorYaFpYz2jftg7PoESVPVo=;
        b=lufTGAJdD+wzRI8vQiXyk+cnEu7hQsxmObXk/3efqtgFf8vUavvYa+8r7lXuGb/Ah1
         tfue1aFRI2oMG5dyzOwg2qoBA5ofJjsoLR468VlleZIU5FlUiUwfD2waa+TKGnvvKBIg
         P+cfWnsjdDKdVL0IvZwTUxzzwC6VxoWHTYOMJ/Pau/JG69EV3dqhhMKxiPg67s2ILUcC
         FqdctkKZO+jqMGQsgn0fiRxEh6fofalxpc8pTdSm1Ij2h1lFWVI6ina+9GNTLNd2BIzq
         XW5g/mRJQb+xR8Ydm93u8/QhWDU3+1QbKs+0+I5NxGRQdqEx2YpqRRQrLGaoFSm8nsgL
         EAxg==
X-Forwarded-Encrypted: i=1; AJvYcCW52ODB1wf/l2DkL0zbXe9katbIigUEi2OHNZ0j1DZUuRh5VjCp88Rl9YNi0MoKD3oMl10NJ8WdrjDtFHaR@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6ccwaTkUKiJWg3VYWMIB5RaIEtmPuEHs/LeO261QnhI4CcE2g
	wqrCozbWJsngAonwIUdO5h+v1tw3A2+A02IMv3yJRyqZ2FV/r6iz9B66
X-Gm-Gg: AeBDievPnv/y6HrRi9Zsud9Jq6ozQz1/74J/Nhob//w8eUOpK8WbOaw1nBsK5wVXEdQ
	4+CyhnXo9AFb/iVYVc1Daz47h/cmJe1j4S/7j4uS2ULZw/cRuPInMucxAgg43jjxkTmLJq2QYqK
	wp2+WK7aO+spOp0myDfQ/qg6bW7bAypd8X97kWjowM0WslyPsi2DTAd39P2EFFhDwhjYWj7X6zQ
	kgkeBtwjXYm2GSgc+O8RS0Hx99GjXgpFzLJVGsMSG169lrwrnBkukYRaT1mNj/DJ8+TDXDZjGkK
	ZoFlS2hP6OrBXL8t1LNnSjq4PMXFS0P6138oRxRYJJOBbxZ1y8VYGqZ3LpKB/ovgk2JAxTO7byI
	nf7scTyLEu9Eu5Dt/4XLJmS/o+kwGQ0dtMSuxV4NLfFAIJZCYS7K+icuWWtqWuK+BPQts+mDz9U
	5EE+lLPqG83WGz+D1I8vQdRMyZh/JsEFqy7ZK9NXdMBw==
X-Received: by 2002:a05:6a20:2455:b0:394:56ae:8a7f with SMTP id adf61e73a8af0-39fe40027cemr10638113637.42.1775998837349;
        Sun, 12 Apr 2026 06:00:37 -0700 (PDT)
Received: from localhost.localdomain ([222.254.206.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79219c618asm7361852a12.18.2026.04.12.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 06:00:36 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH v3 1/2] staging: most: dim2: replace BUG_ON() in poison_channel()
Date: Sun, 12 Apr 2026 20:00:11 +0700
Message-ID: <20260412130012.5832-2-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260412130012.5832-1-ducthinh100812@gmail.com>
References: <20260412130012.5832-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

Replace BUG_ON() range check on ch_idx with a return of -EINVAL.

BUG_ON() is deprecated as it crashes the entire kernel on assertion
failure (see Documentation/process/deprecated.rst).

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
Link: https://patch.msgid.link/20260330182255.75241-6-grondon@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/most/dim2/dim2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 23230a32c2cb..7953d4626752 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -647,7 +647,8 @@ static int poison_channel(struct most_interface *most_iface, int ch_idx)
 	u8 hal_ret;
 	int ret = 0;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
-- 
2.47.3

