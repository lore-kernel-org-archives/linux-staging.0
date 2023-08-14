Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9241BE5F;
	Mon, 14 Aug 2023 13:34:28 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so2873464b3a.1;
        Mon, 14 Aug 2023 06:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692020068; x=1692624868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5h96pxv2Yka7KmUWEJu66IE2CTecUjZawrP+6MraMNA=;
        b=OTfotuObIcudaAx7bUBWfq0umjGQXHRxWeuW+raRW5pJ5Rzp3SOodftij+df9OU8nH
         yTaBUr2lnQEVL68AgiAN7pjeCkPwp3bdT4NW1Y1qh8w2Cg3tYiATHuEBaL3WJSCUHpHV
         ts7vH90v8p8b1pyGJJyDnelM5NKGMj+YCA5tJrUDz2AR9Zph0lDpnUCiu1LUvj88TBlG
         U+Mk+nrX6yeVXrsQ8+Wv1CDZJZrK4Ul5HIOH/NuP6A2fnDGG0n6WzXqZR3kCHohr2yyK
         1HWQnrrD6ixjdr2Djoe+UFhUR+RJvpLF20ACEW2AD5YVBzPjePFc/C6PWe0m/raUf4XQ
         rKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692020068; x=1692624868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5h96pxv2Yka7KmUWEJu66IE2CTecUjZawrP+6MraMNA=;
        b=LUR2XZBDJjO56owaH10TEaRSspWlkOK/mvoS9sJgwBdOuOUM/As9U6BhWizuIFkugY
         GVyi9/N/0O7S0wFpOAtttyhy9HEBEzzkvd8s89Uf76IqklQfLfSUPIMdSHpxqrGIsg/H
         B+bechnpB3J/QRuzSDzsTyO+mde1wsbd5UrWpP9i3y/9Vj5xZ9cyejzCw+Txucs4DmTd
         UEqBkWKRJ86ulxsnqkpUYj8Dn0YeESXhFIdKs18E3hxrHhUD0VKXTT965oOFakVKdZXh
         OViFEIQgi7XTa9HFfDa76yBvceL4ofH8OMt9jR8nHqzhjcMDoFwmZuMDfWECDeJrvtDV
         JZ2Q==
X-Gm-Message-State: AOJu0YzWzPz4lD5qnRljhHQPGlehuXsdf9NYYT2WtCk/3txNwaRZZ87z
	vPsnbbPFykAPB5N3Hq8Q3vc=
X-Google-Smtp-Source: AGHT+IGmdEnS5dBWTUlvfmyfz1IkofxRcbSzi9/c/MmNDCAV5bsxedm6jpa32PW1iiiEhoagGV1RPw==
X-Received: by 2002:a05:6a20:394a:b0:140:c6b1:78d7 with SMTP id r10-20020a056a20394a00b00140c6b178d7mr15573025pzg.26.1692020067899;
        Mon, 14 Aug 2023 06:34:27 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([171.49.234.213])
        by smtp.gmail.com with ESMTPSA id x7-20020a63b207000000b0055386b1415dsm8576413pge.51.2023.08.14.06.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:34:27 -0700 (PDT)
Date: Mon, 14 Aug 2023 19:04:21 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: vt6655: replace camel case by snake case
Message-ID: <ZNotXWJbJU1Gi2Gx@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace array name of camel case by snake case. Issue found
by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 v1 -> v2: 1. array name renamed from byVT3253B0_RFMD to by_vt3253b0_rfmd
           2. typo in the subject line "small case" corrected with the
              proper word "snake case"
 v2 -> v3: word "by_" dropped from array name "by_vt3253b0_rfmd"
           and became "vt3253b0_rfmd"

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/baseband.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 0e135af8316b..696d4dd03aa2 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
 };
 
 #define CB_VT3253B0_INIT_FOR_RFMD 256
-static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
+static const unsigned char vt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
 	{0x00, 0x31},
 	{0x01, 0x00},
 	{0x02, 0x00},
@@ -2005,8 +2005,8 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		} else {
 			for (ii = 0; ii < CB_VT3253B0_INIT_FOR_RFMD; ii++)
 				result &= bb_write_embedded(priv,
-					byVT3253B0_RFMD[ii][0],
-					byVT3253B0_RFMD[ii][1]);
+					vt3253b0_rfmd[ii][0],
+					vt3253b0_rfmd[ii][1]);
 
 			for (ii = 0; ii < CB_VT3253B0_AGC_FOR_RFMD2959; ii++)
 				result &= bb_write_embedded(priv,
-- 
2.34.1

