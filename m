Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EC9134A2
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1bQP2o+"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507b9408c61so7491003e87.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698742778; x=1699347578; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNOnxQseUn+sdzcn++tRPmK5DAb/ytwQ21KP2ZD3yF8=;
        b=N1bQP2o+QTwUNrP34sQvVpgm9qDedDsQAgLW/E9s9inIWWmFMwRhzpLU1Uuw0zOGm8
         wAA73rOHdSiTC++C1y+IOZaweruzFocUy+IsLvS8kvYu452OvNAHB/g1JF+dANZ0EQxS
         cd9gtzLj7KGVkVDyA7m7F4yK4+NSxjnxcN+mYWkj+wbUbM4opC+Oc9xzwb0GoFtl25Bq
         MuVKfXZy9oiNn2tylvMx1i0gwono9nz+Py3FUT78Ex9uhpG8Lf9p44GI3iQsrEv9zYy5
         7Ix2TeksnxR8yeXwiiccpa6O0Mu6q4p6+Dpy2mAKvRJpaJP5pXd5ALNn/43V3zZXpNBT
         wG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698742778; x=1699347578;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNOnxQseUn+sdzcn++tRPmK5DAb/ytwQ21KP2ZD3yF8=;
        b=upyeGgEHz+fbGcdH4hFTHUJ+jzfJGZdpu15SXqFiEfUhOrCr7tiXNjSsQKaIq7BgWj
         WYBuGN1En2kw9kMB+DgiZcp8XfKRLSMeaATVojwEtCzEPm69a2lLpQe32VVuayp32dDq
         squ08kY15FJB95BH2Utlw5SMxYYaI/e67lRbScQcYWiRBXB9xldMfSwG0nR8ie6IiyQy
         zTkm0Tx3bOdkOkRl2gIZRw2WKH5kwigaq0SDKIdyzvBsmjKLPpQptIXlII8Ccq/VYxGb
         8U7OTuVMapM070xju2Q7KfoqHfyRLyfssLgTinSToduriIRXXjydqFFyQwqDT7ALG8Qm
         227g==
X-Gm-Message-State: AOJu0YycljlkTOAHowoiP+A7MBPB6FYS6xovjwEgZ8WAmbLGwBq4LIvS
	8n91Ydy5aCpXObJ2WEOcEsU0qQ==
X-Google-Smtp-Source: AGHT+IEz7RBymWwGaxhsiouoy6qvMnV1G4Gz7ZzpjpSRrBR9AiCIjw9PoA1bkmrCkpDthe9/kykFuw==
X-Received: by 2002:a05:6512:ea8:b0:507:ac56:66a0 with SMTP id bi40-20020a0565120ea800b00507ac5666a0mr8295514lfb.56.1698742778001;
        Tue, 31 Oct 2023 01:59:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d684b000000b0032f9a0fe0absm103388wrw.96.2023.10.31.01.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 01:59:37 -0700 (PDT)
Date: Tue, 31 Oct 2023 11:59:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vc04_services: remove unnecessary NULL check
Message-ID: <1dff4d9b-d067-4525-95e0-ffdc1185cccd@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We ensured that "service" as non-NULL in the previous if statement so
there is no need to check again here.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 39b857da2d42..a0117efa2991 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2040,8 +2040,7 @@ sync_func(void *v)
 			continue;
 		}
 
-		svc_fourcc = service ? service->base.fourcc
-				     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
+		svc_fourcc = service->base.fourcc;
 
 		vchiq_log_trace(state->dev, VCHIQ_SYNC,
 				"Rcvd Msg %s from %p4cc s:%d d:%d len:%d",
-- 
2.42.0

