Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534EF1E0093
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188928; cv=none; b=Loa2GOCHIJDztEUqnPMv/qpCI1sUAKUueVCzmmv77eOTuKPYBcqsW8ivNn9dw7bt0Et6yKPQHGmXhgYv20fRHHQ4D4zgi2VxuALc423WZOjXU42q8gkcCAeKtGkSJVzThBFv1GOrjHffjpPVf71sWzlkoI0T0x9/8v9DddkRCaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188928; c=relaxed/simple;
	bh=97223miK528afWzLObqgTz+YySWavoxlzDv1Ft+0LxA=;
	h=From:Date:Subject:To:To:Message-Id; b=e7368+zhxQLmQKKaVTdmWqFXZ8CcN6/llTtvjYdlg3EFSS3vF6Wad4otYsV5KdPYjh0Rjom9dT+8DUT8iXbyU7jBBhfxBmzM0WyHz70W7UsmRTvBK6rxZQErfmjTpeOZCFIbv2Ym+hsMVvKTUxMZojh2WAr82+emuuw4LSLgOJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=kAzf8vrR; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="kAzf8vrR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729188922; bh=97223miK528afWzLObqgTz+YySWavoxlzDv1Ft+0LxA=;
	h=From:Date:Subject:To:To:From;
	b=kAzf8vrRkU2POPcF5qTxqJAa7IPjwkHQbAW97y+YTDhusLsc3Yykj8uxNTDA4AR2w
	 otcjDsx/67QJWta7C3N2OSJO62DbQDXNhZqvvCZYmn+y5sIBMFPnwPt3aBfgEBUv+O
	 QKyvUVlgUA2ZsO0DMB440/aOc0b4H33qDe6W6pMY5mQDU2Hwf9Xu8wxW0GFD6BgFY5
	 eOHgsjX9ouNgtiF+flsOmxksl/835iZ27Nk+YT1AXc7xzI2mUPQWze82dTWyzOovpu
	 CSyiUh58UkTEs+RqOQKyENYueRvR/CVrtGCMQ4jjYrMGoR+tK2oYMnfwG/FmAHY25Z
	 5WMcpOsmw8EdQmnUCXvqlJQLXmnHc1qujjxbsYNBX8LjRJ3uPkWzdFRhbJkzG2Gb3z
	 zU6K9nSxRg7fW3/BuCuK/z9WE40RF6+lStV1mfD53IK5P2gDuIgevA+b44zBCXItoz
	 /N1hey9EmNACw+ErIrAmYmmjPw2F2VEDrml7f3B8S9jfS4p/8UXXFrC7pFk9mSuAB5
	 K2FsjCsaRkU2MK62eJeJhMzaNnfLv5l0FwebPCSRnnDjYydevft4bCdX9qLKjFbL7b
	 aIgKzDqCDG/3/7mWNQYBaVFc/dyNjBDOLzaORWYdh1/R7WOPc2zQDbHTMl8iyeUTy+
	 dZeub6JToDn5ni4rIv9HCp5E=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id 7798918DAF2; Thu, 17 Oct 2024 20:15:22 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Tue, 15 Oct 2024 22:45:58 +0200
Subject: [PATCH] staging: gpib: ni_usb: Move kfree after last use of in_data
To: Dave Penkler <dpenkler@gmail.com>
To: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241017181522.7798918DAF2@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

In ni_usb_read() there was a kfree before the last use of in_data.

Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 1da263676f2a..75f39e1f3ed1 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -690,12 +690,12 @@ static int ni_usb_read(gpib_board_t *board, uint8_t *buffer, size_t length,
 		kfree(in_data);
 		return parse_retval;
 	}
-	kfree(in_data);
 	if (actual_length != length - status.count) {
 		pr_err("%s: actual_length=%i expected=%li\n",
 		       __func__, actual_length, (long)(length - status.count));
 		ni_usb_dump_raw_block(in_data, usb_bytes_read);
 	}
+	kfree(in_data);
 	switch (status.error_code) {
 	case NIUSB_NO_ERROR:
 		retval = 0;
-- 
2.47.0

