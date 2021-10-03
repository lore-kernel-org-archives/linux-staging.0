Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE63FDE
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 20:01:30 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id t200so6754296vkt.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RISxD/viKv7LKWmGTkIKr7KI+2YT0D1VIuZdPYzWbkQ=;
        b=mK35pTDRYFtojim+7uEt2qb/XHjO9IUDlkrkpTyOiCyT/+ut31qa6u2yF6u3X/RpD4
         /sSnSGlP4vR2d5T3uJdemDAdsA37nfGzlmE6C6y6BeNGYKGMaM2Df//aSVwVJB8ysDH7
         8Yf11VrUu0cEzP40wHLn6h2CQi2PRNExp1CiCWT+ylcn6HRd3JSDGL9Y9Pu7EdiWRHaQ
         Q+Ahln10F7uVBh9sZEJGY05amLqaH5zMJSrG0BscWalCvpPPnxzMniOdpKwo+jBmsA3a
         z3To9KfWiirah9Wly8IhfnB3XJ+/KCDpBzjUFaewKhh1mhMQZB2LGKHvq/xzJhyGULua
         gxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RISxD/viKv7LKWmGTkIKr7KI+2YT0D1VIuZdPYzWbkQ=;
        b=jyOGNI2CzAl/qKjBm4o15ks6gu85WA8J3Y2NjWsAuSkkrr2WkeudlVKaMr21cDK7uX
         DChyc+QPRbtQkjTTtNEILyjc4Ohs6YnpML1kMUyLLLeCr3yH9byg/CEN9G6ZeIczIzd+
         w6euHl81QRkt68866JXFMbklpquUKvMamcp+ZgI9ts08uDPKEBcfahxlS1ynZ/KRoQ0q
         /K4/n8wD5pjbyQGVL9mvnwWNPXUEhms49/JVMixp61hC+zgt/X0vZO1j5Wm89sURcP9j
         7EN00fGxGUc8EoN6WXbylkMJhkhwKfgFSpkn0oLMxrow6Jpqaa+WMdJHdg9TVIbTPkjs
         ge5Q==
X-Gm-Message-State: AOAM5339T9u39gBERFVIxvtFaXOUtZ/es8Jjp2r1VmZZOoTGPM1revl0
	67pR/r/VnqjEFDgVnxza1iV+ZdB+/F9jhQ==
X-Google-Smtp-Source: ABdhPJxHXNALxamC78pDf3kPboNu+0yUjARPw/Vj6beyUnoITXaBEkpTgEC6aMpZkDJxGHqmyzIZFg==
X-Received: by 2002:ac5:c24c:: with SMTP id n12mr7474711vkk.10.1633291289737;
        Sun, 03 Oct 2021 13:01:29 -0700 (PDT)
Received: from localhost.localdomain ([181.23.73.135])
        by smtp.gmail.com with ESMTPSA id x21sm6691019uao.2.2021.10.03.13.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 13:01:29 -0700 (PDT)
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
Subject: [PATCH 8/9] staging: vchiq_core: cleanup unnecessary blank line
Date: Sun,  3 Oct 2021 16:58:01 -0300
Message-Id: <20211003195758.36572-9-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003195758.36572-1-gascoar@gmail.com>
References: <20211003195758.36572-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove blank line before close brace.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index b4ad68ff42db..416110bf20fa 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3193,7 +3193,6 @@ vchiq_queue_message(unsigned int handle,
 	if (!size) {
 		VCHIQ_SERVICE_STATS_INC(service, error_count);
 		goto error_exit;
-
 	}
 
 	if (size > VCHIQ_MAX_MSG_SIZE) {
-- 
2.33.0

