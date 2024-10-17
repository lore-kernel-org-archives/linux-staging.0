Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA531A9B42
	for <linux-staging@lists.linux.dev>; Fri,  8 Nov 2024 20:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096733; cv=none; b=n0g4z/iIQOqKoKcwtZNl5JEXX4TyEC7dKhw10FNFYRuwL3zcdxpGUtnfZpqtWhTK5L+FlkjBNC70YWOgZFTd1SFdMHHqwDqkWUqFwRTUsR5M5k/O8upfyJ/58kR9/uNtNuMe4UCBTVLXNNAX9CMyyx7aTHpbIlVxVcOFOKUKZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096733; c=relaxed/simple;
	bh=Zz47wOHgHmm2yDzKouhF+ZC8npzotgEENpjnRWNZbac=;
	h=From:Date:Subject:To:Cc:Message-Id; b=BemfDql4XKr18MJjOuWxVXafB4yMnH1hUpgy14kOitosjdlbUrbuSNCeFp7zS5ywPe0pz7LmIc/Iw+rI2N9HWB2hpX9GYG8F5krJV7ggaWFsRPUvBC4R2CX6xpM/OZlGeb+IrjuvqjWwrPi2gHmYrGcDSjLMq9dHpGKjIfWZT1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=b6UJrJIV; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="b6UJrJIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1731096727; bh=Zz47wOHgHmm2yDzKouhF+ZC8npzotgEENpjnRWNZbac=;
	h=From:Date:Subject:To:Cc:From;
	b=b6UJrJIVRDAIiHztQOcOaOpso8vhSa4Nr/6ydoLUADlvrdefpwVgpBTGnPxKPpr4w
	 LlfcoU8a5CBz8YoMrKIFJVzWOopXZlD6/mSZ3CKGcQ8ksNX3tseeUStXHKwQWKJFPW
	 c1XHwlfqLcVPs3Jz77CBQiWVQQExz9YDHOXQEayN1QOISDPWEyS7eBX9idlb6SCKFS
	 F8FrfWimFMLfUxyGNdl8YRAQxmmWjn9W37L306Onbem1LD2UlyzkaI+SZCDGSNza4+
	 5edXBv/lboM3Ypa2qt5xYTntucETTBb13X8KQSviDmGzPR5Q4AS6fbyYl82PvEnZU6
	 NQyQ80lADAIBzXSMxnML0Cm4oRdCIwDR+Nyrxy15LPfu9jyu7rOMkhiovm+cPzepRh
	 V9H4gnm4BpBgnGJgdGqBp6egZshypriF6tUYa3qcxtv+0RIh8MIRk/Gg4cCMCO4F1R
	 YIsLdvHXDAj7SO3vtoISqyMWP1wATdZuZigLG/J9rL2SbRjKFT2IkN3QOFL5ykAL3r
	 v1g0/itdaZBo5CTTf9cE0iHusSu4RDBd++zEEVLiWVHXIxsj0YXa2vJkRulOvOJQZV
	 zV9kjv8YqIcp+fF9OcnbOu5eEJwIci66NGQLs0ceTaYix9O3g8usz5xQs9ayoT7M1A
	 8jEV4JRipZx76S+XSgnS/yJ4=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id 1194F18DDF5; Fri,  8 Nov 2024 21:12:07 +0100 (CET)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Thu, 17 Oct 2024 21:54:47 +0200
Subject: [PATCH V4] staging: gpib: avoid unintended sign extension
To: Dave Penkler <dpenkler@gmail.com>
Cc: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241108201207.1194F18DDF5@bout3.ijzerbout.nl>
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
 V3 -> V4: rebased onto GH staging-testing

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
 	return 0;
-- 
2.47.0

