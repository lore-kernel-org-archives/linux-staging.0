Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165268
	for <linux-staging@lists.linux.dev>; Fri, 12 Nov 2021 20:35:56 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d3so17597202wrh.8
        for <linux-staging@lists.linux.dev>; Fri, 12 Nov 2021 12:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=AqcWsB4FWsDe7NHoJQPl1nKY3ysaIWoyuuUKqbGAI8g=;
        b=KD3fbgaV7gB2zXLga6vyVGVVkU7K1ukFi8NQonPQGzMU7UPcam3Lfs8Kyp2DmMCvIi
         lqETXH4W6lXnQt+erNZlTrO74J2ZeYDutpUTETrr0GD0GAWXZOtfGU5hBwm8ogeiTEho
         eF1RhpANij+aPBoh9u/c9jGwOZofXzhk/O+SVIdroqtbZW8/U1vo4/2dQoNOZDq7/5oY
         LbMXH2FIXk9646FcqlDrUXKzlUJ9Z/6N2ok5h2ZYZJ4Vr6nfce6cJ95uuHmnquZFEC3M
         bDmk2HrrtvQOr0Asi5kaDx7R8Msrd/UHjNhzlcRhqhJNjY+Qdai5Ccgq/laVbQoOI2d8
         glOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=AqcWsB4FWsDe7NHoJQPl1nKY3ysaIWoyuuUKqbGAI8g=;
        b=0R2nBJfM7Q4Ias73btYBOeSMoAafzHaCOvk+sIbuREjOTnsWyKSA7PBKik2Sow0LIM
         BN8arR3/epEVgwEvjKNS03GUUqbB4y6gGXXNeViHea97P7z+KuU2k1fKk+F/9++vrnO1
         w8NJbRV4SrZkb/u6ahKVY/+KKadndU/ffPZZO9hK2zsXB0XN6mmzk7ZsVMi+RNbkOLsy
         RKa5EnvP3p+AfBuUrEp46TVJGS78P2xq653jyPmFlvtuW3Cz1Kgg9Iv8dX9KtvaQIEQr
         /I4QQPVjuadRxNt1IMZ7DOQEE7kaRudXfqIJEtsdDudDxThh06smR9q5/QHWCjhTCCa3
         Ac3w==
X-Gm-Message-State: AOAM5319B3UH1TDpps3klPSbypaQoIaFeCy5Y3dvXvkAEH4NssKGaOop
	3XvlHy6F8WaMO78NexS8aD9OaPGy9SRR+ygwVx4=
X-Google-Smtp-Source: ABdhPJziy67H9U4oVkLu5CNIyS2L77x2s3BhfkCVR7qKMk9U93dlvycZuPjh1aENvWpu+GnWTqtqJA==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr22449256wrq.94.1636749354227;
        Fri, 12 Nov 2021 12:35:54 -0800 (PST)
Received: from desktop (mob-5-90-199-106.net.vodafone.it. [5.90.199.106])
        by smtp.gmail.com with ESMTPSA id t1sm7791363wre.32.2021.11.12.12.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 12:35:53 -0800 (PST)
Date: Fri, 12 Nov 2021 21:35:52 +0100
From: Gabriel Goller <gabrielgoller123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: wlan-ng: Removed unused comments
Message-ID: <YY7QKNB7egKuTC36@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed commented-out code pieces that are unnecessary.

Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
---
 drivers/staging/wlan-ng/prism2mib.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2mib.c b/drivers/staging/wlan-ng/prism2mib.c
index 24ba10d6bd0b..fcf8313870af 100644
--- a/drivers/staging/wlan-ng/prism2mib.c
+++ b/drivers/staging/wlan-ng/prism2mib.c
@@ -679,16 +679,8 @@ static int prism2mib_priv(struct mibrec *mib,
 					       HFA384x_RID_CNFWPADATA,
 					       (u8 *)&wpa,
 					       sizeof(wpa));
-			/*
-			pstr->len = le16_to_cpu(wpa.datalen);
-			memcpy(pstr->data, wpa.data, pstr->len);
-			*/
 			pstr->len = 0;
 		} else {
-			/*
-			wpa.datalen = cpu_to_le16(pstr->len);
-			memcpy(wpa.data, pstr->data, pstr->len);
-			*/
 			wpa.datalen = 0;
 
 			hfa384x_drvr_setconfig(hw,
-- 
2.30.2

