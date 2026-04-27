Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF5039A074
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277916; cv=none; b=eQHT5XuHGkBQvx9NmwVeBsM5kOJoo06NsbZ14pl1XMqPEMHwv++EdbwyzveLwcKbh76Syk7m4UtpD+cEHNqNcfeottFbauyYwTNPAxH/rhkEptket9fpoO1m9aMqDMrTYRFEJgW/nKu4Puy7V+ZVoeqItpMYqdN4SPNerTiFBTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277916; c=relaxed/simple;
	bh=UGUi2ZtX1bemwYp8cSksp8hkcBsw8FfUwrFHOQVPgO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmLRkSGceibY7/G6HmkmngboVEbjfmBWyrwXKxQEiS1qa98Da3/1x0aFbByjFciJpGWeaSDB6denvsYttQ5tCxPH1VugTLA70V+bPD9Xpf48Hy2qBC/EHfbgldBFVjUa4p45Bn/7uGQ2uxXiTn3zqgVa+qe6KK6KyCH2NtmL8Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amcjZGYv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amcjZGYv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0046078so90465905e9.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277913; x=1777882713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORRSLkmyVRQ6NCw35RQV07Yi/LmWTcjj6Iy7t//9MNM=;
        b=amcjZGYvyEQ7x902kLXvoo5wBT5YOOik/GyUIIcJrpbWmhjTYJ1EAR0iBEoE3Hq3eG
         FrlfwoZK9j4GAHK86xHitwTrlgXbXhX7I4C8iPciuqespxhS+5Js1IAu3AQZduAN8QUn
         c+guU/rSDiqpb1JlII7w7fls8rOn3eKZm/AerHZaQ0TY00KabXl7cAuroy3ghS1CMNvg
         aDLh2CP0zSUYv5TCk9IDPmrvwCJyq8DwSlsFh4/6GfKKf8J6lsmAQ3Rd7Jz2IsmmRJr6
         l+GyFtdNW6fZ5azUC+aiuYq/kEs4vbcxFILqp37ulXS62uqzfvUb+CTU8EdqsXwsUIdS
         lwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277913; x=1777882713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ORRSLkmyVRQ6NCw35RQV07Yi/LmWTcjj6Iy7t//9MNM=;
        b=tEERpTckvJ1XIwDM16I5tKblmhs1GfnHa6zSG+XgaMLsEqPGgz9mbwIpTB0volAEs7
         hZXvFOn1bFnnDIRb44UAJlJAcVX9S0w04pfOH9+nk01fa4uvEyCg3avzJjKUPqJtEIa3
         S8m0Z2NeGyX7vrbBnMuaJemjHlkO/LNILkpJaLb0ebQV4k89jkIRMo9SVKjkM/t3mBJi
         CBpnBveDtdIbIDTcTOEBsM7gUHTFA6jN4Cq3QCVa7Z+Dr041TzkVdT+eEOt2Che7QV1G
         UEmmwFVP7Y8vuAf8itV/p0XfwS1G5l9UoTB7apcwr225MdCMBxTAiTZV++g/Fdp/GMFM
         2rHw==
X-Forwarded-Encrypted: i=1; AFNElJ+NeBkYXvw4d/ufIsay7a89tyvmtySKBv/NqL7+wBX3SByr5ie8m1Rpx0w5eW2/TKKPGGUsoCihr+N/6nSB@lists.linux.dev
X-Gm-Message-State: AOJu0YwnWIoKJzCpMolN8amKWHarqqAuk/f08MZe9+e11mWilq65fem7
	zVtfeuPtCEQDrzS/XbhrzGl1Vyojrlvz93i4Q2xkF1lGCgLpHy59aGcw
X-Gm-Gg: AeBDietJKr7gv3SAbOq2reiLDcWvql9eiDaPZZ/y2CD75rnlNQM8hdZhuk26M3M325a
	ozZml24QusEWw1v48fo4C3yWVVCJHbXyc1LOogsa2spwE0YFOMrv99wIl+t2n0AdqOBNo590jtC
	R6riEwdCdUee8xuDZS6VxH23vaqVwruGc5sleh0K0gLkmTUhT81hCbJaJROWu4Y+VVd28ztv/8P
	O6SHISVrS/X3v2pk1j5gRFLCofYPnKrZKZaIddUTiMSkAO45CRHQSOjMuhfYmVZsWnkKwlc3Vwc
	cNnr7lkgtdd5iCUqIcsS1oFl1PBC6bFsgwtkJcgLaAHk1ldtkffdNGAToU5zjUOel0jMNqOgAQW
	chCD10UZh2r0eguBTzxBvmTNW47FWyKLe7yw2tQH9bs35md9bthi3dPQilX2iNzs20nv8QIX4nQ
	E3szSBRH66c149hoHY98S5hhORnVGWIFfchbFg1knzanry837jCEekHbNPssyv14vTscmcGOAUH
	UQobQsv2rZH/xW6leCuQbUZHpK00CoWJ/KNQhklG6KSMrM8mdX1n+hDrjuMmyWGV2YIayA=
X-Received: by 2002:a05:600c:4652:b0:489:a4:e578 with SMTP id 5b1f17b1804b1-48900a4e944mr303852385e9.14.1777277912730;
        Mon, 27 Apr 2026 01:18:32 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc14a61asm712652115e9.15.2026.04.27.01.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:18:32 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
Date: Mon, 27 Apr 2026 10:16:25 +0200
Message-ID: <20260427081626.3393697-3-hossu.alexandru@gmail.com>
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
2.53.0

