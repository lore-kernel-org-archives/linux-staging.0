Received: from mail.wantyapps.xyz (unknown [66.135.5.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC94187F
	for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 22:27:32 +0000 (UTC)
Received: from localhost (bzq-79-183-83-88.red.bezeqint.net [79.183.83.88])
	by mail.wantyapps.xyz (Postfix) with ESMTPSA id 758997D63E;
	Tue, 17 May 2022 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wantyapps.xyz;
	s=mail; t=1652826451;
	bh=pd6Vee+X5bKnfkJoQvuv34sp7wFRIFqhfKwqf22xJJE=;
	h=From:To:Cc:Subject:Date:From;
	b=cuxxKNrIYB+sbARwoyzCbW2VM8FAjR+hQgkceYmIpqe4rZZDjvYuo5bxABWkx8LUc
	 VrQgIaJ5hgv58AvoAY/ouXv28gmZDHD3s4KJ8CleUZpyyhL5EtK/ma+WsuENP2P0Tj
	 PpFWhKg5zpIKnxD2ePWdACHDCwYbpLXNZT5+vcn4QqYEDKgRlCJbVB2NTkPhxXdsaE
	 znffAar84pz6SOYYjsl4Rubz/genEvSAMXsscdJSfVQRhBEybNGUWf9kZsDkIObukk
	 fYXDnY52A4FN58lX700DcwqVfRyEkT8bTQPF0rt02XU+gnhKxpAP0aSu9DJ6I6B+wh
	 WHDwhkI0ipSmA==
From: Uri Arev <me@wantyapps.xyz>
To: 
Cc: Uri Arev <me@wantyapps.xyz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: axis-fifo: fix indentation according to checkpatch.pl
Date: Wed, 18 May 2022 01:27:09 +0300
Message-Id: <20220517222710.678033-1-me@wantyapps.xyz>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(My first patch!)

scripts/checkpatch.pl warned about an indentation problem in
the axis-fifo.c file.

Checkpatch warning:
	CHECK: Alignment should match open parenthesis

Signed-off-by: Uri Arev <me@wantyapps.xyz>
---
 drivers/staging/axis-fifo/axis-fifo.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484..51ce48e68e27 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -383,10 +383,10 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-				 (read_timeout >= 0) ?
-				  msecs_to_jiffies(read_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+								(read_timeout >= 0) ?
+								 msecs_to_jiffies(read_timeout) :
+								 MAX_SCHEDULE_TIMEOUT);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -526,11 +526,11 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-				 >= words_to_write,
-				 (write_timeout >= 0) ?
-				  msecs_to_jiffies(write_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+								>= words_to_write,
+								(write_timeout >= 0) ?
+								 msecs_to_jiffies(write_timeout) :
+								 MAX_SCHEDULE_TIMEOUT);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.36.1

