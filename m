Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ECE3CC320
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368646; cv=none; b=bTAfiwyO/qS4gYayYmw6j5OWS5jCibLa4Bsi+N+Woa2uWHsUou5lYM550x9ae+NkBDUvehbe39dw5kHQAK9D01mIXxKovix0ncb7LEtn4LLDc+6eVBdJEBDHJLMnmqEjJm+T5hw5m9eShJnicFvSuCj0FZDTkmMdCykCr8griQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368646; c=relaxed/simple;
	bh=HrGZAnQwY9MJbd/wv7fd5eZFlQP7idEHOmDb1AkwUaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+4TRKAaAndquJckro3luSt9R0r0O7EtuYIo5k/zyCaCpKWYdED5WUXWIpOEVjydAhHQ6KId87sXcJTuMne4CShSRK1Qxfx/gd49j84RKswGCnYgkm4/qA3PeqW6oH7JzDkdzOxL5l9x1pikSB0y5SM0h6faWjNdtj1WTmKnx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jx0CHs9/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jx0CHs9/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd01481e592so875900466b.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368643; x=1779973443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuMzZ0oPIB63SQlMEwBPtCu4kk4sfKKOYS1JICO/Nwc=;
        b=jx0CHs9/o4N0U0K/+Tbfe6qIC4bqtniX84gEPpmK1hSaJN6DLwdRHjWRJg4fjvqq1Z
         A6Ncb65e2XeABMSakn+Sg0Skz63wadLLsiGrzI8NXcEB/utEGbQxEwtWnYoEnikh8Nw9
         rpvUuXGb7nKEw+BBxU3OQDXIgULzr7A+dFkNlvX17wE7v/k/e7GWlsZFomSscKArUJlS
         ydkYyR8W1xzltbpSLt/k/B6uPz2jw/+cTUN/OwE3/gRd3CUagKj1wrPdcALgwD8nF9hu
         W4BSAMDWLXJh4w49yQ3TbUQNEmoe4vumcZZhINP9LwpoueqlohX+rQQf5bI2SjsGTRrE
         hiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368643; x=1779973443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuMzZ0oPIB63SQlMEwBPtCu4kk4sfKKOYS1JICO/Nwc=;
        b=bwQY0oVJ+p+C+hTB7eLZx8MPkxKN1GftzQpuWSib2psf8+jTn6LL4cP5mbwytE1+I/
         Z/PJvWdJaqpp/J2b8zK0MMsiDxqTUq0/UHQgchCZaDYHs4BY92aVgBXMTX+9A/YBR+SH
         THhMU4sABz4CTWSCoWmHjaPIlIHw29XzPMqSKctBwRWKvMs/G+T9GpOEst6sCoLFt/9A
         2vObTCC4YxpYncegIt+pg2IBYlXPPF9d8yGQSXfDXnRWq9iRDG/eqtJ3xqX7FByo7R2w
         PnNXJV8HiXYxg5DGJ21gmNtc9y3H5VjdN4quBnAW5sTXsJLdn0OnaqLfRIBLoaWSJEgP
         IfAQ==
X-Gm-Message-State: AOJu0YySQvNYSbtzblEQ8WlMSv7LKVDeSouxr06CmmMey/33Zs6kCtF1
	VzRIkqhcVxKOvE4fxm+A6kM9AgwiLD/pSXIq4Yf+3I41B/OA5DfvIAUj
X-Gm-Gg: Acq92OHrvBbbXawYbuFNZLyaas3+lkQTrUjn0CnJaEfKATVPe0t8Zr19/azyL9DIBkZ
	bZkB1Etw/MUB0N89nDYPF0uNVRQfX+ikWPbUku9c99gVCNaeEwIyi5izhEDWEfZHJHtuH9zmb4P
	bQE3Ufa4P2qRE8KQ3pggTxOMrjyTrhY5BaZEYBtCMUnO2/jd0QoZkWWHjkehFxhCQWfnjKNtk00
	7ofdcbJuLENbZDM1cSOpiwhODKRa30aYbifPSBbB/DWTB28RUILPvE0DQ3iNS4bd9f+myp92rkj
	kqy5nIiXj6+VWVRxNvxX6gxJxbPF1YCFpVL7biYnA++amve6ax3hEkGFEYivVLniYJ2Y/BAgB6l
	VtsG15s2aPTcXP7xpyfiI97rzOsJTrfnStBY/nt8EVwaTjmtW5mTPGkdCLCz0vu3J9IEiGdG4rq
	xVK4QMFd8KbCdDv6UNVCX0xkrMrcVa7inxfn8VZ+ko9F9P+c8zsMMPrkYhKZBqhPghUkxsQTZyb
	79wXNi0t/i9Z1xa8Ze1vNdsK1IQk+p6XYqWxfx6vFg1tmQvKZqkdNGp4FGhambgmvnosI3L9ret
	GRk6TxPH+61ZHk9+DhLYEGx4313O
X-Received: by 2002:a17:907:7388:b0:bd4:e5bf:1ed1 with SMTP id a640c23a62f3a-bdc13b781eemr112177366b.15.1779368642720;
        Thu, 21 May 2026 06:04:02 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a505905sm43766266b.37.2026.05.21.06.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:04:02 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v6 2/7] staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
Date: Thu, 21 May 2026 15:03:25 +0200
Message-ID: <20260521130330.754181-3-hossu.alexandru@gmail.com>
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

Two IE parsing loops are missing the header bounds checks before they
dereference pIE->length:

 - issue_assocreq() walks pmlmeinfo->network.ies to build the
   association request. If the stored IE data ends with only an
   element_id byte and no length byte, pIE->length is read one byte
   past the end of the buffer.

 - join_cmd_hdl() walks pnetwork->ies during station join and has
   the same problem under the same conditions.

Both buffers are filled from AP beacon and probe-response frames, so a
malicious AP that sends a truncated final IE can trigger the issue.

Apply the two-guard pattern established in update_beacon_info():
  1. Break if fewer than sizeof(*pIE) bytes remain.
  2. Break if the IE's declared data extends past the buffer end.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884cd39ec756..c646dc2a1741 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2931,7 +2931,11 @@ void issue_assocreq(struct adapter *padapter)
 
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
+		if (i + sizeof(*pIE) > pmlmeinfo->network.ie_length)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
+		if (i + sizeof(*pIE) + pIE->length > pmlmeinfo->network.ie_length)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
@@ -5324,7 +5328,11 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
 	/* sizeof(struct ndis_802_11_fix_ie) */
 	for (i = _FIXED_IE_LENGTH_; i < pnetwork->ie_length;) {
+		if (i + sizeof(*pIE) > pnetwork->ie_length)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pnetwork->ies + i);
+		if (i + sizeof(*pIE) + pIE->length > pnetwork->ie_length)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:/* Get WMM IE. */
-- 
2.54.0

