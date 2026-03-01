Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0ED1FC0EA
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401700; cv=none; b=V/yoOobTs5XqovjcPvXLDIyNuyLMMO2u4L0U7lCp2bew9xZNgg40oA6dsXoozV3XahPV7O2bWKj8RbNFUYoWW2f8vg9YNXcn3yiNI5gaVmr6+bCiZsd0V5tL0sgUl9XCDJBoh/YFLAkLKH0ijn2srrs8nYWBmTF7P0GGKkR4o1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401700; c=relaxed/simple;
	bh=BpfEglPlON/6443/iTHPtdk7Mn9bKuwUS/TOt9cN4iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PM/8AJ99OP1ttodNE+ZRUeJMNHuMlH7OoUmCwDfyX/TgVF+ltNoBIHg8JjECASslWqNuGd7Y5Meqcrdc2eZe4roZVbwDdRptycdVxbBPxRB97aBiYfzI9iL3RJM+NvmeiUjCzXHKe3O/4OF5cLlQMs6lOS6wONhObfP2eOAxeRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wj6aJj14; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj6aJj14"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-899e43ae2e1so9384736d6.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401698; x=1773006498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8nKulQ09Jc9o8xxw2OW/YwFisCnWckIAoJ3QQfq6wfM=;
        b=Wj6aJj14NIvbV+KC8MyFxjML4GE9qK9Mjqr1qtUWYltr/+kYJTU94aI805bBO17dop
         jGNcwfBZXrdVVkx5RcI7gkDOUfCCz/mvbEqydXFd4vLOfd+TrCOWarn65Sw46uwPNtHs
         9SM3+1OY0atvFLvrkpGJmH3y4h1POYgO/9i2H/vKvEuG+tyZsymOiWsbZhXVUhg7HoVF
         eBJL3a6cUHr438g12JuXlLf4IHRCnBgi+LaPSdFZga4csj8oYY5rApOoXQ7RAtzLVyZR
         9SQ6ACaKrKjLwEIkvL/Jx3pksWQVIosGQbBV5zKCb9sTEH+LVu9oK4TNC2gy3QOGZJB1
         Is9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401698; x=1773006498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nKulQ09Jc9o8xxw2OW/YwFisCnWckIAoJ3QQfq6wfM=;
        b=B5p8YfrMLD+U1zUEFmX17+/K2u/d/e/y0jnYWtn4C2tTmFYXc2Bkv1X8KnkXDrOSrr
         MZodzw2+HyKqA2SZw25oNTOswzKdWHmeXYGBOH0ULp2opAPPyrFd9W/y5USoUuHKQfZA
         icpAjjgSopZA7b5zfR5AjLUhwfADc8HUD5Kz+YDV4U0V5tkUv/YxXSW0FI5uRLSaDxGh
         bLLbYjBdXVdqxukOdtGGwvQWhzqMv8Muhb3YmLDGntrAWwnVpqN8PA+itTXc/ahFD6TR
         Fxf+xgVgvBm19G5KqrHWBxZ4Wx/U5/vMobHdqOke4s361F/TIobJZZ6bXuUOZlfUM9kc
         BHgw==
X-Forwarded-Encrypted: i=1; AJvYcCVqeWdQEKGDWoLEOfiIHEhNb+vSMNrv9xND+pNXMCJ3eyLEx/UjRZK5XJRYIUYKDh/1ooP2Mnz2mMwdOMjv@lists.linux.dev
X-Gm-Message-State: AOJu0YwQI+uBm2GEHRYkiTgfkwPqulHyqUHOQCrzBNrLS7uPVoJVZ3G1
	bQTESSk3HlGtF3BlX7iJ8ebupS18C5oevzf7MdfFZtQwkNvrko/QmA9S
X-Gm-Gg: ATEYQzwnBztz+vSOvV95twegAHTFTGaCd33CYNw/Fl95k3tRjlq5qgsQNbyOZr4IBCv
	zMmjsel/l3KjefxpDUELRQd3NFs9TqO0b7aCbcbhduffIvrNYDeNmGTIw0oMuKODpcvJWL9JvW3
	m9fQS/YypSPOiyKtSwKn9Jecz+fBSRVaCvXKpcN8dR1gAuA6uklW2XgHkykA47LDG0kwrddjHbQ
	RbxS3o45PnsySM83rJBjX0A/3Tyg/uotdprCYhJ05Qol+lKtcEWshFdnMG55pbcn8EpJEuX/+fg
	B1MyQ4PVWrIchwjW3FB7eAiEtcKr0+7lbKM8jjDNrX8tlq+8t6KEeZpDiD8JurkgbRwPTO44Bop
	WbA1KFj6C3UaLB8nka6Dx6psmgT879+rCOlKzeyHS1NaVrj5qNclIt4dDn2llYnl73xjnqd/wME
	a69CKUfvxb4+ZbSYaHJWcgi5yDCNAV6knvBI1NZ3lzjjhb6eHkl4LjNmFNX0HAXE9BoThaoRb7o
	DaP
X-Received: by 2002:a05:6214:1c4a:b0:899:c409:23f5 with SMTP id 6a1803df08f44-899d1dc26c2mr135434976d6.26.1772401697711;
        Sun, 01 Mar 2026 13:48:17 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:17 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 01/10] staging: axis-fifo: fix alignment and line length in wait_event_interruptible
Date: Sun,  1 Mar 2026 21:48:06 +0000
Message-ID: <20260301214815.2628942-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Josh Law <objecting@objecting.org>

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aa90b27197cf..aac2c58ef9b3 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
+					       words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.43.0

