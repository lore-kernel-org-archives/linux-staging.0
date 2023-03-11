Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071307B;
	Sat, 11 Mar 2023 09:44:07 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id e13so7169222wro.10;
        Sat, 11 Mar 2023 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678527846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FV3s4pRBe/SsPDvS5hXhpiciVp3uptiHsH3lqLkU2zk=;
        b=Uio34FAeq2YHxBhU4bvnf9HFokRxjfOB1qJ4O+FDUqpT7UFH5A3z3c2eZjy9eTp5OU
         I6Ce+mpoMMRnfdlz4yiTDYqiolPpw0sVKhvfXxPo8YP0eMMwQreZtDnJg2p4Ap8lfImU
         wRrrss4iuZvEFxps7e1GMS4IfgFCrWRJC5l8jvHx9T6xMP2PBS3zC52pbdfMu9YtjP4P
         /x7sHF/bgCRjTWt+TlRFTrQ2HRF7IdrPYj17jr0LutGMiri38LjuzyOEq+85hxbwCdMb
         ipEoKBTMWp2ha/cCVcSOzPfhE4KkGl7JvtjqBKTOEr+mq+RCZaIGt9iXxHo2ZOkYBdx1
         e7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678527846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FV3s4pRBe/SsPDvS5hXhpiciVp3uptiHsH3lqLkU2zk=;
        b=H6y40TkgrpPqCALlf8nIxvmQ6hDLg7DFwoU4VVlfVtlRIMeNFZem44NQ18b/WfhOl6
         9bVnX280krlLz7gKGGF9EYy/ssTFDhCEqYbVCHU+AJ5WfYdPnsg1QTe+JaPXfWTbj1Qd
         3p61c9jCKuAUcFYXjgtJMRxD8VUTcXJFRsDi9RW/El2fTP3teQxo+qRhnGojalKeMBwl
         LkSOltIxBccdbJR0RJky1Gwkss7rD7ZN9cNybxBoKBdrTkYDwR/ZENrhG4fdHu293Jux
         ppRUrglE27jdpe2FCFa+DUa0HwXVS3oPieSM/jKyx+n4BqDhxj461g6rRmQ2H6d/1xIr
         ZJNQ==
X-Gm-Message-State: AO0yUKWSsa964HNeYuywVPB0d0i5qbNf7KTqAoQv10mzlzvpPmWfKPLu
	TTz0kgIcbDKuiGICHoWqwvL23GJOyHMKGo92
X-Google-Smtp-Source: AK7set8pmYj4u4FDqLSBl8UQeoIicOm93KMCFaxkMKEuR8FNwIXgVOxfFt+1AVDWvaX/17Aqb2v/Nw==
X-Received: by 2002:a5d:6641:0:b0:2ce:a825:e0a1 with SMTP id f1-20020a5d6641000000b002cea825e0a1mr253556wrw.14.1678527846108;
        Sat, 11 Mar 2023 01:44:06 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d60c4000000b002c6d0462163sm1967663wrt.100.2023.03.11.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 01:44:05 -0800 (PST)
Date: Sat, 11 Mar 2023 14:44:03 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: axis-fifo: remove tabs to align arguments
Message-ID: <ZAxNYw2rFQkrdtKl@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In file drivers/staging/axis-fifo/axis-fifo.c, in line 386 and 529, last
argument is indented as it were an argument of the second argument.
Remove tabs to align the arguments.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
Changes in v2:
 - Do not change the alignment of second argument
 - Align arguments so last argument do not look like an argument of the
   second argument.
 - Fixed two instances of the same problem

 drivers/staging/axis-fifo/axis-fifo.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484..fbb3ff59dc7c 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -384,9 +384,9 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
 			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-				 (read_timeout >= 0) ?
-				  msecs_to_jiffies(read_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+			(read_timeout >= 0) ?
+			msecs_to_jiffies(read_timeout) :
+			MAX_SCHEDULE_TIMEOUT);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -527,10 +527,10 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
 			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-				 >= words_to_write,
-				 (write_timeout >= 0) ?
-				  msecs_to_jiffies(write_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+			>= words_to_write,
+			(write_timeout >= 0) ?
+			msecs_to_jiffies(write_timeout) :
+			MAX_SCHEDULE_TIMEOUT);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.34.1

