Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087907A
	for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 19:28:13 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id j3so5831595qvn.0
        for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=T25orQZcjJ9x64HlBZmcnhujj49u8jvUi7v4c/vg2ig=;
        b=NxqOtqZxaRI9geSW3ohqQMnXUxpE0Rb38kPdTjSul1t77l+SCfNdNXOoXtSihMFvR3
         hy3eRo/0Yrz1QGBWWV3Q+L8J2ql3t59DHpjUnAyejxx8vtajD/zT+KporB8jWqBG4k4L
         y5mcFUwGFNF6xBkGXAJvb+cZFNwHgCE9yv5cGazWxmTAJJbrCjSn0o/YIeMv/gJ+UU0X
         MWAjvQcoGxsQNLHGNAWomJ+TyW1FlWl8wRHRIF6qh1ujJ4foaZ989zbI/kR58qQkhdGk
         j0bx04mXaAT371xsfTSqvrJ5QsRi9EAY+LNCMga1b5Q22OT88/joqEblXyNuElam6wZ9
         Zmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=T25orQZcjJ9x64HlBZmcnhujj49u8jvUi7v4c/vg2ig=;
        b=DD6WWmnbtdYUqlh5LdQqciR8IcvGm5VaYCMZPvLbrUW+ttvPiddnBxYleuAD9mcLjP
         W4ne4L6Tm7wq9hA/ZOycgBUdCwtJYCSdoR5hTe12pizMVIqu3TQTxSu5lRYTG3ROZ98t
         8ThLpGq0CZm8eFBszHvadJpSPRxfYisBQi2xhERKr5RqIPusdMZEkiudqQ5ojfXeg0F8
         /N39nlhU3u0NGrTD5iB0NIUnR+XZ3pAo9kT4C/YdPocCa4HWYJD1GMnj+eNyUEAuoFTR
         BtQoHo+OrJShq0VDgCz8Co8pjVZFL8xKIHWJwNHdVR/bDYpIwcDCrtjuwdoyxbpBus8Z
         aBJA==
X-Gm-Message-State: AOAM532yTTgXWKtE2IaTM8ska8oW9Jgh8thUZN1y+8Cjd1DI4PkeJ6/d
	22RlqggQmTOxRt3/hB7Lnrw=
X-Google-Smtp-Source: ABdhPJyyUT8WIDsCiESNZbn08Hyx2dRtMYdv+Fo37IPodgHy6tZQQoAq6m7GQcQ41kxN4In7T4bZkA==
X-Received: by 2002:a05:6214:194e:b0:45a:d8e3:2d3f with SMTP id q14-20020a056214194e00b0045ad8e32d3fmr21546166qvk.59.1652815692947;
        Tue, 17 May 2022 12:28:12 -0700 (PDT)
Received: from Sassy (bras-base-oshwon9563w-grc-26-142-113-132-114.dsl.bell.ca. [142.113.132.114])
        by smtp.gmail.com with ESMTPSA id h4-20020a376c04000000b0069fc13ce1d4sm33546qkc.5.2022.05.17.12.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 12:28:12 -0700 (PDT)
Date: Tue, 17 May 2022 15:28:11 -0400
From: Srivathsan Sivakumar <sri.skumar05@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rts5208: spi.c: prefer ftrace
Message-ID: <YoP3S6mGQEwUTQDC@Sassy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

fix the following checkpatch.pl warning:
WARNING: Unnecessary ftrace-like logging - prefer using ftrace

Signed-off-by: Srivathsan Sivakumar <sri.skumar05@gmail.com>
---
 drivers/staging/rts5208/spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rts5208/spi.c b/drivers/staging/rts5208/spi.c
index f1e9e80044ed..0d2d065508d3 100644
--- a/drivers/staging/rts5208/spi.c
+++ b/drivers/staging/rts5208/spi.c
@@ -460,7 +460,6 @@ int spi_set_parameter(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	spi->clk_div = ((u16)(srb->cmnd[4]) << 8) | srb->cmnd[5];
 	spi->write_en = srb->cmnd[6];
 
-	dev_dbg(rtsx_dev(chip), "%s: ", __func__);
 	dev_dbg(rtsx_dev(chip), "spi_clock = %d, ", spi->spi_clock);
 	dev_dbg(rtsx_dev(chip), "clk_div = %d, ", spi->clk_div);
 	dev_dbg(rtsx_dev(chip), "write_en = %d\n", spi->write_en);
-- 
2.34.1

