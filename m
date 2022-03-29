Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55846258C
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 20:21:55 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b24so21985287edu.10
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 13:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fIs5jI9omv80B5uNj3oOSCaJBQX+29ujQ7UOt2Cbf58=;
        b=Jf9Ra5iHS5hioNaVO9GhdL/uG/444ph1zmk8dUfMXgNVj83UXcBTgmZOtWGdvqUIbx
         3u9vsnL3GcceGLKWE7h9bbTV9SWJESQPgF4kcb8psti+o0GS/btGAzv1tqbHwY+oQjOt
         JkBqL9Hyqppb0cEwNz7H17AyztFK0zcX3LBQftBbsEycfOFdliWjQhQOd0411Fqy2FSm
         myQNedrtJ0r0q0xxD530yD5pjCG7DqM42vYJm0N3Y+MxcaAQEBu51uM8pvhtob2JqivO
         8jocciF7IEnWwzhxFLNhtJsyCrlK4zXiC+A1eT4AwfPgA5PvOhWPPtSve0+pCI8gCZuD
         iq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fIs5jI9omv80B5uNj3oOSCaJBQX+29ujQ7UOt2Cbf58=;
        b=BWL41MeLfiHsrzO71Vt8I+I0Kt9W8Xh9CyMpw0r7/wQPUPHGwbpgg+mRHC0PpxHOSz
         czSgcJyVRWQqwB7tYeAXWf/iL7BQ9kuNcEJIDvzvb/gttHoEoY7qOyIUakRPpapxGZN6
         1jzJtETBUXex1Cc8PGisay+mmmkO6OX2BJjwMrC6F2gv46JIMbZNrRuHIiqyMH6TpR8l
         lRJoS2Xucr09dnqcgL6U7NSZMuiR1vkvleLKJIX5fnAQpaRDigxqgRlDOt5Tj1P9rQzd
         MLtruPZk4UVBFFslheO7oss6sDqg7pbSPZW+FR/Z6WMmPuYpWlro7kt3D04ZyV72aJNC
         NuPg==
X-Gm-Message-State: AOAM533B2l5SmHYtueKzdasvzMcbyGxwu/YSxW4vFCk0v/+uBErRb2RC
	mYsve0tU4xDGkMkQ0cAGubQ=
X-Google-Smtp-Source: ABdhPJyJa+lNo2HUwnOhZSfYZOfzn0GkZx6F2p+5jGP+ETbLaJm7lunbaJHlO7RRzTMHAtEHDXhtlQ==
X-Received: by 2002:aa7:c056:0:b0:418:e8d7:52a3 with SMTP id k22-20020aa7c056000000b00418e8d752a3mr6703601edo.301.1648585313737;
        Tue, 29 Mar 2022 13:21:53 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id ss12-20020a170907038c00b006e0ec9e806dsm3938111ejb.136.2022.03.29.13.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 13:21:53 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 6/8] staging: r8188eu: simplify if-else statement
Date: Tue, 29 Mar 2022 22:21:39 +0200
Message-Id: <20220329202141.7028-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329202141.7028-1-straube.linux@gmail.com>
References: <20220329202141.7028-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify a nested if-else statement to a single if-else statement in
rtw_set_threshold(). This improves readability and allows us to
remove the local variable threshold.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: Better readable simplification.

 drivers/staging/r8188eu/core/rtw_mlme.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 086d64542082..1d52cfac1999 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1789,20 +1789,14 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 static void rtw_set_threshold(struct adapter *adapter)
 {
-	u8 threshold;
 	struct mlme_priv *mlmepriv = &adapter->mlmepriv;
 	struct ht_priv *htpriv = &mlmepriv->htpriv;
 
-	/*  TH = 1 => means that invalidate usb rx aggregation */
-	/*  TH = 0 => means that validate usb rx aggregation, use init value. */
-	if (htpriv->ht_option) {
-		if (adapter->registrypriv.wifi_spec == 1)
-			threshold = 1;
-		else
-			threshold = USB_RXAGG_PAGE_COUNT;
-
-		rtw_write8(adapter, REG_RXDMA_AGG_PG_TH, threshold);
+	if (htpriv->ht_option && adapter->registrypriv.wifi_spec != 1) {
+		/* validate usb rx aggregation, use init value. */
+		rtw_write8(adapter, REG_RXDMA_AGG_PG_TH, USB_RXAGG_PAGE_COUNT);
 	} else {
+		/* invalidate usb rx aggregation */
 		rtw_write8(adapter, REG_RXDMA_AGG_PG_TH, 1);
 	}
 }
-- 
2.35.1

