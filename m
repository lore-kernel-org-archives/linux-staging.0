Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F236D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:25 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id w3so32852643ejc.4
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qK+Xn3XSqnVGFlxnxNxfWPIqrE0tgY5h8GYqAB5G+DE=;
        b=iQsH62qmVgQp78TsW8LX2zKarBYm/qLuIbzzvH57gC/Kxf2vTlC+A1q+V/4Q4gcFQz
         6Tqj/NWg5ev3+BkX0gVoAi03M8ap3avCQhd3dBba+Je10VBz21AI0Knw5gL0C7DteEsR
         G5OQaFIrlhPX5WsKQ7hi5oEIib4KcdtFunT2bEGtY93sMoxjMYSNoBoGpC4VZ247E1zJ
         o9mcBfO9zlNsiq2kMpPF8EGpdQ6KfiCeqC3ZUrgcIeQQ3vVnv7Aa0jMZhIhY5cMfY5xV
         48IEtn+PVEsqRyUZmj3eCia/gyKioWntlr19uygqRDux9qQsjxKKSjd5GF2/qlXgsjwp
         qdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qK+Xn3XSqnVGFlxnxNxfWPIqrE0tgY5h8GYqAB5G+DE=;
        b=nedHDvUL2MMhZea+eIMtdUBX6krtGD4RjMguxYeIL9LswJo1u8hpBDp2hZrARBT079
         Bm67fTd3Oh5maM73hmBojDGCyR7Q6aU+AP16/jHfw10C5AXOC7v+dZlS3lkoGA6hFxVg
         jPTD3cldKCRpopxkenFwJ5IPKIASnLzbmSTCNPxmiI/MnHPcaKsBJginqR4YsmftAOe8
         E417HYCZkiJvWvn83Gdo09bcyitjqRNZ6xR5uHfR9OZgQztC6cvSUK0MOdtvhoyTeC2J
         tUpcvyUDcKjuhZYQPrTRjlaaEjdmOLAaBfAc+npoIKaI2ueCsPvl82uomZ5kHSZLW4Dg
         BKNg==
X-Gm-Message-State: AOAM530RKuEOoC9CawSIf93LPaxY7Uubnpx40evWCXnsa1ebDXjVvP6Z
	wMzlKdUVBdkiDbrXKQnmCJ//KzC1JN8jFw==
X-Google-Smtp-Source: ABdhPJxF/weuJqO70KbRUG7VR4Rut/kRyHLVGI1RAMOTVQijhUzPkHkhiln4aTmSI8qv8Eod9Px7WQ==
X-Received: by 2002:a17:906:3018:: with SMTP id 24mr176405ejz.186.1618423943723;
        Wed, 14 Apr 2021 11:12:23 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:23 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 47/57] staging: rtl8723bs: os_dep: ioctl_cfg80211: 'ack' is used when debug is enabled
Date: Wed, 14 Apr 2021 19:11:19 +0100
Message-Id: <20210414181129.1628598-48-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function ‘_cfg80211_rtw_mgmt_tx’:
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2754:7: warning: variable ‘ack’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 89a21eb63c0a9..48b64fb579755 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2591,7 +2591,7 @@ static int _cfg80211_rtw_mgmt_tx(struct adapter *padapter, u8 tx_ch, const u8 *b
 	struct pkt_attrib	*pattrib;
 	unsigned char *pframe;
 	int ret = _FAIL;
-	bool ack = true;
+	bool __maybe_unused ack = true;
 	struct ieee80211_hdr *pwlanhdr;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-- 
2.27.0

