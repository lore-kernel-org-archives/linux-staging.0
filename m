Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9825E33343C
	for <linux-staging@lists.linux.dev>; Wed, 24 Dec 2025 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570740; cv=none; b=JLWfVVBTzLAn+uPoQGrYg5aG4dwBqi4U0untyQwExC6vv0hmMloV9HqF/mi627GUxqL6dzqCRZNJroIvPqP2O2fQFuBEgaGH4rh7hNOymBi1BLwcxGLeIpzi5E/fYr56nwLe4WvqWfa4Ab+0kmtOEqEFSMmGM/b3meifQRZAZms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570740; c=relaxed/simple;
	bh=vV2AxVBGWNPf5DfiHymaldGfVCu4+j83dikHYL9Al40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1OGfRmHfgwMsfQAN1W4FtJAEkA1M9JaG8dSUobIYNi4m5IztA4F/ZQ8mIT72v/x9NiRMrfh4PzGWbyD9WYiwU2DTQ9zPTdx+Cw9c5QXxzojKuCPrvy++lRZRErcNFIUE+s0hkdpsrZibsQRJfQxnI6kvthex6YjecZ0uXRzDEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPTlPONb; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPTlPONb"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so5309316a12.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Dec 2025 02:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766570737; x=1767175537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggySzSK5iKOIYAfFp9jHFvxyzRSSRMRx7Zg28buJhXU=;
        b=PPTlPONb4JN/yet0xMZ4V/1WJ1So+YX90GbPSs8RdrmkPtyUrz/pMg6J+Fa7qKN7BK
         TlYKYME4FptWRFOvpehMmg5SxSroQn19TPdSwC06LEA1Y+pme6G6woQLjP3o9xkgSzBR
         c0rZolcMbkk3f4iD2mdWNvRDt34n42Ow6RmZA2hMIYURewjA4i5DGT+Vx25ELQEQQo8B
         vjxa46OuB5+9LENmsV3mW+p4kuPrCXgAd7wYS8wwZyJQH8Uqlo94JRLZqj5OpW+4C2CS
         mFCw9W3r8yeWXOk+Ip1t0c0qvle7322MjQZGAK/58CQUZLKJTa0qa1eb9HNicXMD3sdw
         OUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766570737; x=1767175537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ggySzSK5iKOIYAfFp9jHFvxyzRSSRMRx7Zg28buJhXU=;
        b=QQGNzA7RAV7zcIZxab5pEEkASjIIVFPf7gCLozGDDQLph3cap3HljhbTnG7faaI1c5
         2ciMTm/UBUyG7UwfCGNy7vIuzGYskQlrYhCCEaLISrp/8pbXJw8Q3vajZWB0tiujhh1D
         qQq/AeKu9I/od380luV2L1jtAvFjKtuT8gKEPRT3gBrshRg75K4m7kfsVU2bvXmuLDb3
         6iusZ6DRe91DHC2qwrgbaG5eGyuiwX5q83GRGWKfVF0WLr1LtRiqgfPjWrW1CERXt9/U
         MuVc2jDZz60UYOKnKoJ2H1d+ZFyv45odFlw0hBT/Hnrf250Ig64skY7wJyI5cPSZ6uJ/
         p0PA==
X-Forwarded-Encrypted: i=1; AJvYcCW6dv/6qIE6Dz1lecxYABwki6hYhM+4OJ7ws0lLMjIdvJTFL/lt2D++QWBBUta5KKdLxkxm8p+7q0hKqkoE@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0SKexMSgjJRvjEjxTJapBNqRU9OnIPZRDcude6g4FcT+HmN5x
	VzxmP8jgDcZfjpe9mdWnspx/lCpqOsZDPqXVpucVih1l2EExSo337KMp
X-Gm-Gg: AY/fxX7zjWqe8stdSlmbbI9c/6C+9rBxW+uLzr7WyzYgbsJ6/zYSDEYzFqHkPiiS9E/
	SQwzz5NHGw6Lhe8cEeirZWBEssnOP1j1VmpnNqjOfHrThKbmlRrup6sYXcvJzG/CVNukxg6klRO
	L8tXHL7BLq9LnRzCf+C6gmYRioAN+E7hEmYndDW0wY65DhIMMFezTMRESjtYpbo4QiombkIPkLx
	ZDtMTB1AkRW+LrEWjWTxP1MuhvMOKv5s4Tmdl6Lj9lsGMVm6t04F5eWCfbeHPsjuPSQvo7ePlpC
	rUjAWALGQ9GCZTxTUdygN+xCWNXYuAuP7PeeL8bTZXUtgcVBkUMcd4a7Or4tDiCAXq3cfdBXXeK
	nWrSdIu04H9PR7PjGN/lnTMxj/Wn2KDSfke/G7pnpAbgklCDkQQ2xelCeIJqF5Ja0tH2nk9hJNt
	vV+yvMhrcZWRoAQBQoVG+zhxzwIgHgtmjLqfa4tj//3qWh1kZNiYZBK6Sayey3ag==
X-Google-Smtp-Source: AGHT+IG5A7MgeSNs6EXtL/BhNu3tiByZhWc3rS3e0jv396fxloE3TxxnIVdR90mG625aGYB2El5wpg==
X-Received: by 2002:a05:6402:1467:b0:64b:5851:5e7b with SMTP id 4fb4d7f45d1cf-64b8d34f12dmr18291199a12.14.1766570736665;
        Wed, 24 Dec 2025 02:05:36 -0800 (PST)
Received: from localhost (19.120-65-87.adsl-dyn.isp.belgacom.be. [87.65.120.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53be0sm16237966a12.2.2025.12.24.02.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:05:36 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: core: move constants to right side in comparison
Date: Wed, 24 Dec 2025 05:02:56 -0500
Message-ID: <20251224100329.762141-3-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224100329.762141-1-william.hansen.baird@gmail.com>
References: <20251224100329.762141-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move constants to right side in if-statement conditions.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_security.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8fdeeda88a6d..92b12a13d27c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1009,7 +1009,7 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 	if (pbuf && (wpa_ielen > 0)) {
-		if (_SUCCESS == rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
+		if (rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
 			pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 			pnetwork->bcn_info.group_cipher = group_cipher;
 			pnetwork->bcn_info.is_8021x = is8021x;
@@ -1019,7 +1019,7 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			if (_SUCCESS == rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
+			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
 				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..86e54454145a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1488,7 +1488,7 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &(adapter->securitypriv);
 	signed int keyid;
 
-	if ((_WEP40_ == securitypriv->dot11PrivacyAlgrthm) || (_WEP104_ == securitypriv->dot11PrivacyAlgrthm)) {
+	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) || (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
-- 
2.52.0

