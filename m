Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA33B5F5D
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604489; cv=none; b=OIlK78vbPNLTCLaHI3+xeCijwi5QxYMi9F/ZMM87rZMTtPKcVHTW4nLosM571SWpE5o7ls/n2EwcdTRuQGn0fZbvmkHjksABzEn6rcR23bJF//jScJgEH5Q3IUnJbR9cEJk6eJ8S6TCkpVdUg99pie073sLI5k7UwauVTLnO0dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604489; c=relaxed/simple;
	bh=ytsQiOiP4J+KRZQFTf0GWFtQ8qdDF43YlKKgCmb6LSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o098CndHlqgmnPpX6aulWWT+qYTAClqBT6o0RAoFtkCZYYnhJa2tspFdNyRwgCBNibOJ3Qw7VDCPSXxx+JOjN4MX8HM9l1612BxU9lgwm6MSBMRa7M+b2eTlDst1UURDfoo5NTIY14qLhHvS7130LIMLGr1UHIAvP1Hg/Jt4Zzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=AAGofYZx; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="AAGofYZx"
Received: from mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1f87:0:640:a06a:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 3C589C00EB;
	Tue, 12 May 2026 19:47:57 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (smtp) with ESMTPSA id nlNSSYsRFCg0-wIRHbZii;
	Tue, 12 May 2026 19:47:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1778604476;
	bh=wI0GjT53rOIYWqEa0Vm82H2yOyQSsxtXyI3AV87wjos=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=AAGofYZxOaqTi6beoYOlUEZNYn21coZ3MwztF50WoZRTJHOZMSVlFzADv1+ZUElw0
	 8kQHZYJ0dvUpIDknnjr91T3g8pLY4ABnMxYMHQWSak7naol6HWIGA4bn57qpjSRGqz
	 MfqQlUYGTl8y3Unf/vnx/Sl4KaEllGWrIikMLgBw=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH 3/4] staging: sm750fb: remove unnecessary initialization
Date: Tue, 12 May 2026 16:41:23 +0000
Message-ID: <20260512164124.188210-4-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512164124.188210-1-ahmet@sezginduran.net>
References: <20260512164124.188210-1-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove `data = 0` initialization since the variable is reset each
time in the for loop.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750_cursor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 9d6bca3106f4..f822d147ede9 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -84,7 +84,6 @@ void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 	/* in byte */
 	offset = cursor->max_w * 2 / 8;
 
-	data = 0;
 	pstart = cursor->vstart;
 	pbuffer = pstart;
 
-- 
2.53.0

