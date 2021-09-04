Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B883FC0
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 08:09:23 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id n18so1330440pgm.12
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FM13umhiUZ5Y1cUzG3acpmqo6yaDvf6xGiDzXDodIV4=;
        b=D0uiAgyFHTZSJ4/mZMzCUe+Jr2nKhjSLljLCR+masb9b9IJGho5k7blEZ1czjm5rdu
         nCNNYHTB8l3Pl47jvWNNjjAY/e+j660nE25+7fcj9vOAg191PVM7eiMAWx5jdXd5U8FJ
         Qu3B8SBmkuezbXMEijcA3FoWGXOGJ+6tqEaRwHS/B9QEpdc2OvAu72ORHNHUyRpPfBaY
         lGUJ5441GZRBape+BPLrCjTyKCccIAoGqKfc8jl3NQiCxPk/sMXq5KkV/aSvtVLF+8nI
         sCBRWe7mKtFAcS7uW7faPNazuW9lYnqig0m/MRU/P36SnSQ5cV6hPRRZ0aYGJHuKnrzO
         FJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FM13umhiUZ5Y1cUzG3acpmqo6yaDvf6xGiDzXDodIV4=;
        b=ZM5ARom+5Z4BCm4M0jax7n02Y6r6khznQL2cuDF1bSrM7yH/41a2yJiT39s58ZIDFx
         sXsxX9OjQOCmKeDojGtzudgfgqsogrTRomq6banmgiwalTisDZxMyjfIeAN3KSqFRczg
         /8PZp5lkj1sGEz/3xkJ7myCdHWK2qoSEne05kq1EJmgqv8/ftKbkagWOh08b1svZX9o8
         1xWxnM2bqZ+OYY6vIjATfcQXD2JGp6l0JBRADaIeIhkQgvu1P0P/7FpKF/yRprATQGnN
         9OqpkUY++D8paMQplYCVL+rC9f6mAwJ4IAOOwQW6Ld0p/5wWLXlJi1QebW6lrMaICrdu
         Gung==
X-Gm-Message-State: AOAM530+jwPbl7SpDf8y25+RDvq122IMSZxfqESuMsTHRaQR5Le8MEuw
	/0m5LXOLQzWVGLW+cg0RLoo=
X-Google-Smtp-Source: ABdhPJyWZDgzCINK92xB/oRyNQ1gtNbqN/d0OGjoJcpsnAW/olWibQZxe3s8v9+NLAWK4kHylgXOCA==
X-Received: by 2002:a62:a203:0:b0:3ea:eeb7:fdd with SMTP id m3-20020a62a203000000b003eaeeb70fddmr2558895pff.59.1630742963493;
        Sat, 04 Sep 2021 01:09:23 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c26:4b2d:32ce:9155:7c42:8667])
        by smtp.gmail.com with ESMTPSA id v8sm1445652pjh.24.2021.09.04.01.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 01:09:22 -0700 (PDT)
From: Srivathsa Dara <srivathsa729.8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Srivathsa Dara <srivathsa729.8@gmail.com>
Subject: [PATCH] staging: fbtft: fbtft-core: fix 'trailing statements should be on next line' coding style error
Date: Sat,  4 Sep 2021 13:39:16 +0530
Message-Id: <20210904080916.15476-1-srivathsa729.8@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style error 'trailing statements should be on next line'

Signed-off-by: Srivathsa Dara <srivathsa729.8@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index ed992ca605eb..65de1c02e7dc 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1038,7 +1038,8 @@ int fbtft_init_display(struct fbtft_par *par)
 			i++;
 
 			/* make debug message */
-			for (j = 0; par->init_sequence[i + 1 + j] >= 0; j++);
+			for (j = 0; par->init_sequence[i + 1 + j] >= 0; j++)
+				;
 
 			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
 				      "init: write(0x%02X) %*ph\n",
-- 
2.25.1

