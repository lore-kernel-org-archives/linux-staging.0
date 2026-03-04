Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5686235C18C
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 05:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772603289; cv=none; b=fShNnBnCcyx/ssnuzpjcCDz7NSIO8u40Oo0DRJ7CpAC43pmszdrL3yu3mDT12NV2ysArHUSMs+YH4ytzHMcuazpQdNmosJddkmUG6FDo5DUoF8Ph/YBkNcnI5TRPu+tiJ1PpaxHr/VvdZe3bc4j6Q47tuQ2RhE42Y60iPklALt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772603289; c=relaxed/simple;
	bh=hGzGZSIesgRYKKABk3MCtmQIw4wPBxignY5EC/CTKhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jppplZQEcuq0m1UWlefNmAf+/t+LPo2BKj6dXO1fFGnZPAAtH/0E873JMGgxtdvTjp+jCWmh79wrbkEyMPX20jvXJVtUkA7uEkGnjzFiF5tzAAOszld/Xv8una+EZ0Rl9hTY85AK/ZRc9CiI8WkuklcVQQ7vTsmwGWMXDZ+7NCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vwiku8hO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vwiku8hO"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so5700815a91.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 21:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772603288; x=1773208088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uU9ryShtwN5h/4AuvpDstnK+MMGP0hOhRJ5NA+muSDg=;
        b=Vwiku8hOGd1W6AYDEgUEZf5om9gVMnOTHgUkDFG9KEWAykEXzgBRECVuhFiXBq1ruq
         luH3jj/2H7WPcVnOpJ11segW8ushwxB75RGn5zNMYDwiw+4Vy94YdvLlukqZcSm1TcnO
         jNnjsSl5jyEp5AfoqE6U3IXfVX5cd+W68hnVxaFbZJw9glGcGSTEQDxdCyfeSj0URjLe
         1SuRvPQZApOto4nE6bnTzdJvVV4wh3nz6aBsLpWhtJhABXk5X+gbOby3UMPodvPMiLyc
         DxEceBbvSlGAa0MS07XwUTLuT8sBlN2kg66AAeHwdD2aG9GjHyVx3pqT8TkhjJgZ3UIW
         N46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772603288; x=1773208088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU9ryShtwN5h/4AuvpDstnK+MMGP0hOhRJ5NA+muSDg=;
        b=ZCzkJ+jWpghlo8bUVQctD4B/j9XH1Ba+FCBhAgu61J/S37i46h1aKnMWmOtYVt/mMN
         3E5J2CnpFOE8JIXqXBRs1027jbzqpUvl/NlwEjvFn2lP/+AW6FyWLHC8k0WhvoeexPy4
         mfVtt0cUQLwmcc5UjSeiIpKUXJ/bUR/zv50/Yx9pNiCW4cy36o4/OYLCAR7s56eDxB1J
         +xjW+HJdjrCqqHRT7RAHLRI7WBkchOU5baXmaQKrBy9z22P8vBi7E2YTJvfsmVhXz8Bg
         r15yZ/XTShWrgQhkZ1FZT7Pi2tlNpsLmcfuu8ZvHiDxeclwecwFXfo83usGNyug1KqVD
         2QQw==
X-Forwarded-Encrypted: i=1; AJvYcCX4Rnnc0eHdnfRTreyom2pEdDwDQrPzjWq/A5G5MIBN8hLKj1Hg2budRluulj+2wq55FFlUbglaTgMNPG3N@lists.linux.dev
X-Gm-Message-State: AOJu0YwYtIXaCpjGQKtxZmFWvFugIAR6IqXNxZuUf+tRWF+4BGEBJYAD
	ZoNZU7pjICocy4pR1sK1sG5wSH+fHa+z4mw4FkKPzyt9AggsDmgwRUP7
X-Gm-Gg: ATEYQzy1Iul1GyGZtr7qZsZX5VAkLwBXKWxzvBJrJ8BLgQ1QrPAcgwCMSnw+4PgQ0sN
	on3BaA6DD9IuFj1OSRPA/zj814p04GlL2fRktpShNoPwS7hrsvGpoIIGAcYumKDJDujx9BoCzJa
	oP4libRKE3QCasGPFTvHlO/mqeDMpsmihLAELwn/QVAxg6K+NY1A8TbKdtoGxJske0apm1H8dz+
	WehSfBSkxSXmuLzkmJJd0Cbl2StBMI/MbyZGZ3XRp+/p7HxJdF52/Vck02KK+hMYg+I2oAkSQ8n
	RKn6iEfzHR23VLskmZ/1sIaN02TV8rpvggegEsLC5JJBajag7EdoQaP0RGr0t/vF9RKH7SKGzfB
	r34KwLFY25cxEdIktzjYFdJ4mAPIEvSAUjV5Am6cH01w/bqD/y2PiBUB547BjGJwEvVxxLyd0zP
	gh58/mDqLEo1BIm9fzY62dk0Q7zZdACLX7QQ==
X-Received: by 2002:a17:90b:2691:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-359a69c0d3dmr842672a91.5.1772603287690;
        Tue, 03 Mar 2026 21:48:07 -0800 (PST)
Received: from localhost ([2001:da8:e000:1218:e91a:3fb1:31fb:f3b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3599c49f6e2sm4416242a91.10.2026.03.03.21.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:48:07 -0800 (PST)
From: Avon-Hermit <avon.hermit@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avon-Hermit <avon.hermit@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style
Date: Wed,  4 Mar 2026 13:47:20 +0800
Message-ID: <20260304054727.70113-1-avon.hermit@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert a block comment describing the AP20 hardware bug workaround
to the preferred kernel block comment format.

This change only adjusts the comment style and does not modify the
behavior of the driver.

Signed-off-by: Avon-Hermit <avon.hermit@gmail.com>
---
 drivers/staging/nvec/nvec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..736f11942174 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,9 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * Delay ACK due to AP20 HW Bug; do not replace by usleep_range.
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.47.3

