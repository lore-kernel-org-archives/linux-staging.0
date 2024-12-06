Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7411865F0
	for <linux-staging@lists.linux.dev>; Fri,  6 Dec 2024 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733451923; cv=none; b=X3BJN/Mz5x6OsTo1mZAE29kdtR6PHsG1hVDH3aYYEtBUkXvbsgXqcwIdPi93pri9ETv7Vp2D/kMH7/AiH2XNdV9p0npYfoY0HJAnFwm83lpJtMtEN8nZTzO/knggtVubvXWlWbAhNuT2FGk1mHtOEaVxQfnpbgmRTNNLqGBE3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733451923; c=relaxed/simple;
	bh=6CnnYbgX+U8p21U9RlvH4zbAJ+aX2QrLYlLDn+2XfmY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ImtmDPgB1Jxu0AtfaVxwXYE5xKBDO8HQESoZDJTJv7lXbaZmL2T/DWZ99J0Q4NvcKaXU3doW+y8zkrOOB7y7tyoC9qKGv4KJ/xr6jku8cHCIUKTxziaejVUc6VR3svh/nz5AMt6P5I0rRqjuLIuq1Mil6yTnuqRe1r+GEji8Qds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=knCYKS7U; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="knCYKS7U"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1733451913; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=8D+f40Zx8bRgTvqVeFZvLtf/oLeDGcBhqIyVZLlxmCU=;
	b=knCYKS7UEUMhO0SpQbSLi9yudGaWsTWgNcTuMFb49hWja9xDvCQyVMXeHnoV0JzF8Cwql/aVaHnBrTthKZPK8zt/RsXxbpV3e2XPGhndGTK1cKmtCfuTouzqUvYkO3Aa9no0ebLcvMLdg55tWFs5FNdHQuSVoDqmdaa6fDZ7BB4=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WKuncbu_1733451906 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Dec 2024 10:25:12 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] staging: gpib: Modify mismatched function name
Date: Fri,  6 Dec 2024 10:25:04 +0800
Message-Id: <20241206022504.69670-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional modification involved.

drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:676: warning: expecting prototype for interface_clear(). Prototype was for usb_gpib_interface_clear() instead.
drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:654: warning: expecting prototype for go_to_standby(). Prototype was for usb_gpib_go_to_standby() instead.
drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:636: warning: expecting prototype for enable_eos(). Prototype was for usb_gpib_enable_eos() instead.
drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:618: warning: expecting prototype for disable_eos(). Prototype was for usb_gpib_disable_eos() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=12253
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 1a8eb3bfb61c..5bfd8ccfd7db 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -606,7 +606,7 @@ static int usb_gpib_command(gpib_board_t *board,
 }
 
 /**
- * disable_eos() - Disable END on eos byte (END on EOI only)
+ * usb_gpib_disable_eos() - Disable END on eos byte (END on EOI only)
  *
  * @board:    the gpib_board data area for this gpib interface
  *
@@ -622,7 +622,7 @@ static void usb_gpib_disable_eos(gpib_board_t *board)
 }
 
 /**
- * enable_eos() - Enable END for reads when eos byte is received.
+ * usb_gpib_enable_eos() - Enable END for reads when eos byte is received.
  *
  * @board:    the gpib_board data area for this gpib interface
  * @eos_byte: the 'eos' byte
@@ -645,7 +645,7 @@ static int usb_gpib_enable_eos(gpib_board_t *board,
 }
 
 /**
- * go_to_standby() - De-assert ATN
+ * usb_gpib_go_to_standby() - De-assert ATN
  *
  * @board:    the gpib_board data area for this gpib interface
  */
@@ -662,7 +662,7 @@ static int usb_gpib_go_to_standby(gpib_board_t *board)
 }
 
 /**
- * interface_clear() - Assert or de-assert IFC
+ * usb_gpib_interface_clear() - Assert or de-assert IFC
  *
  * @board:    the gpib_board data area for this gpib interface
  * assert:    1: assert IFC;  0: de-assert IFC
-- 
2.32.0.3.g01195cf9f

