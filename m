Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6D0192D7D
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 19:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730748936; cv=none; b=lkvTRwQXAAWcKlE9A3dBlUJxIZeC4Po/CijtJ5I9h9wAGrPEUkOCY2rR9zFk7DsYdq5V93NKIzCm2BocNW0+wVIlppfpojgjEkUkUrI735cMCXJPpeo8Q3uliITnvuPbfv7JtiYhhAnQ8ho7uN7vLG0G/qqBy0meNydgzaIZAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730748936; c=relaxed/simple;
	bh=ZFtbJL/+20zYzI89JpHWPB7xwrBkjkgmWk/C1M/FO3E=;
	h=From:Date:Subject:To:Cc:Message-Id; b=HY+8CTLjKvj0tCrpaAby+066EKjDdWVG8pN+yQSAard4Pb58avKGkLC2n5hsH3pJi2ZGKnpfTCbhy1Dbwi5443p8+RfOGiG6SWzEKlHCWyvBBDOGb7TClJm2QP5fcWaZahFzCyM6YMqVmm/vlkWc+ZHTvwezmP1ra3tZt/CcbCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=S4KL5FCc; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="S4KL5FCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1730748930; bh=ZFtbJL/+20zYzI89JpHWPB7xwrBkjkgmWk/C1M/FO3E=;
	h=From:Date:Subject:To:Cc:From;
	b=S4KL5FCcFr/gex0q+lbnPDhM2rdz22yMRBfR+5iUcU+91DpI/ps08uraldQUmE9z7
	 hhv3k4edvYVfBRaxKq8rA1LFWIe5iRw4hIkabIqPSjH3+8umjhpYOMKYhFEkIPgarE
	 RnJ/Akp+Kocq2o2il5MHLFXqOJrJGP8lHe+0GycHG4ezZh7LkrW5ilNM6tokJ6+bxv
	 mf8bZ+yI+rSGjy1IJvsrLJBjcogtwtKIaBrkpbp+LW9OykPG2cbcElzmqwyAinKa6q
	 LfRbWv8OtGfl1biKpAEnOkjkJokJX7mGoWA5ksFJr1PirCsdYlj4Uh/byzrd5KbqcH
	 ebSlQoVHxa56PcS/Va4gi6i+FISYKMTgWQY5gR00HJLjdxd4AQYGTJP1ibEk9/xy5h
	 us6ibTxkmmMrdkfYvgJ6h0leVf/YI80JzCOy2XY0Gkwb1oao4OpQ+fkvPV7QBcbt7O
	 8bh0dB5kgKqQf5mM5UWaSclVMWuCdn6NH1/okgcvhdhy37DUAYoRDXSZUifg+2vCkl
	 CSWq8jwcijt861vU6NPQunEDP/HQvBRa1GdDgVX+29GVBZgf05j4TV63WUsgSjcy4Q
	 g22UHA8W8Ig5ces+Zd2Ve1/GS4/Ffuidr6x+P12akZDbnJkHnr8ABHz19CtA8muX8u
	 H4uVrT0efe1jb+UF9D3pWztA=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id 4AA8A18DD38; Mon,  4 Nov 2024 20:35:30 +0100 (CET)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Thu, 17 Oct 2024 21:54:47 +0200
Subject: [PATCH V3] staging: gpib: avoid unintended sign extension
To: Dave Penkler <dpenkler@gmail.com>
Cc: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241104193530.4AA8A18DD38@bout3.ijzerbout.nl>
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
 V2 -> V3: add version in the subject (sorry Greg)

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

