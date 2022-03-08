Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999677A
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 08:09:51 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id k92so7341429pjh.5
        for <linux-staging@lists.linux.dev>; Tue, 08 Mar 2022 00:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=w9D6iWO0MWv1/HxyhvxBgbJwCmIgSuOmNtaaVMp02a4=;
        b=FVI8cFf+IetQf2vzJ9vIWvUUo/8ocMiWxktiC58PYPpjyDmjZzj4MdkRm/dEmiq+lm
         +GyISVdgghdnheUPZ6agmNdsfn13WEt0fbzgBsxB8MhbMNotWcCx1coy2HeSTtdoNEaM
         e2mBpFhfm1J7NrSJsboTsyadWISTos14/h7/JT0K0812e6IYqHsr1N6VAdjM7k6Ezt4U
         thKyaAnB0QQeu/fjnAwexjHL3rV/8lqM0xu25WSYZUFC+s2BT1/heHL8Ce68YVW26dEG
         luHBQEjGUAFMKfGirhjuGcERzUoBawtyC1TEnrMdhAode1zJP9uT+KouHB9Z6t+rCkUn
         V1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=w9D6iWO0MWv1/HxyhvxBgbJwCmIgSuOmNtaaVMp02a4=;
        b=c6lqLtbew72aHYMv1+/SEGIWXl4EQ00sr5X+uPmos1bgTlEJbcjWMrGfOY0Gx5QmH7
         sHYnnnvEfcASrG7dYR/JtxClxFqDG68hwvWK9cevQlMFLebhGysT/XgldN6TS8MLpguj
         mhukjcWl6Yed2CBe0JjOdSJn1kU1Y+Fk3TJrPhG38KRCqugEgK1viWnMBzbKZ82Fjalq
         XF8DBqDfqrbmuj5g7DSDzMgn6z0Gj4F844vgH1RyAJTsJlYoXoSWzdt9sZhqydvLpFem
         KJbyO/wERUdDDu28OptnzKqrs3bpYjgu2+wtD7zOIVqgX9eRfy0TOfx6Yff9GkoUvz6O
         Bm5g==
X-Gm-Message-State: AOAM5335FqExUJKsWq59Xumg3/vOp2C9Np4173Ufai4N8Z7qW13WJj55
	MmQMso+7/IRvl9nF5HM0MX8=
X-Google-Smtp-Source: ABdhPJydB8DkbxuwT7AnfQwGafcuYCoWxT9DgzyDr2HbzpIp+ynJD12cvZsMY2S6HA5F40z3n0awTA==
X-Received: by 2002:a17:90b:17cb:b0:1bf:138d:e0f8 with SMTP id me11-20020a17090b17cb00b001bf138de0f8mr3333248pjb.157.1646726990886;
        Tue, 08 Mar 2022 00:09:50 -0800 (PST)
Received: from mail.google.com ([122.58.164.114])
        by smtp.gmail.com with ESMTPSA id m20-20020a634c54000000b003739af127c9sm14223979pgl.70.2022.03.08.00.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:09:50 -0800 (PST)
Date: Tue, 8 Mar 2022 21:09:42 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: remove hardcoded mask value for easier
 readability
Message-ID: <YicPRrH3HmpiTCxe@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

replace hardcoded value with the bitwise complement of the mask used to
extract value sent to rf69 chip.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/rf69.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 3028018f0b45..659c8c1b38fd 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -741,7 +741,7 @@ int rf69_set_fifo_threshold(struct spi_device *spi, u8 threshold)
 	int retval;
 
 	/* check input value */
-	if (threshold & 0x80) {
+	if (threshold & ~MASK_FIFO_THRESH_VALUE) {
 		dev_dbg(&spi->dev, "set: illegal fifo threshold %u\n", threshold);
 		return -EINVAL;
 	}
-- 
2.34.1

