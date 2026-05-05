Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52B148C3FE
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778002713; cv=none; b=bBrYb+2OJRYLTzgkmIN2DD48vUUKfImCuX8HeTqveqX/h+bweP4/4L9KpAohVCqthkEqOV7so+LiN0AUyJZcRpYEKtgLj8M50usCp/p5EmRxNb8v/3qhPnD+mjwzG8eK7CypM6eBROF6+HaQPXqB7mwePrqvNHmVBp73wQUwrwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778002713; c=relaxed/simple;
	bh=RdfwN/LYtP4aF0CJvFVTs0hMjHmoDcKmx6pMoxp/CbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jwc4S+xnOSU2vHcWSZkeFrnVg5NRWn2VWzVf0aO6kD/XwXy3/0PlhI40QZGQyhV+Mrq8UhThUveHvL74b/IMGgBTT9OtjsXkZDReLoOk6XbvU9/bVMw5/Y8/vtscqD6fMwUdb59GsMtIPqp3bufuhpauvBZhi2hexww2ce5LxbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItbhtNa/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItbhtNa/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so87234855e9.2
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778002709; x=1778607509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NpaDj1OSOuFZ6NR+/4KPE7w1qddaBejMbo1xZezZe4=;
        b=ItbhtNa/Yzhe+zDhKFf6O5HZELNiItft25oOwgZZ6/aUhrv24P9ExC0UF840wDcK9Z
         /oeZldMr3oDG4GDmmVjA0Et25ZemvpnZKz+76MeVs1Q1XqF65l80X1zS/2YhoLgD08FW
         DWU5TVsBGbSYzg8XQ2ZKY+L3rPzom+lo2Rg2ExvLR2NFvpLdRbpmyiKhrjyi/44rlQpJ
         zEvok+F9IDzk4tdujQhFAwm8JMyJfD8kXoPRhM22gFOTYj1EB7XlygLH0EeQ14ZdtzGS
         nMZ5R97vT8c7gLI7CrbzNoQpFfu2pPPBeT88vhHSU2Bfb2FE3v0AaD8keL96oHLzhxbW
         aNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778002709; x=1778607509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2NpaDj1OSOuFZ6NR+/4KPE7w1qddaBejMbo1xZezZe4=;
        b=Yei7gOI3Rc5RvJlZ7xJQNjUKqBU49kEUM0vjCmzfjrMZ8IN/y2gZno6jRQ4Uhu+vmO
         x2WzdVcibVR+HicdwR0LivZwwbe5VEK2HvkbXWnAo0dwW0X6WLi2ChCctTU1vuzZGt7n
         AJaeKu4mZIJQnYPmproTlBpmJI5gkkaMYRMAWV3tFdMTgKQ/lwZP4gWVREmGgt5UI28v
         +UUdesU/met7zJKmUvu3STD2s+4XWhnSDGJU5JtO/seTCt9H2KfeLKMZIZ2dcS+GJo2J
         dbftHuU/EEdawc4qOoRKXoPsPGC5whMISPVHtEEf97OMPEc2+10fSdVvipvCrJHaQ+0h
         kaDw==
X-Gm-Message-State: AOJu0YwEW0BVUkuCyu1Vf/KG/+AzZwafNfgX7mUvU3cTLnTHNdrMomv7
	faYekk6UryaTR4CiQ2az5QrFAmwOgo62oqMOWVHuuedadQ3bC6Q2QVre
X-Gm-Gg: AeBDiesBOazagLKmMv9ORe6crpVqwFG961Z9q2c1M38xDC/rIg2O9tqnQaqdjEkktZb
	BM0Icv3KcdBXqDg7O9Wzbmx0tvFgITVe+JC91SvDMrD8lWdygaq2PhH5e4GEWyuuFI7363dYvfj
	E/Ayu59oBWQNoS9VD2/Z+uaUaJY3K7HUdb8iJ4JQ2FuZM6Ju7LauJ+bONtKBxmhJm4biLhFVa/f
	2r4n2SZDo1kI//hNHHLz+VRVrj6l9tK99NHdCtt9Z7iGKz1ycOQkMW8yDkQG57y4B7HDpRovCKA
	uobtSu8dPgQmrGufQab15+kWEteBbwXzMtQe3mGD91B8W6MTW7xQ8lDyy1u+LIIfy8FDVZYFww9
	3D5gSH5vs3R7WNwhZBv3MZO08CVormxcoA6e9XiSW6GViDgeR8JZ/x2VrsfcAqtC12WyGVzF8ar
	Z0aUEgea1mvZfBcDK9h5rHhKg+MhDuJdTMmezcY9zhdaBiX0rdg19ymdXmrctIvyqZ5TeT02Yep
	v1BudrNHY0Aj3O8rAfh0QgC4VRm4o8cGpnha2yQqvarOB15+GROJWFMMuF5pU8QCN7clzABl1qt
	Gwwn0A==
X-Received: by 2002:a05:600c:8585:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-48e51e0b5c1mr3428345e9.6.1778002708617;
        Tue, 05 May 2026 10:38:28 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm655473875e9.9.2026.05.05.10.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:38:28 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v4 3/3] staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie() and rtw_cfg80211_set_wpa_ie()
Date: Tue,  5 May 2026 19:38:18 +0200
Message-ID: <20260505173818.3674164-4-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505173818.3674164-1-hossu.alexandru@gmail.com>
References: <2026050436-italics-clumsy-e83c@gregkh>
 <20260505173818.3674164-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three out-of-bounds read or write paths:

1. rtw_get_wps_ie() reads the IE length byte without a header bounds
   check.

   The loop only guards on cnt < in_len, so when the buffer ends with
   a single element_id byte and no length byte, in_ie[cnt + 1] is read
   one byte past the end of the buffer.  Add a check that at least
   two header bytes remain (cnt + 2 <= in_len) before reading
   in_ie[cnt + 1].

2. rtw_get_wps_ie() does not verify the declared IE payload fits within
   in_len.

   After reading the length byte, the loop does not verify that
   in_ie[cnt + 1] + 2 bytes are available starting at cnt.  A crafted
   length value can cause the subsequent memcmp and memcpy to read past
   the end of the buffer.  Add a check that the full IE (header plus
   payload) fits within in_len.

3. rtw_get_wps_ie() reads 4 bytes from the IE payload via memcmp
   without checking that pIE->length >= 4.

   For WLAN_EID_VENDOR_SPECIFIC, the code calls
   memcmp(&in_ie[cnt + 2], wps_oui, 4) without first verifying that
   the IE payload is at least 4 bytes long.  Add an in_ie[cnt + 1] >= 4
   guard before the comparison.

4. rtw_cfg80211_set_wpa_ie() can overflow the 256-byte supplicant_ie
   buffer.

   supplicant_ie is a 256-byte array in struct security_priv.  The WPA
   and WPA2 IE copy paths use memcpy(..., wpa_ielen + 2) where
   wpa_ielen is the raw IE length field (u8, 0-255).  When a local
   user supplies a connect request via nl80211 with a crafted WPA IE
   of length 255, wpa_ielen + 2 equals 257, overflowing the 256-byte
   buffer.  Add explicit bounds checks for both paths before memcpy.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v4:
  - Add two IE bounds checks in rtw_get_wps_ie(): break if fewer than two
    header bytes remain, and break if the declared payload extends past
    in_len; add in_ie[cnt + 1] >= 4 guard before the 4-byte WPS OUI memcmp
    (sashiko review of v3).

Changes in v3:
  - No code changes from v2.

Changes in v2:
  - Add explicit size checks in rtw_cfg80211_set_wpa_ie() before memcpy
    to prevent the 256-byte supplicant_ie buffer overflow.

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c    | 9 ++++++++-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731dd47..d6d5f3a8db4c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -661,7 +661,14 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 	while (cnt < in_len) {
 		eid = in_ie[cnt];
 
-		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
+		if (cnt + 2 > in_len)
+			break;
+
+		if (in_ie[cnt + 1] + 2 > in_len - cnt)
+			break;
+
+		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (in_ie[cnt + 1] >= 4) &&
+		    (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
 			wpsie_ptr = &in_ie[cnt];
 
 			if (wps_ie)
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index fd3bae31b0ed..e7ba5ccfa03c 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1445,6 +1445,10 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
 	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
 	if (pwpa && wpa_ielen > 0) {
+		if (wpa_ielen + 2 > sizeof(padapter->securitypriv.supplicant_ie)) {
+			ret = -EINVAL;
+			goto exit;
+		}
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
 			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
@@ -1454,6 +1458,10 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
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

