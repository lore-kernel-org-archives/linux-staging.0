Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB7733C1;
	Mon,  6 Mar 2023 20:52:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso9090335wmq.1;
        Mon, 06 Mar 2023 12:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678135963;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aJCxiJZWerGesLMxoiHiSQbzXq2ZZwY7rYAIRdf2Ow=;
        b=gcUrahBEEiK3lB9tcDO/XZO8WeBNXUpgDFlATbPAT5MXeiSwMCN6aklVbGYYHiF1WN
         ryuaitWiehrmvmA2eJZGm6zXEam7Hf0uvUCxNaVqczc8WGNtq9lVqU9nRcD0cV78vV2V
         arQurw56NnxeKsJsh053moE14OtP2kuiYSKEDJmDkI7dsB9aS3JhzOnHKkIyfmidxid4
         QEzZVAFZr00OO/wfycjW/n0scmZH1bU2sHbuhBYu0+dkPOlKANPwk3Ryjl1+bR7dNtof
         L9j5IZMvkskqjq8ogJhEvTKYgZqx6QDnCvjCrs+iBtCdZYqF6Ft4RpfberVlGg7r41wu
         CEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678135963;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aJCxiJZWerGesLMxoiHiSQbzXq2ZZwY7rYAIRdf2Ow=;
        b=MqIi3kH11Tjz5d8Yz6/h07lyQOJhTbecAoLWmXW0euTWYVjvkB6R6sVL+IfOa3meis
         gCgpCMmjhZFejSP6cQ1NzBt5mtP28bCHzrIr1e0xbE+VRIHVIbtzzb52hZkuEKkpo51x
         5yUsSSTdLBVsCX5yRYxfpfqdBN1lSkGvdJU6u4TF7Vzb1Axc6Agf29qf47YIY3Bxph7m
         wA8UXcY13E3OcLj34LH8tdSeRFKx1rSMnes/i5R1Vmfv2AUfKtUIg7ooG/10SiM+IIxI
         LqJo/FSywJwluUhZm5WwX24ANwK3/3iiXRvQ8vzD8CvPuJOR+feSpmN6QO0cujB1YU5u
         l0Zg==
X-Gm-Message-State: AO0yUKUu2imBH49dV7whp17llFBEzY+hIXesjzcv546fPvw+GNTNVxMZ
	ZL8JqM02n4sjcbQ3wveXiww=
X-Google-Smtp-Source: AK7set9ckL59axzNSlfpGNFK4YFTFflF6EN7ZhEsDsE98Hg8WI/WSPJBBXK0tTDbPjsN73pI6QUY5g==
X-Received: by 2002:a05:600c:3c90:b0:3eb:2b69:c3c6 with SMTP id bg16-20020a05600c3c9000b003eb2b69c3c6mr10510232wmb.1.1678135963365;
        Mon, 06 Mar 2023 12:52:43 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b003db0ad636d1sm16213303wms.28.2023.03.06.12.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 12:52:43 -0800 (PST)
Date: Tue, 7 Mar 2023 01:52:40 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: alignment should match opening
 parenthesis in axis-fifo.c
Message-ID: <ZAZSmPpB6fcozGa4@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In file drivers/staging/axis-fifo/axis-fifo.c the alignment did not match the opening parenthesis. So, a few tabs were added to match the alignment to exactly where the parenthesis started.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484..6e959224add0 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -383,7 +383,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
 				 (read_timeout >= 0) ?
 				  msecs_to_jiffies(read_timeout) :
 				  MAX_SCHEDULE_TIMEOUT);
-- 
2.34.1

