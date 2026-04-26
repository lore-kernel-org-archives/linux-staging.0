Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD354334C27
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777197229; cv=none; b=DIRmgVsWKkPKDcDKmVjh/M9KEIRJwqaBDQClSCMmVaZWTKR4QL2mm5usfQPw5e4YnLpkedGhp8mdWqg2fT9rxfmZMEks6LSSgwEeuqXi+YnWwCUn0F5GcjKRPAEMJrz5Axki91gBHzT0oJ7+QNTmr3C1fwAa+GEo8xOD+AjiM/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777197229; c=relaxed/simple;
	bh=2sxtaXndNMYWtBQX1X/Wg7r7jokctj94Xqx11HqSA04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEOH7YKnRY3MySbI5YqZ8+rBV1aHx0rV8nL70tN4xrWOAPJNFsVFvICOZuufRvF0dMDxwtK9mGk/3V+YYYLzAlZIVj71Up70UrIph5R02ew8rvoOgS7xe2jeuBCVDuEm+A7RJkvcRGNDZdEa4cyNFYUQGSvw/U7HibrCamjsFp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvigDeET; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvigDeET"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so85092395e9.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777197226; x=1777802026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXFpiKghA67p9cDwUzweTgUETehBK4YrQbqfbhlykPI=;
        b=UvigDeETttZ/WBv9R9OtQz6GF44xRFF3twscNkqs4h6VY6Ee1A63Ki7YUcCpX8fcqP
         +T8meauLW0BZtAIDN5j2DAVSbFljG2/gCEx7MNQR2THkQwvMV96lzPbxrRNzZHvWjn1a
         I7YUiJHGfKYrGCWp0dVcX0wl1blt0ymPgOTdiveXGNIvlKQOdkVbTkqksB9IluxMQdji
         /6J27Csfw/RWXgVBCoT1lX1svsj9VAK9kmKHZpX/nuOLugquhJlZXudr34FksaZ1BIL3
         kS6EaSmn9/NmY5CIcS7a0XU6oXSgEq8VAuZHk0TWactzDZpTK9t1FRe6Ki/HPx0LEQo3
         U+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777197226; x=1777802026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXFpiKghA67p9cDwUzweTgUETehBK4YrQbqfbhlykPI=;
        b=g4yXByxQjf3am3y3WGKKSofjhk6bBiwszhdZ3dx7YOtJ0djVZj4uDJRdPICuM5egRD
         fhmzdT9h+F647SJEKuXdMsAJbxzNTNCBgJsoMKwmDbg4REAG96vP797tEYCA7zt9ajzY
         MhwfrWJU7+usMtuJyFhgpmv5L3ga/yx3bAFnyrM6cWahmMjqiGPoxmJOJ1U+FVWq+JwY
         jnmjvrKvRrY19RFRmN62Yw6gSNIuMtoJgwETe0RtNXlF4kC94Wqbrf65d5zxoMDXr4mu
         LLsfLkXEdg2JcAATWCHVZziW+mpn2zFPJD5F+vE/87HxAH32AVdkxdZ90ZpHJOoZiMe8
         Wt+w==
X-Forwarded-Encrypted: i=1; AFNElJ/bOHi/gF2uyCHJ5dRmRS2vTD8L0Cy/LH5XyISmFTBLMEdcmbufT6I1Q+6jY493Z7IVu5FU7kBFu5UYiJwF@lists.linux.dev
X-Gm-Message-State: AOJu0YzdARx6KTI9YL32MTNDlzXFmcDU6ul1yc5KdQKwNdL6/on5Mcpv
	Kz3IdeBcl/nzU1yhfqBQLgeEdRmd4KawCLfF2d/4qmx/bU72+HEAnfq8
X-Gm-Gg: AeBDietpe2W9WEZXDeMijeaNvkcdA2E6VW+b52VhZK+XJvyUbUf7UwJiSPb2cQfJZaF
	+AuJLd5KKZYxInVdJIEaWqrvbB+ciFTI0f08oHW2dyEo5IDpKyjmIGpeHNvsMR+K8SvMLyfff/X
	2gLYoQTytOIb36Z8B76ceFb62HyJ6Y4DmUjNzaYjS28WPv8riNOS3qk5oBqi4BGagsIRnWBxdIj
	QPvuGBCv5mozI+FSRtqNwgIluatgMi4qy9HLguvylC9V6vDqCJutS3gXCwppDRgjFEjlQYJCYzC
	Sc96CyPt6bjZx61lAWHOdQlNfOVlazvpBWsb0HFkt0E5SJcbPto+Ga7IQzf369kHqu9TLl/7Esp
	myNk3UO3AITVQcjIErfrIawKoAgJJQ30tIPJZSOE3RTpZkJgw5cN0wmXT8Vcj8OUWNuPsjKE3D2
	vXXTbb8LL//qRX7UtTiAe3WhLFIj2N7ApcK6jebQqhiS9wrlelJap2NcaotNQeiyezqluTbjZoO
	S7mRG8BU+bR6bDiQOPJf2GDfRiOM4El5vAJqxvfAJAPKMsNTwGTvHr+dPDWJe5GwUJ7Nxo=
X-Received: by 2002:a05:600c:3213:b0:489:149a:f9e6 with SMTP id 5b1f17b1804b1-489149afa07mr245250955e9.28.1777197225861;
        Sun, 26 Apr 2026 02:53:45 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb735d3dsm510905405e9.2.2026.04.26.02.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:53:44 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	hossu.alexandru@gmail.com
Subject: [PATCH v2 2/3] staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
Date: Sun, 26 Apr 2026 11:51:55 +0200
Message-ID: <20260426095156.3523480-3-hossu.alexandru@gmail.com>
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

Apply the two-guard pattern already used in OnAssocRsp():
  1. Break if fewer than sizeof(*pIE) bytes remain.
  2. Break if the IE's declared data extends past the buffer end.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
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
2.53.0

