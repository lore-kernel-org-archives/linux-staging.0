Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641623FC0
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 06:31:40 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id q21so812996plq.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 23:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1uz0oGH2peoXwoViq7ISy7dnv7QydlkNRkRbvHanRv4=;
        b=RAzfx9ZbzUl7+CFMq0YA99u/jBVlx0xAFoDQ2uq9SPGKcXCE2+Q2vR2gWB6JAYMuqQ
         MTGDDdoK8qKWA+vqpmJOEaw0lNPiQseAra9NdeULs/2vhQgOrSLeDLLrFmTBMzz1LghF
         /GD7qLHU/q4KrGboP47vLzgj0cNRHLW2SBxtpzpNAF+OmKtbD8J/yJUNtVpfg/yq2Jqm
         hE3lYVv3Po8vCIE2DYjbwKTk7sq47wqMRnSeSGII+7Vw31r8VB+D5tE1CwSfWatQnmmw
         /9Ddaz35OJUq3A581q5LUQqFK9uy+vLNA9W0l59W+KTB6FhEd2q+7pZmIVLy/o0LFkHA
         m+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1uz0oGH2peoXwoViq7ISy7dnv7QydlkNRkRbvHanRv4=;
        b=O1zNCRJObLAo/iWtpMvG/OKwdi5aA0fwLRaDGabBISwSPgxa3NLY3S8eUuXH5E8wY4
         nJiTza63k/mLZZs8OWxo8yw1Z6lO8BBtaeDGFs/DpqpyfIWXdcc/Qm8pIpaUCW6jmAEs
         /ymeaz6u26hT0KHbpR8BFoB9WnmI3eiCJLtlgzq8hGK9TtAZPkF5z+dCEX9cgnusVK1g
         Yw/q5Hw62a7auTepxaT8GtYuVfAZpZCq3DuXTFbzaZY2T3WBV0D4FVm1iFT9jdevtWXC
         Feg1ZQuo7HMTjBldH4xO4BQoQooqKdcwFUZbSS+B3SlDy9HLW1T420gL2Vin03d3QkgK
         a+kw==
X-Gm-Message-State: AOAM533PE0RblQJooi8OTFdiyGDDif42+Ld/Hq8b715eb8Fk6LU8vRS4
	xgqzvcGOsFGuX4ODlfwdKdQ=
X-Google-Smtp-Source: ABdhPJyuZpl9wW4ps+FAaEdQj7Q0fyN344v3p+LFNSy1+2G2NRjD4gsEKPT8X3Keja90XKvEm0DFKA==
X-Received: by 2002:a17:902:6b49:b0:136:3f21:7a9 with SMTP id g9-20020a1709026b4900b001363f2107a9mr2196578plt.81.1630737099883;
        Fri, 03 Sep 2021 23:31:39 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c26:4b2d:32ce:9155:7c42:8667])
        by smtp.gmail.com with ESMTPSA id p24sm1408256pgm.54.2021.09.03.23.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 23:31:39 -0700 (PDT)
From: srivathsa <srivathsa729.8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	srivathsa <srivathsa729.8@gmail.com>
Subject: [PATCH] Fix ERROR: trailing statements should be on next line
Date: Sat,  4 Sep 2021 12:01:27 +0530
Message-Id: <20210904063127.11142-1-srivathsa729.8@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

