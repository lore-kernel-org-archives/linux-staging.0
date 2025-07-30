Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE09295517
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753872316; cv=none; b=fa47qlsqU1gjvgF7V9Dug8eR/Dv5XTvOIXyv42W8vX3eY4UiVy0qCHlnC2pH3MIzlAkQPEn3up0nFhsIJIKxD3OLCPgV0L+hVLrVsPYGmmxR5Tu0LdcvXD/hHfXFMmnANSWMEwrtGmMtuRyM2nQRx5ho/w5OoWddyiq7xDkNMgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753872316; c=relaxed/simple;
	bh=1k5ncuPLYLjmJSNvSn6S3vq7O1Ze6ESSHk8F+Z6n0nI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rik/mtlKI+/xS6FpzFZVfUzDvNGm3KGbnFblEJjZtZHqUrpBV75qEDrew6GRADS67xJpjjL3cIpADQLS3GiG1h8klUVfP669kJlqZPKGRdvguxa3VBjv5zNmcZSTdWBvUR9BlhYesq4e/wMvKxY8VUi8GrrJMNeD8IXC4o5Lxo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz8aD8ec; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz8aD8ec"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61557997574so1318130a12.3
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753872313; x=1754477113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnAv1OGjpNdst6+omDSot3tyUGyzMvpWfnjJwpDwNOo=;
        b=Xz8aD8echkYIh67lYqi6s7LlrXkoSVDD4n1blpULjeRupQML3Q5Qza7Bwe5TXGfEHI
         v18q/pOsmZg78x0rmUSyZ8sHw9nF2dK8Nuu2YIwj14hIXttemkmyT10x9uVmXLrgfrkI
         +e2w8eYK4X25euCX9B5GCLFc6eEPO5fbTLkeMCUNKQtmUMPXsnUWO5jRxPYbMHw8LTP9
         MLhHCee0LcME9mw3Tfw1UUryKbweawiuRfLa0NW5O46tEo6G9gADWJMlFBbHDOynB9ln
         w7/jCSbub8xUesJrUba+qod9gFRxQGWIDp/BcWr7SJo8xxR4EZxQKfF97X4hVTKl/Od6
         vIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753872313; x=1754477113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnAv1OGjpNdst6+omDSot3tyUGyzMvpWfnjJwpDwNOo=;
        b=McADJQG33kYJnJoK7PbSsHinAf5VfRFnWKFruTZ4T8c2XtAG3JsTfbqdcijgJ/yXqb
         kghsGduJ9yvoKCIak0VmlBmYlPescAiZQcKhAA6qK2D/I/CDIoEKLWNNUTQCP0RGgtGF
         M9KT2ru9igWt1KA4K6QgCBSNDfFvWrdfPuO2xXNyu7QdIqnFWxrPz+tvUsdriv04f038
         mE3jti6Ti2DqXuQjS18eANYGcXo4Lnp/sX82KMapiKMvdwtFjWug3bzI187uhbzxF40r
         WxLrOlyZOjwHkEQCtRRCQEUcD9pLrDLEwtElHW6Vp7X1Foaa0IPqAjrxRc4zgE7EgUJj
         ZOcg==
X-Forwarded-Encrypted: i=1; AJvYcCUw7TvPomYWnb2523uzhuzfDNCy4SN+NkYw5n/+UES0bjXu6bBSagPiArt87QQvnMR9mshUKOPo3dGKi5PT@lists.linux.dev
X-Gm-Message-State: AOJu0YyKTnofx5PN9Rz2WGjTd3dqaZS/JsHrFeRVgdYtNdJzdKL5NCL+
	bobtVV0n50svLpUViurI35jP63RNAaOJq2bDKcxDoj5WdcA/9j2ahPu2
X-Gm-Gg: ASbGncunXWaHrq5crqiI7HoSp2LZNQcVRwFdVGiMBpTxJmwhVVLwPWvlj1q2YVhdUnx
	mKLTRlRpfgGj6vtgFHdawTSnlZTFKqqdcTVi1cj8pBdD3K3Amu3PU6nF4DEwdP0PgcIGMcUYGzY
	XDy/tnZC3BymzcTW/AN2X76HKxsSjhoy95vJQYepI4Nghs7B3WtHaoMcojm/FB2aoQ8audPnbe7
	ZKBa5aHJJiAZIIfJNjxeXh71WP1nLfeSYESXvdMk0p5C7VkYrWrRA5eIcDjWUo3Cxmt+X3m5sM8
	s5WWnfj9lWUBzVitZIEZfTobFOQB09qxDXFnN+BLAH+oxpAUlkfd5X046skFDYP9IeMLFuc3YjL
	RJkEDUx9pZodt3+6EgbnWjx5AMidzxYFoxQwXfqlRez+9wwKoltNQrx2C
X-Google-Smtp-Source: AGHT+IFegvOXCvA5sF0jNFm/UnIAP1YzQ26yl3/5ZrWK+EV9rktXxZYfEire4zGPtTBYLO1vFpq5AQ==
X-Received: by 2002:a05:6402:2751:b0:615:5b45:2eb9 with SMTP id 4fb4d7f45d1cf-61586ec4393mr2799100a12.5.1753872312832;
        Wed, 30 Jul 2025 03:45:12 -0700 (PDT)
Received: from tumbleweed (ip-77-25-32-208.web.vodafone.de. [77.25.32.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6157974fde0sm1582734a12.7.2025.07.30.03.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 03:45:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 7/8] staging: rtl8723bs: move rtw_report_sec_ie to core/rtw_mlme.c
Date: Wed, 30 Jul 2025 12:45:00 +0200
Message-ID: <20250730104501.150270-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730104501.150270-1-straube.linux@gmail.com>
References: <20250730104501.150270-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function rtw_report_sec_ie from os_dep/mlme_linux.c to
core/rtw_mlme.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 34 +++++++++++++++++++
 .../staging/rtl8723bs/include/mlme_osdep.h    |  2 --
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 34 -------------------
 3 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 27f775d8f9a8..1c720947955e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2033,6 +2033,40 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 	return ie_len;
 }
 
+static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
+{
+	uint	len;
+	u8 *buff, *p, i;
+	union iwreq_data wrqu;
+
+	buff = NULL;
+	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
+		buff = rtw_zmalloc(IW_CUSTOM_MAX);
+		if (!buff)
+			return;
+
+		p = buff;
+
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "ASSOCINFO(ReqIEs =");
+
+		len = sec_ie[1] + 2;
+		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
+
+		for (i = 0; i < len; i++)
+			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
+
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
+
+		memset(&wrqu, 0, sizeof(wrqu));
+
+		wrqu.data.length = p - buff;
+
+		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.length : IW_CUSTOM_MAX;
+
+		kfree(buff);
+	}
+}
+
 signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len)
 {
 	u8 authmode = 0x0;
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index 8e8b5de285dc..3930d9e6dab7 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -8,8 +8,6 @@
 #define __MLME_OSDEP_H_
 
 
-extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
-
 void rtw_reset_securitypriv(struct adapter *adapter);
 
 #endif	/* _MLME_OSDEP_H_ */
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index d2f4855e9d9d..918d9496d7cc 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -65,37 +65,3 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	spin_unlock_bh(&adapter->security_key_mutex);
 }
-
-void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
-{
-	uint	len;
-	u8 *buff, *p, i;
-	union iwreq_data wrqu;
-
-	buff = NULL;
-	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
-		buff = rtw_zmalloc(IW_CUSTOM_MAX);
-		if (!buff)
-			return;
-
-		p = buff;
-
-		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "ASSOCINFO(ReqIEs =");
-
-		len = sec_ie[1] + 2;
-		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
-
-		for (i = 0; i < len; i++)
-			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
-
-		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
-
-		memset(&wrqu, 0, sizeof(wrqu));
-
-		wrqu.data.length = p - buff;
-
-		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.length : IW_CUSTOM_MAX;
-
-		kfree(buff);
-	}
-}
-- 
2.50.1

