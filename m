Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18A03CC7DC
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368648; cv=none; b=T9EdVCg6uMEe0kQlegkWR7IGs2kjmr09o3bPamZ0H+V6HufJ+Bckln5IL4Dpb7J43u1GuD0cXJKkd8xR3NSyMY/0DzffndK8uDJFX8aL2eBaZXxxiOPXJrcI5/VwzUsBMHTuP50YB4Zsh2Rb2MSHHobVKFk7UpghCpiRxEqzvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368648; c=relaxed/simple;
	bh=9A4jVnzDv/usUlFeq3EuOnxuhB9rRPwyxJzmHvtAJ74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgGE++SEsClsRmehaJR7WAIBzC3FsTdN372kETc4VpqjbGmi/srbrD+WmrVRAAkzZMJALW17AmG004/cKy5mJQ4AGlPBumlcuDDTLxwkSz64z5dBp+5TornF74cazVuyw3UR3w/Be+fPKVf91AH2kgo2FUUWRtKwC87GrSzY2Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvdKUTXn; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvdKUTXn"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67b6da5a618so9990826a12.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368645; x=1779973445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4lmM74WsQVb7gsWrSGGOh3OWSwYycbJASwr5KvwFMI=;
        b=YvdKUTXnhITFs71istjdqdW+0xO4T6JqPRhnvDKMJvKqb6SWWVVCDBfAxY6d1kcyIf
         EVVtwcV4slCNAasORzrQaUyDvg2m0aSYOHpEXp0k5P8KJBLSu0tw4dRyLOIkD9ox8aUI
         UlOOZNz2dpAZi+RtdVJRM2OLb6DBEa1JZOzJ5zEDjzpnqShe4j2yMd6mHyH6uGIj5Vad
         SOWXOJaBpaIm11u1WnZ+MewnyW2afo9yaX3Fex1g2UJZrKDJwHQtcZG3JXkEGzI9HV3E
         QJivqnzCsfjHLMzoi5aAGgCshkkh9F6/pLixOEQFbkTXCGYTDpiqn5ETEAaSYT2zbEPL
         HjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368645; x=1779973445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S4lmM74WsQVb7gsWrSGGOh3OWSwYycbJASwr5KvwFMI=;
        b=PRgLIiymUkOI4d5DZdY1bOJMbaaAN/Ypp3+wdARq13KszY7BUYZTECeu1DyAMBegZv
         3Pg9JavazyDxKMp01+pxZ6HH2r1G1NFD8GeSE7avGJ7wiI3TaA9Ccrt8tOuIXeQ1JAsC
         Ywelf6L0VDcRxiliSP4G2dUyDCv+rsjGrSYUZa1tj88Q37Tfdrm1yBiQKpR57Ln30/Bk
         2uKgIQR1SMweqX3lNzg4nLRV/WsWDDOdhj3zV9m4xkoV8DjU5OdBgcLxnCU10/SIjszm
         HVWNv531o1ioC4nFXpzbDKaafPkQJJda2JJEqiZwXdNz5p6H5Bde3koZ6RqVJ41pu2IN
         pTgg==
X-Gm-Message-State: AOJu0YxlWzk+zo40ToJ02jgeTBhyTVr62sWd4Dl66Z2DqNLEVuRRcboi
	y/pFGGCs8XCws1ERsF/lFOllYDo+5yTzNTISoqlwo3dRe4TjGPg9qphw
X-Gm-Gg: Acq92OHOBfMuDRB7H2KN8oLYAJHXB79Fg1FMYx6G/fKe2vI2J7wGmbCn0GaotffArkl
	godrXyIgHX/ovMPlZ8C/jZ7AjOehWISTZpWYTLF9gVk1XT+OP7VPbfM+4apujjqpP8dyzWT/rVO
	m8r8TG8Z3feij0cc5QFyX2J2t4P4Pwyemu+Xv1iQle/c/GDDsBYaLw7vtNowl/wh9BcDv4Y6rqk
	iec1HuXuvMfCAMJQq0+KTxTd8tkSmvMmM/bd7kuvwmutwp7Krkw6TaEiGhWRRanYdaq7Cl0QSW0
	A9NI6dLGfeyQTOwjDBiLaQBhNvDIw1O8Hybhr5UDRWAW+CHmF0qHJMyi2jR7LBL/DIjGU3atdq1
	7dJJaN0mFF2XZ1FmvuJ2+tWBu9tSlWfI/gVVYLU+S/GaALT57wcDAjn8Dq8fI+3exiKyIEClkJ0
	zK29rp1pRJWtvLP7/+xRMpR09XbKZ7CzGD69BsgPgQ5kcvbgWFHmGF20vKBK0+bZzH8Jce1gaVd
	DWGjRl8qnHDXQ2mY7j1oBLCpmQqRdDW6reDWBe7u+B2dF5N8UjbSOSpo/NN5lgFras5qYu9+zqQ
	Uq4dntTRrZ53oFseFtl0CWI+6Bdi
X-Received: by 2002:a17:907:7ba5:b0:bce:4be4:cb9e with SMTP id a640c23a62f3a-bdc13e7e9c4mr162388266b.24.1779368645114;
        Thu, 21 May 2026 06:04:05 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a505905sm43766266b.37.2026.05.21.06.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:04:04 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v6 5/7] staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
Date: Thu, 21 May 2026 15:03:28 +0200
Message-ID: <20260521130330.754181-6-hossu.alexandru@gmail.com>
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

