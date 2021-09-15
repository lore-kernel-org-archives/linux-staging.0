Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39903FC9
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:29:32 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id n2-20020a9d6f02000000b0054455dae485so46367otq.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hoVVooistygyhZh4JdyGmVYpdIyp7cTYMGqCLCSTLY0=;
        b=GLh+YyiPdeP971yf2WMJp6qlI1tEFoeWedmD3j5EJABG3/wl06rNX3hGpliIQbAPJi
         37nPcYTAMCdNOFefeDyFRRFlPDq7gg9gswDQ08Cam39BZ0e+TX3CTVV2TLMCuthtBfWh
         bZUVTOd1uwq2kDf3E/quJX/fNZnJLea8FpvSK9VkLUrPOgO1HOwLj5jW6WFms8LS+GAt
         vvK10OU8oVqiThwTiy7P962tCwFNb+87hGr6yn4kg7OcLSLt0q/f3dnbx3RRTYwDOXKI
         c8vbb0poNNnYvtbfes5xhGZ+0KfC9jb3xMSFqf0unz8otO8yuEnc10iqlQWAeAKtJAeY
         2Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hoVVooistygyhZh4JdyGmVYpdIyp7cTYMGqCLCSTLY0=;
        b=P9OBUGW8DZL3vS5PyZ8gc35jr8lXum8f8k2v4O1q/uLyym8upOLCpR45qV5cyqpQHu
         8CcgieHg1Pyl0LgLXpGndCMx52qIAdUpgOOKCAGFv/rDfU94HLZ245Tux+sPrpjoMdSa
         zdHKCPxRQuRsJK33RCkn1zEFYSQMXnGYJe0JpJYuhdllBFs7s1L4+2GBUlaIEdxnSE7t
         ZzV6XH6/GNkJjqTbCudEaAu6zKz8eY3t4R8EUVF4RkI39kgjixZ13/zQbwKPTVAsC67z
         wrAVD6PnBQCDJiS2KioURWEcy+aWY1lYHCD+2LdIhfOnmujfIXkci8P49ZPYcxiA5TGs
         df2w==
X-Gm-Message-State: AOAM531IvQs5NwnA8yMqeGp+2dUwrYfAVyZw7/K5DPagHBDE8Ferl8Ll
	gpGWnOwq5vNOycTvE3clhMPZMbIRpQV9UQ==
X-Google-Smtp-Source: ABdhPJzcrfoUuffYTAAYHUwkorhtRtauEj17pThrWLsC5z1Xi/NCJnQYmOoCOv0J7b6iCpqCzMoopQ==
X-Received: by 2002:a9d:6094:: with SMTP id m20mr1704121otj.380.1631737771796;
        Wed, 15 Sep 2021 13:29:31 -0700 (PDT)
Received: from debianG.lan ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id l4sm247584oth.4.2021.09.15.13.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:29:31 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 1/3] staging: vchiq: remove braces from if block
Date: Wed, 15 Sep 2021 17:29:14 -0300
Message-Id: <20210915202916.413914-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces from if block.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_connected.c        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 83502f5f3a33..f367dbe2bc63 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -17,9 +17,8 @@ static   DEFINE_MUTEX(g_connected_mutex);
 /* Function to initialize our lock */
 static void connected_init(void)
 {
-	if (!g_once_init) {
+	if (!g_once_init)
 		g_once_init = 1;
-	}
 }
 
 /*
-- 
2.33.0

