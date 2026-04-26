Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8F83115AF
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777197232; cv=none; b=Ht69p3Y8ABN+bzwuoxb0So3POUQucnnYIe1ZzZ6FyeqanJWRUGM8xdDcXFUfiB+9JBZJBjeGhcVrHtNccZBop4AmgoCI4axyqbc6g7QaEzHCjXUytis4AoqiFTPyv0HymQ+35HLdDWICunntsDYOIlKKQKSYq8UNL6JWbzt5YzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777197232; c=relaxed/simple;
	bh=yB0kTr7Ark+l2ZmItXYKrX9Uk2qIoK3YXCfQf7BUvnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMHEON6TZrylU75vGblQWinFsKv2X13JcbsEd0jQs5+DFOR8Q41T0If6HnWXbOAGpEKtiEBE4B5f0qJmp5xIrv5vCgevwjHGOucAB6S82vf4eGdWRttkmbBIVo13gwpgqBQjmbUO11aJxDeC3JKw/13O+49GpSnd6WI5NzzaS8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLDDL/i3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLDDL/i3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so108327545e9.2
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 02:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777197229; x=1777802029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXJ6RQKenD2VCj+0SLWJH+R887A9oyB4v4T2DhtGmis=;
        b=WLDDL/i3+KS3y6ONizVKaC0Gu6bYx0M35/R972XPdXx8YgkwtGu4Bd+PY0GYmECk8k
         61e/JBEXzvFRI/G0FycX7WxcYk5fJNKeYRLMLrhluXddLQracmmLP5jSauRS3IMfBcYZ
         4nbxCkLmDt5P/zVKNqoWuxMlHEbRzA24BH2Jt/0QtJlaUAyEinefAb4ze1XEkJ77loow
         7gmtR1dCUgqXZtDaGySYzBxKr6RxlF4LWF0yto1luP+Yr2QkzCTpzWU4OftfOpKNMNCN
         pq8pfb+Pe+XybgJJXbBf9Wd1/8Pn+NCFHwAsEI4ra3P+sG2q31hvoVBuyk+QTRPm9T3j
         1juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777197229; x=1777802029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SXJ6RQKenD2VCj+0SLWJH+R887A9oyB4v4T2DhtGmis=;
        b=TzOLjZ4Ejde3oE5BCkiAaq4tsnuuWlaGvbC+9z2J1NFUULgYmnX9UlAoqCQGbzDJSQ
         xkndV6fOZP2vDuVsfuS8xlZB4yNuofQL15q61DXmJMsS82DlMd9PJ9yXxJjfm2FWMomY
         PJGabsmAtNv5AHYd0cM/Fl8pLHm8yzQ+ZRpj0PsrUKXbX8sFDf8P0ZQWAwVw8xUtGfAS
         6w0AWCU3OKhqz53NIAHRL1A/nQ7bexyVEC7SHMGJPz92dcaEIAE/fett4lQ+CtVrJ2eB
         h8xwGBCD4epvSRk/SMn+cz4JiU9IM18Htl0WL8Jfv586hukF0qAe/8R2MWgcuaE7mnPG
         Ducw==
X-Forwarded-Encrypted: i=1; AFNElJ87FNkEVWrU2Kmq7Dh2WVK6BPbnEnNfOeoaCdMT43sovyXDyu8qWCN6OjPGYONgfn49clZlxp2RZhd/2w71@lists.linux.dev
X-Gm-Message-State: AOJu0YxKl6woooD+i4Iio/7K1at9Irf5ymgoM15s3iK46wfuHt42Hlz/
	4PR6JyGBUz2r16jC381JgQmr75vCTT8Yw+3sdemfTAV4L2CfwFWLVYn+
X-Gm-Gg: AeBDietTCBLu5plz2Uveid9iE2uFNrzy5uLKdCxCXecbbREk/ahsEU4D1FqgDKB3Ht8
	6cwOzRrvUf70pEDWuLR33F1mbTCO+qyBoXLxEIvnzLijJmHuK9Et/RtMU1Pfewcy5/90Gaht6S0
	tY4wDaKr2IqjFC6w1css4Im4h7v88Tm4iZ2e4IeTZmd9uhizf8ARJABvXndoPCbl9noHGxWXcJZ
	HfyyX8H7rFIResTwpcOnkO6sEeHVDzIQ6VZ0vCFoxe0Tpdb/6GmLbeRt39R3q7V2xv3TQ/OZFlU
	0taFyd8vHK0QxpoSUiWmojil/od3fpsGwjz+n3o3L90GU/FM8JoY3mucnxD4GBboab2Pv9fLxpC
	TJ2FUSRIm8AG+6VC7EMfHelKGc5SKKlHFIuyosbHrZoEyLxSX4j8/tObvd+z/WztMyJJl6grhLj
	QUt2bvpVjArMrCut9dUeX0VKFGMgWvdHLkHuMs6FfuEvBsFA97S27cdIFcV2RrvpgCFbbAzr6vX
	Oa3AOeogHcQV4rXRXWK+cHNZUW8nq3EztCGpWpBU+ZaqdooUnnmoanU8bBGDHxpZTtWRa4l2bwM
	N6gTPw==
X-Received: by 2002:a05:600c:a105:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-488fb7826femr388671575e9.23.1777197229352;
        Sun, 26 Apr 2026 02:53:49 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb735d3dsm510905405e9.2.2026.04.26.02.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:53:48 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	hossu.alexandru@gmail.com
Subject: [PATCH v2 3/3] staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()
Date: Sun, 26 Apr 2026 11:51:56 +0200
Message-ID: <20260426095156.3523480-4-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426095156.3523480-1-hossu.alexandru@gmail.com>
References: <20260426095156.3523480-1-hossu.alexandru@gmail.com>
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

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
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

