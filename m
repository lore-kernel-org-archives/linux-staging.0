Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EDB1F7097;
	Wed,  8 Jan 2025 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327416; cv=none; b=M22/ct0r8bN2W7Ypr71zxpH3qEaVt337bO8fpthJ96oT5hRXTz7QXMVesJpT5Z/GPWUa83QYVsnfJx1gXsom/FfG+YsoefUXEAJnDZLl3876HmBnic1k+FOgUV5ekQ8mMPjIirMEMZXxKCBbmUvFxbJGO642coo33UqDsX0Ztek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327416; c=relaxed/simple;
	bh=KNP4gnkNVodC0hrOJO/PHpGkHZweK1Qz9ot5/Z/UEkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KLFtFTc867t7KI7z+bT0PyZS1BTEGvzk27kdDjq4uUwmoWSmCZKXPd1L4FC02csyF/uBjuDmHf8pJ2A5+C2fz2TvEJmmHGvXL1MseVrpyl1PkG8kJvo7849Mn1uEpSjqnSSyjccIIVV8nT+LbgHMWnXa/xxqYu1QiM7XKQg+cZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dbv0Ispc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dbv0Ispc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B6BC4CEE1;
	Wed,  8 Jan 2025 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736327415;
	bh=KNP4gnkNVodC0hrOJO/PHpGkHZweK1Qz9ot5/Z/UEkU=;
	h=From:To:Cc:Subject:Date:From;
	b=dbv0Ispc1Q3pChJSTMEzt5R/2DGHL7svXz9BL50hSveeqFWIlgmsaN/VkTXQR9alP
	 MoRUNp6eVFtljsFE1Yo9PW0MvqUdOeqFGWnqlbIbBEStGxNKX0Z9AQmDC2V5fg4lOV
	 fydEtW/qQmVQMH1bc25RsL1Srv2bZ9Txjk4HS9pw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	prarit@redhat.com,
	roheetchavan@gmail.com,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] staging: gpib: mite: remove unused global functions
Date: Wed,  8 Jan 2025 10:10:10 +0100
Message-ID: <2025010809-padding-survive-91b3@gregkh>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4435; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=KNP4gnkNVodC0hrOJO/PHpGkHZweK1Qz9ot5/Z/UEkU=; b=owGbwMvMwCRo6H6F97bub03G02pJDOl1Dh91dtY+r13DufbjvHlrK5j1u7I/THnIkyG05n7Di yKfECf5jlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjI+iiGedYdeh/XTTTPffJW 6/jB6vIHy378qWeYw/HtD+O8zllStdtb5yhkpOtVfQw6AwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The mite.c file was originally copied from the COMEDI code, and now that
it is in the kernel tree, along with the comedi code, on some build
configurations there are errors due to duplicate symbols (specifically
mite_dma_disarm).

Remove all of the unused functions in the gpib mite.c and .h files as
they aren't needed and cause the compiler to be confused.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202501081239.BAPhfAHJ-lkp@intel.com/
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/gpib/tnt4882/mite.c | 69 -----------------------------
 drivers/staging/gpib/tnt4882/mite.h |  9 ----
 2 files changed, 78 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/mite.c b/drivers/staging/gpib/tnt4882/mite.c
index 90341f8c394e..ea64dde46bcb 100644
--- a/drivers/staging/gpib/tnt4882/mite.c
+++ b/drivers/staging/gpib/tnt4882/mite.c
@@ -148,72 +148,3 @@ void mite_list_devices(void)
 	}
 	pr_info("\n");
 }
-
-int mite_bytes_transferred(struct mite_struct *mite, int chan)
-{
-	int dar, fcr;
-
-	dar = readl(mite->mite_io_addr + MITE_DAR + CHAN_OFFSET(chan));
-	fcr = readl(mite->mite_io_addr + MITE_FCR + CHAN_OFFSET(chan)) & 0x000000FF;
-	return dar - fcr;
-}
-
-int mite_dma_tcr(struct mite_struct *mite)
-{
-	int tcr;
-	int lkar;
-
-	lkar = readl(mite->mite_io_addr + CHAN_OFFSET(0) + MITE_LKAR);
-	tcr = readl(mite->mite_io_addr + CHAN_OFFSET(0) + MITE_TCR);
-	MDPRINTK("lkar=0x%08x tcr=%d\n", lkar, tcr);
-
-	return tcr;
-}
-
-void mite_dma_disarm(struct mite_struct *mite)
-{
-	int chor;
-
-	/* disarm */
-	chor = CHOR_ABORT;
-	writel(chor, mite->mite_io_addr + CHAN_OFFSET(0) + MITE_CHOR);
-}
-
-void mite_dump_regs(struct mite_struct *mite)
-{
-	void *addr = 0;
-	unsigned long temp = 0;
-
-	pr_info("mite address is  =0x%p\n", mite->mite_io_addr);
-
-	addr = mite->mite_io_addr + MITE_CHOR + CHAN_OFFSET(0);
-	pr_info("mite status[CHOR]at 0x%p =0x%08lx\n", addr, temp = readl(addr));
-	//mite_decode(mite_CHOR_strings,temp);
-	addr = mite->mite_io_addr + MITE_CHCR + CHAN_OFFSET(0);
-	pr_info("mite status[CHCR]at 0x%p =0x%08lx\n", addr, temp = readl(addr));
-	//mite_decode(mite_CHCR_strings,temp);
-	addr = mite->mite_io_addr + MITE_TCR + CHAN_OFFSET(0);
-	pr_info("mite status[TCR] at 0x%p =0x%08x\n", addr, readl(addr));
-	addr = mite->mite_io_addr + MITE_MCR + CHAN_OFFSET(0);
-	pr_info("mite status[MCR] at 0x%p =0x%08lx\n", addr, temp = readl(addr));
-	//mite_decode(mite_MCR_strings,temp);
-	addr = mite->mite_io_addr + MITE_MAR + CHAN_OFFSET(0);
-	pr_info("mite status[MAR] at 0x%p =0x%08x\n", addr, readl(addr));
-	addr = mite->mite_io_addr + MITE_DCR + CHAN_OFFSET(0);
-	pr_info("mite status[DCR] at 0x%p =0x%08lx\n", addr, temp = readl(addr));
-	//mite_decode(mite_CR_strings,temp);
-	addr = mite->mite_io_addr + MITE_DAR + CHAN_OFFSET(0);
-	pr_info("mite status[DAR] at 0x%p =0x%08x\n", addr, readl(addr));
-	addr = mite->mite_io_addr + MITE_LKCR + CHAN_OFFSET(0);
-	pr_info("mite status[LKCR]at 0x%p =0x%08lx\n", addr, temp = readl(addr));
-	//mite_decode(mite_CR_strings,temp);
-	addr = mite->mite_io_addr + MITE_LKAR + CHAN_OFFSET(0);
-	pr_info("mite status[LKAR]at 0x%p =0x%08x\n", addr, readl(addr));
-
-	addr = mite->mite_io_addr + MITE_CHSR + CHAN_OFFSET(0);
-	pr_info("mite status[CHSR]at 0x%p =0x%08lx\n", addr, temp = readl(addr));
-	//mite_decode(mite_CHSR_strings,temp);
-	addr = mite->mite_io_addr + MITE_FCR + CHAN_OFFSET(0);
-	pr_info("mite status[FCR] at 0x%p =0x%08x\n\n", addr, readl(addr));
-}
-
diff --git a/drivers/staging/gpib/tnt4882/mite.h b/drivers/staging/gpib/tnt4882/mite.h
index fb84eaa83de3..d49c348a1c80 100644
--- a/drivers/staging/gpib/tnt4882/mite.h
+++ b/drivers/staging/gpib/tnt4882/mite.h
@@ -61,15 +61,6 @@ int mite_setup(struct mite_struct *mite);
 void mite_unsetup(struct mite_struct *mite);
 void mite_list_devices(void);
 
-int mite_dma_tcr(struct mite_struct *mite);
-
-void mite_dma_arm(struct mite_struct *mite);
-void mite_dma_disarm(struct mite_struct *mite);
-
-void mite_dump_regs(struct mite_struct *mite);
-void mite_setregs(struct mite_struct *mite, unsigned long ll_start, int chan, int dir);
-int mite_bytes_transferred(struct mite_struct *mite, int chan);
-
 #define CHAN_OFFSET(x)			(0x100 * (x))
 
 /* DMA base for chan 0 is 0x500, chan 1 is 0x600 */
-- 
2.47.1

