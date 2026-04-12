Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB312DA75B
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998836; cv=none; b=GpnCa/eLuRXXyw+yk0NlH63I9EZc0n8SpMoOVr1MkTcN3SC0+f7U9kHE8EClhZ+5gazGU2vZqz9AqiTzW2DnA3g8/9fSd0cpIpdzjepxubunNrrbZpBEfSOiEUv+95wQpISy9Q6e7VM/0009410RJ2fh+0hmdw9Ng1BCLRnf05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998836; c=relaxed/simple;
	bh=qF6xk2C93oFJkz8g3+IR/cHPByXU3lGxQqkVWgBbyCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrtXpp2mr7S9wbxo+AS9SQQfxtdcHoi5j3s18Gcn7Oigs9SJudjIhqCK1y49FUVQoQ+CqK3oJjqwSCsyG+xsrPBEMLfS946uhnGdnl1KfJl8Qc0zF99FhlsSeScmrv1fWo8oqvmCeyA3O3LQdyN+JddqaeFuFS1Pq7NJP6X/9s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHz49S8/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHz49S8/"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35e576110adso332063a91.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775998835; x=1776603635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AYAzWEgRFQdx5yqRoGUW9zmfN7xHZ92X4n1F+ALqdZs=;
        b=UHz49S8/RWwrEJbh7SLRclUhdBChj65ss0IqrICfIcjof0PyXYCc46pMpnf3mb7oC5
         H2nmK1qajFKNEzB2FSww34u+VGqj9CgCOB3xQgaQR48Hs+0mWA3r9Bk80ijAGKn7QBLw
         zLyVj1fwAe9VH+Q9j9IW/Tt6CeFwTd2DUtkHAZLuhubIHVj4yjcoFqwdt3eRxTwSay6o
         HA8V4oANkKvvIzrrzdqba5rUsEgiAO0v9B+vMxhUNlS1PCNiCgWRiWc60rHBleWY9zOl
         dCXDcw1jrPgs0Er9AQj5tEdlTg9MAS7Cm3kFPYcGm/DxLkk8+vZinZwZWPU8HdJ825Cr
         SkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775998835; x=1776603635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYAzWEgRFQdx5yqRoGUW9zmfN7xHZ92X4n1F+ALqdZs=;
        b=tYi6xT0yekVmJNw27GyEXOzJz329+AXs3HqsAjRLYOY63T/ujfWdYjWrIli3lrFuiV
         lWa51poRPb/Bqbx489XqKw/ydhPXAwDJoptmoqW1H0Ane2G+WrOG5+XJdH9cpixyv7mp
         eoEwzqYMOS1rYnJUQhNSevhsYmn2uvFKa25v+RD1KD2qK6bqD0Pnhogu4AROi1TAxpFu
         MTwqO7Spsk2UNdGJhUi0I6GkYYHrB86eUxAmKmdMD7jzwQp9f3rIdy/5nZvSBl3z/vqR
         PjAN/onx8p/WRQ+y7mZDEQjdjS+1Rt0oDKi0rNvvNtKb4eYDkK2g5Ra06s6F2oBUVkdC
         iRcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7vptBDtkkBcha6k74tfUHLB0u+lJjhRA7UWDa0MSi0i72Y6dXFylZGMjM6OrfvcneZh1ztdCQDCVZcKS2@lists.linux.dev
X-Gm-Message-State: AOJu0YzkVWhNZD6G4Xp/Egi+9+Q13T93fwf/re9S0uDcy81PV1/V9CxD
	KZ9geoKZhBlbQKCa/Ht70i0Pfm4ZXxiYfzZYtGxlTBZAlhofC5LWsN08
X-Gm-Gg: AeBDietRBd85HWjDrKiK6u1lEuFfxR07VI01ps7Qz1MKY7/qkRRM/3lhmKuALXnrNbR
	TX2632AI4Y8f49xyXngtx+2AmQQz8ExuiCIJuQoY1wL/uCP8lAGms0aFE+mh3GbG4Yt8SyaiQcV
	wcu5QA1zKmdtN8YGxmQANrEiuJneQDwXgnHQ8iFw/dMNsAGsGY/qQLxYJ8UcQp8eNAkuHm5nt0m
	aU4k3l9+i0c7HuULn6NOWGUY0WqFs0+Vy2ejeaz3pLo2FUxnu5u8v8121AaVQ5KlzCs2a4A4sIh
	aGjqmXeOzGV4jWwFs+kIT9fBgn1cemJR0uYWgLnD2yIwSEuMlDp7wVHXbvMbV0fJ9WrNvpclU6t
	uvdEuAnbdxNBBlNZaBoNN/I9KPKEcfNHk2r61QiLgoYcAx7fwzGHPyp/7FglqY8F7rZvjPUmCmz
	dDtlPsZjJoVYnoYMKoEhVra8ZpdppLqRJAMuYzL+soJqEcRbQFMIYo
X-Received: by 2002:a17:90b:164d:b0:35a:2ed:9b6f with SMTP id 98e67ed59e1d1-35e351f6d14mr13918171a91.0.1775998830337;
        Sun, 12 Apr 2026 06:00:30 -0700 (PDT)
Received: from localhost.localdomain ([222.254.206.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79219c618asm7361852a12.18.2026.04.12.06.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 06:00:29 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH v3 1/2] staging: most: dim2: replace BUG_ON() in enqueue()
Date: Sun, 12 Apr 2026 20:00:10 +0700
Message-ID: <20260412130012.5832-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Link: https://patch.msgid.link/20260330182255.75241-5-grondon@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/most/dim2/dim2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 0b80f313a266..23230a32c2cb 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -570,7 +570,8 @@ static int enqueue(struct most_interface *most_iface, int ch_idx,
 	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
 	unsigned long flags;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
-- 
2.47.3

