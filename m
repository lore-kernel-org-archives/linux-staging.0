Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853367B;
	Sat, 11 Mar 2023 15:24:59 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id h8so8568991plf.10;
        Sat, 11 Mar 2023 07:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678548298;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crbZwDhWuP19Nx72AN6LNeVP5R+Lb57Ts6T9QLS5tCU=;
        b=OkfZQ/o6x6eDZRPH/ukLKDjV6f5jsB5Wreq2S6MRZ5hsv60SvPx8APXlXifFFG7M/z
         hdYG+M+fH2/GJC4Cw97edH5DfWc2YAZGBHFdqhJFeFi7UOvQO9JqAeBla7ImEe1t1Ikt
         5HLoQYeHHfi4A/l/PMjGYtA7qUoPUDv9b3cebQDvMT1QIOX7aGPaLEHFSOHDbcRmrmTD
         qEcGwB32rn6fmqh0k3ZQnq9FYwlj7VnIGmINwmZw1E4XrgJm/sQsC81CpBrppzxsVFvu
         PeXUO5Bxm0ahfiFfNzlI9lZT00F62bkWHZgElIV8l3b6O7KH2qORgK5HBvjAcihD4U1o
         HumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678548298;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=crbZwDhWuP19Nx72AN6LNeVP5R+Lb57Ts6T9QLS5tCU=;
        b=wKxpZSe5B+QyRPjh2Jm2RCZHE0dK2Ks1/U3SaEuTwaPFsQnulc+f27820kVOBL9Uka
         2USPeBoGklKrkHFP7At8U3AWS5uecEcYO1nEsx5ndebgpJSIv82Dd5QVY5mQ6LoNqy6W
         V9HZhHYYBU55aUhLDGIGwoLOxfEb+dR0eQllr5roloI8Sm0LTxOdXA10Zb5nPSAT9qpo
         byuCzV9v91n6Ww9Q/RlpiCVrZyBKxC8bttKlEGMhAwBBQAMDn8ON1CIyRGXoB22lVs/g
         1wsm/d5/MIPO1Vc9/0GxXiQQKUMCi8LWYY09MUqlmg3NiHNqPpC6FjknjvAPH69noxqk
         waCA==
X-Gm-Message-State: AO0yUKUAvY8pb1o69R7w8G9xUqikYGuxUD0S5A9FA1q9Yjryz3EXDtAY
	2NaFyS4yRcIdJvcDA2Qn7N8Fy1bCl5M6IQ==
X-Google-Smtp-Source: AK7set9gJeRH76pCp0p9bue1wncgBaSpopayuwbdmPZQmpYlrWzMwSL3rPYeT1Kb0Zg4tS+QenKLJw==
X-Received: by 2002:a17:90a:52:b0:233:b20f:e646 with SMTP id 18-20020a17090a005200b00233b20fe646mr29110601pjb.0.1678548298653;
        Sat, 11 Mar 2023 07:24:58 -0800 (PST)
Received: from ubuntu ([117.199.152.23])
        by smtp.gmail.com with ESMTPSA id kb12-20020a170903338c00b0019906c4c9dcsm1713823plb.98.2023.03.11.07.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 07:24:58 -0800 (PST)
Date: Sat, 11 Mar 2023 07:24:53 -0800
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] Staging: qlge: Fix indentation in conditional statement
Message-ID: <20230311152453.GA23588@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add tabs/spaces in conditional statements in qlge_dbg.c to fix the
indentation.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/qlge/qlge_dbg.c | 35 +++++++++++++++------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
index b190a2993033..c7e865f515cf 100644
--- a/drivers/staging/qlge/qlge_dbg.c
+++ b/drivers/staging/qlge/qlge_dbg.c
@@ -351,26 +351,23 @@ static int qlge_get_xgmac_regs(struct qlge_adapter *qdev, u32 *buf,
 		/* We're reading 400 xgmac registers, but we filter out
 		 * several locations that are non-responsive to reads.
 		 */
-		if (i == 0x00000114 ||
-		    i == 0x00000118 ||
-			i == 0x0000013c ||
-			i == 0x00000140 ||
-			(i > 0x00000150 && i < 0x000001fc) ||
-			(i > 0x00000278 && i < 0x000002a0) ||
-			(i > 0x000002c0 && i < 0x000002cf) ||
-			(i > 0x000002dc && i < 0x000002f0) ||
-			(i > 0x000003c8 && i < 0x00000400) ||
-			(i > 0x00000400 && i < 0x00000410) ||
-			(i > 0x00000410 && i < 0x00000420) ||
-			(i > 0x00000420 && i < 0x00000430) ||
-			(i > 0x00000430 && i < 0x00000440) ||
-			(i > 0x00000440 && i < 0x00000450) ||
-			(i > 0x00000450 && i < 0x00000500) ||
-			(i > 0x0000054c && i < 0x00000568) ||
-			(i > 0x000005c8 && i < 0x00000600)) {
+		if ((i == 0x00000114) || (i == 0x00000118) ||
+		    (i == 0x0000013c) || (i == 0x00000140) ||
+		    (i > 0x00000150 && i < 0x000001fc) ||
+		    (i > 0x00000278 && i < 0x000002a0) ||
+		    (i > 0x000002c0 && i < 0x000002cf) ||
+		    (i > 0x000002dc && i < 0x000002f0) ||
+		    (i > 0x000003c8 && i < 0x00000400) ||
+		    (i > 0x00000400 && i < 0x00000410) ||
+		    (i > 0x00000410 && i < 0x00000420) ||
+		    (i > 0x00000420 && i < 0x00000430) ||
+		    (i > 0x00000430 && i < 0x00000440) ||
+		    (i > 0x00000440 && i < 0x00000450) ||
+		    (i > 0x00000450 && i < 0x00000500) ||
+		    (i > 0x0000054c && i < 0x00000568) ||
+		    (i > 0x000005c8 && i < 0x00000600)) {
 			if (other_function)
-				status =
-				qlge_read_other_func_xgmac_reg(qdev, i, buf);
+				status = qlge_read_other_func_xgmac_reg(qdev, i, buf);
 			else
 				status = qlge_read_xgmac_reg(qdev, i, buf);
 
-- 
2.25.1
