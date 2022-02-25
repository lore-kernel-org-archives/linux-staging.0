Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C007B
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 08:03:23 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id x18so4056764pfh.5
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 00:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=pATmZROrWiuG5CWs1kSYk2Oan3U4G8+HjVhDW4324ys=;
        b=kkM689EQ5WPDqsWwfkb20CAFFR7mEU5TXmtqcIiDCShdf1rtfcQLvVcG3s7ptn/yVB
         rDuOOIxMg36Cv17J+jZYMN/C3iYh3wQj35fIXYWGT3ypRMLkXfyV0n8fbADG3ZSsfO1G
         1MAzDGivTrXdBtoJZFsJUxLNH5Ype3qFWIw4M6dcqNg74qhcAvLbDPJyq112nWj4RWZm
         0XdJRWbyZoMJiaPGVRZvs/YTzjNfCcYmv9kmt4lh6jwgw4iC2J2bLn/hBywQmoVZ1cQ8
         9kvpm3aP68/sOWXFJ2V8dAYTZ2fr5fKfd8whpbkfFnei0oAFmYd6bfOpp0iekoatApdX
         HOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=pATmZROrWiuG5CWs1kSYk2Oan3U4G8+HjVhDW4324ys=;
        b=ILCdfxewbjzgTabuRV0KtON9eb4k8czoewiN974JoNlqFwpVj0Fk3wnQ00Xpj9HDdm
         0J9e4KgCiUWYYMvl1u8sh/jjjU+D9Xhl2/CuyUXQPc/5sSlL3tQwkhzW0+ee23sXCEVm
         MD+aZNfxUGgIKJSPINS22Cktpp3II7qt5sw7ClqezAVDYKg2MUVSvOnN58GxKhBEsEdW
         FOKriAHsNgBFiOf8BuyHs1SrbvzWrTuwjoabVmhHrGUqQKFvhOYGHZQqaIMWJzn4ZG+B
         uVy9r/uVacy52eEoSK4Pmzk0RE68rCGiWI0fONA4PW0n6Q1Gc2RoK8PFDcs8cLa9SWbM
         wCdg==
X-Gm-Message-State: AOAM530FP1gc49bQ1QdOzqR90F1THEkeMw/Eu81wb5e55/FnBsGdyBPt
	c3CiI3+ZNBXiMgp/TJYIap8=
X-Google-Smtp-Source: ABdhPJy0gMwqLyE0+7tN6+q2loHkORGpgvzfluL2SdR/pNhk48Qm3AJK2kn2ZtRPDQSvKhAHivNk1w==
X-Received: by 2002:a05:6a00:24c5:b0:4d1:65bf:1fe0 with SMTP id d5-20020a056a0024c500b004d165bf1fe0mr6561632pfv.0.1645776203359;
        Fri, 25 Feb 2022 00:03:23 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id nn17-20020a17090b38d100b001bc5a705fb2sm1557900pjb.26.2022.02.25.00.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 00:03:22 -0800 (PST)
Date: Fri, 25 Feb 2022 21:03:17 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: add index value to write dev_dbg statement
Message-ID: <YhiNRSi7jijxJWCL@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add index value to the string that will be printed by dev_dbg for better
easier visualisation when debugging. For instance, if I have a big
message payload that will inevitably get split into chunks, it would be
a hassle trying to debug if the offset of the original payload that got
sent at that time.

This patch adds index value to write dev_dbg statement.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/rf69.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 901f8db3e3ce..1a0081ebf63c 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -869,7 +869,7 @@ int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 
 	/* print content written from fifo for debugging purposes */
 	for (i = 0; i < size; i++)
-		dev_dbg(&spi->dev, "0x%x\n", buffer[i]);
+		dev_dbg(&spi->dev, "%d - 0x%x\n", i, buffer[i]);
 
 	return spi_write(spi, local_buffer, size + 1);
 }
-- 
2.34.1

