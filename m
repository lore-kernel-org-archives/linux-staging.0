Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F962F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:29 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id y7so6759141ejj.9
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VXGJ6BJNTyxC31APtHNNGgHRV6GpZZQxSZgzKX376VM=;
        b=aNtbLLbf2Q6SlzpKcWsgRebLvwn4zi/d589NGuMeRYyZh3RP7FCPHSaCSinheiYAy9
         18QCLBDdRW58unZGIiFrpRZGZJO2KMJELaGccyw5SPcA+g1Fc6dAz2RgqYbYynQciOc9
         /nt8Cc/9MciYXiU2lSHHZdtrjqYMJwgsb93bqeC/bGVNF7O5UPnLr4RBrrrJQfFc4Qx6
         27TfZiTu0Ke6My7QKTrXe9JhigcVc04ffGUVKO3O5oVLVRNVcZisju618/6bed+VS3/U
         66vkN+DlS+GUH2XPy5subtLFkd6Ct5PuMcz/zLBBT4/XlzOT1vyHl8DJCDPffOuDZxPb
         Y43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXGJ6BJNTyxC31APtHNNGgHRV6GpZZQxSZgzKX376VM=;
        b=AycwxKAcc+aiM5d6JLQb7LxGIeJMbUDKXxJ86PTpHcf1fwMXkWUI/BX9Tbnczq83l8
         SOKbY9ig7/CL0yG8HmJxyQM1xlvpptXmuGXxaXU8iMt02aKP3o1mrx3NmBN8RBWI3MZ/
         gH/3q24YKiFrZZJ8JsNbA1Ti/FM7335FDaF1p4o1O060NfLQ3TPcDQvXn4CDAO1MMSJ2
         69XEvPTF1j47azC2/zFkqCy/gVF6L0WvCLJP+550kOyJ1BnzIg+qEmsBvO4MgfYWnL/n
         qqLwO2MSv89s6pPI1wVHfXQXZiIlAZc7SNr2eNDCitW0SPIfBPSpdCBqrZX96e/lkUco
         NMew==
X-Gm-Message-State: AOAM530hgIHlFxcF2a57s4HekWGUBj7o5oB1ILYBLVwlAtewilpJuyfP
	oCNb98atvn66c37VCmeck4LCFm4vvLs=
X-Google-Smtp-Source: ABdhPJxlBaxATSJ6RL1VJK8aZe0xlGAYAbrKJVCwzsUHoR9XelKXA/xCuWyaVFezkScToe5DzJVauw==
X-Received: by 2002:a17:906:5811:: with SMTP id m17mr4732877ejq.221.1619793868446;
        Fri, 30 Apr 2021 07:44:28 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id pw11sm2047716ejb.88.2021.04.30.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:28 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/43] staging: rtl8723bs: replace ODM_RT_ASSERT with netdev_dbg()
Date: Fri, 30 Apr 2021 16:43:39 +0200
Message-Id: <1b5da18835320ed9f312acdc01553bbd58e28bf8.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace ODM_RT_ASSERT with netdev dbg.

Marco ODM_RT_ASSERT wraps a raw prink and prints a message
everytime second argument is false. This occurrence prints
always, so replace it with netdev_dbg()

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 0027ce211619..fcd3f97e7df5 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -552,7 +552,8 @@ bool ODM_RAStateCheck(
 		break;
 
 	default:
-		ODM_RT_ASSERT(pDM_Odm, false, ("wrong rssi level setting %d !", *pRATRState));
+		netdev_dbg(pDM_Odm->Adapter->pnetdev,
+			   "wrong rssi level setting %d !", *pRATRState);
 		break;
 	}
 
-- 
2.20.1

