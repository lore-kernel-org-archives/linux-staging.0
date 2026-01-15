Received: from cvsmtppost11.nm.naver.com (cvsmtppost11.nm.naver.com [114.111.35.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014DF26CE2D
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 02:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768445135; cv=none; b=tt1aWVwRzhPn75hOHl3pF4qzk4dJe/CO5KLg/dWU1kHaHd846+AgH4MvRLKbS+LOPKrmki9lUCvdg/iqS5GBCn4ZoeZMbJylmvrJiHFGBHTSWAdFN7KgL3+Qeh08+dbRL9fo6+f3rOPcYQOmtKOP/VZDAEiZmjise4OqSGMK3lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768445135; c=relaxed/simple;
	bh=MtZrtguzjRwjhFUdVbr5NFdQVMDFgYdISxc6yraRwoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lu9iZlI/WI+OkrZ+INF58D/3bmgJoVeeP0BTSYUx+DsSkfGMAZBoh2140CaOHWsRIAW4IutIXMYlnVofnUgcwSaUMbl9tfY/ENhsOu9HJtE8HD8NMhnrrKjcdsKDZq6q8l05+2uKsa1M992FHls9WFbX+8UP9uzzZ9W567+Hfgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=gBZEDnk8; arc=none smtp.client-ip=114.111.35.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="gBZEDnk8"
Received: from cvsendbo020.nm ([10.112.24.40])
  by cvsmtppost11.nm.naver.com with ESMTP id 36rDQ2HSTaenQEZjn8ZzOA
  for <linux-staging@lists.linux.dev>;
  Thu, 15 Jan 2026 02:25:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768443917; bh=MtZrtguzjRwjhFUdVbr5NFdQVMDFgYdISxc6yraRwoQ=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=gBZEDnk88cyrbZevmIGejKm8CYT6bkNE8dOQ9cwvfKkE4hu/8uyLRPmq1M5GOawKO
	 6DBIsnq3MMe7A5W+3e9yaeP1G/TZ7FADCorzFtWrCuRxTKoiEsaC8F60kWK/3hcpin
	 3agQJMCbv08GlWW7ZJhopO9a41nYYRwtOBhqrBFt/G4Ezb+kDLjSW3gR8v0PCwfZE9
	 /JPapcebXgQyLKaOz23DBbOyGjf/t3xcBjZhP/6FiJwWBWTcb8S+knoM1kC6qzNqvS
	 yGBD8pNwxanO2h+PT+LL5UGIzCftVksZMX+jCNofC9mNkRxCmIizn6F8lO8ojyZebX
	 +7basp2ZwppFg==
X-Session-ID: nDxqJB0QTMK0KVj8dqUJ7g
X-Works-Send-Opt: B/YrjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: sZbwFA2rFqJZ+HmrKxEw+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp003.nm.naver.com with ESMTP id nDxqJB0QTMK0KVj8dqUJ7g
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 15 Jan 2026 02:25:16 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v2 2/2] staging: axis-fifo: Use bulk I/O accessors for data transfers
Date: Thu, 15 Jan 2026 11:25:09 +0900
Message-ID: <20260115022509.3038062-2-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115022509.3038062-1-s9430939@naver.com>
References: <20260115022509.3038062-1-s9430939@naver.com>
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
v2:
 - Remove unused variable 'i' in axis_fifo_read() to fix build warning
   reported by kernel test robot
 - Add Reported-by and Closes tags

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

