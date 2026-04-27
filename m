Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9654439891E
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277906; cv=none; b=u373d21sVxxKkf1QBLq9++NPqxkUjOPpAqTd2Wm/jOChNUYM5v6o8n0yTPZLLm860xDulOxrwY6X70zWaJP4qo2Hw9C35tIguOMgE1wWNPcJsEhvUwR5hxbe5c/Z/05V8gRhqbHhfuE33hBwzvq0wivILL6+7gmCM3qP3vxFFrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277906; c=relaxed/simple;
	bh=X54KA9PavQZQEzucsCa1+36HcRdsBWVlMFDudcoevyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xn46i5Et1SKiiCZOTGm9mQbPlS4sRfCnhkEDC9SLfgCfILJhmpr/ww3GAMOuihyUbpk7YeRodc94If0gQ85syabRog9LpxGaS1Rvj6DyWFnF934WLWnS14evmYJwXoTLR74N63F+8XO8SaGW1+f5riOz5cydLkrCiTg/W0ry2A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlcgOvS4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlcgOvS4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0046078so90464135e9.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277903; x=1777882703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VGLXQGdtwW4M4dZrF/iMa6PrGQcTVy/0M0hUiD6E5M=;
        b=GlcgOvS4VkJMKac/QOzgB4AEE/CRTz4fLEhlnOOFHU++oYOTMu5wHAl9W08tcjYi7l
         7sz0hTMJ0dZMoV0/bTqCN64kUVN52iyR8lH2YM28z55KpfsJQpm77KcYBoSbRokos9yR
         wAgT02WFhXYB1hLPZO2iShf6rW3MyBHw0TSXBPu/QfbQX5HFDZlUl8F/XmZR2sH0h42g
         HWL+ULyLc/cNTRf+0YQw0IXfH+mfbSb0gWcsNlfMy1SU3aschWu4MOpDKodxnHNhklp4
         m+MU6XT6rQRrNTV3xOkKc6g5gBqNrAKM4e3TSLofdjsQNhCivZf3bNcoRjIFj3QNUuhP
         oCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277903; x=1777882703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4VGLXQGdtwW4M4dZrF/iMa6PrGQcTVy/0M0hUiD6E5M=;
        b=sTljr+b6Cfgdv9hvxbyRN9BIFPmMtMjsbYBwnx6NwfNToHRbx17TFi4Ncj00eidfZk
         dF0sqJH97qOhv9DMP+YYu57wz6VRFHaAEeu0OE6qHZspE98k1kB+GVn2ONcxyCqqZbsu
         4K/eDntNyDPfJeeFJOx1JDV5C7stX8oa9ejM++t7bn/ZOFftYPyDeWJynTtdvAlxYjKI
         W1cCZ4b9XmYo/ZQcSzbZaECdePcK3q46kFguWlrlsLUHe4gLEaGzIS1Yq+AHB5PCT/v8
         1VzWGkDwCAMOeIZswb9uU2S9zmdlTGecuTa2DavKwtpfSJuRSm2gyvyERSVRm1y7VQrK
         jJkg==
X-Forwarded-Encrypted: i=1; AFNElJ8OVk/13TilLvtHrYGd2J0BYJv824SW6wdijISRpXDnMbslxDZQ4Fn5mzGIFi2iGxdEihZtFqLQZhcVRngN@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9982e0vC0fx2lh1zgOXvH0hOZ13GGBCAZrwr/Q3SI6dFtcfYp
	yDYQmKmQtDkrKNItUgSDyoMrTVOIEoUL41p0Qz1TYxweIUOniPNP3K7sDa13ouub
X-Gm-Gg: AeBDieuw7/S3nhI5aR+N+I+DQCWc5y6TrWHWeSMSmz20H7JF1dDRBSUAUt3CfycW68X
	sBuZ2YKG+RFN0j2sOfhuZNzIQrcwZDYircposiRbRLc1yZ4Ejtt8XPDR+w9YHNCMFmRul/oBNzs
	F9stxZvGxJhGEx7H1d/ORx4fnxFBrNMj0wpVGRtLonS7rhud5tJ/+UioqQjBYgWxaeNR61CV75Z
	+EljQ8WDLAZXwGRJd9JumLI1EiABUXhyhLkUQB2GRUWkssmVEtODWpKaN0Hs/PFuEJsEjZNXcsg
	Q/l1aG8nzYouG4/QXI/AFOrfjgtUXCNHTVp2S5yG/MDQDAVDSoPcAPOug6OyPz/niT32d45svRH
	KiD1tKLpWxCXLJP/kksFmKIN6BTRtMGW1QoAIE7sDRx2KOijk86P/m4QPlPTB/bdC4Wwm3UBCd/
	03UiW0Rpbg6oGSUuE/ccXpJWUjq/kdiagVzG1KxOUi22BsTxUeP5wJMXSpGmPafm/I8B9c/lolI
	d/3QbXGlIIoqR9t8TD7huGogd50p4iIvCpIhM8LMlrnvRCfrqNol4nfIQ2JOZhe7uSe4Eg=
X-Received: by 2002:a05:600c:c106:b0:489:1ba8:5be9 with SMTP id 5b1f17b1804b1-4891ba85d07mr326445715e9.29.1777277902712;
        Mon, 27 Apr 2026 01:18:22 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc14a61asm712652115e9.15.2026.04.27.01.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:18:22 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
Date: Mon, 27 Apr 2026 10:16:24 +0200
Message-ID: <20260427081626.3393697-2-hossu.alexandru@gmail.com>
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

The IE parsing loop in update_beacon_info() advances by
(pIE->length + 2) each iteration but only guards on i < len.
When a malicious AP sends a Beacon whose last IE has only one byte
remaining in the frame (the element_id byte lands at len-1), the loop
reads pIE->length from one byte past the allocated receive buffer.

Additionally, even when the header bytes are in bounds, pIE->length
itself can extend the data window beyond len, passing a truncated IE
to the handler functions.

Add two guards at the top of the loop body:
  1. Break if fewer than sizeof(*pIE) bytes remain (can't read header).
  2. Break if the IE's declared data extends past len.

Also replace i += (pIE->length + 2) with i += sizeof(*pIE) + pIE->length
for consistency with the sizeof(*pIE) guards added above.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..e0d73c267786 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1289,7 +1289,11 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 	len = pkt_len - (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN);
 
 	for (i = 0; i < len;) {
+		if (i + sizeof(*pIE) > len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN) + i);
+		if (i + sizeof(*pIE) + pIE->length > len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
@@ -1314,7 +1318,7 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 			break;
 		}
 
-		i += (pIE->length + 2);
+		i += sizeof(*pIE) + pIE->length;
 	}
 }
 
-- 
2.53.0

