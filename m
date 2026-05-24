Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7B3B47E1
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 23:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779664547; cv=none; b=i3iEkTPszyln3h8SHlL8i1/L07dpHds1jCuy5i79U14CykRVd8UEp3ymtuqQZfwjEeoqtO6IwUa3+TN8KVOOLptlq8SNSzFapGmrYaN7d+BGP0Uz8t1gqVt6DhkAigBZMzWHinM86ZALuvf+uMewlKiebsNUDO6jFswk+fLDX3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779664547; c=relaxed/simple;
	bh=wUQkDEA+c3MoyQTiA25d33zMS/R9fXsunzUwSdEhGJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8BZZOw9IlSPXwjW+lq+BxqzBq+LFGaxiQdObogdu2l2T/WBsETdU4Nd6XX77k87QQ0FQb568KPpnXuIuAPV8BzrfjrBcYHHwwE/rZk5rrUOPk1tpmidYvdJ84ls0yVxTklT6FMOTMRRxjeo5HD4VMZN5gdejWCS6+f0F3xGSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S46BIgH9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S46BIgH9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so6620466f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 16:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779664544; x=1780269344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCXgu7mmBV4o4fqQpXsS9NGPJ7Jt4qFYTEYzg3x74f8=;
        b=S46BIgH9WNUbWROgEl0qa7brGRqZCyEOaolZzEL6pAnBsMw4hgoZvEKi/vkKIWeo/p
         FPPXb6YQwXXEg/DGpNVRs8IjgdDJZALrkHKORkdhobAHYO8CPH7hBfVXVDBdV4ORB5sk
         QvuRb3+T4d1tsy62Y8ZaQRat6L4R4x6YfMui5Bz54X77tTIlH/Gvx7qXYhD3x7FifKPZ
         zS6Zg7ag+Nj/6NFLf2G0m+dPky23JblejQkLG6/YexVZywmYZZxuNF1j2Y4djWd9Zq5N
         jgLZH+TNA88BlsERxD/TCbugUXYdRMoWN4zKhqupkUPUBq3qfNl/gefqEJedp1uMQKo9
         zDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779664544; x=1780269344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KCXgu7mmBV4o4fqQpXsS9NGPJ7Jt4qFYTEYzg3x74f8=;
        b=Y6xkeEyJ9m/815PHA28ioNeCYc25nMiTFXg02fKFScwtq071FUdPyjZPiVFryoMaJ0
         QCKWBsylzmjV8SUGrqpK5yNl8lM8Sa9xv+MupXheEyGA+bKwuDh/wEbdMKIke5mPPp3K
         A9dDrlZwu6+o3dPrC3xNCFJ/Hp1PzUi1FOStvPxEuP3x3bj7Muj9VIPdaIURchnx8NMT
         1ZL9DFDkTDaoJaWX/jMZ4NcF8kWI0baqf6D/gvMH/C0TMUTAbFcLkiIs+WIgCvwIqcnE
         uX38gZctsWEH/83FPcWEZhqjEYcOfUTxFzgKRKiZdWes0oIqKtj0U1Ia556u1M+YGOSv
         ZrtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NF8s0IizH3UNJsrX342xH8iohLAgdUlGAv8eP3D/1NCsomFfn/cLMaLmIw/EdRu/iYAi5wGTNfEJt0Bof@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Ja6EtzZZzoTO7/ZkUMdwxszGxqmnvHlRvDL1sgFa4G1hy2sd
	00fTh5Zr8wa3v9fPS/H4jjl2IpREMptLcu82H6GEH7ME2RgtQFf3LKLL
X-Gm-Gg: Acq92OEzcmiLc2vTFL96ySVhsGXlm0QzVcvzr4KiwhoOoQH6MR+oR3XamHlZadVX4rP
	pyagbYAlIY6jPWDB9QlW4W9yxbP9PUSAUQNcYZ1FAG30JBzoDwEAuIJm5p26bZzDxOoYwYYQ4RT
	GbmmIDM+FR8QV3iMnB3utrOlrUPFqMEAaXFnyj7tFfj4rTSOjRbjnYhLIqnuFrqOuhEcoYNirdj
	CrtOnBzoIt5VjUlr/HBbTzwJ5tINNJor6Qoc0bsPb2WKr3Ihw42Fe2lCtOzKnAo42dT+rRYtTSN
	gNGmqO9e1ltPqQi7vtZe8qRJ6j7j1yI2WndqcegbMxQRRkgq4T3Kq/W2X5nE2RXQlYvyE7O9FqL
	6CMKuKnaCd+y+B4OU0Vcn7msWgQFTpoeA5OcJwpbywQqUGfGFpPA/PxEH58t2k8gA4SbaJGrit8
	HACErGZa1mu0KPRknDpT0E8XeoHxf68If5VfPKhK8ot0rAiKRkOLNrmzR1u1T3/bk5bWwTtg==
X-Received: by 2002:a5d:6f03:0:b0:449:cd74:7432 with SMTP id ffacd0b85a97d-45eb3131f3amr16640087f8f.15.1779664543789;
        Sun, 24 May 2026 16:15:43 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm23073063f8f.29.2026.05.24.16.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 16:15:42 -0700 (PDT)
From: Michail Tatas <michail.tatas@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michail Tatas <michail.tatas@gmail.com>
Subject: [PATCH v2 1/2] staging: sm750fb: rename setAllEngOff to set_all_eng_off
Date: Mon, 25 May 2026 02:15:37 +0300
Message-ID: <438a9a516955be8cbd7144e95f494663c8c99e23.1779661132.git.michail.tatas@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779661132.git.michail.tatas@gmail.com>
References: <cover.1779661132.git.michail.tatas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable setAllEngOff to set_all_eng_off as
per the Linux coding standards

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 drivers/staging/sm750fb/sm750.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..00c293430a7d 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -848,7 +848,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26..589ae51444f8 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -44,7 +44,7 @@ struct init_status {
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
+	ushort set_all_eng_off;
 	ushort reset_memory;
 };
 
-- 
2.43.0

