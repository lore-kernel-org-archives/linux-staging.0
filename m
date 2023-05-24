Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2CD15B8
	for <linux-staging@lists.linux.dev>; Wed, 24 May 2023 04:01:11 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-397fe20a2b5so225102b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 23 May 2023 21:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1684900871; x=1687492871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56NnY1XWFQglCZDR+mXGOsAUP2AtRPFO/hDy6QbeiT0=;
        b=pX6jYKKyXPNBmGORsYEu7PRQVhYNbdpl1YaYjBy/aeSgqr0CzpvTG/pfdpAues51RH
         0snUZpxxCA4USH4auk+FePnrAq1BC2hEhDUmsbzA5l28EFYqyvK3RENGsepZSOsmUDYT
         V5QoAO6owrK/vZvYZb6h4OL1clq6NnVyRv+90PFBRdV3sOW9Fi8Ajm71UuL7T+WU0yf8
         NvN25SnWmy3T8uNCYQUy5eYaZAcZrP2Hq6cJxVQ3UitlWika8inZmZdsGojsdHnJ1m/Q
         688NicqabaUMCX1uE7zknvKqXYv+ozrkD4jM8CKxPUgVYLNdIUEcfzbPOjKC1mLbkcAv
         /3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684900871; x=1687492871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56NnY1XWFQglCZDR+mXGOsAUP2AtRPFO/hDy6QbeiT0=;
        b=akBpw++bKVWviG1hfM8LUraikXLZd43AJ0HCk1USDcO2ZSfaKtTCouWhEd4+jufgOv
         Xsh3jZRaCozzK+y15PYxmvfAoR/ixvsTAX0gzWMqpZnRMW66KpM5qCXFs4Y3kKi5uuUF
         b2q3mt1U+dZUpdUFHA5M9Q8SjWpnahMT84gYzh/k9WtGsNqtZbkxr6Tda91rfJsODv/I
         r6RpW/kMRrCt2Yea+mNfTl7BeY3RPtDva9KctZO2IFGhTMGqjkKOeCcZGvdO9wqFEKx0
         22Tex0HwmLJfrNjDnozDIN6XaeBqDI1kd//MPfZnNnEkjsK0nM2hOJgvSvW80fh9OrCf
         P1WQ==
X-Gm-Message-State: AC+VfDx8AI2B/Vxv3d2d6kTcQTIX2442gCMcnh+2K8NcxU8UVoK+547p
	KYhva8ibx8NnyvvY7WyBa6qhow==
X-Google-Smtp-Source: ACHHUZ6iqjajerA//gB/3ydUlqEaddMg7Ge5NDXXlR+0Fb5i3qEO6Pv4DvSWlDTFTB411LY9dai80Q==
X-Received: by 2002:a05:6808:6d0:b0:398:4385:baf4 with SMTP id m16-20020a05680806d000b003984385baf4mr1244105oih.49.1684900871125;
        Tue, 23 May 2023 21:01:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:63:8ae3:4d1f:9fc2:9fe6:c88e])
        by smtp.gmail.com with ESMTPSA id v203-20020acaded4000000b0038ee0c3b38esm4761418oig.44.2023.05.23.21.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 21:01:10 -0700 (PDT)
From: David Tadokoro <davidbtadokoro@usp.br>
To: gregkh@linuxfoundation.org
Cc: David Tadokoro <davidbtadokoro@usp.br>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix BRACES warning
Date: Wed, 24 May 2023 01:00:51 -0300
Message-Id: <20230524040051.235250-1-davidbtadokoro@usp.br>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning "braces {} are not necessary for single statement
blocks".

Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 4b0ebe96302e..ea993cbb7bf7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -1099,9 +1099,8 @@ static bool _rtl92e_set_rf_power_state(struct net_device *dev,
 		break;
 	}
 
-	if (bResult) {
+	if (bResult)
 		priv->rtllib->rf_power_state = rf_power_state;
-	}
 
 	priv->set_rf_pwr_state_in_progress = false;
 	return bResult;
-- 
2.40.1

