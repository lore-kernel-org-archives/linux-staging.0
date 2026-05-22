Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C752BFC7B
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410784; cv=none; b=jjtbnoiR1yeyHZ92YJpX1QfjMUIletvCv/AGXYWjQESWO1GQgg3MUi3rgAvzXnd6I0I/LlGicEOWOQ0aU8QCBNjDP2OaoUoHaVp6Kcn9beQ1tKRc/zZyDnPXBgR8PCk7s1mzUDZFEBUc/ITXiVgwMLzxPHQ5LJUFw9f6nL/SV/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410784; c=relaxed/simple;
	bh=9A4jVnzDv/usUlFeq3EuOnxuhB9rRPwyxJzmHvtAJ74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAtekdXnlxqlOUvhzA7emSK9eHphuNQs6WS8F15rqlobH9fSgO2FXyogdNhpWXOz/fGefII83H5FjA3qfxvhRQX9ZnhfqWgOpm9YX27c0PNPdHFoBSlxlda9Sn9f7qLnGyxLG3IAPo4ENNWj7SQi4ueZN/iVnI+vGiYbS1zT7Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+VI/CWX; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+VI/CWX"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso1666350a12.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779410782; x=1780015582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4lmM74WsQVb7gsWrSGGOh3OWSwYycbJASwr5KvwFMI=;
        b=T+VI/CWXo8XFZFzEMtMIbv9MHiiLwE6Q1tdAtN+Ty4cPbJC+5E6iU2tq83oobiVbEr
         mZYwvIKWZ0bGXxkvY+UezL+fLY6aRst7PWdcvIQNmqTbs0tFV3Cd+U78ihl2rt4qtVfg
         u6OWjG7bIsCXE317bX7VFF5WFGCn+tRn/JCSP7OFJCkr4wdPPd/GFLJgRCRxIt6ydsnl
         ZwvcD2k+Y1UAIU9vjwJmTK4wuzqZGAlZ2Xbz3jJX0l8aXlAAKHlUIuNXEayAnxmaWjXA
         /L6Ui3YA/6PAvpOuN+AgDGwZB/nTEMbMTpoqNrv67lAfXZlVR8BxK87t04JEX1s8aFTD
         XGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410782; x=1780015582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S4lmM74WsQVb7gsWrSGGOh3OWSwYycbJASwr5KvwFMI=;
        b=EsMZI0ByY5iyObWSiCFAbj415snStIesLXXhxjBpomfu9cPuPraU/Bckua/xZIlcKA
         2NRt5Kt/+/EP6i9ylbptHUuhoCKFbYuSBTd599JRwNDVbtzqq9ekIfnuMSboagGXb5K4
         ElrPdC72k6xkuTq9MCSDuzeOJOEonb1z5zDocrnhuNtBBPvvpBl29W99kY48qy89gtSj
         SxDoxef0zqQvprIJtb6jkUalvTgxDmWMvvGUcjxQj7nKStXY1Rw9C6AMBzgSQD0IuI5y
         k5QciNS6mgBjesP5wAl8Qmrb0VnNsytaDf3ZOiZviqXti1x4OCR4IzRjks+czAn5T9ke
         6xAA==
X-Gm-Message-State: AOJu0Yx68L87ubC6SZbnzseNnZ3TnQ5zdPsb3IiYDDtZ1q9CLo4zvy5c
	tLoVUF/IfBoQeRLxnX0Zi46YYc3fRPjGTrC48Ef6pqH0KExZehwI2Grm
X-Gm-Gg: Acq92OHS5A4Oens80It6wmrh3NPUNNj+wE2wbGCG3EKZZjGskeJ+6mXcWQ5rzdVxTQq
	2wTakGQdE9nOjc783/+pu66XIRb8rsHT+t7KhjRhCDhsLIVH8gQ+PIDEen7XQHITA6j4PPaWYgA
	oROTYPTPRHpI9ZLLLvLIl0t73JTvtEYT2QA1py/TSZB7ozTRlHA9YV51YiFWzNHGBvyFWFX1QOH
	QvsPTJUyK1bvKuvbY9peDiFPshzPNm2OHpL0zvk/cg/KsA0MPm1CSd47X0ehykrVsVo744NN+uv
	LSqxqhTsGq+w1bLCr7TiG07tv6D3tLPetkVda9KbPdsfcRdStY1s98yQ2VYePwS11T5f/TDSpLK
	lCjLasvbcnTF9TFNYGRRezb09na0G466pyoPLFTNOZVmQYpmYEcFRyUD3ZI4UPL5rqWDDS6AG9w
	pSxLn/vdLtzIZCAuSElpRrqEosY7rEegHsSDHzFQZem5/UiiEUsvx1Z/9CSc4dOwnVVlyovjazb
	6ZwO5qCrkrCyYdDseOjcIgEFiebTju+iIL2YaIhSNVxk8CplbUCI+AJPzfUNo40JXGm0aTtdFLp
	uOAI24yqYJUwvdwR8ljuh+clfs/q
X-Received: by 2002:a05:6402:3594:b0:676:e619:2be0 with SMTP id 4fb4d7f45d1cf-6889c44e2a0mr484221a12.8.1779410781772;
        Thu, 21 May 2026 17:46:21 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3535a12.0.2026.05.21.17.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:46:20 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 5/7] staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
Date: Fri, 22 May 2026 02:45:29 +0200
Message-ID: <20260522004531.1038924-6-hossu.alexandru@gmail.com>
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

The IE parsing loop in OnAssocRsp() advances by (pIE->length + 2) each
iteration but only guards on i < pkt_len. When a malicious AP sends an
AssocResponse whose last IE has only one byte remaining in the frame
(the element_id byte lands at pkt_len-1), the loop reads pIE->length
from pframe[pkt_len], which is one byte past the allocated receive buffer.

Additionally, even when the header bytes are in bounds, pIE->length
itself can extend the data window beyond pkt_len, silently passing a
truncated IE to the handler functions.

Add two guards at the top of the loop body:
  1. Break if fewer than sizeof(*pIE) bytes remain (can't read header).
  2. Break if the IE's declared data extends past pkt_len.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c646dc2a1741..68ce422305ed 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1406,7 +1406,11 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
 	/* for not to handle the synchronous IO in the tasklet */
 	for (i = (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
+		if (i + sizeof(*pIE) > pkt_len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + i);
+		if (i + sizeof(*pIE) + pIE->length > pkt_len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-- 
2.54.0

