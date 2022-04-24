Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E817A
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 16:31:53 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id b12so7090801plg.4
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/noh+5Uc1qGrvG4//CeRZx4MibEjRfxJ6hoprNgkUE=;
        b=VNeRnw63/ItAEpzBOVWitrcmRTeccS46J4GatZadFJK7b0ByX4ql7Hm2dQfS4A9ORj
         9bcem5WCbul3TgJrbmgK+vC9mJbWKdLyDGLhcc9OAcKJ+RrCOp4/1/YPQXi6FyIXs1Ev
         FnGhVSeP7Q4T7PxIj64DqQjLzaxKOoTZvXaVrXBxNpDgvRWjFkuW95e36pfVpCwVp7tU
         LFVVGsQwZXJw3hbmiiyjEo4iFL83q5HbEIZBjseCQM0K34+6KYWMFH55ZVANLCJtPw1x
         pRNjbIKdfkmSkLlUrfR/J7zQt2TIg7qhXF5cuIEIdBFImWQ+o5iuHt327eix2vDo10Cq
         T8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/noh+5Uc1qGrvG4//CeRZx4MibEjRfxJ6hoprNgkUE=;
        b=AFNS+zyjhh/PNbBwQnBEPZKrND8Vz+E/oeTiVbcVUjmnecwXZfn8fANzAg2e0Ch7eJ
         Mu2P5DL5qmnfThueXII5+2ujayYkLy33VwZL4/lvftNndih4fM6BUQ3dorY1u7lsde0h
         oJtqCx3keCVP+/vS6GtKNG9p2OQfKHFg3xClvBixiGjrXG8ZB1NisSjetpwHZ5sGTLBz
         npqgvCS5MV9VgZL+GmmF1fOXnJejYwJWZtHI5Q9QTyFmVRYfjXR+r+EK0Im5TE6jhrUO
         OcAHFBfli1jWBc1R7ogpPDNeKagpx5PZNzYJH1JQyXxjE4gUzsFSqm1K0j1CEMGoRBgc
         ekKw==
X-Gm-Message-State: AOAM532s2UZUYmLkpf7GlECYWgTIS5fVg6KUPc4WEpe5YfxOzf8pNt3n
	xV2GRpndKxI3DdEZuGLEVu8=
X-Google-Smtp-Source: ABdhPJyZkH83VKTOm/vMgLC9ylS+tM2c+7OtyemNTH198Aozf2c2XTcDMLNYBbmXLPaYXdVUxPgBxw==
X-Received: by 2002:a17:90a:5983:b0:1c9:ee11:76df with SMTP id l3-20020a17090a598300b001c9ee1176dfmr27107739pji.95.1650817913328;
        Sun, 24 Apr 2022 09:31:53 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:b82e:45af:4bb0:4014])
        by smtp.gmail.com with ESMTPSA id i5-20020a635845000000b003aaba2d78c2sm7113472pgm.71.2022.04.24.09.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 09:31:53 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: fix null check in _rtw_free_mlme_priv
Date: Sun, 24 Apr 2022 22:01:32 +0530
Message-Id: <20220424163132.37007-4-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220424163132.37007-1-makvihas@gmail.com>
References: <20220424163132.37007-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a NULL check on pmlmepriv in rtw_mlme.c:112 which makes no sense
as rtw_free_mlme_priv_ie_data() dereferences it unconditionally and it
would have already crashed at this point. 
Fix this by moving rtw_free_mlme_priv_ie_data() inside the check.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 081c02417..87c754462 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -109,12 +109,10 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 
 void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 {
-
-	rtw_free_mlme_priv_ie_data(pmlmepriv);
-
-	if (pmlmepriv)
+	if (pmlmepriv) {
+		rtw_free_mlme_priv_ie_data(pmlmepriv);
 		vfree(pmlmepriv->free_bss_buf);
-
+	}
 }
 
 struct	wlan_network *_rtw_alloc_network(struct	mlme_priv *pmlmepriv)/* _queue *free_queue) */
-- 
2.30.2

