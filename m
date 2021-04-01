Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8715E71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:20 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id o19so1167745edc.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yx+72Epx+NUmisxn0SR/nVRJ35Oi3tLmnqMdM+YV3RY=;
        b=Q27FYDA23lpDWJV/fvWPA5uAILasjXzE9vUUpKmLCpWRMXc8wz0c8GYe08V+Ld/6n8
         bWwHMiekG46yvOYx77BimmmunVA38ZY2cqm7xrPIy+DNlqfNt63UPgtVztxEecbezmkn
         hS01qpNImXoHeHzeCgA9aBQOKgKkg8eWwLNCPam6/j5LRXQby8nWCGKv6UNWMgg3HHuw
         tp1cwkK5y2SxOprJ8e9Dv6ItCtyoa1APi35PmkkcQAMXTXHxQJnrHVjvVdK3JvK26uFV
         OXH2j+FZe24V7R72IgqrUR8p3a6B+F3DV2CW3d067FQ10M7MlEINRjmqqugsJd1SkXTd
         C2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yx+72Epx+NUmisxn0SR/nVRJ35Oi3tLmnqMdM+YV3RY=;
        b=Ldlo6PtAEtP2JDGaRxjbnYsrj3dojnwAFJnSdg44oK0t7sxgeZgmvY1YRiqmsTgG8v
         /qy9Bl2IUoU7wy3uCemVeKBTRc5v0XU92Ux7yWdzEj8j/cHMOgHbsASctlmggrlR7qki
         vc4oVr8hhZ5bomaOQBKZLKnL5IyrAwWR+NKllYRw+VFclrjm6zRSxkkSfKoSEHxnvFPP
         NWakjVOjONds+ryxFAlakU2mvtDO4VZfevVT1DywZgclFzGPyMtzZxdSUGcaap3sXg2u
         jwRsLDQ39IHcHI4R8kQPpKxasyBzwyqzyLeChecO4JnIrOJI8hDb+7C7PGW/XVFzMsGm
         LOfg==
X-Gm-Message-State: AOAM5307+sL+VXd0yrzFjMILLnZFk4xmFsGU3OmwkTxoooW6gfrvASmt
	J3S0QeT06Z57c2DD952dii4=
X-Google-Smtp-Source: ABdhPJxXj0e1SrScqhvCIunTcW48FMFvhjTlzJlEbNCcfK22JlhNZwG6coQ9up6oiPJCKPKtgPfEgw==
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr9092777eds.199.1617268939166;
        Thu, 01 Apr 2021 02:22:19 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id wr20sm2472855ejb.111.2021.04.01.02.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 34/49] staging: rtl8723bs: remove RT_TRACE logs in hal/hal_intf.c
Date: Thu,  1 Apr 2021 11:21:04 +0200
Message-Id: <bdefcae9217453774e97cbecc08d8f8bd194048b.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE LOGS

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index aa4356327636..7fbac4c8f2f8 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -108,8 +108,6 @@ uint rtw_hal_init(struct adapter *padapter)
 		DBG_871X("rtw_hal_init: hal__init fail\n");
 	}
 
-	RT_TRACE(_module_hal_init_c_, _drv_err_, ("-rtl871x_hal_init:status = 0x%x\n", status));
-
 	return status;
 }
 
-- 
2.20.1

