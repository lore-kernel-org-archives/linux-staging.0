Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840510945;
	Fri, 13 Oct 2023 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXcPtEUy"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-692ada71d79so1539547b3a.1;
        Fri, 13 Oct 2023 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697185604; x=1697790404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZXQ64zI4dZ66y0C+/+YXtcZqO4ReFctnoAjwEvrK3I=;
        b=KXcPtEUy4Y+ymnYwEi+mAR8o6ZZg5WTOKdBqMWWS319otw5IRu1hlId0Idw9ZnDNxT
         awGwGudVIbokHzWQmDDs2CKJ1l2mhh20ofxuDu7+g1mxflgTafAscCHHdjE3PO+P69Ew
         m2YOaJbMfH7qRah7NO9+OUeYQf3c0K16IGlfC4IGVs85UxENacm+ko4hm+8pMLJ/mj10
         w080XEiatv14v1bXTUyeVjZMurcwgUZqClQne24vhKvZlytD+tKFI1CCB2gUtKvL49ZE
         6Vk1LHVMRk0oJ4CPJVv3NInGtbOOjf5804lHR2lFniHbw+zGKfTf5zeqYUN+b4snXfH5
         4anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697185604; x=1697790404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZXQ64zI4dZ66y0C+/+YXtcZqO4ReFctnoAjwEvrK3I=;
        b=A1FHThVhZfNuKMvR4EuRTTOix5s0Wek2ox4dnmCwa9Mip+GBZY9BugMsYLMJ5dmOL1
         dOfjkm8jg2B3oRaWIIZcfY+uQ9L2jvZ297Zvuud7tLEXUdtdc9TzntAMh3iFhLhVbRIZ
         yhVooHwUjIUqaoQXBR6qDuvEdonKev5KR1nLs//fNQlbZTIBFk8d2z3f3VUF1MgmHtCO
         nY2I+Q8+SrmKlDtVPB0Ti+5GVXcVAG3yJ7ef25v9UPI03Qe4LiyTeCBjFNl1JSJL1a1E
         fTesRZjcd7Kj+a9kGvwL54+wy3oOutMeoIx7lvSf8aOH7MvIkvZaYdoN6s0v1MQS9Ks8
         q2DA==
X-Gm-Message-State: AOJu0Ywo6JsY5+qBaYdyCRdoho2u++4s5RyGOfnIqLydQTiQt7rvr7yl
	7qwTRv5PWdqUtcHx31LNDhEM3wCUfkNeiw==
X-Google-Smtp-Source: AGHT+IHIvwAg1pMkW2F212EPWLTWWwNAnZSE/IqGZHZrUWiRCTHsfHFWxJyAHHwAGRKTdwWbO6S8Xg==
X-Received: by 2002:a05:6a20:734a:b0:15f:16f5:858e with SMTP id v10-20020a056a20734a00b0015f16f5858emr25495617pzc.58.1697185603950;
        Fri, 13 Oct 2023 01:26:43 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id z16-20020a170903019000b001c32fd9e412sm3305524plg.58.2023.10.13.01.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:26:43 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>,
	Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH 1/2] tty: gdm724x: Match alignment with open parenthesis
Date: Fri, 13 Oct 2023 01:26:34 -0700
Message-ID: <ff627fcbc9e450c2e8f4aa5810b94e56151efa2a.1697184167.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697184167.git.soumya.negi97@gmail.com>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix CHECK: Alignment should match open parenthesis
Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 32b2e817ff04..4e5cac76db58 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -271,8 +271,8 @@ int register_lte_tty_driver(void)
 	int ret;
 
 	for (i = 0; i < TTY_MAX_COUNT; i++) {
-		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
-				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
+		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
+					      TTY_DRIVER_DYNAMIC_DEV);
 		if (IS_ERR(tty_driver))
 			return PTR_ERR(tty_driver);
 
-- 
2.42.0

