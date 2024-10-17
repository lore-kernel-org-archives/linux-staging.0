Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550F9645
	for <linux-staging@lists.linux.dev>; Sat, 19 Oct 2024 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729363555; cv=none; b=Ed2/fAApE2HmHumDmB3p5plT4BEkrNiSFD4FA7yBmumeZhuGc18Z/6ATTs88gXspFAN+Pkk5iKS/twR+Zk+zXalvDpYqw1n4FI16os8m+ll7qdxALlVmzy+D5HhL17+35yevdd9AVTIQZEB3BNiY47cu/F+Lfa7Kd1O+l2dWTRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729363555; c=relaxed/simple;
	bh=Fag2OUPRneNbvAf6D7CEXV9hZAEjFSRco5jZ9UP9O5Y=;
	h=From:Date:Subject:To:Cc:Message-Id; b=ToyAwsBPdGCxPJ+/S5hIZvZ47frbTF89mbEOvH/nyzJZSPAfrzFnUQ04FWM/gbN4xd1MGLDOUv3RtYcaZhMuiMghn1H5whSKWj2Q1gCZdepK6Kbkvoe0FMOJkXIHRyJ10GKe5m5oQ5VkQfNkor4c3Qcbq0mN8JxyQa7fhSK7P3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=dNNW2her; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="dNNW2her"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729363550; bh=Fag2OUPRneNbvAf6D7CEXV9hZAEjFSRco5jZ9UP9O5Y=;
	h=From:Date:Subject:To:Cc:From;
	b=dNNW2herllBd03XNdAs4eX+FCPpEQedMI75O1nlamQ39cD/282GEqd/XuOCxQrVL2
	 YMaTXgijPRe0UNs7IhUpS1oCF42GGuRriVH2ll5KnZgu2uWK60fz/OdgdStnDkLONJ
	 hWejz57vSADr4yh/c0DYO1pOrrG9gcu5JRgW3FyEJc9tr2fHKtqC64h5V5KgPk40C+
	 ujHEOVZPsixypZiDqly5k6Fbjz+k3LNOZPOEXjaglK5kjebD2686a1L1X7YjcN98vO
	 uWlyRvtWDw39WxP+hMwDZZpFu4aL2I1YyPM8rrzjaqUWKolkDnT7A7a0wumb8Pe7Za
	 v7IuXbj3t0wM01/YG3kDfVTjFtEHQ71rgn+qSP8HANYdfTKDSjbnnqgftldzYGQZ7N
	 Xo5CwvwuZv/FxiI9iWPxJcPKW8UTQE2CIJwK6uzkQkSG/mcuVH4xwAdTxm4iV98Jtr
	 PyY3x3oIJBwGBaGY5AnigqFGA7lZGSvgsgE21OWCTxk8592tx4qPQSMvnhTlscwz66
	 u2GUxPTRpnKQYtZ/iqcMKqF4h9ibAaSNevLPCBlidm1ERPU/G7CIZiF7w8/Inph6sO
	 ATbaJzZcO3aIPDUX29yzMucTZ+1y75GvA4QJlvno6A0sZUJou6DxtLnzB/geNa+QH/
	 dl0umEX7df7s9qMVpv6nHpRE=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id C44F518D8CD; Sat, 19 Oct 2024 20:45:50 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Thu, 17 Oct 2024 21:54:47 +0200
Subject: [PATCH] staging: gpib: avoid unintended sign extension
To: Dave Penkler <dpenkler@gmail.com>
Cc: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241019184550.C44F518D8CD@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The code was basically like this (assuming size_t can be u64)
    var_u64 |= var_u8 << 24
var_u8 is first promoted to i32 and then the shift is done. Next, it is
promoted to u64 by first signextending to 64 bits. This is very unlikely
what was intended. So now it is first forced to u32.
    var_u64 |= (u32)var_u8 << 24

This was detected by Coverity, CID 1600792.

Fixes: 4c41fe886a56 ("staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver")
Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
---
 V1 -> V2: Changed commit message, added Fixes: tag and a reference to the Coverity CID

 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index bbc7e8866872..f3a1b81be22d 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -679,10 +679,10 @@ static ssize_t agilent_82357a_generic_write(gpib_board_t *board, uint8_t *buffer
 		kfree(status_data);
 		return -EIO;
 	}
-	*bytes_written	= status_data[2];
-	*bytes_written |= status_data[3] << 8;
-	*bytes_written |= status_data[4] << 16;
-	*bytes_written |= status_data[5] << 24;
+	*bytes_written	= (u32)status_data[2];
+	*bytes_written |= (u32)status_data[3] << 8;
+	*bytes_written |= (u32)status_data[4] << 16;
+	*bytes_written |= (u32)status_data[5] << 24;
 
 	kfree(status_data);
 	//printk("%s: write completed, bytes_written=%i\n", __func__, (int)*bytes_written);
-- 
2.47.0

