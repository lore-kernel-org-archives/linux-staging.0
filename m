Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2C33911C5
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784462207; cv=none; b=s2YAlD4946p5HPm9+uofjTnzLaHYKiw9+OGW/H7VzlW8byUBmtx8jd9OIEXyXa3wKAvfkJRg01ad62D7GLROJa+d63+SBWb/4UXLi3GO1lr1weohVrtnYM3edAVseGJCyUS5jVb+Ty0w0HXcr28g0+5dsBJK9ijiTQ2Rbjr47Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784462207; c=relaxed/simple;
	bh=xgYkmaC4sywYYEtk8AKTdFSt5A/jhYykhfeOWVd/JzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eWXheCizRWtkCa4qDOeqqN9WLK+9QDofIXrQN1kOHTCTJcW5htyxe7fnoipvNW2ecHX7ewi0yipA8ehNy/zNrThk67LXQBI/eMZ8gtrrDBFDYZBlcK1sT6cpebow8Ay6iEqV13XsYWVLnO4Stf7pkRA0HwqTxbE06GmQi+w3SjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4RIGk6X; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4RIGk6X"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954df200ddso8964775e9.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784462204; x=1785067004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QNVQF5gPTGrVogrPIbv9TDS9kiYitCyuOPlWplw+DI=;
        b=m4RIGk6XrjiPtZgyamP7DaRLDtcMdYOabtiFPeU9xSRVbBTFX//ZX+QKCSd09QHVQg
         JeD4ANdRqGxL/MUn5IOD+aob9Mn7Beyg+altg9O5oDWdpiNsiquAkNZCZPrEbedtjyHW
         mW2insTY4+Rmo4SsthU6WqWsFMcxJBHoP8V9gcyfTqb0PRUvsFY1g8exqRC3t7TnLUyu
         mleew8V+WtZpI4RbEy54r5+NwXXB1V6Ngu3Y1ogoa+Gze2g8HlRDyRQiraj8DZFnq+Wj
         q9EHaHOemvFoM0uVzMf35CRoBnFAchmvg1/yE8HZfsreU1Xlh7iBXq7t4F/+gdAYujkJ
         IKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784462204; x=1785067004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QNVQF5gPTGrVogrPIbv9TDS9kiYitCyuOPlWplw+DI=;
        b=hIc/nYbyjP3mIAyhX2z1kN6ssDilOWDgcpBiDafIu3SH71jCajXreWtyfPyR+4LlTi
         8taEEDKQg/fy4BDAT0uvVCHT6RAWnEQ1jTEuLIPr1eQfn9uhSbMKkhR+h/YGbBN8ZR/s
         2LyzCDUsDTZSnXUdI73bJpFsNGOMK1dkIg9ZjSdgZNQ/vAjnGQKS/xGx7SMlkBHPeTgS
         E2wl0KgNSIcbL6PMnaLIFy66m8V5a24czb5HGAF0OBJcPOmUP/7qcPt49f9kzN6fytXG
         CEhO+OrFza9wBoFf964c2hTqajsxV0QlfRATiBzs42rfJ4law+L3qPnyFyQtNis4an7L
         dKSw==
X-Gm-Message-State: AOJu0Yws7kxuIe3uSO0fHaamhHgrchvN9IKLMCXtf5VdwCBKx6BCH3UZ
	IOL7nl+ZeMwjWd0qqcfEyjBF8M6ASYp3+s3uQrznGgSu1fegksQmoYkUhNzD9yxyGN0=
X-Gm-Gg: AfdE7clFb4TD6v88PqX0ej5VKkHYKjG7cKICKiEvpG2IYJ0hHP/8nf+G+vyMfucnfnl
	CE0QeHrRqGVHDDg9WgIo/fsoHjnsCGcgDaS92PnusKXgYSLLI0+q0HOP01cgJtnoZYNbmiz7TNy
	+kiTOyYD3ogAWi7pU4p8jY/r/L9ZLWLd1ksDlNayerT3eIEYpGcEjoHZjTjO9Cqw9R8gFaSBbJ3
	BXjrYnigYutzDEq3It5+T7TnHUQrzsmLjqArgckkniwBfeaFY56yleXn6JVcP6x1DhmEfI8y1la
	qUQeRQvyn86DFhvGmBvENnHZfjmOrOCr2qFrgjmXtULVIhIF940+K6v8a5qgJlGQZqJkGGEiPR2
	6xsEMrAupbSOfaCCkasBpEOmqOVjdNtIRVhriCVzoDXs81OtBbg8kovnRd6j6eW8EKK2ua1NSLj
	UkWyeogHAL3XeRR340QIex3z52/TBWyXS84IF48pKlwuWrABwgYRxLGFyyMZ9sdj6O5FC3mk+lr
	NkYQg==
X-Received: by 2002:a05:600c:4503:b0:493:c84c:2b57 with SMTP id 5b1f17b1804b1-4954a513f99mr103759975e9.29.1784462204487;
        Sun, 19 Jul 2026 04:56:44 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a35830sm199719265e9.3.2026.07.19.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 04:56:44 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: wrap line over 100 characters
Date: Sun, 19 Jul 2026 11:54:50 +0000
Message-ID: <20260719115451.4401-3-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260719115451.4401-1-fliegbert2@gmail.com>
References: <20260719115451.4401-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning by wrapping the lines.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index cd6c7cbade9b..114deeecc80f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -704,13 +704,16 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf)
 					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
 					u8 ret = _SUCCESS;
-					struct wlan_bssid_ex *pdev_network = &adapter->registrypriv.dev_network;
+					struct wlan_bssid_ex *pdev_network =
+						&adapter->registrypriv.dev_network;
+
 					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
 
 					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
 					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 
-					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
+					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
+					       sizeof(struct ndis_802_11_ssid));
 
 					rtw_update_registrypriv_dev_network(adapter);
 					rtw_generate_random_ibss(pibss);
@@ -1024,7 +1027,8 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network *pnetwork)
+static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan,
+				       struct wlan_network *pnetwork)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
-- 
2.54.0

