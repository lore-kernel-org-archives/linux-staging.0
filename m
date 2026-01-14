Received: from cvsmtppost06.nm.naver.com (cvsmtppost06.nm.naver.com [114.111.35.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3262396B8D
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 13:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768398239; cv=none; b=MLpPAA58Wnk+nlJuaVbQJbZdKZnidY4TDjARDEOJj4kYJ7BS75ygAVFmoIv5EgMhh9r2F+BvuurjeUIxj0UNe8kd/bQAJp0m3nalP8kY/qH504gfBuKWQXYEkufaBYXFY1r5KYItrf20SKBKU9CPQNSCuP2JYEqVsw8FkrxBfIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768398239; c=relaxed/simple;
	bh=sktD+fAC2F91+swTtx9f4TiC1ZXTyZMGs74BMzhOJZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wc7bUExN0fDiSeC72B0+TzoxB/Vb04+J5P9PZzxoUtWs6H99DcWSWIxMydbTY4RXL2RSdrQJe7aF7AnR1xRn9UsgPucau94Fp4cLsK7AkCrf5sClteKHt3PN7S0fjC6eOqYOFHuNXeat/Qv8pVDuyFoHIthhmV2K5Zsz/MS8AzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=WPqoU+TE; arc=none smtp.client-ip=114.111.35.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="WPqoU+TE"
Received: from cvsendbo022.nm ([10.112.20.47])
  by cvsmtppost06.nm.naver.com with ESMTP id eRnWDb8nSOuCeIPKjSkYEg
  for <linux-staging@lists.linux.dev>;
  Wed, 14 Jan 2026 13:23:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768397020; bh=sktD+fAC2F91+swTtx9f4TiC1ZXTyZMGs74BMzhOJZs=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=WPqoU+TEZUo5rVX1zwUxiic+TbMpq4XiNuyRMaodh3lqcFhL0nyyfJDCKJkdjD7f0
	 VULEx6o/i8OGrpr8VgqU7TpI/UJrUTJq7mAWcO1wxC/a5w0/Na2wLbWnL4yNXPeHDI
	 jG02dd5rsx9lXg4Fwk7+Ajq5idfY2Hi0ABg06geKYsUS2saWl4b3g/rhxvS8YZLUmi
	 N10/giTUUN2KV+PIfbRWG24Z8MGqi8gV2x1brLBJ2OFaguuhm7oSZASrNEiVidbBkR
	 GwRGv1Ljfxoa0uHORwiskP6Gvl2TSpzRxBeuhz2wtK6vrNi/3uQLJFROifFnfHGgyd
	 bca1Zf08OnUiA==
X-Session-ID: ZhG-ljDsT72zyVPpA+efWg
X-Works-Send-Opt: B/YrjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: fZKrKq2rFqJZ+HmmKoMd+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp005.nm.naver.com with ESMTP id ZhG-ljDsT72zyVPpA+efWg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 14 Jan 2026 13:23:40 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v2 2/2] staging: axis-fifo: Use bulk I/O accessors for data transfers
Date: Wed, 14 Jan 2026 22:23:17 +0900
Message-ID: <20260114132317.2901972-2-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114132317.2901972-1-s9430939@naver.com>
References: <20260114132317.2901972-1-s9430939@naver.com>
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601141928.CyFxDTEk-lkp@intel.com/
Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 525156583c4a..009333cc398b 100644
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
@@ -190,7 +200,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	unsigned int words_available;
 	unsigned int copied;
 	unsigned int copy;
-	unsigned int i;
 	int ret;
 	u32 tmp_buf[READ_BUF_SIZE];
 
@@ -259,10 +268,8 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
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
@@ -378,8 +385,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		goto end_unlock;
 	}
 
-	for (int i = 0; i < words_to_write; ++i)
-		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
+	axis_fifo_write_data(fifo, txbuf, words_to_write);
 
 	/* write packet size to fifo */
 	axis_fifo_write_reg(fifo, XLLF_TLR_OFFSET, len);
-- 
2.43.0

