Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE71438C2BF
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753249; cv=none; b=mPDrgWWi1bh9PesTeKNx+nW+Aw+tJWrgwcWIzaHjwPNqRqTVLnuX4iHsbNXOXOrXIh15ixsJ6TOwVFF507ZmOQft/PI1LcIYSBT0GUA58w6z81Z7NTWBFN7KJqvgdqhesi4wNbKOpbDIXGE/O0nrhqIPorctpkMllRuurjRGSkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753249; c=relaxed/simple;
	bh=Axmd5IPh2I0ePfoBcxce130e2QCyMyW6fCwo7DYmTgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OrvUJjEE/wQIHj0vN/TXcltPn6iTK7+xPEYEGqLP8HlQyWaAm7QRmX/9pUB8old0GWgkiwzFzdinxe2USvC+4TQkW6HJb6rbpn/LYRAxRay7ZtVQpLUyS4lJkm55cnH0U5Gdrmi3Z+JLgjcR++5GMqAzVD5Hm6y+OhnFl+TLDJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHX8LUn9; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHX8LUn9"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12c1a170a50so10862485c88.0
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778753244; x=1779358044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCk5lbI7sH2Lz326mmiKMLpYmZaGzeWhG5OnFEOU7xw=;
        b=PHX8LUn9p9CO5JG2G6Fwl4CyU7p8+S6cpJxMqRETr8cG15wAR2ucDiP1kw8EasHwzn
         46p2FNiwSOPmilIqm0cQvNpaJMaX2qnsEIDRkF2yGJJ216RgqimZZkp4t8Ns0Dv1AarQ
         fp99NXpgH2ha9audjQwSxi61N5VmB4MjMyCXNSnBviFLjpScaMfkr4Th7+GYdd3LGLwH
         umFQ0CcUd1o/ubogKr29RomoteafWfdn6ieCQwKE67B27+OszTFReZimWu8oHcSaLUEV
         fab+Rvjnjhvt9bYNLcrunmFbgmQg43KYT0P9cDI/gX0cgSX1vbt6tEMP05xmXE6H6YYi
         cZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753244; x=1779358044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lCk5lbI7sH2Lz326mmiKMLpYmZaGzeWhG5OnFEOU7xw=;
        b=jlUPZ2X5i6TPlauW9PmOCF9xXLr6ZAIWaK6WXZFzTstxpAUoFZKEO9P2dxft6W7bhv
         AT8Vu5ul0200pmVNnOzECprQsnRYnDgeViMcYM7njeqv8I5HPPrQCPIEMc2Q9v0aoxTb
         rcWpbWOmwRxnzn8u10QxCjDfiTUxO6VYfTSOt5ee2+qn09vBGKbfaa2rUrDnapesDYtS
         jwzxczxSf0A39cbAPLXKTQPfQVyk4dnXQqoT1MBI9hI1u5PYGgrg9rBaPNvjGSxa3g/e
         AfieqskUohHzB/XLYWktfKLgYglH+f/8CT2AhtQop1bgjVHPdZltPNpqeWRtLDXdd0N3
         Leag==
X-Forwarded-Encrypted: i=1; AFNElJ/Wesvy38kl06FudvKDjeo5sixhevLmJJi1dUGmADW8IBd4+P0EYghoABgAZ3c6lP+wVed8HC2R4A0DllVd@lists.linux.dev
X-Gm-Message-State: AOJu0YzWmEbrIGiaqVfgBLt+GbJHUUNSSsfEi7sLSDycbh8ldKw6GYaH
	gdRVfglesUCs1fg+bU+tBk9ZbxpbP+S07d0h78tOLkRGynyhp1xdEMjD
X-Gm-Gg: Acq92OH5wQqiKgPH5ldOhWpaSUx3gKmrARdqHJFoTnLbjmESwr9jkNE6NH2G+DGk0BI
	8/NYjnLUbHyf8NtB0CHa2rmo3M7t9Cr1PR8sevAOxVCx3aojl2SY3xCWDVu53KVbL6alov7Asv9
	TFCgiNf/MXdaG7AtBoDVS2wmuJK4TCoabuVR+uSJ/x0azQLtk5IXfKwJpI9FwKg/y4r8EY86K50
	hJwaIEWy9O3kqlCQt3BiH8wUt3bJTu9nJwhOenyAMfSLKOI/XDArvL1SHoXURWVyiZrM1/dFCvi
	cVVdBOPxBTq7eFQ8d1V1MtBrnrVe7PWRbWwOny85T6pLZtRkGL7LS1pV3HeFB/OcE3IATiGDqBE
	7hGjnwF1cTD3+SreqLqwuH9nu3BZRp9hGyZA4Z4wx0uMgpXQjXSLSW0qwfL9jw8Nkl+5XduKRBh
	1SVdWrWh0WkrKrkvDjBycKj7eLSvuUBDFTS315lEi4b+wvHI8EZ5mYDzY=
X-Received: by 2002:a05:7022:2399:b0:134:83c2:26b3 with SMTP id a92af1059eb24-1349a14eed9mr4253148c88.0.1778753243876;
        Thu, 14 May 2026 03:07:23 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm3757921c88.3.2026.05.14.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:07:23 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/5] staging: rtl8723bs: simplify rtw_xmit_classifier control flow
Date: Thu, 14 May 2026 10:07:04 +0000
Message-Id: <20260514100708.25031-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514100708.25031-1-dennylin0707@gmail.com>
References: <20260514100708.25031-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rtw_xmit_classifier() by removing the exit label and
using direct returns for error handling.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 458e471535ad..72e5dddfee5d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1874,16 +1874,13 @@ s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
 	struct tx_servq	*ptxservq;
 	struct pkt_attrib	*pattrib = &pxmitframe->attrib;
 	struct hw_xmit	*phwxmits =  padapter->xmitpriv.hwxmits;
-	signed int res = _SUCCESS;
 
 	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
 	if (pattrib->psta != psta)
 		return _FAIL;
 
-	if (!psta) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!psta)
+		return _FAIL;
 
 	if (!(psta->state & _FW_LINKED))
 		return _FAIL;
@@ -1897,9 +1894,7 @@ s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
 	ptxservq->qcnt++;
 	phwxmits[ac_index].accnt++;
 
-exit:
-
-	return res;
+	return _SUCCESS;
 }
 
 void rtw_free_hwxmits(struct adapter *padapter)
-- 
2.34.1

