Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E633C10;
	Tue, 14 Mar 2023 12:11:58 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id ay18so9575313pfb.2;
        Tue, 14 Mar 2023 05:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678795918;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLOiANFqOi3wCdM3FGbLFB9AhuDgThqUdwTy4yeXIF0=;
        b=jhyQ3METWoCznCYzEZEf3dooJ/wr5dURSHCk2a/blSO/+4qFYrNBc94DTB1Aj8xO+u
         6JqjjTFz+YH6HfWGY9ACeOPMJVguSlhAROm9Z1swZWZ1TJhl8ghwaSQGUKmvgxXt6KCA
         93JE3Cg11EXN3fK1vJnYYpNd0vidJUZ3Cpd6Soh1S3ceO/SvbJAVkpn0WY1Wmo81hvaJ
         mc61i9cfVtoxOYGgDgpDUYNEfE5JfdqNBQ9cSczTCTf4SB7QY561pTzgCCdcpwks8q2x
         Cu+RdjKkTf5dlpDfZZ8tFjiW5zAMu6AdMa+ftMAHEb9bOnTYw/dVIwEhf7Boo/x2WPh6
         S7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678795918;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLOiANFqOi3wCdM3FGbLFB9AhuDgThqUdwTy4yeXIF0=;
        b=GDOXwItakON5QbUkGEc3ypVclEgNhzoKAkNzHhjb/5r4BDeny8lpyyCoCEyTgKa4am
         Jdij683i0HrykhGkdGVOJD8xuhks4/v9f3oIVrqr1wGutomnMvulcYo34IVZYZ927+tV
         dWFF5L462TQxmPZf8msBzetA/Yn0e93OGC/ZONl5Z5Gs78Ph070A9SZTfKGz7wp35bOo
         I3lhvl3N90v2ex36W8IEaG6XRORqXBoE7aC/JWkcTgfv9wnmHQegnMjBpW4k+2wuPEn0
         5snu+gptPdixJfDK92Yn514GnVgeSJQ50y+7vCKsEes4VlBcP5qOp4O/HqAO12KfMOXN
         zIVQ==
X-Gm-Message-State: AO0yUKV8VftyY76d3/sC361P+xxablTDA2mUqjITkpaCf0x6HfI+Hz5j
	PZrx+FRBSf2xGmMdWZY3WVkU1mqvSQHSWA==
X-Google-Smtp-Source: AK7set9kndnwILN2cfyKlOfZpDCZ4z63OhVoikttIm/+N1sMW7D5K+2f2M2Gul6Wh+L4jKMyfLf5TA==
X-Received: by 2002:aa7:9508:0:b0:5e0:3038:2300 with SMTP id b8-20020aa79508000000b005e030382300mr36080931pfp.20.1678795917706;
        Tue, 14 Mar 2023 05:11:57 -0700 (PDT)
Received: from sumitra.com ([59.89.170.99])
        by smtp.gmail.com with ESMTPSA id r3-20020a654983000000b004f27761a9e7sm1440786pgs.12.2023.03.14.05.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:11:57 -0700 (PDT)
Date: Tue, 14 Mar 2023 05:11:52 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] Staging: qlge: Fix indentation in conditional statement
Message-ID: <20230314121152.GA38979@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add tabs/spaces in conditional statements in to fix the
indentation.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>

---
v2: Fix indentation in conditional statement, noted by Dan Carpenter
 <error27@gmail.com>
v3: Apply changes to fresh git tree


 drivers/staging/qlge/qlge_dbg.c | 35 +++++++++++++++------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
index 66d28358342f..c7e865f515cf 100644
--- a/drivers/staging/qlge/qlge_dbg.c
+++ b/drivers/staging/qlge/qlge_dbg.c
@@ -351,26 +351,23 @@ static int qlge_get_xgmac_regs(struct qlge_adapter *qdev, u32 *buf,
 		/* We're reading 400 xgmac registers, but we filter out
 		 * several locations that are non-responsive to reads.
 		 */
-		if ((i == 0x00000114) ||
-		    (i == 0x00000118) ||
-			(i == 0x0000013c) ||
-			(i == 0x00000140) ||
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

