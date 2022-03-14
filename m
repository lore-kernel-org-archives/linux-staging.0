Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F296AB3
	for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 19:31:16 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id hw13so34955482ejc.9
        for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 12:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JR1ztvq6kbKN8hA7Y7h98nuZLWbTGZ3l/pHlNUnX8tE=;
        b=XGomWcDqK/SjKlZAq4K+U+TwMjoR8oh+nnvFNnUZI0bHV6Vo5DkLiQHehbD4V83RYy
         1oX/VohumuiCcDz8OoQ/FDMgx/pPW8BbyS1RKUk/LW/Lkv3IiCfIkAgA0nD2EIlThttp
         BuHZ7b0tAs7pRAgOvPMDVRH0GLnXYID/8J/oGwGFtGYY2W667Naz0bH/Wdb4Lus9d6Xc
         39d9C/jPsgt3IYC3uub69dzuKZfsdjiDQNA/zmmJRfLc/UxEPKwLsDjeosnm3TJPnqZg
         9TcDtfjuT45wCgxIOm1WqNloiUsUB8oMr1RCw0UV62eHgnTZ8NUwmRDOxoygviqjCM7S
         ogGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JR1ztvq6kbKN8hA7Y7h98nuZLWbTGZ3l/pHlNUnX8tE=;
        b=m1Zx4eFBiVNx+j5XaPmZkPZuuvxEJeSwl/bFbbwDBqDIhoBZNgWHH5iMLB1Uc5TTeU
         +fIz4Ek/rp7PuVGScVfC5FaKI1BLn4wUcNB8MZyUs3/fxlNgExJ1yi32jhuxz5zQJhyH
         i77B5jFLP+NkUaqI/FxwuF6Hs2xgFnm2/nxcC6WJzbW+qG+e4iBDlCdKPiO/yepvratb
         Rpp/TkMcSeRyMw+s1SBLqb32x8lbd5PcEyFjQt6QXCbwWBb8RC4G7TtL5jAOIYDkHfXq
         Jj/Pn84tVcpXl35Ofp0kD7VecE18U5UMZVMLmwHNZZwxN2s/lAi2kgzO4qS8zuTtzuuw
         Nxwg==
X-Gm-Message-State: AOAM530sukeTnKVQsgRdC4+GRmu5/bPuTDiJ1wvDf4xQNjoP//L8NOaJ
	yGr6bEsn6yNuR4O8KCJEKI0=
X-Google-Smtp-Source: ABdhPJwX0bDiQzNL3RTuiGVwPJ5kgLUdAZRRQyXu26dwV/buw7A9BNgZ36XpNbZ/EApYwyXNm/mI6A==
X-Received: by 2002:a17:906:6158:b0:6ce:61d6:f243 with SMTP id p24-20020a170906615800b006ce61d6f243mr19652896ejl.268.1647286273745;
        Mon, 14 Mar 2022 12:31:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id w2-20020a50d982000000b00410dc0889b9sm8646960edj.63.2022.03.14.12.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 12:31:13 -0700 (PDT)
Date: Mon, 14 Mar 2022 20:31:11 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: vt6656: Removed unused variable
 vt3342_vnt_threshold
Message-ID: <6e1ef287e66039f9013435f8fa1266de7387df2e.1647284830.git.philipp.g.hortmann@gmail.com>
References: <cover.1647284830.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1647284830.git.philipp.g.hortmann@gmail.com>

Missing part of staging: vt6656: Remove unused rf_type in baseband.c
Reported-by: kernel test robot <lkp@intel.com>

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6656/baseband.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/vt6656/baseband.c b/drivers/staging/vt6656/baseband.c
index c04fd052e467..ad7b963f0d98 100644
--- a/drivers/staging/vt6656/baseband.c
+++ b/drivers/staging/vt6656/baseband.c
@@ -167,30 +167,6 @@ static const struct vnt_threshold vt3226_vnt_threshold[] = {
 	{41, 0xff, 0x00}
 };
 
-static const struct vnt_threshold vt3342_vnt_threshold[] = {
-	{0, 0x00, 0x38},	/* Max sensitivity */
-	{66, 0x00, 0x43},
-	{65, 0x00, 0x52},
-	{64, 0x00, 0x68},
-	{63, 0x00, 0x80},
-	{62, 0x00, 0x9c},
-	{61, 0x00, 0xc0},
-	{60, 0x00, 0xea},
-	{59, 0x01, 0x30},
-	{58, 0x01, 0x70},
-	{57, 0x01, 0xb0},
-	{56, 0x02, 0x30},
-	{55, 0x02, 0xc0},
-	{53, 0x04, 0x00},
-	{51, 0x07, 0x00},
-	{49, 0x0a, 0x00},
-	{47, 0x11, 0x00},
-	{45, 0x18, 0x00},
-	{43, 0x26, 0x00},
-	{42, 0x36, 0x00},
-	{41, 0xff, 0x00}
-};
-
 /*
  * Description: Set Antenna mode
  *
-- 
2.25.1

