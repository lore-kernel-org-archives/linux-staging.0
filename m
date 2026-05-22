Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A02C0F91
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410788; cv=none; b=eoKOtBGBBzSsfmk5IJE5VcSaT0gF08WYt9aq+0eEWUchN60A6M5IdKctuOvps5tiQvLwmG5y66Wn+2IWGXYx8tQD/VxvM8CuSbI8iwLYLw/ADt4rhaZkKDlmReV/fkCxiaHp/lwHyPJyl43qfx4i+EYLD7kvSMMjSA5k5eONHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410788; c=relaxed/simple;
	bh=7SsrYMKDh9rt+9N6EF+fS9nQeI4YX7vkrI18oJQsNRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HiBWREDQrpwl+S+GtjcNgxDb4mVDfX7UvtvGiHRlu3E2CD2dkomOhrAj27xp5jmfs8RRN6zX6RAdpVb+g6ubdskQlfjyvozlVfwWrmFZxRk6dzETuWlPhgevEYIZTt8VyPHkPzq+arc/bNC8kTsF/Gc3YJAYYiRS3mbwZXU0s1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QU6Ofj4C; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QU6Ofj4C"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67be41d5eeeso10983846a12.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779410785; x=1780015585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMABQ2lm+8Apo5qMdLPjApIQTOzncW9oYRbW/a64Ly8=;
        b=QU6Ofj4CI4oQDlofkYeA77er3L5PsnDr6NgOLl0UY5Q4STqD3wlsEDTZHsBgamDgUA
         E6BaSjcTeRik73Al4tHfVaVM53tj7vXr+h9RR28X8ydID2y5/CS8Qn4luL7XC2df7C0R
         zwKYHAhYCkCMSkFDxLJ9YljsMq9SsKCGpIHXcbUEDAcWjCujJLT2rWqMLD9QjoUBNjr3
         urdzeXrhs0PG4wKImjpgMu+N9VIZg2Xr7iqC9dInEnEOsNqJZJmFz9DnW99za8cBa73k
         7TJ7L//70qEYeDW2n96NU3XC6IvjjCHQTJZEkBMULPqqLEg3lM4GAaXIQ2jYVMWAITVo
         WbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410785; x=1780015585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMABQ2lm+8Apo5qMdLPjApIQTOzncW9oYRbW/a64Ly8=;
        b=WA9RxFQWq0tnda3VZwPp3QTxP2lzn6HQJ+mAUQMqJlq+a+Dwc+lY5ad+H5SV5ka3/H
         QaiVfXnvct/1GulB0fDyaXqjRlk/Q9980zGwg/h54VkiIPQ09vPNviqpkHANGwlPZjBa
         JoZJ0+w5oOZFlqXHV34gQX9UOz7D0Fo523x+uI82gjAdqluYQHM9S5UfCtTj3e/cfcuC
         QDxVyHIHUZT/OFBKYmYe/x9SXl4iemy27VEFxnUHnqL1etPhbQfgvkahomzwJOZaouk5
         yEMJRGOmDAN3IsX8Nh7kQ5qLAr0xVWpfZoo64MvQwgFPMaimCRwSsxZqGf1ad/pnsUKa
         N4zw==
X-Gm-Message-State: AOJu0Yxen1Tzx042oIMf/AQuT0p+Z0XlwUCBYfTUo+RQKHcgCG0JYhWG
	kFGHSLv9eJxBk3AJOy0vb+HKJXdtDdHN1MBIzkT1KyZc7AgKDFeemiv+
X-Gm-Gg: Acq92OGFePHmNxK+aE3I9s2WJM+3dgMJpkBQXWgkMwFGaCKPmRuevPs2snkO8hPeq5F
	r31xtBN/91c+xHfCVMkoMVjR/6j+aoNbKsn+zEt/n4X+nsa8mBvWi7lJRWz92llm+qskZVg/H06
	kNiZJmOjOGw0CLGcw7yzNtejk8kOKQQX0qthKzpQAYWubq9nBS5nu1Gd+NK6GNcT/WOLqGcLcmF
	YjbvCc3FkYtWknCcrgmrRC/Z+1gHCdHgKXXndzZHDXMFTepXIna13EF9Jj0nP9Zr848pUsOUdLx
	JMXYl78fsvMaKDm6guxQkX+A2sIDrT72SkOYJH2ri+JESuFsx42yCZg18K21lYLIRgXKbLwK8IT
	zHDmln2VpXs0rJZODFReqPfEi8FVi4Ibtxr3RTOYX1Ohq07bI/aTTYvgy4SzQ3SgJZD3vLC1mCH
	36+5PJTIQDpLPBYnM8n88r00uf7yeRJCKcqExQ1cO5/hb3EBfK3bTR6AkcWT16NBYDDYK3ca7aK
	oS40oRZKyzoAF28BP/OeCxivootoxJ49yPCg++ARuOHcP4BhKrKsAwIUQ2EqIULD8yhWwzKOS3D
	a4aDkEXtDColEcu9LXX7MPQAtLkj
X-Received: by 2002:a05:6402:43ce:b0:686:d801:96c9 with SMTP id 4fb4d7f45d1cf-6889cc374d8mr599441a12.14.1779410784990;
        Thu, 21 May 2026 17:46:24 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3535a12.0.2026.05.21.17.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:46:23 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 6/7] staging: rtl8723bs: fix OOB reads in is_ap_in_tkip() IE loop
Date: Fri, 22 May 2026 02:45:30 +0200
Message-ID: <20260522004531.1038924-7-hossu.alexandru@gmail.com>
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

The loop in is_ap_in_tkip() iterates over IEs without verifying that
enough bytes remain before dereferencing the IE header or its payload:

- pIE->element_id and pIE->length are read without checking that
  i + sizeof(*pIE) <= ie_length, so a truncated IE at the end of the
  buffer causes an OOB read.

- For WLAN_EID_VENDOR_SPECIFIC the code compares pIE->data + 12,
  which requires pIE->length >= 16.  For WLAN_EID_RSN it compares
  pIE->data + 8, requiring pIE->length >= 12.  Neither requirement
  is checked.

Add the missing IE header and payload bounds checks and guard each
data access with an explicit pIE->length minimum, matching the
pattern established in update_beacon_info().

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index dd34f229df12..94bbe7ac13ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1335,15 +1335,23 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 		for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
 			pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
 
+			if (i + sizeof(*pIE) > pmlmeinfo->network.ie_length)
+				break;
+			if (i + sizeof(*pIE) + pIE->length > pmlmeinfo->network.ie_length)
+				break;
+
 			switch (pIE->element_id) {
 			case WLAN_EID_VENDOR_SPECIFIC:
-				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) && (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
+				if (pIE->length >= 16 &&
+				    !memcmp(pIE->data, RTW_WPA_OUI, 4) &&
+				    !memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4))
 					return true;
 
 				break;
 
 			case WLAN_EID_RSN:
-				if (!memcmp((pIE->data + 8), RSN_TKIP_CIPHER, 4))
+				if (pIE->length >= 12 &&
+				    !memcmp((pIE->data + 8), RSN_TKIP_CIPHER, 4))
 					return true;
 				break;
 
@@ -1351,7 +1359,7 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 				break;
 			}
 
-			i += (pIE->length + 2);
+			i += sizeof(*pIE) + pIE->length;
 		}
 
 		return false;
-- 
2.54.0

