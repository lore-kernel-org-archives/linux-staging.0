Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CEB39A7E7
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277920; cv=none; b=u660xwgv712g230wntX+ZSHCYsraXERQ4jrZHTnh5TdgRNPy/kxeyZrw8uZXFakWVU6nwt61bUw9R0meC2Et7ZaXdInqf0U8LeMfxc5Tjf4ytPv9a0K+fj8HJKP62fpzEJE2D10EEEFzWZ7HpbvwepnT2VK3WmxfVtoVqYVV8T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277920; c=relaxed/simple;
	bh=QsWgV/TRc8h5FUj2uOm4q4TApmuKuKTXIme2FfHuqZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ms4uZDDVEiYkg1M0t9TQ840HKaFue8UgivbkAXiYpfMTmoM2TplZkVZNXfVfXP9EDrLxbnALE3m6podJB9gQk+7Ty4kQgoTeV11UOEj7iRYndq2MwZt8ysIPnxqLhjsGL/rp/iII5621DEJowuHXDQusKCGirYE3xrmj+OwmZFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVk/ZrdE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVk/ZrdE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so71281525e9.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277917; x=1777882717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVlRFyF005cdj3KbEszpkmE7tTQiTu1k1/BY4S0J3Oo=;
        b=ZVk/ZrdEzhSJ5DfAQS025IX6iQaemjgM7Qo+MgWqBxqmSTaYBxfI/HOU971vKxGGzE
         W1Q65eQ7r+wL/n7eh6N5XC9wNFwfFRpDO8Eayzy5TFSc+Hp+3kFgidpRgyl8DD2v+VQI
         Hg7EwPumm6YqsJE1Ij0XZBmxvzrWWZqe7E5MQtZY3LbTaGDFyEYP9AGWGuYfzrXBKKGI
         s8L9l1JPiBTl+Eu2w3k7aXJFT0n17aMHJgYXdcGW+6unMJolYpQn9E6/Uf8MxF2LMlL7
         tdgQfz/YPvmYIspzl9HVxYHkF2I+z7X8MV9IjWGeK8mvLPoQVEK/K/YcZmU+Y/XChjUd
         eE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277917; x=1777882717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVlRFyF005cdj3KbEszpkmE7tTQiTu1k1/BY4S0J3Oo=;
        b=ec+WxgItIWCY8mDB6pqnmqaGRwh//8UfZWbk+RV1opU9e46dPJYC8GS/tFywr4P1A7
         D56rzHdV+AB69SlYiPEWkLyXTvZjEgU7VZsUafLyrZG+beqsQJ8knnzONFzbLCzZNYih
         +0CtVuSqPby4y4hLw73RRtI3ceZwsYpminO8/F6sIJxDHRDreThwmb5Oh2yTYwt5ZLSz
         BPSxKKZNVvK2vqPTlKcMYmAqmhsy6fhG2IOoPBLNyBAwE/vXWEEeG/ijdSysIbaBUtXm
         CDYEN8dmaxhnF22xKLI1ZUV6TKZR8iGmSiuk3Y8vFmK1CiM+VZQ1S/nxCCZuIE8JKESi
         gYAg==
X-Forwarded-Encrypted: i=1; AFNElJ/12poFzLGhlbdw5Bm5w5UDxC/Jn41Qq7pNIwFmmO9pGaWHK+WyiKy2lWM16oii9DQpskCO6HiprELwLgi9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx582OOa7/CHXwLgP4LCn3L5eI7zej5KRNQ35LU1wgo+IM+kEFc
	OdkzYNVOv/xRnKjQIGiM9SdGEh13ZOEFZRH00Acr/2w5M0FU1GJqpfj4
X-Gm-Gg: AeBDiesQQeiW+wvYDJ8PjqUtPVdlKPAaSvpu6Mf+8gOg1FHR45NwciFBzOyNP9I93mU
	q/5XFWYuhvL2HIjCT2Q4GY3OXPLCvIN84SaN8TF32HAGx2NszSRNVp1z5x5JAbwOf6vLsRZIOjv
	SHQrDAoiffe2asa/3KivZfU68e9ecrWBwsLSAK5fBtPnPE/aOd8/uwiiSLYPDRtqVWSRWA4XONd
	dh3vIz7vkd/HmA05F3Envc0tvDS9tmAvuOW4nmg29q+WzGxOb8OwPMfHZdqSqwomJL1jOJhNibG
	TDiQINajMh6gKdjoKMjm8zrjLHgB/X2of8KmXibaHqxWj2g408Br3rYICK5ctTAb0cVofGfGm1W
	kfCWPHZ+8EHNiNpzqO6+GaE22BTG7ih/GT+m7S2XPnMtcYQjhtObIsvRCIP/iID0gH5cdHC3Hvd
	HoqgdQV1b+Rl7qRUUll5TXFYH9OYMZCO51VDa7OLF7DfLfaP/kZe+ijs0bgIT4iW1JJ/6IgxLmU
	m5jf1VF9XcQluysR15xb21oqLefPIdvCZjwFWbm0vcz+BPgIOMx48wy0W8GEh6m5klGmds=
X-Received: by 2002:a05:600c:548a:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-48a75b9b0c5mr734945e9.29.1777277917225;
        Mon, 27 Apr 2026 01:18:37 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc14a61asm712652115e9.15.2026.04.27.01.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:18:36 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()
Date: Mon, 27 Apr 2026 10:16:26 +0200
Message-ID: <20260427081626.3393697-4-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427081626.3393697-1-hossu.alexandru@gmail.com>
References: <20260427081626.3393697-1-hossu.alexandru@gmail.com>
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
2.53.0

