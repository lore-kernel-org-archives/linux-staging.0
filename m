Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A7F365
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 06:26:41 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id p21so8848970plr.7
        for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 23:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmtzlJtofIdyT91pfPGIdJT3CouMXo21i2AbO1DpQkE=;
        b=Q3ObJHWoSQyQnVhBa7/0d2PopodKZvFO0jqSSwZr+4UueRCxWev/G/wIkRLDcgQ4Pu
         eXnUcskEwJRBnx+4sZLGmqVdE9nZt9LqXeUF2uGLPCfXA3TNMrT5mqOzCNfkKSL0sjdg
         fqJa05T/3PfJxdsIJt3r1G76i+EBnTjltpJiE4H0nwnlUEtBPE36KzToyYucjvp1C0lx
         EQcVflp5291JLQPyK9cOZRDnXn2B9TiasbjVp4YsWuYY6ggKmhT6AWqcFjHR7DLOIbMd
         AqdD17rU25IVRitJnDPvkmO3Lx0lg9iKx84C4hznaUoiITGs4vtRsWiF69C6WW1QDcbr
         DtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmtzlJtofIdyT91pfPGIdJT3CouMXo21i2AbO1DpQkE=;
        b=nGWho5Ybxy7MGDJ44Bet5QU/RG09C8aBqh7BIQL8SqUz7JaYD54BBXUr2cgFND3tMo
         e48PUvOgtw5sIF1AB67fBisOeDwEa/OS8PbhXrJIAGqRW/qy6zbOT+DafdiIxZLzZRg5
         iYYTIwg7glJYASjQS6YbEvhQITrqEtG1PxPZSrUquhLK3Vd7BMFO76SSfSS7xXq5O6TQ
         sKjs/CsCKIZVFrhm7U14Ro7T8ZpSw4451fjlNI3b0XSXwFrXTbCa/SZ7Ms2PVBgVGSzR
         dznuCwKDOb+iQ3BlQZz3cbeierUkJ7oi+5LEzEcGjQvhQl7wHKQtvvGG1aFqQ6n0XcdX
         PY/g==
X-Gm-Message-State: ACrzQf0leAn9mydOPOSHc3860nk/633flHUlJKL9ePx5+FNPPe4uJDgp
	zP47Ujr+9/MnADzuG3ljY94PHCldSt4=
X-Google-Smtp-Source: AMsMyM7v/qFUuD2ZpJ/6Dk3ddoWdOKrqjZRuA7qPaHuyL/UJHX2S4us9Ej1r+CzMc/+5BrfNKS7CSA==
X-Received: by 2002:a17:90a:d901:b0:213:dc98:8b0d with SMTP id c1-20020a17090ad90100b00213dc988b0dmr10345145pjv.11.1667284000883;
        Mon, 31 Oct 2022 23:26:40 -0700 (PDT)
Received: from ubuntu ([218.237.158.230])
        by smtp.gmail.com with ESMTPSA id r11-20020aa7988b000000b0056babe4fb8asm5660439pfl.49.2022.10.31.23.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 23:26:40 -0700 (PDT)
Date: Tue, 1 Nov 2022 15:26:36 +0900
From: Gabhyun Kim <kimgaby415@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8192e: Remove line breaks to match coding
 style
Message-ID: <20221101062636.GA3257@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove redundant line break in function definition to
correct coding style.

Signed-off-by: Gabhyun Kim <kimgaby415@gmail.com>
---
Changes in v2:
 -only one logical type of change per patch

 drivers/staging/rtl8192e/rtllib_softmac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 1a3ca3e57623..1253de481805 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -148,8 +148,7 @@ static void init_mgmt_queue(struct rtllib_device *ieee)
 }
 
 
-u8
-MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee)
+u8 MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee)
 {
 	u16	i;
 	u8	QueryRate = 0;
-- 
2.25.1

