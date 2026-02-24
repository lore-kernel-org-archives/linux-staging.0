Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0290219303
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 04:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771908593; cv=none; b=lR+vnjDsEfGMbY6E5RXURCjvz13eHE3wOHTQHTXnWrFAezS5qQxEb0YzGUHwYS0rKqjKJbYsDVCWyZgbeSpuaWDaGC2xOOIl4pO9L23xKZmzXcWYaBHtsnasHmcZn8013fVQbgAZ7tcSEJNtjTnYfKTR/YwFOKOySZM2OgkgzWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771908593; c=relaxed/simple;
	bh=TfowHEYZX7cajamHNWl8arL/Dv+VRy4rmsoFcmYLnTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt+1J632U0A76vGTV8yGGUqkG9n/VskBKjzF10XqRU0N9G67KZcoflm26SuPPeGWSgfgj/glOk1jv2blaTRKML1TKrPZb2sCEfPHJgSEOh3Khak+qTu6NpGBBlGHAHTj6liSXYOOK0P79HWh7tDQG+NsTRnT+EDc7zupHJPNIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F53Q8Ip8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F53Q8Ip8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aae146b604so35595105ad.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771908591; x=1772513391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFqnBhWK01miB2tsrhsuRriulee8yMWlKiYQhJkSAzk=;
        b=F53Q8Ip8Pv+trj7Q3jZmXUJ81kgph7VG7E1yN7KhpXGyJyb7kz9EMso+eE8DPV3wGR
         oJ00c7UDdJ8mmvP4WDetGtM3JF6kUuoNU8d+N+YCIzfQ8cZVOi4hkbSkoSQkIcfIzzmf
         JVPk8EDv1eB3+PoQUTflAO/Y+kWVSHe6N/fxALe0pFElURGXvzECqAPqh4QY5QtayCm9
         5usuOt00La9QWSKI6JXdJHjkpt3e6vEmyUguI4il4Ra6vU1Bk0uC8P1txLGGKMLN8Y4E
         IwZW+kP+D+8F7Xm4f5hnmPSgWGYB/rDutF88HPUDANEBNPEnoCBlMbsAFZ/jZmQV7Cir
         V+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771908591; x=1772513391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFqnBhWK01miB2tsrhsuRriulee8yMWlKiYQhJkSAzk=;
        b=og/j0vfVmGF5+N9fi0kHOuk1dPYV3f1yj7xxdHa9ORpv0iu3YD2jcXi/i1bDxTZTjN
         HWyoVJX3E1064G/rrx0pb9YCl08KusI7tHQUTJZX+RXzPzpdR2eAjE+ut+3U01X9Iy+q
         wSvOaFlFvqRrvpY4/eeBFVkMCEDSh+Sf5PBvA1Dbh7ln30/RqJzs+yqedVYYe0AWunRO
         X4nvOExa8zCP+5kc6ci0jmh5e8L7+3gupn1XhHcJIBrFJMoYpZhPoZU8l2U7BwX+KB3j
         zdLyAZrW0TK+y+n2stY2YiRLsI2YAxNxZO7sGmJGvGscNcdTXpNfjackb3aY4F03v2+E
         o5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVTNsYxuBp73HZo8nZa8ILfReJiMkXclOL7jE9RVhR28p/0AlvnpQK3p/tHdyhkV1KWxtiWOKhp8z6dZit/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2y/s3Tx7e/HVsccOwhiKuYHS6NkQNe09oGWVAhjRBciI7Ltdz
	VSnHznlZczAD7kApcnqpzFMuGILtIwPc1JvgnX56Yv8IG/LZyZn8cFgp
X-Gm-Gg: ATEYQzwIJspuWJOitE2I1I3n38loiSy6wk4O43voPmHm6PjKzD//E5rJq0E+t7UV0wR
	dBcr5YXSZhyZvDnjtZXWzbS0G+PTmHwZDi85WdCdSCxmBddM7o49nnnPuhWVJEEhG0Nn7wTfr0r
	eZrR75j3ZH5MnKiBTHVDZW0fHVPS0uaCfO96iVVRCtK+Ogs32tjf0tXzE0DC0XHjbmc3IcuQT1o
	Xkh0ZUzI0h6R/P/iZl4xAWoU93Dxdho1SJxRJd+fCbj6IRHxzjIb3DD1H9aImX9srQeh446MHRk
	81VxtTyf+1HIiYOOsZW6M5v2Wd/DeGCbNhF9RyTPj6qE/PgUzM4gFmG9ZDBwuv5WbEaD3CijRUS
	PX4kHA65IJr5Rpi0FpJHDHXDa7/pENiaEKW5DXZE8mFlKC++Rjr3G2gwuFMrtuXFjYigGaxs5MH
	5mTMtqIvvynwiFaI7CdJQtz0jhNtEvelRTxficJONlmd08HdU=
X-Received: by 2002:a17:903:2c04:b0:2a7:95d1:3c0 with SMTP id d9443c01a7336-2ad74450ef3mr86111395ad.23.1771908591002;
        Mon, 23 Feb 2026 20:49:51 -0800 (PST)
Received: from localhost.localdomain ([183.96.230.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7505bf1asm91567995ad.92.2026.02.23.20.49.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Feb 2026 20:49:50 -0800 (PST)
From: Kibaek Yoo <psykibaek@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kibaek Yoo <psykibaek@gmail.com>
Subject: [PATCH v2] staging: nvec: fix block comment style in nvec_interrupt()
Date: Tue, 24 Feb 2026 13:49:46 +0900
Message-ID: <20260224044946.54022-1-psykibaek@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223143101.76552-1-psykibaek@gmail.com>
References: <20260223143101.76552-1-psykibaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multi-line block comment to use the preferred kernel comment style
with leading asterisks on each line and a trailing */ on a separate
line, as reported by checkpatch.pl.

Signed-off-by: Kibaek Yoo <psykibaek@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..62013019a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.50.1 (Apple Git-155)

