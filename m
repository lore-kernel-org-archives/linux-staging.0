Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F86D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 16:12:08 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id y18so2472014wrn.6
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 09:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=aXJMkbHYuGwBccedw3JgWsefWKqhfd6TEzDaHSegUOk=;
        b=R1KnRH95esdS9oJngTJiNZ2CatqOweuDjwG7YueIAq4yybD/VqsfZ7XUCxLdZdV6E4
         EgCwKrBgJakPq7fABuDUdxThqaCjFwI+J0xkoC3TYzYF0De073O6zoat8QwcVZzCMG6l
         Qw8yzziCKkwuhe3bq1f6I2Cs3c0VMl26WY5EnMT9BstwjrQsRMCGIYBPBUBljreJ9upE
         +U8Fx16+sZxpq/7UNpd012yPcJ6kSHJAmeAnD+2CbXpGp1W8AqEsO8+HLlTNqXlp7Sk+
         yHNusFxLGV27vhSQcfcjfAlr4WwAry0e/9qLEkAAk4i/6McwwdFrKKVjsuT0gGdZfdn/
         laQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=aXJMkbHYuGwBccedw3JgWsefWKqhfd6TEzDaHSegUOk=;
        b=X10ZMQ6rV8OEj38thU6CXEhwyi3zxFTazujgzpYEa9YB8HMiHnEilPJyZ1B1bOO8qH
         cTHZVMWsfSLuzR9MBBI+KSS5oZ5J4pZxWbd6JrCCCuIPfGLpOJxDKZnm143hbBhT5gxf
         YJc+REJKIhDK5iOH/aVOcmNJDkmObAoRcardM3BFqkxNR6GaOW18ah13LDArpHutib+k
         t403ktUDvmk7pMjmG2nDHOb7b1zttqhbdmVCT0re3FqiEutWmcdF7gNqzAbms4wQzsq1
         U7LokMnKnXt6Gv20rZ6dy5WwQWxCtbDJ+uguHtQwGZZ1Pm2hLHjhvj49BPA2hBRXL72X
         xONg==
X-Gm-Message-State: AOAM5307fNCsv33LU33lM5L5mAy0WgHSKHhX9sqo8JXS8IoU2hQaoA4T
	rDZjTyQrLwXzEikx+aswY9c=
X-Google-Smtp-Source: ABdhPJyGIvPG0ARpLbeJXdpIZSUFIA2iFlDIsg3HEkuSdEsupu8NtfeJLY9X5lt1/1vMEkYcg+Eedw==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr5311147wrk.49.1617811927452;
        Wed, 07 Apr 2021 09:12:07 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
        by smtp.gmail.com with ESMTPSA id w7sm6211481wro.43.2021.04.07.09.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:12:07 -0700 (PDT)
Date: Wed, 7 Apr 2021 21:12:02 +0500
From: Muhammad Usama Anjum <musamaanjum@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>, hverkuil@xs4all.nl
Cc: musamaanjum@gmail.com
Subject: [PATCH] staging: axis-fifo: remove redundant dev_err call
Message-ID: <20210407161202.GA1505056@LEGION>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

devm_ioremap_resource() prints error message in itself. Remove the
dev_err call to avoid redundant error message.

Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 2bb1c2e9cb57..ed9281089738 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -853,7 +853,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, r_mem);
 	if (IS_ERR(fifo->base_addr)) {
 		rc = PTR_ERR(fifo->base_addr);
-		dev_err(fifo->dt_device, "can't remap IO resource (%d)\n", rc);
 		goto err_initial;
 	}
 
-- 
2.25.1

