Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F436201271
	for <linux-staging@lists.linux.dev>; Fri, 18 Oct 2024 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729280376; cv=none; b=d05zvAdFCCBEcW6gaXo/CbMRoYMTP1qk5pbUtupI/CUH4PUUy4lkBXyjr1s5J4dcVBb/WTu4wu1CHaTSVX/m/qbx15xnKAEU9TUtH0usoNXxexR2z0jk0MBSxpIng/x/wOWrxBxfTYKVEFsNEBjhYeCp4UWOcJNj+0kU+fvCg4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729280376; c=relaxed/simple;
	bh=nlXauVRJF3vaKluGQ+28NGRUV6/Ut8HyqyH9H2fE9oA=;
	h=From:Date:Subject:To:Cc:Message-Id; b=rlpF40S+xaOEnrUEQttrsTHihQ1njLvK5H4xeGskQwlTJKw0YhRmeEnKYqH8seKfUqVhnrL7L3gIMKvTFuINu8QXpGXDNsbZqLQi704JgxLs5v6OPKFy+9IWJZfUUhIX1z7V4+g+FUvHpIoio7NXKEs8CTKy65wAIj799epG9og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=fajJlMWE; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="fajJlMWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729280364; bh=nlXauVRJF3vaKluGQ+28NGRUV6/Ut8HyqyH9H2fE9oA=;
	h=From:Date:Subject:To:Cc:From;
	b=fajJlMWEKtRYtY+bLZsZUnvGQQaUq+WDkj9+UESeuldX+lrpYirAY43M42tOA2B5v
	 LXS0vBOltgSBsegDcWLLd8dQ0wh0iVjaBvdwCAgtug02Ec44flu8SjNiewMa1MPyTj
	 6UW1Iuf6XoC/i69fanmfXH/km+aarxp7qSAIWGiBQ2iTQ0SFQ2BUG6BdJy8vfvRZs/
	 0Vi0AIlyDLluJYDl1Tay+Ep4eyYYTnwkCcrh/HaigrzAsYoMvyOlgUmrKdM/rpjk2X
	 yukecw7Ze/XGGhIKh9oSHgJVRXB8ccwulHKOQb82nVu6igKnV2e4CKhj6i6U61W+0B
	 0nez+WgPCl5tqE5cUkqEAobx461CKDQRM16wGd2CsIkf1WJYQLBMnNoAdhLspilypu
	 Bc2BqOn1IlNX61MPrC6/kEy7L0sQIrIzorZWb8X3xLv1w5aGzYRkYIHE0GO184uMXE
	 9pNmGFVsKNtkz3AG/k/w5788LZd7pG2uT0/uYc7HI1rkyPryGdsLprlK7ML1OMTsCC
	 GZiN9Em/ZZQNx4qcMfvw2n4b4dJmAXpMuVPSFX0wtJyaIBWiXr4dAT6bAvQbyaefbn
	 QvmSvupZ+YUsN1O1miqfUJhuafBG+M7doPeXkSh7qpDvMyNZL9A6SpBkBZ7bDnLiso
	 00fsYca/cKo3lu2qM1FgVhAU=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id C90B818DA4C; Fri, 18 Oct 2024 21:39:24 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Thu, 17 Oct 2024 21:54:47 +0200
Subject: [PATCH] staging: gpib: avoid unintended sign extension
To: Dave Penkler <dpenkler@gmail.com>
Cc: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241018193924.C90B818DA4C@bout3.ijzerbout.nl>
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

