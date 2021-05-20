Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9378472
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 12:26:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f75-20020a1c1f4e0000b0290171001e7329so5107344wmf.1
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=boUfBdDppdi68CWZ1DuaCR1tP+CexdjRgBwZYDLgxuk=;
        b=ssdv0Tx9lb1GaIEaow+ywpGUqZgPHsker8xNMonpVNkOgs9C8FEMMXBQvyEWHIqSR6
         /K5soqinL9uS9cnbJ0rnXLrBYW9alw/ojwOdNLyAd+0eL2wO+xyKjiZfj9llnalWMbxM
         Fb3KTEDviozsbGFY2ST1Q+jKu7GjXYUK/GE7K2ZBmBBe5ABwUaT6F/oFdnb6yEImFFUA
         E+gHzBl3qz9rhuXXSc06wUVJrQFNEhoiFMdHgT1f+wwUpx3VSLNTR3zUMZZMP0vUvpES
         GZPZ/HOTx4sfw7PWd0YPty6y98CGC0gSpV0DNB6KGgEL6IP2HbSUvgAPYqRrPSczTyQo
         GGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=boUfBdDppdi68CWZ1DuaCR1tP+CexdjRgBwZYDLgxuk=;
        b=KfzJQShNO/Ew0BP1g7J1S3jPKDVqNiLOGRTa1UEnD7F99lSDDOnA3sQLDBcQN7kVdx
         BPeCbpSB1IhTI6TuOo5dIFWAlcWX/oyQ8NRhUVIlelEIwIh1CrRNVIYLM0wg5ZH+H87w
         pl9YCXrb4ZuqHy7PR2YNlQsUdaUoJKBD20tey/NdQQYH7emxAMEcMU7N/7bO7ibwIP/s
         xnNpe878PXdyobBFvcdh5GjByUuUyMinRthUH1mVZAcrDkK7llo2G6vZZyKbOZ2bVp+I
         qhqQDEdbeS1HaOfFXXySL8HzmgH++KlVXuMu2J6ABcP/rdjoNPfp8/9hxJMXW291DGhw
         SeJg==
X-Gm-Message-State: AOAM530dZ6VkuRlMvp5r4XOJI+08ttcLJQyvypq9DH93/BrrPmx3mY7I
	+fKHOu/ssi4WiLZb7BvX+Mg3gg==
X-Google-Smtp-Source: ABdhPJwGts8gvvtcP9OeWw3+uLLEfsxjAGahlDu9SP0IgtGCPxDXFmrMx5YDrodHIB8xv1yh51Qtkg==
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr3726450wmf.53.1621513583141;
        Thu, 20 May 2021 05:26:23 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id r5sm3001817wrw.96.2021.05.20.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:26:22 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/2] staging: rtl8723bs: core: rtw_mlme_ext: 'evt_seq' is only used if CHECK_EVENT_SEQ is set
Date: Thu, 20 May 2021 13:26:19 +0100
Message-Id: <20210520122620.3470450-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function ‘mlme_evt_hdl’:
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:6004:5: warning: variable ‘evt_seq’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9fc612fb736f8..80e5c29852b8a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -6009,7 +6009,7 @@ static struct fwevent wlanevents[] = {
 
 u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	u8 evt_code, evt_seq;
+	u8 evt_code, __maybe_unused evt_seq;
 	u16 evt_sz;
 	uint	*peventbuf;
 	void (*event_callback)(struct adapter *dev, u8 *pbuf);
-- 
2.31.1

