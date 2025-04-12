Received: from out.smtpout.orange.fr (out-69.smtpout.orange.fr [193.252.22.69])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546631922C6
	for <linux-staging@lists.linux.dev>; Sat, 12 Apr 2025 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744444129; cv=none; b=mAnK9r43mlPFAwD9tFMds+9n1mL4NvOeFPEoc89zjW0TaoPudv9zSmgVUYAB0OgakqIyjcj7d7okHMCAzA0EDmIg4A8xaelHi2P/myHGJNKKaYFaIsmcE2563ly42E5IO9vflImun+N5BvdUkZkWxw28KxCV4f7p+jU2PFByRSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744444129; c=relaxed/simple;
	bh=2TDNINhhP+tqL6gRsN/zaGla/IazuRP/HIv0iKIdYdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tp0+QXmTAf0rxHFc2ZL6gOhN9KigbMOLzPyiuNJUsXAGIgHo1bS9Fk3xOAgUH2a0yZ+H5Mj+2bNDU+/xQYDHm2v3M/Xh+eGpsrvzlXLlFtQ79YVfcoLDjnZMyEnznkSKnZTE4oXuXBZe5OQNnypg7qJNOk4OHXtSOM5gL5bBIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=pqtZyHa7; arc=none smtp.client-ip=193.252.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="pqtZyHa7"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3VbRuJv5sCZIm3VbVuYMRQ; Sat, 12 Apr 2025 09:48:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744444124;
	bh=TyBefwaCj12qoZCRmqa2pA2xtccxwzTRF92uBTc5N+k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pqtZyHa7FFYe+AplfhLYIUWw2niLc6gTv5te8yyIDzQQ0IX40p50ASDzMTt9/fR0z
	 edZhstppiuZaJQQbpDWCbLY04wjCez/+chWlAXqzXU77eNnIMgGW7PE1/GmJ7sOwc8
	 3EL7NWBfltZazWV1ywEwcLYLM07R2krNBFECuu5hiNEgBS8Ci+eCuDfXzjYjUwcQc1
	 j6P1PGgza4RudwrYmMNYigF0b/2amK8MeUPcy+8B+zhCMcOrIevhTrs1h1S+8RH2sL
	 sZBWJrOYHZ0FBJUNtqMHksrRPrrrObNXWOiqz+RZvhPPDsl78l5tyYm//VXq7GMrLy
	 UvoTSVzFx/T0g==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 09:48:44 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] staging: gpib: pc2: fixes multiline comments style
Date: Sat, 12 Apr 2025 00:48:34 -0700
Message-ID: <77eb5fc5050298503009fa212600f00514eeb713.1744438358.git.paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744438358.git.paul.retourne@orange.fr>
References: <cover.1744438358.git.paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the style of multiline comments to comply with the linux kernel
coding style.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 96d3c09f2273..d93502a833bf 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -267,8 +267,9 @@ static int pc2_generic_attach(struct gpib_board *board, const gpib_board_config_
 	nec_priv->type = chipset;
 
 #ifndef PC2_DMA
-	/* board->dev hasn't been initialized, so forget about DMA until this driver
-	 *  is adapted to use isa_register_driver.
+	/*
+	 * board->dev hasn't been initialized, so forget about DMA until this driver
+	 * is adapted to use isa_register_driver.
 	 */
 	if (config->ibdma)
 	// driver needs to be adapted to use isa_register_driver to get a struct device*
-- 
2.49.0

