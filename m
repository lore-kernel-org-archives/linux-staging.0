Received: from cvsmtppost18.nm.naver.com (cvsmtppost18.nm.naver.com [114.111.35.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF94392814
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312137; cv=none; b=GC2P0MwCyBrufmcK/FKoFklY5Mal0yUxjPVvge2sQGqSaYymz1C4q1BdfyjVegwZUHmMr47xeUMvDCVtoxRhEIUvnGDJWWNjmsynf7FCsHIWxCnBW6JJjPAwVNwbObeBJi0P3F4AjDLDAaxpF1hpo/qYtkuYr7ySgIsj0xTcRv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312137; c=relaxed/simple;
	bh=DBy4fXrwF7D1/9v4t2RP+30eJ7Y4adDfQ9rWzyZuD9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvUXH4Fhg7Y9qT0QYgKLKvJzrzxnz8YZdSeCSjmeBOjB+l+rHDb7/WNB+z+C2tPJV5Si2OIGZwds/BmUJajfxRymRZ84fMRcFfUqVCblQrCxEY1BGrHYXaS2q65WkGOF8FBihigkQmOgpEbml/88JQPEthMsvteMioCeyCvXdU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=LZ0Gw+ZI; arc=none smtp.client-ip=114.111.35.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="LZ0Gw+ZI"
Received: from cvsendbo036.nm ([10.112.24.44])
  by cvsmtppost18.nm.naver.com with ESMTP id f+1PODriRuq1CgBlBJp1lw
  for <linux-staging@lists.linux.dev>;
  Tue, 13 Jan 2026 13:38:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768311526; bh=DBy4fXrwF7D1/9v4t2RP+30eJ7Y4adDfQ9rWzyZuD9I=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=LZ0Gw+ZI9wRgyylwHHWrDdu/40nI7nhInO20fGjmRIyi8HsEzbGYB0MgpMkJhFYr0
	 bywqOgqYQVIW+UjHVoIO+Dr5fPb2SyWnzclWutOyEOxaq7LCYV2W7q/or6PIFsR6rQ
	 t6iL1RVMtzCqfIgR4H8MMkKMdS5es8IEB54UH0vg46+ydneRgVfYzvM/n++fZgWOpf
	 A9SZdCJtQcqY8PDnpLVt6JGClmkNDC79sBXSggNCtzYjgdL6dekyEYQfD0OiZdguCC
	 F30abb0Nk7y6TE8rr0o52X+cmuHEE46tGV8x2he2UTkOxo+CYsB/BuOIg5EcRkjzNo
	 SAmp81T7SYzLw==
X-Session-ID: wCFF+3gDR-CZX8m31Z4vCA
X-Works-Send-Opt: 6/Y9jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: fqnXKo2rFqJZ+HmrKoul+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp008.nm.naver.com with ESMTP id wCFF+3gDR-CZX8m31Z4vCA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 13 Jan 2026 13:38:46 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH 2/2] staging: axis-fifo: Use bulk I/O accessors for data transfers
Date: Tue, 13 Jan 2026 22:38:31 +0900
Message-ID: <20260113133831.3422480-3-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113133831.3422480-1-s9430939@naver.com>
References: <20260113133831.3422480-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual for loops with ioread32_rep/iowrite32_rep.
Add axis_fifo_read_data() and axis_fifo_write_data() wrappers to
encapsulate these block-transfer operations.

No functional changes intended

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 525156583c4a..9663d2efd411 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -150,11 +150,21 @@ static inline u32 axis_fifo_read_reg(struct axis_fifo *fifo, int offset)
 	return ioread32(fifo->base_addr + offset);
 }
 
+static inline void axis_fifo_read_data(struct axis_fifo *fifo, void *buf, int count)
+{
+	ioread32_rep(fifo->base_addr + XLLF_RDFD_OFFSET, buf, count);
+}
+
 static inline void axis_fifo_write_reg(struct axis_fifo *fifo, int offset, u32 val)
 {
 	iowrite32(val, fifo->base_addr + offset);
 }
 
+static inline void axis_fifo_write_data(struct axis_fifo *fifo, const void *buf, int count)
+{
+	iowrite32_rep(fifo->base_addr + XLLF_TDFD_OFFSET, buf, count);
+}
+
 static void reset_ip_core(struct axis_fifo *fifo)
 {
 	axis_fifo_write_reg(fifo, XLLF_SRR_OFFSET, XLLF_SRR_RESET_MASK);
@@ -259,10 +269,8 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	while (words_available > 0) {
 		copy = min(words_available, READ_BUF_SIZE);
 
-		for (i = 0; i < copy; i++) {
-			tmp_buf[i] = ioread32(fifo->base_addr +
-					      XLLF_RDFD_OFFSET);
-		}
+		axis_fifo_read_data(fifo, tmp_buf, copy);
+
 		words_available -= copy;
 
 		if (copy_to_user(buf + copied * sizeof(u32), tmp_buf,
@@ -378,8 +386,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		goto end_unlock;
 	}
 
-	for (int i = 0; i < words_to_write; ++i)
-		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
+	axis_fifo_write_data(fifo, txbuf, words_to_write);
 
 	/* write packet size to fifo */
 	axis_fifo_write_reg(fifo, XLLF_TLR_OFFSET, len);
-- 
2.43.0

