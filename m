Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0E8154BED
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729194958; cv=none; b=NgLApakbdTQGdufPz1TCbKfPYFjnAP7uNqTeo6GccUUloqJmS2CuPrclWoimxfrARFFFuwo0Kvc4vNm1XZ3hB75V9H4TEIiN7SCARe9fg4DUdanrP3izK6tE31dhBcrfKYIGm0C4vgFcGd08HWtq3Fd/uBDk/+qIEeUMHVz5G/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729194958; c=relaxed/simple;
	bh=UsuF4IKuZM6EfRTIo1MqOejrHhZMmACeZbJ6VP9h4+Q=;
	h=From:Date:Subject:To:Cc:Message-Id; b=ipCCekiCgR9UKHztB0S5EAqRg1XvDqzO9UQlarG93idxOwV3bTvSsZWAW35LgEKwZS+mYCUXnyPJuB/zD5xTDsXJ/98EGk95gaM5ihrVfAt2NMhMQuhX9e6dfKxaydnwY+XBn5/LO+L3cRZh+ubiJx4dJcyMQhLzz4Cff6Y5FrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=mQS6Tnw5; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="mQS6Tnw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729194951; bh=UsuF4IKuZM6EfRTIo1MqOejrHhZMmACeZbJ6VP9h4+Q=;
	h=From:Date:Subject:To:Cc:From;
	b=mQS6Tnw5TkCVk54unoHjNM5TLOiKOr08gfvHCoyWnQhKOIl0YVJB9VNPL3IW4pL+i
	 ROwhkTEZXwbCFr5o0Q21hrKr/ythJd0UbAdAo/+AEM261hGlfkKUFM9PJ6OctO33ss
	 2eQ+wu8tXWnuOdteHPESwLoiYsfl7K85qj/DCxvbTFAKHMFSYfKiUrCj1oG0wPyAcp
	 34zALbTu6ldAQ+pIglNDL8CZ5JIQlAz0ToizGNi4FofhHx156SZqpCLkPzzPFcor3p
	 HGKiEjdO4co7naM2IXb8ewp+3G3NZ0OisNX/c9XO34TmMsSFHzUT0PHSyvv/p5QKp+
	 oPZlvxgnJm1yXOVXOK7lJScun72HPRIETKOy2xEG3BEFzzXavQCAmb+X/nRIIC+kqW
	 S+LKIvV8qbZqlyu5+WkpWR3F4HCbbkoKmAR2+4hu0JM2jdNmwyH4sYP8+HYZPA7/RO
	 klDGgbCeqo/P7bPJ/Di419t/EOythmCAwh9TfAZAds0V1pkn96n1Kz6bQB+n0O5KVY
	 UMcw6Pep+QTk9rmi90zdMM3A4KvXPXjg0Gioe4sNbfrxKLz9MZZIek8PooWAScI+ZH
	 9HKVbQ873rp3gX/rWsRHWlwC834xFsAZoBpo/lbZeSnzjsGyliAmWkr/stjAcMjzje
	 fmjityVJN5pF6PGmxipvBnIg=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id 04E1D18DAFF; Thu, 17 Oct 2024 21:55:51 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Thu, 17 Oct 2024 21:54:47 +0200
Subject: [PATCH] staging: gpib: avoid unintended sign extension
To: Dave Penkler <dpenkler@gmail.com>
Cc: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241017195551.04E1D18DAFF@bout3.ijzerbout.nl>
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

