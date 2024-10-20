Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE75C2C6
	for <linux-staging@lists.linux.dev>; Sun, 20 Oct 2024 19:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729452168; cv=none; b=uUJ4Uc8ekh4OBteWdGW9b6rnB3cXL1+ahww0JjCfOgfluFF/5NJC8ywUZrg8FxUt2t1GdPewjb5Q/JHqWyfr2oiKHyDhcZ0Jms2E9Izdqirpn+YDQFpUQLHEmbkQZ3H4RvOBji1bQB7VoER19L9E/FWb1kwuZkw6bt1jhl0yPZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729452168; c=relaxed/simple;
	bh=trxEgoO9OnfKxSsLvAM1O2cKIL6cT1wZJkI6LItEOMA=;
	h=From:Date:Subject:To:Cc:Message-Id; b=dO0DSVI5HxnadOnnWKLMhwst63le589z5GY54fcyX1FBfdoMrTqq6PbZl5bksQvn3hP6CNpQcOcVUR2PwnBSvq32x04NPZkXUOueR6QVPunMI66bTveNh7Ffn+JRALxympv9EdPWxf3CRAvsiGYCEWYzEhyQ5DwHTFDsOtQARfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=TMTb+/bi; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="TMTb+/bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729452163; bh=trxEgoO9OnfKxSsLvAM1O2cKIL6cT1wZJkI6LItEOMA=;
	h=From:Date:Subject:To:Cc:From;
	b=TMTb+/biBU7yjp5R+RjPuxgfjghtUvWP5KjOdkzMrnHx2qHUJ4xRA+RnfG6BX2PyP
	 +T5I/CmspAB5iDHU0Q/77xTHGa7OLJdt0OhZvZQfe4/bfsfqe5VMj17/wNQWtW5Zbg
	 qQTfBOS+dpGkPn+39FvCCPbUwoVVInOugaq1MmB0PgKVA2AXZWbX3j3XCylpqfSMil
	 l+EW1SQEVxmefW1kyWxnIoh35CsOoXKcMgZqLqb1geYZQ5ekm9d4k2f+GMN9BoYzvG
	 1TjwagbQUiTZfijAUTLVy44tBF1Y2Ol/P+b2VfFPDIfG8IVECS1Od77NUpm2LPGAgI
	 RlIiCHdRQ+7S9bcOhKWArFpywUf2DsnVvYARG+H3GdEEwGD9+Ey+evBhCtXP7gEXts
	 S10vsEcDWrsi06d28qty7mn++4PbqLGlAZt2VtABw/DL/uOASoivQPaWePdGHNoXtM
	 6HK39iyrIN4Vp98K4MTRh3AyNKNCqx63ndkL3NOY5RmJgT/ItYIxxuNDYsouBAJ4lv
	 yhnqetohek8XqKQrXb5JBjZ5b9v0rTGg2ttRsj9hvIp1qSvA92tU1JSIM6GafNV2QI
	 SBY5FzFbisAl4K8jF/QijO+nhrFaLxHcxVp0i3bqDAb3PqTMooWBbZy/PJRoot1rJs
	 F+Kiwnu6LY53NIPphrzQ1LxQ=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id C6A0F18DA7F; Sun, 20 Oct 2024 21:22:43 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Sun, 20 Oct 2024 21:21:43 +0200
Subject: [PATCH] staging: gpib: Add missing check for NULL
To: Dave Penkler <dpenkler@gmail.com>
Cc: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241020192243.C6A0F18DA7F@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This was detected by Coverity, CID 1600787

Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
---
 drivers/staging/gpib/common/gpib_os.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index d5860a0a131f..57ff1ed30dac 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1667,6 +1667,8 @@ static int autospoll_ioctl(gpib_board_t *board, gpib_file_private_t *file_priv,
 		return -EFAULT;
 
 	desc = handle_to_descriptor(file_priv, 0); /* board handle is 0 */
+	if (!desc)
+		return -EINVAL;
 
 	if (enable) {
 		if (!desc->autopoll_enabled) {
-- 
2.47.0

