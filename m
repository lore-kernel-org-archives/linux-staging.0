Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E620607A
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077334; cv=none; b=cPZ/bERv7voP8q3QS4aCu/G8bYS0fgEWM1jsAxtbGpfjoJZvoiDLVhRNc9eHu9/ALF0IFZyXvI1NR2fZXREyNFSXk7YC79thYnPzlJNZ+ZfsNpvoXy9u2kDkAr1h7+7YPgIqNSvooIJIWLEs6cX68w/QHysY2xmdfwx1ZAe6nzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077334; c=relaxed/simple;
	bh=Zezb+lmZIB6+LRPhR8aicc6IGXHL0+DnZhspCfFXGqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wtx2e3yCesvv3IIWK6rIlJeyc0rxOG56EYFIC2W+64iNn/xIpWzWHCZHnfzNhick5RawLOrTb+YJ6K/T78siIg/eyitRLhjRwjA5RmpRPy4e59+547qixA+agDbs/znn7zkiKGkEH04Tlw3Mb3z+iVQS83wkphLp4QIhYltjRPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZFDBEWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZFDBEWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FDCC4CEC5;
	Wed, 16 Oct 2024 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729077333;
	bh=Zezb+lmZIB6+LRPhR8aicc6IGXHL0+DnZhspCfFXGqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hZFDBEWxYy4PxiCg81fWLLKF64iFy6WinWlDfR1fpa9HKyKbwjWZj0deZ9zegNOS8
	 glkTZpcV6DLluIxvbfnT6CM+qlOVONqswduWo0woe7w6uuTmfi5BPaBnQjbXAwFWcU
	 bkp3ieKv4dC0ryeKvQ6eYOa87YqXQaSPv0hQ3ojqLxH2Cie8Q/4mX31j5CJ6vdsLcZ
	 5ZksvRQEXfUpp9YG+4/qE9kQjl5Zx1/+dNTZNPCDNh2rk9NL0m8uLOMhXslqb8MTlT
	 Ty87VNQOj+8Hs6Cv6KzvJADRxElP8PKE7NT41M0uXnmkgh8HXYgLqZ8NwFQ9CDZmXC
	 0SZSAEfYwWRjw==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/7] staging: gpib: pc2: avoid calling undefined dma_free()
Date: Wed, 16 Oct 2024 11:15:17 +0000
Message-Id: <20241016111521.1143191-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016111521.1143191-1-arnd@kernel.org>
References: <20241016111521.1143191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On architectures that don't support the ISA DMA API, this causes a build
failure. The corresponding dma_alloc() call is already in an #ifdef,
so use the same one for dma_free().

Note that nothing seems to set PC2_DMA, so parts of this driver
are likely unused. ISA DMA usually does not work on PCI or PCMCIA
devices, only on physical ISA slots.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index cd70cedb4899..7b3b34f47341 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -462,8 +462,10 @@ void pc2_detach(gpib_board_t *board)
 
 	if (pc2_priv) {
 		nec_priv = &pc2_priv->nec7210_priv;
+#ifdef PC2_DMA
 		if (nec_priv->dma_channel)
 			free_dma(nec_priv->dma_channel);
+#endif
 		gpib_free_pseudo_irq(board);
 		if (pc2_priv->irq)
 			free_irq(pc2_priv->irq, board);
@@ -596,8 +598,10 @@ static void pc2a_common_detach(gpib_board_t *board, unsigned int num_registers)
 
 	if (pc2_priv) {
 		nec_priv = &pc2_priv->nec7210_priv;
+#ifdef PC2_DMA
 		if (nec_priv->dma_channel)
 			free_dma(nec_priv->dma_channel);
+#endif
 		gpib_free_pseudo_irq(board);
 		if (pc2_priv->irq)
 			free_irq(pc2_priv->irq, board);
-- 
2.39.5

