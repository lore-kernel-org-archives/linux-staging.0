Received: from mail.wantyapps.xyz (unknown [66.135.5.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9109134BD
	for <linux-staging@lists.linux.dev>; Tue,  5 Mar 2024 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.135.5.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709673288; cv=none; b=PkU/YNqRpq8Cv4LA2F9pHmq9wxkgsm2rEw8aIvTNn7G+sdVkUhEZtnHVhr8AfPFcQ3L3yunOtYLhNBUUkZBZIVsB1NFvUeLHTo6iMllkYAY58EVAcXDogHRatB6pxrObR9H7lbEI3RKLdg6M1NjhqtguMiKc9766HnheI7NvI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709673288; c=relaxed/simple;
	bh=5UU1/0i5zS6GvWgsS/KRzThBrMJ35VYn0MgQhE8EoMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdVTltPoeTZ1funTmNln+VHPesTJ1LxDRJWG55ZjXxH46jc+DekBl1wVQm9Q2uI5wezh0yeJ09+rss8G78MvW9/SqP8l3yruZ+zgwLNRWEv3Vv+0hcMB+v6cfmZlHyiSS11qgKeBwMCM041qC4hTWrcdZjYMQCDq0kM9RdoTU2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wantyapps.xyz; spf=pass smtp.mailfrom=wantyapps.xyz; dkim=pass (2048-bit key) header.d=wantyapps.xyz header.i=@wantyapps.xyz header.b=TWucwuDq; arc=none smtp.client-ip=66.135.5.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wantyapps.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wantyapps.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wantyapps.xyz header.i=@wantyapps.xyz header.b="TWucwuDq"
Received: from multivac.localdomain (unknown [147.235.203.68])
	by mail.wantyapps.xyz (Postfix) with ESMTPSA id 7BCAF7ED7B;
	Tue,  5 Mar 2024 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wantyapps.xyz;
	s=mail; t=1709673280;
	bh=5UU1/0i5zS6GvWgsS/KRzThBrMJ35VYn0MgQhE8EoMc=;
	h=From:To:Cc:Subject:Date:From;
	b=TWucwuDqup0LmsEC+O3555df1oMRziXwWnYYqtBwamvysZxLL5Stxapx8d7EYjy+a
	 o09hcjyeZtuDKa9cokH7R0HcHY7l7X7YpcOFIqZzTNA3OqM0BC3vkh92vuTCY08P7O
	 8yrO42CvKtg9kPEAW0JmfIDVdz9Wf03/BCRmvHiUfYGOE7ny6R23kzgTCs9qVT4g8+
	 rFPa18ukyRxBPeUwA2eMxtlP14O8KSv4dRNejfB0h2jqrNHhG8cffM+bqpdfyoHvaT
	 Gbdsc+n7/rUGsqU+v/VK5A8plams2PF12/fjjtGUhrnZthzkb7KcoLMgxjb6sZ9Jtx
	 uAOM0BHC8B5hg==
From: me@wantyapps.xyz
To: 
Cc: me@wantyapps.xyz,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prathu Baronia <prathubaronia2011@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yangtao Li <frank.li@vivo.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: Fix indentation
Date: Tue,  5 Mar 2024 23:14:01 +0200
Message-ID: <20240305211416.755911-1-me@wantyapps.xyz>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Uri Arev <me@wantyapps.xyz>

Warning reported by checkpatch.pl script:

CHECK: Alignment should match open parenthesis

Signed-off-by: Uri Arev <me@wantyapps.xyz>
---
 drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 727b956aa231..ab758a527261 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -381,8 +381,8 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-			read_timeout);
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       read_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -522,9 +522,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-				 >= words_to_write,
-			write_timeout);
+						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+								>= words_to_write,
+						       write_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.42.0

