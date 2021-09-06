Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E19E3FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:13 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 192-20020a1c04c9000000b002f7a4ab0a49so2882182wme.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QRPu7/9Qd3PbniV4TOPudxpciFxl4VNYSDgMlaMBEQU=;
        b=BAu2vjVpl9dl72jIJlwdcU62DtB15Kkbn0isQimDy/KQNHbPnb0f6LnqitPubEWBD8
         IfF1Lci2sHDUQIYINsufjDnOREIkBFEelEsAFLLUZ5qoD1nl+JbAGebhTdMes4EUTsvZ
         g2deuJIuPD5xaLGPaciBiy+agXJ0zZ0WjthiV+TbIR1j3AWJZ2S0oOlYB4zBQcG78d0X
         QbDkLlcshkj57ysmQdm9E6q1vc896fAaJIg3CXkyTE85n3J7PRkJ/Q+zBL9rM+q7tAqO
         1VfXnoNSUEgqFmisybdHyb+Ufie6g61hJTTgn4zyIvc8lDvPUR4yZi/LmCT2pK+6DvjN
         fwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QRPu7/9Qd3PbniV4TOPudxpciFxl4VNYSDgMlaMBEQU=;
        b=A0LguZAKoT9jLNdbF/uQHZeZ7Ynf366RCcgDP/bQQDutQEI27ihdFEQe1jnoZm6NxR
         g+U2c5LpTF6sGziCis1mOIcHMjs28jym+GaEzMb8coImgMBFFilXdAE0j3pV3VckPpMm
         xbiDvUtPypXo2gQidOngYNvywOWtfELpBrniqyzpD3Im0xLRWU0pCxoEfsIIqotYtW8j
         i2Sb4QjAq+vSyqpqUkB6BGhjdQTkRJA3t7MfDa286MVCYctIIs5ZUbasBhbn/bAb0hOh
         b3XjOe7AoiJWXk66zt1KSSfDHF85dtTYzcrt2PJwrRDZypx1WCcuCaOCjEj041qYB+l+
         WmIQ==
X-Gm-Message-State: AOAM5329d8BIgMQN4yEDpFiVPfIXi578OTljXksg6Hh+NDVCYo/bhcOl
	Q+oYiKLPz69P9Sygmx8GEU1PcA==
X-Google-Smtp-Source: ABdhPJxo8VsrWI8mDweMn8+gETAkdAcgMKHcUkizSfEKGCsB+hg8Pn5WnnMDSe7tlTeFmhZRbpeH/w==
X-Received: by 2002:a1c:7417:: with SMTP id p23mr8925636wmc.144.1630890071939;
        Sun, 05 Sep 2021 18:01:11 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:11 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 03/14] staging: r8188eu: remove rtw_hal_enable_interrupt function
Date: Mon,  6 Sep 2021 02:00:55 +0100
Message-Id: <20210906010106.898-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_hal_enable_interrupt from hal/hal_intf.c, and remove its
declaration from include/hal_intf.h as well. This is just a wrapper
function that calls the function pointer enable_interrupt in struct
hal_ops if it is set, which it never is. In addition, this wrapper
function is unused anyway.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 8 --------
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 06ee8ef69ce8..3eb05863856d 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -149,14 +149,6 @@ void rtw_hal_get_odm_var(struct adapter *adapt,
 						      val1, set);
 }
 
-void rtw_hal_enable_interrupt(struct adapter *adapt)
-{
-	if (adapt->HalFunc.enable_interrupt)
-		adapt->HalFunc.enable_interrupt(adapt);
-	else
-		DBG_88E("%s: HalFunc.enable_interrupt is NULL!\n", __func__);
-}
-
 void rtw_hal_disable_interrupt(struct adapter *adapt)
 {
 	if (adapt->HalFunc.disable_interrupt)
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 3cbe6c277677..e59a482cc139 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -298,7 +298,6 @@ void rtw_hal_get_odm_var(struct adapter *padapter,
 			 enum hal_odm_variable eVariable,
 			 void *pValue1, bool bSet);
 
-void rtw_hal_enable_interrupt(struct adapter *padapter);
 void rtw_hal_disable_interrupt(struct adapter *padapter);
 
 u32	rtw_hal_inirp_init(struct adapter *padapter);
-- 
2.31.1

