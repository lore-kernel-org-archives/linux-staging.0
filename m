Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2E1C04
	for <linux-staging@lists.linux.dev>; Sun,  2 Jul 2023 12:15:25 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-262e66481c4so1664617a91.1
        for <linux-staging@lists.linux.dev>; Sun, 02 Jul 2023 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688300125; x=1690892125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5cFvQbq7diNNN0bpBR8H7bBLc7lI4nnwBQk2weQsLw4=;
        b=iyviPkChWoFVJ5Q9yfgPuX+wGACeYXOZi7NWTe0N+dGDIm561PvInBcZ1S2r8lhNUE
         UBZn78lCPe2QaKRB4b5ECsX8ZvliF2d81bAGLpllw1YR3PYOfqzYn5z5SgYtP37k2aKL
         smrdUfQbiTf+/5t6mYCvMnY8iakmQcq45HNDeMhO/OlVbwjisv+cNo29UrKhJG1s9VTT
         I+l5d2aUOfzd+MWqi757W8t+pYO4KBfmO59/EnScP5r3EzV9B63jH8bt9rDefOnEXeam
         jijGpWPah4Z0+kxKRY3Pto1x3WOYgvda0CAqc9sYd4Y242zuiGrQ+VL4S0fnvvICQtKZ
         o1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688300125; x=1690892125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cFvQbq7diNNN0bpBR8H7bBLc7lI4nnwBQk2weQsLw4=;
        b=IAegWiwi+N/i7KDjUbU8bJQrEhbgjzxAMgVdEEB1YwTTJi6Qv/elAF14AovUQNiH16
         Ja9zZvvOSXf7jrUE4FWw7ntsWcMTkLniA/4toteMe9DMlLpnoJb4c8oxAtd7jNvifxGH
         LguZEoAb/ugVmmZ8v85TG5VGf7V18M4/YuK/88/KVZQkQTMvn0W+Fw+fNBXOzhEcN3OH
         nPDF+f0xK5PlTXls+jVnzIQERUGBUwIs66bSLwO6Y19rOrKu/Mxvbn8v18FsrR+tx4vc
         qMJ7gU1880jDDS7mZejeGXlyqGwAU6BeUML9oI3LISRAiWiD1gJJeIMAIG3r/ekL9ZVi
         eHdw==
X-Gm-Message-State: ABy/qLb20HwHg1cMsVuZ0/x+N/2k2WJgIMxWTXsFUg7xcj5t3dq6U9U2
	x8tTjzz/MDVPPTl8iYvNqto=
X-Google-Smtp-Source: APBJJlE1MnWjQdQ9dJe/mq1H0nt1nQxEvX4PMyDPZvHXffaDRgCRgKiz8dmKw0vIUwfY4yP6Gsqbsw==
X-Received: by 2002:a17:90b:50d:b0:262:f798:b60d with SMTP id r13-20020a17090b050d00b00262f798b60dmr5959855pjz.6.1688300124661;
        Sun, 02 Jul 2023 05:15:24 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
        by smtp.gmail.com with ESMTPSA id t4-20020a63f344000000b0052c22778e64sm13031137pgj.66.2023.07.02.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 05:15:24 -0700 (PDT)
Date: Sun, 2 Jul 2023 17:45:19 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH 1/4] staging: rtl8192e: Rename variable currentRATR
Message-ID: <091a5abb231fb5c88d47f329ec3b5133b08d6b23.1688299890.git.yogi.kernel@gmail.com>
References: <cover.1688299890.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1688299890.git.yogi.kernel@gmail.com>

Rename variable currentRATR to current_ratr to avoid CamelCase
which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 37c275cac40b..14c78f740366 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -277,7 +277,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rt_hi_throughput *ht_info = priv->rtllib->ht_info;
 	struct rate_adaptive *pra = &priv->rate_adaptive;
-	u32 currentRATR, targetRATR = 0;
+	u32 current_ratr, targetRATR = 0;
 	u32 LowRSSIThreshForRA = 0, HighRSSIThreshForRA = 0;
 	bool bshort_gi_enabled = false;
 	static u8 ping_rssi_state;
@@ -363,8 +363,8 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 		if (priv->rtllib->GetHalfNmodeSupportByAPsHandler(dev))
 			targetRATR &=  0xf00fffff;
 
-		currentRATR = rtl92e_readl(dev, RATR0);
-		if (targetRATR !=  currentRATR) {
+		current_ratr = rtl92e_readl(dev, RATR0);
+		if (targetRATR !=  current_ratr) {
 			u32 ratr_value;
 
 			ratr_value = targetRATR;
-- 
2.34.1

