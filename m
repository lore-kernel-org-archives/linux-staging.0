Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5AB2C027E
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 22:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773094065; cv=none; b=tqnCDFP8tMqkrfp8bL3954zvy6O5AJujHaaIkVR+RP5Ad7yFO/WfP9CuW5BEWyGwnYwgsDZpV2GAHzjqcZZzP6vjep7+RvNy6ivZqmqvJla0QsMgHRDWQ6WnHMTG1VhtNUBCMFrIjFjX0kFBBKShQymMSBE4IdKA6alACOosCYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773094065; c=relaxed/simple;
	bh=WB8mKaj25z21xwbnEE/HxdHj7S3zxp2nI+xpfcf3wdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2S7mzdugc931OCAE+OxaVkZfqP0ofZJ+oFvsZ2t31z2WAfAH52lXUka4FC6kuBxrsl1cjdFF/YHYbTrvmj83qs9J1IJaoB3xpwA/cAMyOXR6PzaB/34BDY0yYw1ejqMJHBmhjnXdiYnmi7qihzHGCJ+SterO4ZU0baIYVY0MvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hhs4JAKD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hhs4JAKD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so8234475e87.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 15:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773094062; x=1773698862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATIXLe26QAR/R7sQs77BbHbXBqtJJOMvXotTHn05fZM=;
        b=Hhs4JAKDuabFOA6BqycBaeJnn0ReABVY61JNULPqGXXQEH5M8GdBlnFIH6B1s2FvZC
         2hriZJ4d/9WATHQ0CkC0SWOrTdcVLazvGy1z0moWYJVCzDaJi5yk9IUQOyh1Jx7JGGMx
         4WSAV3IZOhzwND6ACmND4/zmS3B4fzN0Q3H5r2/Nb1KdauvHOpkyPxD3sefSXtnxivYo
         8R8Omghrgc3Z/JsGNML9dUxrM6DXhPkGZQZBg3wn9qS8xOgzYZh16+mB1BdqYaP30d1n
         9LwOCObDE4t9SsTUygzpQAoGk5lJ0hwEGbu8SgMT7w60hqa4YN3vVUpvF7Odhm4rbUjF
         Wafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773094062; x=1773698862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ATIXLe26QAR/R7sQs77BbHbXBqtJJOMvXotTHn05fZM=;
        b=Pk5eL1BNWRkyhfmX8FRFSZadjRgZkMYQgT/2e5mggW9A9D+dy0+jKfXthwSRqxastK
         qLi1xtmbz/YlukI9dKLuEt/XH/JmWPJE3rR6YxK4fOnILb5g6Eb7qPEV+2+qagA/XBtS
         MktqqV+NeBycbtHhQZjQhwRkEda1o0TCQFmAkR6lVn4pTRGN9AoIKH09n+2trjqiS6dg
         SnCSyPkigQgssXPNSEImX503aB8ek2HKgM/53rLqzSNOEeoH3WCUIar2Olikty9nnq6t
         I/mltKiV05eE4PVI3Et7441Z5htQkJ4ggxp5lpVgWMCS3T0g5P4ytq4P/2xZelZ0dDWn
         41Xw==
X-Forwarded-Encrypted: i=1; AJvYcCV+7etLG+IwXk6kz6mG1m/ZsHtPGCb7rKIQYyvF5wDZFSH1kr3W53/SGOG76lu9HrQddX0iWCw8K9Fk+7VA@lists.linux.dev
X-Gm-Message-State: AOJu0YwoR0oqJgnf79rTe48+jG0b7qMPbKFCIGoH/yieE4/e/pRZonDR
	L5WN3+a8vTJM2G0p4zOBPoCFg+fx8bmCPS+HzG0M47R/C5L56g1Q6ch5
X-Gm-Gg: ATEYQzyvUTUCu2a5h/MGYXY1Ly5XnNxh+DEYoOQcgxvZFdy2U+JNScZOjrglsp0wpgC
	57IShkcb7G9bouc5aj857oKQ++CEsH4QSzQEWxM9XQdpN8SQHIsS9x4Tdgs8BVqYYsG951mi903
	AWrbh1FtioH9cVKrBuDEYfXMPZKqniYzMHqJ4719jaHe/GRu/VNFxniY330wEHJnVSjrHaJr8+9
	eRFuwGVKp0HXFn9wUm+SK7NPIvmCgeO0eN8QN+AL8J3oHg30YUTt4Sdz9RmmpDb6+Vk7QH3piSp
	QOPQR6SXFqDMfaYcI+M7I0NL+gOqNpH5llHdx8Llz+vyLp7jIrOMpuvshMCny5W3fEfio8zub34
	8hBAUMGx7+0UvpLz1ax3Pq5+sQas1s1oYT0SwdnyjtFKJDaMZHbr067oBhBjOvAGm0fL+19hEMu
	5zN2IbZQwmF/+bPhFwYrirkyPRiauzVkwh0ukum7k6ZC1036mX4z5Ex+rxEN/lrRRtT4EVFj+Ah
	A==
X-Received: by 2002:a05:6512:610:10b0:5a1:2fa5:b96c with SMTP id 2adb3069b0e04-5a13cabc8c6mr3277857e87.3.1773094062225;
        Mon, 09 Mar 2026 15:07:42 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08c24csm2405916e87.78.2026.03.09.15.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:07:40 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: gregkh@linuxfoundation.org
Cc: marvin24@gmx.de,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v3] staging: nvec: fix block comment style in nvec.c
Date: Mon,  9 Mar 2026 23:07:18 +0100
Message-ID: <20260309220718.6475-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026030929-uncheck-reclining-315b@gregkh>
References: <2026030929-uncheck-reclining-315b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting to use * on subsequent lines
and */ on a separate line as required by kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e70fafc095f2..0e655f79ea4a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,7 +659,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* Delay ACK due to AP20 HW Bug
+			/* delay ACK due to AP20 HW Bug
 			 * do not replace by usleep_range
 			 */
 			udelay(33);
-- 
2.43.0

