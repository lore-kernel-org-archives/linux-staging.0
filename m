Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9471A256B
	for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170089; cv=none; b=OQA2XVSuhYLrmdkEjSWbVrQhkuOhc2P3Uqn4Jckt+hCED44tPTomxB87c/mgvfOAVnvBifyTUaga84jHHZaR6Tr9Ec/iz5N9Knc9gdHcQASSFMFo4x2//A0EYRAA6Whvw+/QCH1n0Avy7v+Hajrna0veBI9yOykErtF2AKuEcJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170089; c=relaxed/simple;
	bh=1l3HjrUJiABwtuxU2wIL/CGF1DZPSxv1vgQ9ZaOoRIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGPDIeVjDE7jkFa7EV8atYWS75UCIqnA1DSqdSE/Qy+86Pz5/clnK4MAyzUV/mLRNrFrxqgEwBIEeWDtO86DnxmEN+0Yvb4sETvfk8ggiIGJEXrXRMg49DGGu0ya636C9+4OY8W0zoJP/7BkJemvVIahCijg47sGOcLmoOMcPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/G3neaT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/G3neaT"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so8223578a12.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753170086; x=1753774886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7sE0GkdsD45T0HLSOYCdFV1j0QzJKJmMfNON4MWVo0=;
        b=F/G3neaT5rmJEjezURxcxnuyYfEOGF5lTsrcHm6Eb8V8d0k/yIj/mf1FKBlgSNiZ2s
         5yuhDzNwcxDHFS6O+FffgUA6qgiXg0Xdpf36dNDrn795TX8zCd9lI/Ei5nJyGXAgudev
         CtPEEvabB4OXEA15ICtATmPl8CabPqSdB6sYzsNogJJeIJHJ10vjAfY2jX4b+24JiRDQ
         d75KQsgqaB1TXOwWfDJxb9MTevjHE1U5ChBFK9Tku4H0xk9pbEnJrLMKE0OnYBAKzvo5
         nfUBOxBHz9CKN/70xUJUJZK4YcnfiXzpZZepXRDiZNnBcb3eMJqWpw5LXJVtemNQLIQW
         H0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170086; x=1753774886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7sE0GkdsD45T0HLSOYCdFV1j0QzJKJmMfNON4MWVo0=;
        b=dKnwVqEfslunwW3vkW64SqAQtDep3wbFfcSD1U8SWpB2PpVc1AURfFEc6NmKdjR/M8
         w/jsbj7+9Cg+ucLXeEkoO5xm1E+Akf433UygXlfCZ3rJ/5feEi0arq9kspxQOwCPIHfX
         nCMm4G6iUd1sTju/tRj7TQ4a1y5J+QHU6j8YVsQ4b7b/lZG7JV7859j4LVYd0NosZiAm
         VpvuWYJc+ZQDMtl1W7YSApYL3orAjjVlMXiKABloNSjPk62PHWk3kAei4PR7kurJsVDN
         OOBQH2UBAsq7MEVNlm7s0oHRyLv/vNu2B0zUYXZ+q0lek9JvTl8ddh4BtWFBCKilb4eK
         gL9g==
X-Forwarded-Encrypted: i=1; AJvYcCVdct6e4+KqjaH7rGVhCuql7igDHkS7AQOOH1gyr6gxh0Rc4UCG8TrcUuC/noSdvVZ6n1gVm66gCiHO4jI9@lists.linux.dev
X-Gm-Message-State: AOJu0YwoIraOpiP5xRyOPe2qa37eWTV86ea5W6HUE2HggeYIQSmHBGSn
	JJZFmuv2sd+g29245oKvyzODRoXLpt3AQVs0YEOOev9kGS6EOSQZWHsZ
X-Gm-Gg: ASbGnctbkZg/i7JUevNijQMsyCqjQrxkkZUQTSLpqgsBe/oOZzZBs1Ba6OZwtLgUAiF
	T1v+NF4n32mcb/yixlY919wmDwEgTrrckG3arto8/c78IsKQAI7LNHynahkgUDue7Uw1hMYXuIk
	Fng+9Efw1QKRqem+rfhWKKDqWsBcjA3jvSucP4TeJN5CpqK2F0BesA1HrMdc/H+WXBAAIhrDYJz
	HKY5RlNJoH2NBZ3Osy33RIOY7SzymZK9USVXeJMq2zBHZckWjzmRptrEMlJRp8dNh4YCyRiOiiV
	gSsKsoQD6QDBlFmkUxtmvtKZX5tybVgSaW/hMPRQLJ0Ra77/WzU3sARLfHlEtXyBh2vWggEys2r
	R+qe87g1nnD9dzrz16SZfzUI=
X-Google-Smtp-Source: AGHT+IG3gF9sE/0Jdy1kh7EZCr4YbiDOyy3LD42YXJXtzPUkI8b7ra1CAa9x8WSs55Pu8qd79Zg+kw==
X-Received: by 2002:a17:906:d257:b0:ae3:ed38:8f63 with SMTP id a640c23a62f3a-ae9cddea78emr2252508466b.14.1753170086114;
        Tue, 22 Jul 2025 00:41:26 -0700 (PDT)
Received: from tumbleweed ([95.90.185.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79d6c6sm821224666b.32.2025.07.22.00.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:41:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/7] staging: rtl8723bs: rtw_get_encrypt_decrypt_from_registrypriv is empty
Date: Tue, 22 Jul 2025 09:41:11 +0200
Message-ID: <20250722074115.35044-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722074115.35044-1-straube.linux@gmail.com>
References: <20250722074115.35044-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_get_encrypt_decrypt_from_registrypriv is empty,
remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 6 ------
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 1 -
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b60f5a456543..742e6a212a02 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1092,8 +1092,6 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int		the_same_macaddr = false;
 
-	rtw_get_encrypt_decrypt_from_registrypriv(adapter);
-
 	the_same_macaddr = !memcmp(pnetwork->network.mac_address, cur_network->network.mac_address, ETH_ALEN);
 
 	pnetwork->network.length = get_wlan_bssid_ex_sz(&pnetwork->network);
@@ -2095,10 +2093,6 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	/* pdev_network->ie_length = cpu_to_le32(sz); */
 }
 
-void rtw_get_encrypt_decrypt_from_registrypriv(struct adapter *adapter)
-{
-}
-
 /* the function is at passive_level */
 void rtw_joinbss_reset(struct adapter *padapter)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index e665479babc2..3cf68b85eb32 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -341,8 +341,6 @@ extern void rtw_init_registrypriv_dev_network(struct adapter *adapter);
 
 extern void rtw_update_registrypriv_dev_network(struct adapter *adapter);
 
-extern void rtw_get_encrypt_decrypt_from_registrypriv(struct adapter *adapter);
-
 extern void _rtw_join_timeout_handler(struct timer_list *t);
 extern void rtw_scan_timeout_handler(struct timer_list *t);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 3e857aa41d53..6ca6dc548805 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -521,7 +521,6 @@ static void rtw_init_default_value(struct adapter *padapter)
 	pmlmepriv->htpriv.ampdu_enable = false;/* set to disabled */
 
 	/* security_priv */
-	/* rtw_get_encrypt_decrypt_from_registrypriv(padapter); */
 	psecuritypriv->binstallGrpkey = _FAIL;
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
-- 
2.50.1

