Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735703CBE75
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368647; cv=none; b=PzOlsBtGCX4tHCFaMXz5+FwnW8K2oJQSFZPx5q8TqKI/Fz9fY6C2fyAvE5/515+GO87HUTZHzMcFpRlsn3A3e2mDeoKfUDfEBt/2TaZhNo/XP94bQ8OwgXUAfvFtBbkBmnmImQV9D1wg62T12KR9F/V1DK7uYPC1jOW7psNth6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368647; c=relaxed/simple;
	bh=yUxFQRX3bCKLw0bbag7Nni+E3AhTdqJzZfswOngAcC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTC0Rfq+/IuxARM8rGk0VLGycLYtnZBc1qLjBXPRzykUxnrO3auYX0shpIeZNDDBtUo5mOJz+ikrVHBxWYuyad0z/CVVU+/Dvj2IMPZtE6djz25kIlO8/rKA4m2hYhiNsagTTPlQ2i6J93C13GmXDXNv7kPdDr36KOb7Oxl7cSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6CyhjGY; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6CyhjGY"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd8f9725b30so558028466b.3
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368644; x=1779973444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GB1lAvDGjs+DHw89Q6x35AxewQHrMJlNyOlZUD/w82c=;
        b=S6CyhjGYOfO4PZOr1AUlf8iNYDgmJRzjomg24BffkmXB9p1D2P9NXGNaJJ6fpThF+V
         x4BFMJiD+A06JBlml+qMbk5Ls1EB10RMZgqZHK2CVIbfzeI9aNYMcuU/i2ord4tvjVGP
         KBA0VgJLjdfJH7vC7tPrUik1VPP/mB84CJpUKOJpd9OFYmZLPjB1RjGDBK5rLbSyrGuJ
         EVN7JSNEc4jwhaCMiQCgM1I2hQsehgdkEE9XI6JpCQTmZOEhB9qunpeSTSjTWY0HypU1
         LjRb4zaW5rQnOzN9F65GcxlxT11NAhRm9XCqDrJDogTAUySsantm9LGindxc+lHCc2mV
         lpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368644; x=1779973444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GB1lAvDGjs+DHw89Q6x35AxewQHrMJlNyOlZUD/w82c=;
        b=hcirZaf5j5v/hQdH7FN/0qwGIuPx3IbxOe5jBMGlSp0mBbja+TVX334Sg3UIWkEM9R
         YCknsosovCLvR7i7uRO9Ok2yph0Y+JzFGbmRYJGLon1DXhVqa44RKcYk9HhS647h2M00
         T24PWyELK87/MgWY+4MOy9Amps/+IKpLHRcus1xnvPE2AOgALmSG0fTePtV7qOhRdRmL
         WG2ISifvSJ0xdNdEOPjUPnTgqphyO6DwfVN3tMHiSrWcS550ljG4Ye2XN1DeM9nKplHN
         yTtuoz5M8s2aqGeOgc0tKi3yspBT6IQ4KsncIWeEtn6Xw1wu7nyNN82N6pRyqU3XGw2s
         cidQ==
X-Gm-Message-State: AOJu0YyMN0mdnFKeUO8v8rhw1biId6WCtnIPv0bWz6IP4wKXtu1YV3mC
	jnC3C5/HkhCNmP/TWZnpCcCtKQiGLO8RicKfymwYHVJsIaV5veIYZwjY
X-Gm-Gg: Acq92OE5SveUHMLzof81rKzmaRkV03LjMEIdF8BYVr8E31UEfB9Moq3ukcbWViXsT5/
	UoYVKz9ImGbsRy3k1lV9OBx8pMZFWUA9/+11dTC+T4RR2WkKim9evirMYS1Fn7l+Gw95NjgTuHF
	pVjrOzKPPDnLaK/X0Og9cruJIkXlSQsvA9nOTTc/52FmC32jfa440kYSMHMPWahHWfRwQL14wEv
	zB0fhhj7T+2iLguBd4wCP7ircTkFfh5Il2k4yoa9w8w3jYcbEsCoLcG9IBg6SarWLziiKOzNhfA
	eOwovniXfoYn8h0tBuX49F0gO68ceKKi8W9BWm8AgxrZCuAvdXmchegZg5clysQNPT6hNxfoNyK
	LIcPBE9lCkdVRzXA6x/tpdNDAnb0h92P2jbcXt+tgV8FcuVR1Us+J3tcdGvzkzhYQ4R3HsFoBrN
	oJtGDA7rsAQgHH2wCMcZkp+OSUD/ItvHM7wkhZO6BkUYQL7xLZV0kqkQy0v1rhyX7gTLYR2VKxY
	Z0HVeYLmExl3wqPt2d6pOpEejp84WFu7XgYECoaRIqYo6RulhADxrK7b77F2C+6ELSsSC/d1VZF
	xewGybbpvHxtxO2ZMY2cu3NJK62l6j2cNa1WYtM=
X-Received: by 2002:a17:907:972a:b0:bda:2929:6f07 with SMTP id a640c23a62f3a-bdc188f45damr166539366b.45.1779368643600;
        Thu, 21 May 2026 06:04:03 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a505905sm43766266b.37.2026.05.21.06.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:04:03 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v6 3/7] staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()
Date: Thu, 21 May 2026 15:03:26 +0200
Message-ID: <20260521130330.754181-4-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521130330.754181-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
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

