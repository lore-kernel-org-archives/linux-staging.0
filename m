Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10C81860
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 16:20:05 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id f20so5050981edf.6
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 09:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7Js629KccG6US13KeuTls+//WPiM69Qewjdm7oxTyss=;
        b=exh23MC1wmkoMevZsAfh6BeY6VdclumO4+EVDAW5TaAhleMQFIv46cC/14CfNbIoQL
         7PEEyzocz3AqrNvKZIJYYqLbDM5z5GXkb/cSWfaOjey9UkJLEvvAYLU+eUPNtYiQjL+8
         lkzPSpxYK1xXSFgI8iuI9UEX8TVE4JUU9AfIdtNppK5VyKImmw7MCzLWwlwRwcKD4pRm
         EgpITl9WhNURF7hcrNoqDeB1XYfz5lYvBoyBiwJrIBwh3bjedGWBBIVfa6o/Z/3yUbwQ
         /9IHBILTcp+57nxTEPRv9cO0FsL/s92dzLK9UKELTxE39a38L6d4ZJJ1K5jo3IEBETUf
         umdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7Js629KccG6US13KeuTls+//WPiM69Qewjdm7oxTyss=;
        b=WG6uu+nl/9i/XF+pBEVpcxhfrAy8ydaak+8hYMCz90SEKJVkr1woOLq+lN3OzOOPxW
         W9hlXdo5WOpZBBh1EXcQgxt4wIgW8fkwU/9UTl8IIYTv/zYeGt+LvmHSUpTbUhfj7pbX
         +MDCQmnzD3hA3IB2voR3XPSAZayoxqKgNKk2GgphvjfaVOWuVNufAR+W3jmDoX8plqqZ
         H7mCMthd6eMPx/DaNUPMMs+erjxkJ3xs4jN+DUcNtW7g6zOpa5WsOkJ/saMOkPuD9ViA
         7u9aQJnJ4XSu3tTMm1wo97RIb0iO2f4rUvpRDG9cj8fQjJpuWRKFpciiusou3Jlydiil
         tJbg==
X-Gm-Message-State: ACgBeo3tVSvPuqkr4ekPmjoMADWDcU7IleYeUmTNGbTU6e6BabwCxxc6
	z0ov2UYXG/XPGWLJCZTJC44=
X-Google-Smtp-Source: AA6agR6ZemwosBaG90ca0b8HEp0c1KwbAyNmsaPG+GhcgveHCkzeBHVx/aLKeAMWtdIWbWSKH+UegA==
X-Received: by 2002:a05:6402:298d:b0:451:5fc5:d423 with SMTP id eq13-20020a056402298d00b004515fc5d423mr5403672edb.102.1662913203984;
        Sun, 11 Sep 2022 09:20:03 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id bt6-20020a170906b14600b00779dc23be62sm3055346ejb.120.2022.09.11.09.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 09:20:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/6] staging: r8188eu: clean up camel case in odm_query_rxpwrpercentage()
Date: Sun, 11 Sep 2022 18:19:48 +0200
Message-Id: <20220911161949.11293-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911161949.11293-1-straube.linux@gmail.com>
References: <20220911161949.11293-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable 'AntPower' in odm_query_rxpwrpercentage() to avoid
camel case.

AntPower -> antpower

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 8b292644b38c..a870973395f6 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -3,14 +3,14 @@
 
 #include "../include/drv_types.h"
 
-static u8 odm_query_rxpwrpercentage(s8 AntPower)
+static u8 odm_query_rxpwrpercentage(s8 antpower)
 {
-	if ((AntPower <= -100) || (AntPower >= 20))
+	if ((antpower <= -100) || (antpower >= 20))
 		return	0;
-	else if (AntPower >= 0)
+	else if (antpower >= 0)
 		return	100;
 	else
-		return 100 + AntPower;
+		return 100 + antpower;
 }
 
 static s32 odm_signal_scale_mapping(struct odm_dm_struct *dm_odm, s32 currsig)
-- 
2.37.3

