Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6599779C5
	for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 19:13:17 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x3so24185288edb.10
        for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679080395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKzOWshBPa05sAfciXrKvOW4wl1rl1vuNJiyeVc0GTM=;
        b=g62TFrehsNWj46XzWopy/vG91KbP9iseFu9asa7oEBELOPeEhPkTWdw1bNPo1Jj3KU
         ld2WGBlrCFpEcZghiSkrvH/IMlG+cdq3XdAI2eozvqqg2R0iv/2r2RP7zQABWqLHRaVh
         0/CUz4Awh+OK8d1Je9sBZvKSACUkqnCIJSqnr8fOhGM4MZ5ZFDOPzmRC8ki3yBTEZrxS
         4FRd5KK3lVICHBBSSYqZNFqxyaS8xl4g8on9sf/LvUrJ3shnTy4IJL+iw8VFPQEdtkl7
         Zx+AxM7X8PlBANtP4M2b8sgiWbWbNDKvsn/KLvjPd994U+KhDrP2XqqD6fDcc/8RF576
         4jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKzOWshBPa05sAfciXrKvOW4wl1rl1vuNJiyeVc0GTM=;
        b=ERPnRlmtLqorwzrGJ0REP8gXlbKPHBnTuFFeOldYxsbtjtDtgVZfIEj4k5d7/R/D/q
         JesHtq7e9yYyoxxq5JRxeKACqOneiysaFWzKDokzdnzK6F4bCjrX+DghN3yw0pxR7Ryp
         WBLS5naZKO5z3iw3nfGP4Va3Ajom+3J1s3zQNGJNqFMeUqCqQXyqAJ1ssvwJTGxCBRB+
         0i/l1PrVzVsmH0vIsFB2hQBhZDMKMrxONYW9jzrilddGMwOS/RQl65kNFWAkdfMVbjUp
         let1LoqZDuarjx+1aqxUDUCxw6ydjKC4UPriXbYTNMHRPDD7lDkwazyH0KgGVZDwTb/U
         a92g==
X-Gm-Message-State: AO0yUKV0s6s70U1yw7FEjoPH2Yo+aDgECzByJssIwkqUj2QTUwb8dUAS
	PunVqs6sICODuJjVps60iYo=
X-Google-Smtp-Source: AK7set/Z9+Om3DT9CgVQJbSu9C/o4KcLpjmlPrzxTsYMNEDJhB3lQ/AGLj1ie1bzM5ex5RHVuj5d6g==
X-Received: by 2002:a17:906:1016:b0:931:5145:c51d with SMTP id 22-20020a170906101600b009315145c51dmr4697756ejm.0.1679080395458;
        Fri, 17 Mar 2023 12:13:15 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0091fdd2ee44bsm1280097ejc.197.2023.03.17.12.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:13:14 -0700 (PDT)
Date: Fri, 17 Mar 2023 20:13:13 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] staging: rtl8192e: Remove unused variable
 rtl819XAGCTAB_Array
Message-ID: <0733800b195d4f63cce2ef2ac114943c8c30f587.1679077522.git.philipp.g.hortmann@gmail.com>
References: <cover.1679077522.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679077522.git.philipp.g.hortmann@gmail.com>

Remove unused variable rtl819XAGCTAB_Array.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 6723fcce8954..fd34756e450f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,8 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-extern u32 rtl819XAGCTAB_Array[];
-
 enum hw90_block {
 	HW90_BLOCK_MAC = 0,
 	HW90_BLOCK_PHY0 = 1,
-- 
2.39.2

