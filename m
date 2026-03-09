Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D29366831
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087297; cv=none; b=q9O1JbR30Xrj5yeid6sOKUb9fNTRu6USXI7zH7tZJsDgkEeFNdYX66o9kUNGU7XQEW7yz913NjiHAt7SKP/7l0bOzQmwI0rI/EUf1ufSQr+kitSV+T/jwzrutgJBY4eeRDItDRNDt0EH6/qHSwO0mETo9o59R1hXtVqeADTX6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087297; c=relaxed/simple;
	bh=owcKmDhGAy0wn494yTGzS21TOE81EksBWLKtxBBHTRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRAttOeQTwiLWHhVLdYpVYT7gZsnFN6Wr76IDA1y91slllD5Ag6+9LD4flooSx7oSNCaPP9QSSJQ9zgZjL30TU+7IrTKpo3c6V1LYNplzONdbyjv/+8duMUhBsBJd8AWe37UTLFl7nWJn+Ayk4Hjfyf1IVzD5hLjADwvrdodcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVT1bOKy; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVT1bOKy"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ca09f2170so12463928d50.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 13:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773087296; x=1773692096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykmnHyEMPcCOng2SHYCoQ8jJSdse+qCpkmVa5H2jpCA=;
        b=WVT1bOKynU+19UkFbHYsQMMHvnZ7FpJ42TSVh9LPPtt2K+QZFD/DlixMjCuQS5qsoK
         +jVK7H00gJAgX2fOlNvCK7vwlMJ+cZQm8iSEJLMTiSoPAJxaelw9sMVz1D5gUJ7Ni2ow
         jYK0L/Xq0Hr7lZNuR1zXDVpSihaCvPcdR0f8AlqobkZaOKKcXqhGmqDQAmUCrGTqCRoY
         73x0Em+SLnX90SFzXsvzCbc0lZvH9aIs46Fqg8skRrcMpFX+vukZYkk6Z8UZNEItibQ3
         83mL6iTMkg9ijmus55YyHw1AwQuB/wJBHLk1NJ5+yW5ErS1WroLVld2yOTnJlvC7w2Vj
         a2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087296; x=1773692096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ykmnHyEMPcCOng2SHYCoQ8jJSdse+qCpkmVa5H2jpCA=;
        b=muov3sqkLxXYWbtsnNcICn0zdPkWUQLAHu1wRrPrknpbYVWo/XLdbfKyxbRh6wuKga
         f9/MssLu8UghjGSuYbhbW97L5ZFaL/vONvs1eFIN5rnSMCGkypcPF4n2Amu3FY/VTqyy
         g3Vk1MICnqYl0zWd0sVN/kM+Hytr0kGtBm1x+pfNcua9WMP0ubGSqbxpfTYANjjFpFcQ
         3V1MJ5fFBOPUzL/xfEWmDA3Lpp/XeiNWzbqoy9y+SNJKbVdttQim3BqEumJPWsTDwMKU
         vLWpYx9T4PSTXXuLNPR2ae/EUB3RAVSlF7t57z5tOX4omSUfrIOMP358GpZDYnXT1IpM
         Tb0g==
X-Gm-Message-State: AOJu0YymPvsG6rLZK8ehnUednCg7swFnefMFcjwx594mZ+9XQG2sgcZC
	h6jLTVPRYSKS6WJDGjQoTy75Zi00Nuq7WnvQYN0OZwkJ8CjfsbWqsWhoIUSl2g==
X-Gm-Gg: ATEYQzxW8ZXmzsPAt++8ikqGg0VVZ7/vH05o/7C7sWVj+EuSLb0iOxgRto3G0zmlyiT
	1dZrRwePOUiFpH2f1t7cHw/3TEgdt74a6K9GThEtDzZS/3lgtE+LB+1MTNVC2rSpyxNmSVytnPZ
	bCPc2RoAAJ6vaigUodGPP9aQn3HbE5o2XHrGjMOf9S14X7SP53jhIkyqfKFi1tqGSbjeiETconl
	2g5VdnSxwND5rszStWskiW0Pwz2uQMBJsSon22iq6Q4A1Tp79FBlYrNl0mmmgytd7n2PX7A+gd5
	cm9vBluAKCWpGq7216tiluPClgsXaD9eIsaoItOz6X/wkdLQU8uR298/iuHrsAS5z02WLLWE5FA
	ucU8avrwTbAY/bKzH0sATGFhxaSfToOY6SCPegafFQVii93b5/8lB2IguWSBxWUeaR1I/Tc1NsM
	xQZpBxwaa3760Z66EHg3bzCRlq
X-Received: by 2002:a05:690e:e1f:b0:64c:98f2:272f with SMTP id 956f58d0204a3-64d1436a726mr9553450d50.74.1773087295742;
        Mon, 09 Mar 2026 13:14:55 -0700 (PDT)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175e8300sm5182999d50.7.2026.03.09.13.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:14:55 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 4/4] staging: rtl8723bs: replace rtw_linked_check() return type to bool
Date: Mon,  9 Mar 2026 23:12:21 +0300
Message-ID: <20260309201257.16984-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309201257.16984-1-nikolayof23@gmail.com>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
 <20260309201257.16984-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_linked_check() always return 'bool' value, but it's type
'int'. Replace 'int' with 'bool' to make it more accurate.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7bffbc673f98..5516593bc8ab 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2585,7 +2585,7 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	}
 }
 
-signed int rtw_linked_check(struct adapter *padapter)
+bool rtw_linked_check(struct adapter *padapter)
 {
 	if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) ||
 	    check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 9ead083e6b95..ac3ba746b64c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -364,7 +364,7 @@ extern struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8
 
 bool rtw_if_up(struct adapter *padapter);
 
-signed int rtw_linked_check(struct adapter *padapter);
+bool rtw_linked_check(struct adapter *padapter);
 
 u8 *rtw_get_capability_from_ie(u8 *ie);
 u8 *rtw_get_beacon_interval_from_ie(u8 *ie);
-- 
2.53.0

