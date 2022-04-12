Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250E91840;
	Tue, 12 Apr 2022 01:50:34 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id e10so11053119qka.6;
        Mon, 11 Apr 2022 18:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sEEO1a9gpg66HFf13zmhoKxUPpsxt/WYjEBH7Mta+38=;
        b=aXVbsRa2yH5DAASxHCBOihAz6ipOW8TA49XkgznzBFXPNgMxrfaH1kbEz7GlFFkcq+
         1XhueTEgVssesDPYvJOa5CcZS2SrQSNKRmkEvlNOlQ9GyK8bhy1jdvSRlXnNZTh6nr7W
         At4MeV5SRXN4YGyYuijU853lKVzVQpGtNmxT1Mch4kEb6d12LIIDHziyGyBRPZz+IXwt
         5ES2GjLuCzEqHPG3Y1dys8xtAM+ZZpVUHoNd3ETVgLgEOfxjL4TNagIBPcjl2ONRBrK3
         yLICfOldH1XCFa/nnqcjCV+Nd7gxsRh4FWsq4wdnXXH6D+8ALMcEqCO6Q197UMPBig7o
         TXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sEEO1a9gpg66HFf13zmhoKxUPpsxt/WYjEBH7Mta+38=;
        b=XNDY1H1urXMQLGpzj5QGNMofaBmEXpNewwSrAHuVofhu7Zh4pKT+604cmXwSEsOYtR
         Y1EaIB4PtTvVQNSb4cA0WtMxdbvLyM2ycATZnse0j14bkJYe7FViLr2TWANIhOB0yN7V
         jk+UKx8guelXkvtLZGtsl00nTfb0tTbNXq0If3UR3swTyC2IODeJ1hyTnmtq2/3SYDOW
         4xmokHAfC5b+6WXde/lBi60hNJDbqeEGCMUiFINAeNu6w9lDXG5bVQMfW717tzJrNgGJ
         oz/dw9jKjTOZFHIesN9N56S4EyfQrhn++6OD9otEud41YbavCJxdAumLzIKCz6iJTQVS
         Ucpg==
X-Gm-Message-State: AOAM533P6KZJV+Bs2ks1Q+rDOszeUSorrquDGyIWjxH73Mhpkr8iNBVf
	g4ph2IJ5HPYlPqYQ8IcWvYz+Tw3t1/vMCtXQ
X-Google-Smtp-Source: ABdhPJxsOqNQqNWBE75c7gOwbm9rwZ7jKHdxtsI5WotnoPMlls4ptrYn5I1yj0kL0v98wKpQREt+1A==
X-Received: by 2002:a05:620a:3728:b0:67d:4fe0:1e0c with SMTP id de40-20020a05620a372800b0067d4fe01e0cmr1634898qkb.102.1649728231862;
        Mon, 11 Apr 2022 18:50:31 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:25ab:983d:ac30:58b5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac85cd0000000b002e1ed82f1e5sm29556305qta.75.2022.04.11.18.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 18:50:31 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH 1/2] staging: greybus: correct typo in comment 'Atleast' to 'At least'
Date: Mon, 11 Apr 2022 21:50:21 -0400
Message-Id: <1c4f0dfb83ad0c603a9efddafac37cccb7204415.1649712572.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649712572.git.jhpark1013@gmail.com>
References: <cover.1649712572.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling typo.

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index bbf3ba744fc4..45afa208d004 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
 static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
 {
 	/*
-	 * Atleast for ES2 we have to meet the delay requirement between
+	 * At least for ES2 we have to meet the delay requirement between
 	 * unipro switch and AP bridge init, depending on whether bridge is in
 	 * OFF state or standby state.
 	 *
-- 
2.25.1

