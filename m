Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9231A7F8
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 11:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069683; cv=none; b=O4INmfGxicRkuHjXuqR2WtmDjj4LkEZn0/dhbJ1rz9uKeIhkv8vE74AZlitiKZ+W2DnBRa1LY2ieXMYeCaSmwntbXeEppituHaBycirhp6Xh8PMobo5vwqI9SAiOP7Uj8bzS9hsbkX7ZaJloKlmQnQWPlh3SqPmZUW537Be2yYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069683; c=relaxed/simple;
	bh=I3GZ8XwBioEHKmiD5OVtWbKJ8W0S2ADG7BUv6vj/H8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4GdVCjAZqYve8mmks1VF+o4tV4ZcYvA7kpboUXr5HyYoxswwJ+U69FITLJWWoODgW+60p1iK1jui9D2ckcWoGvOGp/pvao8uBJV1MAovrr3laGdrpnYVekQ/nBUwNrvKkb2ynCOw9VCu3DqkprBmr3AE1Q1T4/X2rVJilezEI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlbI6V01; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlbI6V01"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso7788848a91.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 03:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764069682; x=1764674482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5Ist/iGDJwJAI85WLcHXvNoHsSh8TLeoUx3PCoW6I4=;
        b=IlbI6V01bz4eAY17CPuaVjvFKNok6ABPFkEetuSz6+zO0FsHjHbrWjtgBgnYx1vKXJ
         2YBGNuvNi/Vub4X+CEXxKxYyG9Va4GJGnVeCQ6ASG0/3qpl6xkSVhvPwaVWJX4V98ZJR
         2ZyepQRWoQiPhEnHrldRuQoO/Q/2OipCoMAaKfjIPwWBEUB2tr2p2cAge7eTxcWxZRLD
         Lq4JCKrnfLTFRDL4OV7HBJYQsUKS0lsxqu8aGI7O2Lm2xarsREI9DNw4Ddhs0e8oALmE
         ZaK66X7Gkt5Hgw9fJTY4mCtFjcbBuHUWdLXZJCEFP/QUtwffc87K/AYGTrACH+n5rwAw
         4YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069682; x=1764674482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5Ist/iGDJwJAI85WLcHXvNoHsSh8TLeoUx3PCoW6I4=;
        b=ihHNl2mmWHGEnON4sHSsTxt8ek+9FUdOGUUuIoWMjyDIjCgQ2eIzHuW4zXqEwGkAj0
         a8J5Ui4d71qn2nsDwkKCCc2nbgCFkTOohZKfysASvigeHxFmOYgosl7CFFlqY5Fpf1VY
         nI/jskbL+4GGzovn/M32XuHwpQJh3qYiHqLyB56UncRPmSoYaJn9S8lSvgkj2fns+0n+
         sLc8hqoDCSf5eILOK+H1XNqhiL4heRl8CqXNkNAWMHtwzyHtDzwO+WOVC49aWdXLQ7N4
         I3B09L+XFTuyHV9S2OlUy1QuV0sq/jL75HjOddWwvi1VGA6Q0fTQ66sjmkNVDXxPqYbW
         8ZYw==
X-Gm-Message-State: AOJu0YyGUAcPMFrbW0rmf3M/sxwQS8AUpgo7Et9lnP8f8qiFikyJMygA
	8JyI5xUjMwJx+MuhMAcx+BYgB0L1tLLTumhGUMBQJ2CL4DweCOoSu8xa
X-Gm-Gg: ASbGnct+bwMhDpMgcJ1PM7EjvxOTBbQcyccG2NMqLnc5rBHRnI9zcuFJ14vVv70Yftx
	ykiA633zALSl+7z2/5dgFklGQxuwDDwb1JrNPIzVBoPl/2zejkpD7oMTrzLWyPb7nx2+bbaRfY3
	2qTwfIbcY26dtf8c3URMJ0xWJpUAvPkVRPrtuaZdJSkHrZX4SyzD8/BnIAe4ZeOmvOEn/mRMjf+
	fKAhyot6LJt9PfAd5WSjskqNbCfjH2c10MbrwYm7577e+9FsDvWX9qgXuzUah62ojar81kC8Zdc
	ErV7RXvT4ZgEaF1QWJ4WFgEcdmQucsdFXOqjWgEF3dkVcpKTmnXdz2sl0sJcSJ5ww2SvZGlO24I
	f5Yx65QiicU3pQOAe3neTF63mP/uoTUAmTdoLRoC6fRb9FxGcOqAS2Wg0d3LnTVMqhoWn5Zunqt
	r845A8qjB5N+lbE9zzND7Yy53jQ1QnG+kTdWygp73b/JStZtjX0P0iJD70drx4m94i02HkRKtpW
	Tgax9GK6RIZ4aVLCEGhJg0LcsRo+0F0lUdsqtquuLK8oiIVV0dTAH7YINRNH/wBsdiN/+F8YTjR
	pszLniAOgQ6J1qx3sAM9wZ1JzJn/GxIcqw==
X-Google-Smtp-Source: AGHT+IFA9nFLT0pvtshZXrcVVlI0mAQS56rjPa1/up1ipD7A8IkqAHLbi0Fq05Exmt0aQJYAWLTO+A==
X-Received: by 2002:a17:90b:2587:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-34733f34e52mr15923438a91.27.1764069681717;
        Tue, 25 Nov 2025 03:21:21 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727bcaf13sm16296250a91.1.2025.11.25.03.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 03:21:21 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	david.laight@runbox.com,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v2 4/5] staging: rtl8723bs: replace FIELD_OFFSET usage with offsetof in rtw_mlme_ext.c
Date: Tue, 25 Nov 2025 11:20:58 +0000
Message-ID: <20251125112059.16913-5-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125112059.16913-1-knavaneeth786@gmail.com>
References: <20251125112059.16913-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usage of the custom FIELD_OFFSET macro with the standard
offsetof() macro in rtw_mlme_ext.c. This improves code readability
and uses the kernel's standard mechanism.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a897c433d2b0..9372b997fc23 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5275,7 +5275,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		/* clear CAM */
 		flush_all_cam_entry(padapter);
 
-		memcpy(pnetwork, pbuf, FIELD_OFFSET(struct wlan_bssid_ex, ie_length));
+		memcpy(pnetwork, pbuf, offsetof(struct wlan_bssid_ex, ie_length));
 		pnetwork->ie_length = ((struct wlan_bssid_ex *)pbuf)->ie_length;
 
 		if (pnetwork->ie_length > MAX_IE_SZ)/* Check pbuf->ie_length */
@@ -5339,7 +5339,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	/* pmlmeinfo->assoc_AP_vendor = HT_IOT_PEER_MAX; */
 	pmlmeinfo->VHT_enable = 0;
 
-	memcpy(pnetwork, pbuf, FIELD_OFFSET(struct wlan_bssid_ex, ie_length));
+	memcpy(pnetwork, pbuf, offsetof(struct wlan_bssid_ex, ie_length));
 	pnetwork->ie_length = ((struct wlan_bssid_ex *)pbuf)->ie_length;
 
 	if (pnetwork->ie_length > MAX_IE_SZ)/* Check pbuf->ie_length */
-- 
2.43.0

