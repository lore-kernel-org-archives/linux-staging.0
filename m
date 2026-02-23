Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72C91D63F3
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866444; cv=none; b=Vyv0hQWUtht9bjgY0O1/7XHvaR55Ao54a1cJJXE712iq4kZy8b9BFM3F476+qH+rKsKfy/CO9RJ0mYr0h+VjS/EEXlAJwuqwGLTP+VjXfDwWAM1HjWIhP6t2Y6W/HOzzSY6Tqf0obz9Tjhef5krQnBjwOmFLu8ikIsVHL3vbY04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866444; c=relaxed/simple;
	bh=hCCQfEVR5WVztRxxN077LywfOk/rvX1kv/GOeqeJeGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O1CV5od+cBjJuf63yLSC41f1sRS1dFQkXGeuU1KvDpVgJTcPwxm+DAKZ3kqGLrtAgMDuMPgF4nEdTVHTe1Jao8BYO5kbUR1nd0tkg77abRiVPmXVMHfI7bpoW5DYyEFbMp8GeALicaPAvNLWyoKUwXM0XiIrhNBzuZw8xWjK6Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgupme2f; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgupme2f"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483703e4b08so36526555e9.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 09:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771866435; x=1772471235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mytQLDLVbzxjk9TCqtVuElRV5g9O13IhzgXWafZQ10Y=;
        b=fgupme2fWty1PVAQIIShG1uo3g/0xbm4MXDh0uGMztghJkfuwsg39qgODeRzLofVjV
         KCIBq4j2EeZaGbIippbLBuAWEfJ7J462AiP6beBAtq3mx8SYen4xmb5KtgQ7+1I0j/42
         NNJYBkb36eJTLbKH3SorXcwtGod6L0sPKSZprsDcrPPXCifFGC0LMAAxgKgq4titryAK
         0u7tyzH2wdkyoj5nFsHVclJoGoqOaibTRbzyaWzcEo87+vat99BYH8PQ7E8ljo+btcV7
         WvOw4TfXe3DlT77QU59odmDpwcTL8eMz0hKAAsViO+8FgFAfzPzd70DgTe7wkXfJHxzx
         PsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866435; x=1772471235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mytQLDLVbzxjk9TCqtVuElRV5g9O13IhzgXWafZQ10Y=;
        b=m7Rul4RQAY/86yusoNoN+UJ1oe5zeNfYoDh7ARyUtd9FjSf1ejJVhhw5PN+WwXnzCv
         mkWlOKuD/fu+3Hi4N83XrdthCx4tYHkjSr9ews3BTo6FAkVCP+rMBSROLC+7SfDJz+Jc
         GrjU9SitFoK5AtNiC1m3mcccmiPEn00PHByVAoOlKNWU8rnIpB6QcTyhGo35dpcntxIJ
         kKBsJkQHEtXW/jm25Az1oaOLwETLH/Umbgl1SzrAlcqt4SCPnt15oNEr0MFj1Km/hbi8
         FBla7lpzrdIAR4y3MJVfbpXWO/GWyLxkZLUJHDi8fMsBykggwJZ23kGTL530xDgZYZpF
         jC7A==
X-Forwarded-Encrypted: i=1; AJvYcCV/9BNJdOga6whAXICcmBWk9v+V1+vWfldfv4xhHGKOwlcmn0uUhIIooWlcq+Tj+5pUcJH61pq5Iaxq5M3k@lists.linux.dev
X-Gm-Message-State: AOJu0YxYKAsmy8t25yQzMivy+MitJSS/q0A23WJw5gljZCE+uxBxFq46
	kWb670/oQxSMRwsJNs8oCMQgMVKwlIVCwC5hhnAP5MDU83lgXXaRTCLV
X-Gm-Gg: AZuq6aLo7bbeSQSp7fX8taovq8ZVCEg/bMTA7Sdqz7J4xgATx+nVGMhRR4F4AB0nPhg
	G3bizhDD1+OS/hU+C9n/9hZERL0qrtbsg/gvk5h+r2jQfyldTeK/SXOvldTrRrHNe259wxu5BoM
	AtSJ6Uz5OopEqIICfGbNI82YeMwoglRVK7mGX3M+Wzo9XgPgdse4ZpZW9wgiE1j+716Lul4sAib
	IvDZtK8HRhmUIreb5JwW+mm59z+yPG8B/7Ym8R1j2j5SMlnorScL0XIB0Sb4p/zmSV6sbQl4zo2
	+hLlJkYbAga8MsbY7A2gRszfpiBhWeEVFSlUlwb1lNJLvmvL1y9iCV5YgghSiEXHakZG4sbAoYk
	4GXEFHy/rQCk8egkInVDseqHlfrdSyuShXxDy9Yj5Nx1sHCVvjqtCl107gvCb6Dc6Fe5rCO8xqO
	Vg+UL/htaoMAgwisPWXTWwuyGNCql1kra/CwfVP5WVVBYwNaiEcBMDAy7LOSaFFvg=
X-Received: by 2002:a05:600d:8446:20b0:483:4b37:8620 with SMTP id 5b1f17b1804b1-483a9d8de00mr111470995e9.10.1771866434582;
        Mon, 23 Feb 2026 09:07:14 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00485sm23036669f8f.9.2026.02.23.09.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:07:14 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Replace comparison to false with !
Date: Mon, 23 Feb 2026 22:07:07 +0500
Message-ID: <20260223170708.9627-1-mariyam.shahid135@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace comparisons to false with their logical negation
to fix checkpatch warnings.

Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ebe73abab892..0192543cdec0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		rtw_ht_use_default_setting(padapter);
 
-		if (pmlmepriv->htpriv.sgi_20m == false)
+		if (!pmlmepriv->htpriv.sgi_20m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
 
-		if (pmlmepriv->htpriv.sgi_40m == false)
+		if (!pmlmepriv->htpriv.sgi_40m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
 
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
-- 
2.43.0

