Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A31364;
	Thu, 16 Mar 2023 12:56:06 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id eh3so7172157edb.11;
        Thu, 16 Mar 2023 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678971365;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UKr1qsXJxqHfL2qoSt+e2Xhm1LFVtiuaM0seViPHEAo=;
        b=arNV9UwSbZYpITku6wwvlp/FUeeVBMqFeoRLFnjo2TXtJ18clqJ9dKsY3jr7r0561e
         Ht8A4keNm0wcBpdX+gAHODnSEFPx9whPvWshU4dyYeUQR22PsjFU57f0sYMkQnT4Q6E+
         o9oEQ5SlByHZzoRvQk09gUEf/Et2mht9hqlefDqvv92Dvr99rEDTL6gHcQfN9XGpRTKs
         r78Nq6lRyx1seBXFSjwjUuDtsxeoAqZzi/yAXFLsXO0fTVqBaHya25pkPE2NTGRDXs5w
         o2RxlrNBcajbpLkU9+C0clSUlCzriDsM7hNxOtxsfxHYjC/svz992A+KReKo7EIKI5la
         muCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678971365;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKr1qsXJxqHfL2qoSt+e2Xhm1LFVtiuaM0seViPHEAo=;
        b=clv8zlpu4vXHYRfXfSzA0Q27MrU2WK90nJ7cSvHI9OPm9qsR16qttm/eunvCFJp5yx
         YUC1K99Hz+PQNd6V6aurVkgf8+ZM2rr0y/RIN7i5jacILowJmuIn1X/HyVgXRU3qVSRn
         qUUo6hKRTt31MnTpslhzQU8KFFch1ZhpBaTSxPbOnCssWw96ha/Sqie+4iTZAX7Dceuo
         7HbzcFur8IsGVY4IhXV6OAuzSWJDw4oskY8+w67Fcs2l4Tdsz25XLmZicVz04sXP1+RD
         K0oNjmeLP56i6yMS4NMJy2de32MHuYAQxpca/FXgpIWuga3s0fsMqjHhqOi1bq21fk2H
         mV4w==
X-Gm-Message-State: AO0yUKXfTRI46ibyKFIw6t4DwyxD8XNobuCufakJVBfaZd7v2SWkttfz
	1awafklyyPiiivNgTYxvgGc=
X-Google-Smtp-Source: AK7set+wUaR4/UnZnJSg6mGPPXhmikMxp16QqTCz0Y2ViL4Oxx33Bo12qRES/s8CG0tFE9XtDvja5g==
X-Received: by 2002:a17:906:14c9:b0:8ab:4c4:d0f6 with SMTP id y9-20020a17090614c900b008ab04c4d0f6mr9795606ejc.56.1678971365077;
        Thu, 16 Mar 2023 05:56:05 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id w20-20020a50d794000000b004fb30fc1dabsm3825184edi.96.2023.03.16.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:56:04 -0700 (PDT)
Date: Thu, 16 Mar 2023 17:56:02 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBMR4s8xyHGqMm72@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Module parameter, read_timeout, can only be set at the loading time. As
it can only be modified once, initialize read_timeout once in the probe
function.

As a result, only use read_timeout as the last argument in
wait_event_interruptible_timeout() call.

Convert datatpe of read_timeout from 'int' to 'long int' because
implicit conversion of 'long int' to 'int' in statement 'read_timeout =
MAX_SCHEDULE_TIMEOUT' results in an overflow warning.

Perform same steps formodule parameter, write_timeout.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---

Changes in v5:
 - Convert timeout's datatype from int to long.
Changes in v4:
 - Initialize timeouts once as suggested by Greg; this automatically
   fixes the indentation problems.
 - Change the subject and description.
Changes in v3:
 - Fix grammatical mistakes
 - Do not change the second argument's indentation in split lines 
Changes in v2:
 - Instead of matching alignment to open parenthesis, align second and
   the last argument instead.
 - Change the subject to 'remove tabs to align arguments'.
 - Use imperative language in subject and description

 drivers/staging/axis-fifo/axis-fifo.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484..d667dc80df47 100644
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
@@ -815,6 +811,16 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	char *device_name;
 	int rc = 0; /* error return value */

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
 	/* ----------------------------
 	 *     init wrapper device
 	 * ----------------------------
--
2.34.1

