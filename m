Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61D298CAF
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410778; cv=none; b=tkokGfnHFoJUlw+u404KeWUyZul8hbZoY/9RRgHtjGwEEFRfTeaE5fk6Sevw0AmceaP1fDKOAC/ag2UWSqZz12WnwPQTbhp2d80/NrF8D3Bc8jY2dN5sDykcfIeKtgceN2SySDBYQresgqQOpI5AaUIPK8LDnxltp/Y0XIVF82g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410778; c=relaxed/simple;
	bh=yUxFQRX3bCKLw0bbag7Nni+E3AhTdqJzZfswOngAcC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NL+9+7DXxv4O0UyfLyPYybeElz07+diyMrae3kYfcA4hbToUPGO98AnYGPUNGsYF/m58h/SC4AKv/YhsAP9K9NuhL3ZDhFbsxU3rPlbN8qgV6cc8q7uLQKkZnor5KYK73xePybp/Es4h6ZG1p/LsLF/ESfnRHiYEs6XiKMyvEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeYQ0cji; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeYQ0cji"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso1666261a12.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779410776; x=1780015576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GB1lAvDGjs+DHw89Q6x35AxewQHrMJlNyOlZUD/w82c=;
        b=DeYQ0cjiIqLr320F5lIxq3BjkuKd49aS3+CKT9eB/9FHn62zAbHaCTpc3NTYHskQOw
         BhnsL2fiU81En6Z2qcisc+oTqhCVHTybuZl21lS9CQFAgp+B9mB1labdze8q0OFjMsIF
         lEIzAA6PWNXOoi+rfa+sQbPuF+IFhwbFuhYAnJXN8A258KUtZDKYq4gVNzFVChWtiwNK
         bw9dewQKTusXRJ1Q71v7qIxxHfz9Rk/TkkJ2EooCpQoDZ/e+4CewpRpzhq4vLCBL/DTX
         /LfCQTl+ww5CNtlprEqBUPMahDwp1lbZy3dd8nMvKJvlZoUYfNPV5Z8jjpVRqas7HnKb
         zc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410776; x=1780015576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GB1lAvDGjs+DHw89Q6x35AxewQHrMJlNyOlZUD/w82c=;
        b=QnA/NTXWIco0SbZg99xINJylQapEql9XnuUKJOA6NViOPOUdr3CGFhy2OxtbjjPOM8
         oc94Uz7WZQxxML6j082AjYJlKjtVUy7AHvXLMLhYjH25Y1Y8Xc86CXXw7HtNfmBpIATH
         Wrva+RFMyJ7cqIxZwedQlJjY52EZnocZ9eZPU0L0WJLXDVwO26ACD3EJ/0ssVM8Tqr1o
         09XqgWzWLJuA3fW5scZM19BDgTGSqhOqCsTDqP3j5DJPt0AJjljN4nsa0QhFpaFzwbKO
         QyQNwa6M6Mt/8VVMrfwlVvQefQMaL1XoU+IbXACQESM+FNxwwCswz9t2yLT7OVkYCswU
         6Hfg==
X-Gm-Message-State: AOJu0YxQ7stvJiP7EE6UM8zTc63UgLAgtCCKNZIv1a9woIpLEfVvJSDF
	0QrQaSSvri0I9hW18P/8qPvQANCOlaLiOxX/srEkd171tponqokp3tAiUxKum4V5Zmw=
X-Gm-Gg: Acq92OFUE4yiCZ46SCMoWeJzQVUpC08TuTqHFMdJS7TOxylvoUAC3Se8faXUqRITczg
	Gp6xUlCh2ig6gkYohmaqTAgn/f7N9xaABuVGBx5BKOYJWpeTlN2jLWLOfuw6YdEg9ERNb7BgvmK
	Ajuq8Ml94lHxz1Uv5FK1jCqEEnatZ4/m2M7yeWq0pHAtikyrYYXfqRJlkzf71bsVK88XMqQXWgU
	gM0fpGZx1fz8Tjwkl+/NRNawU2ORktw5UrGFe1Z53mMGbt3tGuDmtwgG+xdpeto6k2DFM7jA9Lz
	Zay/dtiiP5/rxcyZ3CWnaOnNukKYNOZb9ayURcOJ9xOaxE5HqTlM3wqn6IGsUc4WbevPhLvHszd
	HcbUX8orE21k/01snUh5Qan7PuAw4y9nWa17nHj/k9ayq/Y/AfFhP10Cq7qvvLw4QFYVZ9j3tTW
	Hb5K1JepgURospdYNZhWasl1DdmGZ6bd/pt46DCcp/TZjth7xVED2l5ockWJ7DvxQH+MUR/YSpS
	gfLINE36rgWmJimnhL4YozrO9m+BF1Lyyle2JXhRNeDlep6oU7b8hglIE4jsGbDSEtL1UUrMXh8
	3uVhgkv2A2Im/LiYjb0UHB9VPBay
X-Received: by 2002:a50:ee08:0:b0:671:9dec:ba3 with SMTP id 4fb4d7f45d1cf-6882efedec4mr1462732a12.13.1779410775672;
        Thu, 21 May 2026 17:46:15 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3535a12.0.2026.05.21.17.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:46:13 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 3/7] staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()
Date: Fri, 22 May 2026 02:45:27 +0200
Message-ID: <20260522004531.1038924-4-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522004531.1038924-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
 <20260522004531.1038924-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

supplicant_ie is a 256-byte array in struct security_priv. The WPA and
WPA2 IE copy paths use:

    memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);

where wpa_ielen is the raw IE length field (u8, 0-255). When a local user
supplies a connect request via nl80211 with a crafted WPA IE of length 255,
wpa_ielen + 2 equals 257, overflowing the 256-byte buffer by one byte into
the adjacent last_mic_err_time field.

rtw_parse_wpa_ie() does not prevent this: its length consistency check
compares *(wpa_ie+1) against (u8)(wpa_ie_len-2), which is (u8)(255) == 255
when wpa_ie_len = 257, so the check passes silently.

Add explicit bounds checks for both the WPA and WPA2 paths before the
memcpy, rejecting any IE whose total size (wpa_ielen + 2) exceeds the
supplicant_ie buffer.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 098456e97c96..3d930d9af184 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1443,6 +1443,10 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
 	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
 	if (pwpa && wpa_ielen > 0) {
+		if (wpa_ielen + 2 > sizeof(padapter->securitypriv.supplicant_ie)) {
+			ret = -EINVAL;
+			goto exit;
+		}
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
 			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
@@ -1452,6 +1456,10 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
 	pwpa2 = rtw_get_wpa2_ie(buf, &wpa2_ielen, ielen);
 	if (pwpa2 && wpa2_ielen > 0) {
+		if (wpa2_ielen + 2 > sizeof(padapter->securitypriv.supplicant_ie)) {
+			ret = -EINVAL;
+			goto exit;
+		}
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
 			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
-- 
2.54.0

