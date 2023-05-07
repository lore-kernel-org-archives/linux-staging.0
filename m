Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471417E5
	for <linux-staging@lists.linux.dev>; Sun,  7 May 2023 00:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2F0C433EF;
	Sun,  7 May 2023 00:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419442;
	bh=FSScn70I0FrCmoPEWpXBnjE7oYUiMOfDx7KbUz8by2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oA7IfJFqvPjtwHKFKL11Nuf9euXBnOqHx31jlC2dVCV3OeIqJSGUCXe6oV95ntG34
	 Mb/C4mxUCCEtAe6NNZL5FmHT2Xt5TVrntB1xUHgtm1GhZxRqfd4TRWT6ZbSGfJfvaf
	 xenMqkwZeDcocZLEgDCkJRAFlPwx2oxlcQCl1KR/KAkyvtW8Nb17cqCLKsZ7nABUyg
	 TOT3IhsPTiPPPMjMdlt75kcoCtaqux2GGj4iYTvmCoXg3qDCV4piYMwoR4JCoujWgK
	 mxl/wW9NOIFl3EVfVxesgtbDi+w5+xJawYHOBwIPbEWFyvH14FqOdIh1PG8g/uUrnF
	 zsJyJQk8XXqFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Khadija Kamran <kamrankhadijadj@gmail.com>,
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	u.kleine-koenig@pengutronix.de,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 6.3 05/24] staging: axis-fifo: initialize timeouts in init only
Date: Sat,  6 May 2023 20:30:01 -0400
Message-Id: <20230507003022.4070535-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003022.4070535-1-sashal@kernel.org>
References: <20230507003022.4070535-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Khadija Kamran <kamrankhadijadj@gmail.com>

[ Upstream commit 752cbd8f191678e86aa754f795546b7f06b7f171 ]

Initialize the module parameters, read_timeout and write_timeout once in
init().

Module parameters can only be set once and cannot be modified later, so we
don't need to evaluate them again when passing the parameters to
wait_event_interruptible_timeout().

Convert datatype of {read,write}_timeout from 'int' to 'long int' because
implicit conversion of 'long int' to 'int' in statement
'{read,write}_timeout = MAX_SCHEDULE_TIMEOUT' results in an overflow.

Change format specifier for {read,write}_timeout from %i to %li.

Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
Link: https://lore.kernel.org/r/ZBN3XAsItCiTk7CV@khadija-virtual-machine
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 28 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484b..0a85ea667a1b5 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -103,17 +103,17 @@
  *           globals
  * ----------------------------
  */
-static int read_timeout = 1000; /* ms to wait before read() times out */
-static int write_timeout = 1000; /* ms to wait before write() times out */
+static long read_timeout = 1000; /* ms to wait before read() times out */
+static long write_timeout = 1000; /* ms to wait before write() times out */
 
 /* ----------------------------
  * module command-line arguments
  * ----------------------------
  */
 
-module_param(read_timeout, int, 0444);
+module_param(read_timeout, long, 0444);
 MODULE_PARM_DESC(read_timeout, "ms to wait before blocking read() timing out; set to -1 for no timeout");
-module_param(write_timeout, int, 0444);
+module_param(write_timeout, long, 0444);
 MODULE_PARM_DESC(write_timeout, "ms to wait before blocking write() timing out; set to -1 for no timeout");
 
 /* ----------------------------
@@ -384,9 +384,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
 			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-				 (read_timeout >= 0) ?
-				  msecs_to_jiffies(read_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+			read_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -528,9 +526,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
 			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
 				 >= words_to_write,
-				 (write_timeout >= 0) ?
-				  msecs_to_jiffies(write_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+			write_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -948,7 +944,17 @@ static struct platform_driver axis_fifo_driver = {
 
 static int __init axis_fifo_init(void)
 {
-	pr_info("axis-fifo driver loaded with parameters read_timeout = %i, write_timeout = %i\n",
+	if (read_timeout >= 0)
+		read_timeout = msecs_to_jiffies(read_timeout);
+	else
+		read_timeout = MAX_SCHEDULE_TIMEOUT;
+
+	if (write_timeout >= 0)
+		write_timeout = msecs_to_jiffies(write_timeout);
+	else
+		write_timeout = MAX_SCHEDULE_TIMEOUT;
+
+	pr_info("axis-fifo driver loaded with parameters read_timeout = %li, write_timeout = %li\n",
 		read_timeout, write_timeout);
 	return platform_driver_register(&axis_fifo_driver);
 }
-- 
2.39.2

