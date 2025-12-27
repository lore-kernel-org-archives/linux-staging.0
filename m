Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBD422A4DB
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870878; cv=none; b=K3x4lFvem6wOs7dHM4ivXCnh0aZXkTa8lg/i6Styk2WLZA2Q2Qy2xiWaVqvANaMLhfHIVqiR/Nm2Oo1JJqedrfGw672VK7t68gyGTxrxfb/Uuku6xsebbCKvdMzoovqTOjnlNCB0rvdT6Clv8dkasLXXg36cF4bgM0HyJt/WiIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870878; c=relaxed/simple;
	bh=LxgLYH+0t14IeWPXKL3be1Id4PQnOvH4meOlZuJHgok=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=huFWCkO8L63XmNy3Uu/ZnKB8PUbcigCXj3BwxVWVqBUj63fZZJZfeQQrMEudGfkDDpttk4ySfKOgICE7O2CJt8ksFFFZxGOQzaBLz8zIe7JdTrt6SaKjdWJOzsQK+zzVrZu494n4eMsCqszZ647UmoYeS5f24AVQxFNG+B5H0Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2tIWqgw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2tIWqgw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so51257605e9.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 13:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870874; x=1767475674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVauf9R1sso8qYHqc7DRW9uJoLmuJMKAhdXRB7ysY3Q=;
        b=P2tIWqgwo6RbFkEuKrKekqaEI+0UxcQR/sKBPhQvJcabq4TmxBthkGYvXFZS9RZMSj
         AglwksJl1SHxZhJwg+hulWN6AQFiA63NNlaHb/t+eqaG779EWf1+J9vvdH8Guf2DYvYU
         HwoQIlSckmnZnq4k7UcKQwgVkdhWDx/ER3WC28f1fCSWlh2jSNOiqLJZcB61JjUkYK/N
         zIRzdJqKPuKay5mOfE7vVQMSakO2FaALRwMpeHqPTqldj+Hqjp0CJs3YPbF2hHGbrMGB
         rXKIFcBu3aAgTH2YVyvsMyin7X1vTUWkLKuhk+GURNVeZqFy3/qswFsS+CSFNZESXPSM
         UfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870874; x=1767475674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HVauf9R1sso8qYHqc7DRW9uJoLmuJMKAhdXRB7ysY3Q=;
        b=atooinmFvHc52qvJVWcT+Cslf2Tf4e4SfvICfZb7YAOrxh13qOThxeqvkHt7fTMT0k
         26OxD6OsLcpdED/jmmuI2a1J1en7vi5GoOECstpSM+Y4c9jaS5x98kceZHTgVY3RqnKv
         1nVMf1j1MqRhAuA+dn5G6Qa1rJEvKCWtcWW5hrhGb+EkjBgjPpmS/MaHfuKSX+TKfl+q
         Ikf1x80FLiLTABDbK1ks9i3990saXntd81wBIq6g4bG82jVfWxxknuzsHFzNmSgyMX1X
         GpZPFz5X+95E7f4j8Fldb2Df0XizVSehgid/SFrn52V2LfE3GA2a2gOjq13ohzd09mFC
         2DWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuFJdK1EDSobcCPX5hgqvRusohlYcZo8HcsuM2VOGxs6g6I7Ov4M/e44HaZio23t5bJE8Yk/GjEhcVq0oD@lists.linux.dev
X-Gm-Message-State: AOJu0YzqtC0BgOo5WFWwbnxZq9AqCwqGzmYKE4pt3soEhHW8yyhY85sS
	K9Vs6fvAwbytlUxVN+7z0V3nWdIfyRBi0lV8zD8u1GkYTOMcXTKweGjRprMuvQ==
X-Gm-Gg: AY/fxX6LJiNFr1Uz1GTySbxIvZ9WfNS8NOaOsQj3W87aBNWTd+p9Oer4Hrgou/wArlr
	CjUGT5EfMQHhBBmxv2qV/YTNPYTYyQrHRz+Fftyq0bFRyFgCLz0fLg7+xUAfCnpTiymbwRHJeqK
	LwIwBRgrvn5yWnTJG9jId6Nnp347YC74BwWQEE3W/WQ4YsI76HgdB9EjNru9Dyz5bLXoEKxmD4w
	RVNvCDjMUUUyi9MrE6rgE1nYLZYhiuugi5J4bPXyg/ktzoCP0IyEzkUOttXDGYCcxELogiDJc1e
	VRY9FlTarCxxFgjosrhQgBUywlqFVFP/J8xLJesAX+1WO22JkseDWZanItni1lROafdOELGlkOK
	T2q5WX4FyO4jcQbJt2+r4NrP1iHoptPBkUbCRJ2bIVsglhPcSDmguna3DaAZDF1hFmT4AuajLFV
	Watk0DsXi14CdvNs2V8UN8
X-Google-Smtp-Source: AGHT+IGAF7vrsxfzAUeiq6XJkT0Ngb7EYw0/gG+8G83RZMC9YkfAcLD6LNlbVAalS4HyAJBGkGgMkQ==
X-Received: by 2002:a05:600c:4448:b0:477:7768:8da4 with SMTP id 5b1f17b1804b1-47d206a8df1mr238447625e9.7.1766870874215;
        Sat, 27 Dec 2025 13:27:54 -0800 (PST)
Received: from ws-linux01 ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm471531835e9.3.2025.12.27.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:27:53 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/9] staging: axis-fifo: Drop unneeded release callback
Date: Sat, 27 Dec 2025 23:26:35 +0200
Message-ID: <20251227212640.3321310-4-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
References: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The release function only clears file->private_data, which is not
needed. Remove the callback.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index d49bb401a227..4071060419ba 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -421,17 +421,9 @@ static int axis_fifo_open(struct inode *inod, struct file *f)
 	return 0;
 }
 
-static int axis_fifo_close(struct inode *inod, struct file *f)
-{
-	f->private_data = NULL;
-
-	return 0;
-}
-
 static const struct file_operations fops = {
 	.owner = THIS_MODULE,
 	.open = axis_fifo_open,
-	.release = axis_fifo_close,
 	.read = axis_fifo_read,
 	.write = axis_fifo_write,
 	.poll = axis_fifo_poll,
-- 
2.51.0

