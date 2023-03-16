Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EDA3D7B;
	Thu, 16 Mar 2023 16:26:19 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id x3so9827584edb.10;
        Thu, 16 Mar 2023 09:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678983978;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tq9EloIOrvY5/fg4afrdweAWwminMwCYXdVtfBekJJE=;
        b=cw3rjSEGK+0p/49S3Xj1+e7O2ekfejgTU5RjO5XdZQtqtn33Yh/B3oKpY3XDhJwkV4
         yFRH45tK1yixf57tFZwFOAmujjqqwUrBSAOQvu83BrSCZEbBC3PDC4BnswQt5YSAOYxd
         eywb4L+27uqmoQIZeb5Yn2uSV+yUvXyix+TUlWALlSn1GI3mzVQmHrGXrjnDPzzpMtTV
         bKRILpSGTVSvJd1YGmIhz8ZT05cW6BKCxvZqhAAE5sm4yzeiRw3+hkzyOt+hSWcxQreo
         AfLUeOwBxxpMHJd7gL8ujcycVPG3mXvY7lhCOzLopMAQU7C78g7lhB87qc8UZqgb381H
         gJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983978;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tq9EloIOrvY5/fg4afrdweAWwminMwCYXdVtfBekJJE=;
        b=kYQ2DKgIDla/uPLhgB9jktyUAblBW01y4dWkYfWX3yyfKbLflCVnv9oRChjlyzviWp
         uPWW7wNPU0YDBJ0Wr9GfYjskFJRD0CfwlYHS+mDndNqJN1SC/I6RmavZa3bxNtPR1Rcf
         K7+uXTFAH4QIpRsL3MpVyST/5nR6xW22DvwcyTfNgX0nJCPOhHzDEqhSwvmHDSB6VG6V
         KwI30o41qyE0SiIgLYNcBQCZiVEF3MKkk7ctvCMAAquH3vcnBeXDbcgOG09u0OP3nTNa
         QYL5d+nXPgWCPxUcvWhCFbv06l2Y/9hPHSgvLKWSJhdFEdks54cXUcEW3QjTp6/GgkDd
         6MNg==
X-Gm-Message-State: AO0yUKXs7VFwR1dzSIccodAf+8Y+nvGp6dZKYdJJMgW+qk911/pBi/eB
	fyCK8wzpHf2MUowjLBpTPsM=
X-Google-Smtp-Source: AK7set9Vw7B+XWw8ayTWXYyKCvtT84Uld87Ok1F8mAjj713LfTnYbPEZxxmNfkipMvifLKsr+DgUxQ==
X-Received: by 2002:a05:6402:1507:b0:4fa:4a27:adba with SMTP id f7-20020a056402150700b004fa4a27adbamr164329edw.22.1678983977591;
        Thu, 16 Mar 2023 09:26:17 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id g24-20020a50d0d8000000b004fd29e87535sm4052660edf.14.2023.03.16.09.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:26:17 -0700 (PDT)
Date: Thu, 16 Mar 2023 21:26:15 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6] staging: axis-fifo: initialize timeouts in init only
Message-ID: <ZBNDJwFHE3vIFS3+@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Initialize the module parameters, read_timeout and write_timeout once in
init().

Module parameters can only be set once and cannot be modified later, so we
don't need to evaluate them again when passing the parameters to
wait_event_interruptible_timeout().

Convert datatype of {read,write}_timeout from 'int' to 'long int' because
implicit conversion of 'long int' to 'int' in statement
'{read,write}_timeout = MAX_SCHEDULE_TIMEOUT' results in an overflow.

Change format specifier for {read,write}_timeout from %i to %li.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---

Changes in v6:
 - Initialize module parameters in init instead of probe function.
 - Change the subject and description
 - Change format specifiers of module parameters to "%li"

Changes in v5:
 - Convert module parameters's datatype from int to long.
 - Link to patch: 
 https://lore.kernel.org/outreachy/ZBMR4s8xyHGqMm72@khadija-virtual-machine/

Changes in v4:
 - Initialize timeouts once as suggested by Greg; this automatically
   fixes the indentation problems.
 - Change the subject and description.
 - Link to patch:
 https://lore.kernel.org/outreachy/ZA4M3+ZeB1Rl2fbs@khadija-virtual-machine/

Changes in v3:
 - Correct grammatical mistakes
 - Do not change the second argument's indentation in split lines

Changes in v2:
 - Instead of matching alignment to open parenthesis, align second and
   the last argument.
 - Change the subject and use imperative language.
 - Link to patch:
 https://lore.kernel.org/outreachy/ZAxNYw2rFQkrdtKl@khadija-virtual-machine/

Link to first patch:
 https://lore.kernel.org/outreachy/ZAZSmPpB6fcozGa4@khadija-virtual-machine/

drivers/staging/axis-fifo/axis-fifo.c | 28 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484..0a85ea667a1b 100644
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
2.34.1

