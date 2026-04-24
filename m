Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2AB2E7165
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 15:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044082; cv=none; b=OtQ2zQrqJjWsfm7S4C+e7t3yNawPeMQNDDVCs9pSqKCxDc8qsvacjI1HBzid6SzkERLxIsw74asnfjGqWF1EXvvOBFqM0ytjz6VThRMzdEqnyGJGEtgbMSD9mePGesXt66TnZVdqLWYqJDp/MyP1DLg3oZBi7Vvu+gYGafUS6Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044082; c=relaxed/simple;
	bh=+BAGoqwzG2uo9ZWK2lnUM+vzyDIPmg6D2JUjKIEe8Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWU6SbR6alRBnQrTHh2jXww5wsE6w0UbqvQSP/3guXvKHckIeSnUO5m3E6zsT0TGZhxZwoymj8nBdHWEGj9PuyhiAukLEX2o4And3robmHBEce5BdKw+8v7HeOg4ktRN7HcopHoEstJ3KMMxruqsNVWGWj2xo898JZa2cbrmVSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joAGnuDX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joAGnuDX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d70c30767so5195263f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777044079; x=1777648879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MC8EVWdfiu77/m8PIRKuH2rDowQHASl4DS6kBp2TDD8=;
        b=joAGnuDXr/WLpPl7dx+2EWUdLef9UZtvxXW0Mee9+uRECmdbo0SuLdDspOMISkKXJj
         YhZwNznCdeLOwr9Jx+xEXStb40Ry185jp1V/gGwzIsXFLe597Io4yCoFowuJod/nNQLQ
         A8FboFb1v6JDs4k2PudQRI8o8vaR+JzEo+8hZeBRxIaACmCZGGdOSi8+XGX74hmDCYJF
         wKU4k64dWtWtodAQF+R3Hg5JrcmY9aIAJjiRG/jdFOsa4jhVt5ZXg6KRT6Z3bhrtISj4
         scqA0DpIU/YxKanRZDgsdUXqBaXdQ2c1ndvjz7KUh8hnezlfax6pU6V5HqTf6e6htX1O
         9f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777044079; x=1777648879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MC8EVWdfiu77/m8PIRKuH2rDowQHASl4DS6kBp2TDD8=;
        b=WcunyaVz+zlHo1O84/6T0VcWI5ypMuNNE0rBncalRAmlhDTZ0GOiJa8TaFQemleN/s
         OkOqMAjOQtnnzWxE7DlFOPTcYX+6DLsWBkA2Me4TR0twGrKLp7Fq1LMI4FNYAT2ZLy3V
         vqGJK1xeItsAe3iVaDc2EKebgCI/EP0oftEw9Z6dMadEBHosQW1SNMzXTTKKJquqz12r
         KE9ZgDAF6Kn4pANQCat/3MzRqj33KibhzHhrcDUhdw0DZsMhrPzzX+zKAOMOcchh58Rw
         Y+SY+TutSZbotojr+cVZi5nR71a6twpe30cLubGb0orORFgZcfNQNZIFwgsDCmJ2K4hQ
         Um7A==
X-Gm-Message-State: AOJu0YxPM2IRCDxagggx8M95Uyai1Exi6AwMRWfOClsiGSd7k12H4KqV
	OB8EbWPXuqqa2DnoUh8Prg0bm7Z/2JKr5qeAYgGGTeRzMo7JxeK42aXm4aGeKg==
X-Gm-Gg: AeBDieu6xZ33PTyEGB1bsyIi1CspPLxBDK6jR7lIh4EvSoBPKqC2yrhqnzKF40HzfL8
	zkxc8Wjz6v+HSu/eIgjL+iZ5N6CIwe+633aXJ2Q5CuAUgLtW+6IzhvNDtCRIbE46WbFLIFZxOQx
	GTpEZVRITi9hfchaR7V+ECbhNinkQd5Vw+tDrr3TjJDX1Ua4rbO6AzVM25JzWFJLn24ihSPYoQ6
	nwRoCNGrQm8c8rpaLmtjywt0LKAUvDZQA4IzpRY5EI/tiCz9PPP5ye2acdFgcChow41eoXy7u8P
	6ucbFw8a0MauoUqIfT0Yx7r4sUkoc0aFB4fcpOigGnfFST70g92L1y6wuevDXB4nIhIUQb33Hgk
	Y/NNrL1QE2pn4pLRRDmxROX/wKa17VJ0ICwlulbL62A/+ni8edZ+s5lcxi/cMWY+1vNppJ+HFBv
	szBxRO32ArDomBTBydlxAv0UYFYlar81QRMJgrw7FH5fPlJFWpfwg5dwzaefKJg5g1HMrwh6vkl
	3Pvb0JVTX3Pe/wgqviWrzsBVDAxFuiqE0setYejY0d46vaSgFEqvLF/vOqHQ4JGIXpqygE=
X-Received: by 2002:a05:6000:2a0d:b0:43d:7a5e:8162 with SMTP id ffacd0b85a97d-43fe407df74mr34148396f8f.15.1777044078919;
        Fri, 24 Apr 2026 08:21:18 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm65670960f8f.6.2026.04.24.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:21:18 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()
Date: Fri, 24 Apr 2026 17:19:32 +0200
Message-ID: <20260424151932.3734611-4-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151932.3734611-1-hossu.alexandru@gmail.com>
References: <20260424151932.3734611-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

supplicant_ie is a 256-byte array in struct security_priv.  The WPA and
WPA2 IE copy paths use:

    memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);

where wpa_ielen is the raw IE length field (u8, 0-255).  When a local user
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
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++++
 1 file changed, 8 insertions(+)

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

