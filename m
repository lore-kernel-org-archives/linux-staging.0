Received: from mail.wantyapps.xyz (unknown [66.135.5.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2221874
	for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 21:39:39 +0000 (UTC)
Received: from localhost (bzq-79-183-83-88.red.bezeqint.net [79.183.83.88])
	by mail.wantyapps.xyz (Postfix) with ESMTPSA id 416AF7D632;
	Tue, 17 May 2022 21:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wantyapps.xyz;
	s=mail; t=1652823189;
	bh=77TXRvsh7hWaErTGymOW8BHXjkBr9MyPIBb/1lV4nz4=;
	h=From:To:Cc:Subject:Date:From;
	b=pMNaTGFYXkBbzqBR4ubjPKA7zfgD4zYfUvj1SE7As1PbnFh7XB3Owi4Rs34pL8+ay
	 1v5gDAaSI00IEEWLkGRjq56Z8HGATGDr4Rx1HQNh8tA9q1T+SDs6E1tPnHoqoiAqmt
	 iq5ZUPecBIv9YV+AiqnevFZHeU8WqKRZAm5s6cav5W0+z8ImBXqHt6UI4t8yARG+V6
	 qqPoICzto2NMz9j4EMTUAE3wX8f9m28VD8wElew1fIT+fl90SPmz+VtR+pdbM2lpon
	 QGLOk8q1nObTij2r6PZNYVxIteRbphoErZRwGExyw1SCw+9r0G8rtIcFnSgtsv5YFQ
	 3+lx1sMlvg0vg==
From: Uri Arev <me@wantyapps.xyz>
To: 
Cc: Uri Arev <me@wantyapps.xyz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: fix indentation according to checkpatch.pl
Date: Wed, 18 May 2022 00:33:01 +0300
Message-Id: <20220517213302.671148-1-me@wantyapps.xyz>
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
the axix-fifo.c file.

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

