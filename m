Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908322C83
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 04:45:20 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 127so4833477pfu.1
        for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 21:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=4OISxA/W7Ea7fGLkHeskh3EaoItPM6YwHT8EDyfGs54=;
        b=gu6/JH11MBZugObAKhGfQ7IriVDZqholcnkBpmp2QHiT7+bIhbb+6zaGFaMuWyXenB
         u5D6p7x17K1yi+aJ9VH11WPUK35UoIzu/2sq3zyXiYDHNUBa9ruXhc6hKaBmJ0Nz/Vur
         RJClnNJCMJfF70KebEqttu9pNh4IeIZrc9DCKrHYdeIoznA3UwYhgYUm+Cpkwv99fNQK
         ZbIQTlcngfXm3h0qC6dZZExvjRG1S8gxr2go/l4Z5u/C6gAtEOsyxRDP1eBHx+fa0wd8
         LdMqQP4Ig7iKRCWDEhY7oDWc6DmutuHDg0iC0rnUBC52JESDZuavKawfe/I/y4kRZkRN
         8eiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=4OISxA/W7Ea7fGLkHeskh3EaoItPM6YwHT8EDyfGs54=;
        b=kDj+TyCjzC3swI43YC8oj2Z/KxoO6u3BaMb6FRKX3J9FR+f/SQvPxSJDlSuKJo52Ix
         n+ybkZk91ZlEyKdbVeoko32jM8A9PK07QE5UId7VAteRiCQMq5iAhWrvOxqMd17pY9ed
         6pUm0vYXDAIGITXPjSkhHvox5KeR2Ia/+y9JlwyDdFsFQ1pUuFX4/YhUteq8IC9xJ2A0
         24/MVquU/Xy75CaxGVmoUEcNyluJ+b+TjZ0jorfRz4VRqXMmukcO0AolV8HC2ZI3XMT3
         NHHjQCFcg9m5I0sqf2qlsEw3MJp+p5EJ9OuzjvttbkOEC7sh5dW/Ymfc5pwXBv0kv83g
         QDyg==
X-Gm-Message-State: AOAM533GSQnTzK4Wx8t4UMq8ij54kptYUI4K6mfrYLNCVJVDJSFXKuiP
	u302z6SbGjQYVEWUyXC5R0k=
X-Google-Smtp-Source: ABdhPJwPXaA5X0uwkTX41sHOwR8seDp1Vs0plHgCBExDwyhr8UdHIM93SlAc+teWEXuCTeq+L9psUg==
X-Received: by 2002:a62:524a:0:b0:47b:e7ba:d9e with SMTP id g71-20020a62524a000000b0047be7ba0d9emr2011564pfb.53.1635396319990;
        Wed, 27 Oct 2021 21:45:19 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.83.133])
        by smtp.gmail.com with ESMTPSA id m6sm1665964pfk.110.2021.10.27.21.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 21:45:19 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:15:13 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	marcocesati@gmail.com, dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: hal remove the assignment to itself
Message-ID: <YXoq2ViLxPVwAgLq@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the assignment of variable to itself.
Assigning the variable to itself not make any difference on value.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index cce3e7e80953..f1fc077ed29c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2746,19 +2746,7 @@ void rtl8723b_update_txdesc(struct xmit_frame *pxmitframe, u8 *pbuf)
 	struct tx_desc *pdesc;

 	rtl8723b_fill_default_txdesc(pxmitframe, pbuf);
-
 	pdesc = (struct tx_desc *)pbuf;
-	pdesc->txdw0 = pdesc->txdw0;
-	pdesc->txdw1 = pdesc->txdw1;
-	pdesc->txdw2 = pdesc->txdw2;
-	pdesc->txdw3 = pdesc->txdw3;
-	pdesc->txdw4 = pdesc->txdw4;
-	pdesc->txdw5 = pdesc->txdw5;
-	pdesc->txdw6 = pdesc->txdw6;
-	pdesc->txdw7 = pdesc->txdw7;
-	pdesc->txdw8 = pdesc->txdw8;
-	pdesc->txdw9 = pdesc->txdw9;
-
 	rtl8723b_cal_txdesc_chksum(pdesc);
 }

--
2.33.0

