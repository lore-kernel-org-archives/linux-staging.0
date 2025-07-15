Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98FB2BE7A8
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604117; cv=none; b=WIlEzlw0pnAomhDoYAwUCANaXBKclJzKdlCgjj8BuOypC9v7JnEocfX0GGw0rF8I8VAwfiSpo3MEjYhsbrFKgRDUoR9utIkuCCv5fXog9r/5l7Q3wEEQtBkkxTdtktR4PTOQEqRPOmZrGiojguK8X4IrCl07w5F4uEZMlz7/uH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604117; c=relaxed/simple;
	bh=ZndwHlsXoOEq87MYFPcyULLV959fWfCpTZu1ZS9F1Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AO5p1+gC6swOzHd+UwMsV211cPg3dr5TLWQvnMV+X/BQ3WHRYpQY5Nk7Rs1Q5P2QfU02pKej7PeIZpSdNuL83w0JrYf51rYaXJgyU2dDWisnmcuLUjVWvcMB//iR2Nv2HeNaCixruK3oQtrGLe2wGYDV/ryVGd70CEnRPu+EXmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoSRd2IE; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoSRd2IE"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso9118530a12.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604114; x=1753208914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQldTtAKMIQtxzVD+5dWQI6iWAw10lsHzzaGm1uFOEE=;
        b=LoSRd2IEX02RUlSbofia4T0EysR21xBJA3rxYWcu7tucrK1hLiuOvVqzXC6BcokaK7
         RvdaA8/DESOIHTCpRWtKCvbjApI6jW23g2tbyYQfs/kgC/KRqczbBnA0SRYJ7ZBOKayn
         aiEIFXtfc1V+Dc3G1Cxv4BoZynim25bRG2S6c9cL+QbC3VhKi0ggoLJpnnIx2pAqv7nq
         hynd+2jgap7xXzRnoZlgW63d7N1SXiIQtKbnc5xgkggSjNFCAElhPZD5i06inpwRCWDn
         16gLo/iwRDHexEXuyX81qhikYxvF+BfhQyy3sNd9EVo48Z6wNiyRy1HzaxsXBMjWIXyk
         cWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604114; x=1753208914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQldTtAKMIQtxzVD+5dWQI6iWAw10lsHzzaGm1uFOEE=;
        b=noGMEbDv1FnJseLtSFg+EYWe5DUMCd2RJswlbVZrDq/z6f//VwIcV9+HM9FQiC99hl
         OtUa0t7uYDtUnmHzahoS8DYIQ4BC8g2pmBDgAcdw54lR1mZ/rsB5Fiarhmw2HUJUkxKM
         C5iN2yg3bCcODctrHkyDmaMaZsU4wgil6PbOpPUHnxFhNE8t8+RIpGA4HmIF7Oove926
         f3g+iE6aPlDuiD+Wl40h0FWxHrFfF/lbZZwqmDSsNhRAoop5KpsQ3ysf2xozJDv78oNX
         8Pyxp5SLXXeLLGpzUcUfLUy3SWkIZoX9LczWbv7f9MZ1zM3ew+CTHRlLDv8GywSeIITl
         F20g==
X-Forwarded-Encrypted: i=1; AJvYcCXra7iEBj9k4byuZbtnv9B8FWSwyrtmDX+iOmJVJO/9GP0hSrO57YWEP3iWawl2T00VE8hb7gpuoJ6pQ3Bx@lists.linux.dev
X-Gm-Message-State: AOJu0YyTZLlegr2ofKJuRezKXcMv5In87lam8zRyPd11312pjwriXkHf
	olYQATZpsUsubEoI6ZijJBcmMHTtqhqiyfD9Yv00/mFU1OoA+Xsd/pP9
X-Gm-Gg: ASbGnctAGvlQZ8eo6vclf0Ia1Hhqjjmfv3Cm41K2qch01UbOH+RfgvDXrp7eJSW6lE2
	Y6WjtpbOPHOxSxmoVuVUzxk/u3UqqxuxgOQPt2+tXAWVJJKR1eVqlRlRPV19oI1GB/sfa9OJS0R
	SvnFyfsP3aTrC4wql635PllN8h05pm1Fs/iCxjSAp23dNUs9qvpBgCJ87phUwcfdfAZakLqoJPj
	btyfiFvbvyIQ9dmS2VOEUGUK2pXs/EWC6A4dRCuAltmF2sEp05/AVtTW5hu+24+ZzsYHQFYkIQC
	Z8F4WbEoU86wFdbJ9FoxWF08H4qBvj9FKrMnBrA4xyD6CIL0cQdkYDmsX14FRhgYMXXk1AYmZmz
	MLdtvwo5+oloVKt8/oZkn4KU=
X-Google-Smtp-Source: AGHT+IH2IHr9Qgp69STi9QpDuKWBS9ethTg3YuTY5YBLmdKPPLj0dxlj0qG01IAXsoKFY27yZbY0lg==
X-Received: by 2002:a17:907:72cf:b0:ae3:b22c:2ee8 with SMTP id a640c23a62f3a-ae9c9b161c0mr50161566b.37.1752604114000;
        Tue, 15 Jul 2025 11:28:34 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/11] staging: rtl8723bs: remove macro hal_xmit_handler
Date: Tue, 15 Jul 2025 20:28:10 +0200
Message-ID: <20250715182814.212708-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715182814.212708-1-straube.linux@gmail.com>
References: <20250715182814.212708-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the macro hal_xmit_handler and use rtl8723bs_xmit_buf_handler
directly to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 drivers/staging/rtl8723bs/include/rtl8723b_xmit.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index c6fda239d020..11d9b9031215 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1315,7 +1315,7 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->xmit_thread_handler = &hal_xmit_handler;
+	pHalFunc->xmit_thread_handler = &rtl8723bs_xmit_buf_handler;
 
 	pHalFunc->c2h_id_filter_ccx = c2h_id_filter_ccx_8723b;
 }
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index ac4ca7e05b9b..ddf868c7899b 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -414,7 +414,6 @@ s32 rtl8723bs_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 s32	rtl8723bs_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter);
 int rtl8723bs_xmit_thread(void *context);
-#define hal_xmit_handler rtl8723bs_xmit_buf_handler
 
 u8 BWMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib);
 u8 SCMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib);
-- 
2.50.1

