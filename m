Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400307B;
	Sat, 11 Mar 2023 17:25:47 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id q189so4784052pga.9;
        Sat, 11 Mar 2023 09:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678555546;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QS/175t+MbbtSL3ZqMpuuGfGkRfZIPfXDt83uLAcCo8=;
        b=mmMeny8nknefTBsgpe/tmJD2V01bAwE0Y0HxdN301V84cphLfqInQY2dRHmk4rp+w4
         6JE/nwT8liagmbu8fdyxLAkvy/y50fUwHwo5ZSxR1RlYUK97MkSRBpD+3n5wkAoofVkv
         MNNDQH3Ys6gnCCG0ss19Jvq+pyYk4r+R1OmfAh1pW4GfHDbNUyZ/HeK15sNmy51z2AMZ
         C/6LTQXCjA1SIWHP5O5/dHgAKSH49VYEyB1CO0u8zXlTv+5n4X8IDP+mnwSJn24l5ynZ
         +QyPpSpaKzxWKLnxOSR4FuIbIbYV7aBfH9hONYKdN+RdkLCNAfw/+dFZJW9buL6bdULW
         gExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678555546;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QS/175t+MbbtSL3ZqMpuuGfGkRfZIPfXDt83uLAcCo8=;
        b=IaV+yoAaw7RKXOl1fliRx4tFfalshLT0l79NeAjaJ2NSdKcXpVOuGFlRxcLEHvMF++
         DHOhKxGlDAfZay/73eDAQPUVwLkj4iSpl6rJApGC6/fz/FN2sivpxNDeAwem7DmVgKGK
         MxmM3sOxPRJ6Jb745y0zVPR+qaC2EFpM/LJvUFfqYXoHCXRTqeSA6jLeNvIb4tOueyjE
         fWGBD6JHv7nDMyirFTgxyBArkFu1Ib+vmIAKZ7gplJKct78ZUXptXnxXPfrpP+rL/n/B
         h6GJt3QMABFWeRFNSey3Vo90gRowmLdjgrCleBChNW8X0X/la+PW3EfgrrXgkgTGRjSr
         QhNg==
X-Gm-Message-State: AO0yUKW85SiKD6RiZ9FE4ZkZr20BbaZAAtWSCatE0361BgpDZxKe0qOF
	O61o/fftouplhLT67bx2aboI1WQbVOGU7g==
X-Google-Smtp-Source: AK7set9ftsFY4ZqIdArrt2/qtu9c+hPHjyWDoZu98KDi1eGfosfEJNXcHZqgNtwJDDaXf+zwsgBtiw==
X-Received: by 2002:aa7:9546:0:b0:5e0:c59f:b008 with SMTP id w6-20020aa79546000000b005e0c59fb008mr22132343pfq.4.1678555546323;
        Sat, 11 Mar 2023 09:25:46 -0800 (PST)
Received: from ubuntu ([117.199.152.23])
        by smtp.gmail.com with ESMTPSA id j21-20020aa78015000000b00593cd0f37dcsm1711571pfi.169.2023.03.11.09.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 09:25:45 -0800 (PST)
Date: Sat, 11 Mar 2023 09:25:40 -0800
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev, GR-Linux-NIC-Dev@marvell.com,
	coiby.xu@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	manishc@marvell.com, netdev@vger.kernel.org, error27@gmail.com
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2] Staging: qlge: Fix indentation in conditional statement
Message-ID: <20230311172540.GA24832@ubuntu>
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
 v2: Fix indentation in conditional statement, noted by Dan Carpenter
 <error27@gmail.com>
 
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

