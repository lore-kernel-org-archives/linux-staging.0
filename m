Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8893D2FC00D
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044078; cv=none; b=k/L00y5nUdXzJrGKUsg3HIg/DS3FxFGJp/sEpGdklneijym+x5hqP5rdui+nKamlLjrVXlOCkOpar/r0N1VffjBe6Ra2DjZClCBRLZ9fwyrQUhtw/wZ2qfDpWyzXgD78GwzaDyh6wzDDUpw0d7Q5ROg5bI/96EX160afyuev7DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044078; c=relaxed/simple;
	bh=i2nYURWA3HhBGoTDpgbrWPO/yKGF2Iz0jdRtEwVekaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kxy3uiWlD17xNyCFRhfrrB7nnkyvZ8X74wFS+3653HxiDR3RPCdywbMbJyL6vzJCMXUatg8UbVuP/yPcUg4m8IV4jTGD+/LmpQnH2PfmooeBdLXJ+e7rHDziPZYhKYO94gieL8HY7TiPwijnFOQlOdPZK0sdOzXXVfstyNakv8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koldCjyI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koldCjyI"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfce3a195so4626796f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777044076; x=1777648876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLgcsNPS/6QCOSfQ0SkcnMzJy7bmKvIkiWl9xMjGBEo=;
        b=koldCjyI8QpgPexpUc3eHJebMDQQiyZUy1q1spRlKC9X2bBiFjBy8uRKzR8KcWuRiC
         ASb74AesbEtFUcDRH1eOcrvqlU8bhesjgUWvTfOnoGv8IqXEqIXUIsHEb89u6Fwlc2bj
         YyH3f5fbGxYT4fCMok4uTxtsnuVq8kj5Y3pCLBcI2YMUoFGibYqbBDNgrW1m/pEVT++q
         rQoHMV2sPZQSRKE6MfLB4y5RcuU3u1ntXQgW1FVY3XF0MCmy9rZjKeOf58Fwc1ANheWW
         RYPwddMot0IlMBs8WtSzfdR1lKdAW2uENo4cXcIYMjOZf5G6V0g+LcsFKh8NFLNbIr25
         sXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777044076; x=1777648876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CLgcsNPS/6QCOSfQ0SkcnMzJy7bmKvIkiWl9xMjGBEo=;
        b=srLDOhWdoEuECChk5jeVu5bob8aK7j3CnDUJeCIPPWJFXfRy7886WWstT2VcGGVbno
         KqGNex0LxOmrJKSQn00Mk8XYfH3mnw35mNLFRbIb/Mf3ndYIJPjxwDRFEsMl//oOqyPy
         n7AYB9Pc3Lfc7Vcsqoo/Ar19UGvuw90gds4PGp2ZgEc6+w3TP9W3eYESKzzda1vpSvBe
         IGZHND6K+b/Iy025apFPnJeW3yytRqiXQT05n9DLOlo9D0k0Q2pv6K00huyuaHauasuq
         G+NireUYp1iz2T0pnnKvxXR+gBJk3/zI7XzRiDv1z50n6ZxrY3kg1+IxPzZqzb2U/9/j
         7E1w==
X-Gm-Message-State: AOJu0YyoOm0qvsgUH+2hxc+ElIqH8CC+5jZZxbID4KXoLf7hCRZHsOzl
	ENTKat2CeWEM7trasRBidQTNjY9F7udh4/jAJQI1hf+5KLB7885xllgi
X-Gm-Gg: AeBDiet5aQRD2CwaH75aG7gaqwRChhbmRUpcz/420C88wQLR0gM/HsDvWHiz+T6hXl/
	wt2VtryBJahf1sJ1u4tFEsG6ct+00bpSXopPX9MjDV4Z1rP5yHXR5xmPlUf2KmHe3ME+dEJHgp+
	ab0nRAmR0zSXHdv3osNqa5NCA+yLJmgWJMsaUbdYMk3s1N4HeGCnO7ssh3v8ti9Zmw71f7cpk6+
	RWSHrmD6rKHmBMt4PZViaLakDyK5Wj7QjPK3PtrubQUQNGDyo3Zrw6iexzPyqql3rbfgp4Q5o1+
	Y6Ecd0kEw9MGyJ5yjfSq4RHYuWBNF5wWIAfoD0V9tUZLpQ5FZlaYxA84YXE4PaJ4puolhdbvYIE
	5CYFQimCt5aeUdgJJtjNgyUt/FiyA1WsMu89HMm8NZktCkB4CgcB1C0caBKJ+2v9PfcRHvPN7Z9
	eRLzs9n5xhgpxnK0zBAHZ8Y03XcYrvsmrliPWSmGUb5DQsm6O8N9KNwQq44Jal2/nS5QOTdmnSP
	8rG1GUGiAnxdJ/PaKwDTk9e2HJleSyI5EbobAYdkv5Xk+reN1llI0GJdLf1v/o6sF2p/U0=
X-Received: by 2002:a05:6000:2088:b0:441:36b7:7262 with SMTP id ffacd0b85a97d-44136b773aemr2347608f8f.13.1777044075862;
        Fri, 24 Apr 2026 08:21:15 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm65670960f8f.6.2026.04.24.08.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:21:15 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
Date: Fri, 24 Apr 2026 17:19:31 +0200
Message-ID: <20260424151932.3734611-3-hossu.alexandru@gmail.com>
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

Two IE parsing loops lack header bounds checks before dereferencing
pIE->length:

 - issue_assocreq() iterates over pmlmeinfo->network.ies to build the
   association request.  If the stored IE data ends with only an
   element_id byte (no length byte), pIE->length is read one byte past
   the buffer boundary.

 - join_cmd_hdl() iterates over pnetwork->ies during station join.
   The same truncated-IE scenario causes an identical OOB read.

Both buffers are populated from AP beacon/probe-response frames, so a
malicious AP that advertises a short final IE can trigger the issue.

Apply the two-guard pattern already used in OnAssocRsp():
  1. Break if fewer than sizeof(*pIE) bytes remain.
  2. Break if the IE's declared data extends past the buffer end.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9666226a60bb..264d070fc7ba 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2929,7 +2929,11 @@ void issue_assocreq(struct adapter *padapter)
 
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
+		if (i + sizeof(*pIE) > pmlmeinfo->network.ie_length)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
+		if (i + sizeof(*pIE) + pIE->length > pmlmeinfo->network.ie_length)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
@@ -5322,7 +5326,11 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
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
2.53.0

