Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC81133F8C6
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338814; cv=none; b=BSketFd7jRw9Bm7rsvfV0OOQOvsDxN0HCpGs2KqnUXgdySjei5TNTGR6MSxKwtYVEVnTuk8DyNYXbpSaTrQ+NoLygTEpDUlp3k4aASanxTSWsuuxmDvYRCBHrkdSt+60AazhrYyGZikM0QuzRz937lVT6F5gEnjDTCVXeHzwCns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338814; c=relaxed/simple;
	bh=xEdulICAQQaGAnN7lxsmdZe/mC6OaMPUotX4BsRNBwo=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=raFjY0/wwKuwE4NT4LQN400eR5p4FhWfiA5WbCN4gZc8MyEu+oynGwX3/8V2p661lT++gAFXSY+RCB4eV3Yn8kvKSIvY6eAn1aZiDCObol+Kpkw7nzXwJcqKsRVZMp+jxXMzTv4pBwIxfH4T4s1xiqQ2JrrYguKFryBz1ehTacc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=yUDHsfZX; arc=none smtp.client-ip=203.205.221.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="yUDHsfZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1776338808;
	bh=kCt9y9olaq2sL4pkdVC9asd8Jg52NfvHbCRP3rRKBTc=;
	h=From:To:Cc:Subject:Date;
	b=yUDHsfZXtSfmuoEN5asuhD/yhSOHgsnbgzclmoJ7b0oI0sIiFbyHMIQQe4H+bwQLT
	 //MBaF06crUgbTP/a6YEhf7djkkL0V8Om6htjCzbq/XEmkkxqDahAiUN4bfpjC4mVD
	 m2V4ZApyhG7ubCqRI1DNcR9DObrYc6A5DUlt7NQo=
Received: from DESKTOP-M81V2AK.localdomain ([221.214.70.127])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 6A283E0D; Thu, 16 Apr 2026 19:26:34 +0800
X-QQ-mid: xmsmtpt1776338794t6x1m75kr
Message-ID: <tencent_E645C114ED280A65BC2FD65D8698F196A305@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25G0VFD8m9CJoyyUi65yJW+HQRtU/Cek8cBORQtG9RHMXdjnuYelA
	 P+VQxBApEl06wKnjne2rU/SfjnDXvYGaWMsuwLfv8xFRM+DkJG0E/8YyqDJB8NIiVuK7t8tiUz0s
	 +K+obeN/AZrlNCTX+ZkxvASp7HfhqKK0YDlQX2wqVS/mwG4Na2WM8ozbHghVrv6W+4rKIbCgeQVY
	 nXaJw/i0aeOINa2zq32syFTej8IRz8wbuJyHIA4DWEl+8u13ZFlBn5xqNXWnOIBZA92x1+hkWlMQ
	 Lph3xx973qtZtGgejDK+74g2kg+H62tPDZKeXGNnjGaPuMgRFmsx21lgIt9bh/6uQ2xEsm31ENbr
	 0UIh+hQEO8+9LqApKXIkZfe2xQzR8AOwNfme5WJQPpdOE88klAIgEMDl/XaL8Bg8Fwtw6XJ+ESAl
	 smGdNcIG7HB5ZfdoN1DdiQqnwnxQu/vuvCBzDPVA81nwVnJssxxY2U/uGmQHf05mcO6uqbigSZF0
	 oxWZpX9VEGR1gY3NX3H0n77U78z6CvZvKvXnuTGMtDmBPTcveYqmAzYIppHW90TcW9NKDrkSV1OQ
	 MivldSR5jT7K2dV30lDWcY/KlSf1qfnFVgvE/7QQ7RSCW8VuUEaZr5nx/i5OVOrLXFFaYs+Mw4m4
	 bC16WknS5xuP/bve49WH0qEveBNzTB6EWj73QKzUkCqvig9JaNtTMENgJmtfwpYJk4/GVrl+3n/x
	 AttWAOcb+6i8lU/GRZDdJqgmfq4MmuAnaLhM3xURR0idsIkOfCV33HanAMHZVBdaaIPYPBpzejBh
	 yG170aRdkjLhB0I63RWEAABJmp8t2E2BDkob4r8WYdUpDJF6XZ0QmBfP4i6xtOH/p9CV/tZ3DHOw
	 /JKQs1xyGVLL6AsjrrFrFhSjfHVM326PQPXbTutSSiTDP5+ih+7olUSBKb5j4qXqQ7RI+02RRm6/
	 QPGOB0o8OlJACe121upBxyoZ1vjkoaeYMIr8i+tWHK6i55vEhSfTkiwGuK50x4tMMmFY+rTT8BIL
	 NKMsQu3yiJaoW/FcFizXpf6gTH07hCduVDc06rlk9wDQbiEO6P/iIVzKHPBLh7yGGCfSL/pSHx+2
	 rm/ZnluQcovrXUaCU=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Xinhong Hu <tp5092@foxmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-kernel@vger.kernel.org,
	Xinhong Hu <tp5092@foxmail.com>
Subject: [PATCH] staging: axis-fifo: align write wait_event args
Date: Thu, 16 Apr 2026 19:24:36 +0800
X-OQ-MSGID: <20260416112452.108215-1-tp5092@foxmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The axis_fifo_write() wait_event_interruptible() call used different
continuation indentation than axis_fifo_read(). After matching the read
path, the second line exceeded 100 columns, so split the condition across
two continuation lines.

Reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: Xinhong Hu <tp5092@foxmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aa90b27197cf..aac2c58ef9b3 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
+					       words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.43.0

