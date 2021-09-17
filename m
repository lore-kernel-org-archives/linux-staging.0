Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49FB3FCC
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 08:06:34 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso6296873wme.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hB7whJFC0X8jOEkpS+/j+QNCR9hvpVa/Awmx8A0MRmU=;
        b=OPrvSKkFZvhwm193cSIbqQHx/eo2pw87C/6h038Kz70XHnA65ySfjnFsPM8lLGvqwR
         dIDm/fwcYtNzjJArfbwvk7ZoBO3s2vUN1Ygcjus0tMnjInGiYUQlF+P4uvui3MLXxxnl
         0WN0Pc2zT+9/8ofknBFPogV/fAVUkgNVHlCJh6LRrnk98912M+IxzZQ8wXXRgA8TyT3S
         WA1xVJbFuxxBe7SJ08ttsbWsWIZAYJmH/GQdfOq8UBpdjEx2GSyQsrIXTIoci1qx385W
         CyMGQQ53OF/9K/T5WNmHnq9N6rPDpgewl7jPtVCpx5VzhOH8Qm0BCj21TaoG800WHSoo
         +BAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hB7whJFC0X8jOEkpS+/j+QNCR9hvpVa/Awmx8A0MRmU=;
        b=6DQM6evRHrN+nooq2FcRBN/mzKyRLjQwgesqskR4Tc0JVuYO/H4BxP27WzZClKInU2
         W66Lmg2fYXApSckQCnqDiwGAIN9zb1u7S9fzejne6Ec1rUH/l7V8R+an3lgk0s2xY1s0
         Q28ZxohIVjxm0eoeGMvIqQEkX8qztUqny7yKp5j0AIQ1N9XtwffYqEHq/DrolA6LEsgr
         JD+/re6BHLttHZ5kzxxPIOjhHGkJvSPFPzRDOHwK4SJn7IaBi0lVuq4CqBrZfj4nvb8Q
         H5wTomnv0z2syk8XxCXUzdEap5AV4R9YHnm31SyF2xpcUbzyqTQPmj5YPauH3autFMZe
         c54A==
X-Gm-Message-State: AOAM530Up6bfj4BXjjGn4InWzTtgTLANVgem6rcoKNR+8GCf1LYf+j63
	P2/4O3TCccnnWMxPh/xCdr8=
X-Google-Smtp-Source: ABdhPJwaa6pAbo6VGnY6WtTnQy1Cm+8Lky1p3WA3OxSVLh6+rJVDyoFLMn3tEAsGk+pOyjUKlUCIeg==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr8988699wmj.114.1631865993358;
        Fri, 17 Sep 2021 01:06:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id r129sm5690890wmr.7.2021.09.17.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 01:06:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: remove if test that is always true
Date: Fri, 17 Sep 2021 10:06:13 +0200
Message-Id: <20210917080615.25819-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917080615.25819-1-straube.linux@gmail.com>
References: <20210917080615.25819-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test "if (pHalData->rf_type == RF_1T1R)" is always true in this
driver. Remove the test and the dead else arm.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index ad0782259654..03b68b3e3550 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -533,14 +533,7 @@ int PHY_RF6052_Config8188E(struct adapter *Adapter)
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
 	int rtStatus = _SUCCESS;
 
-	/*  */
-	/*  Initialize general global value */
-	/*  */
-	/*  TODO: Extend RF_PATH_C and RF_PATH_D in the future */
-	if (pHalData->rf_type == RF_1T1R)
-		pHalData->NumTotalRFPath = 1;
-	else
-		pHalData->NumTotalRFPath = 2;
+	pHalData->NumTotalRFPath = 1;
 
 	/*  */
 	/*  Config BB and RF */
-- 
2.33.0

