Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B69390C81
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 18:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461405; cv=none; b=cdKDbuVbz4DbvMQqCL6MgVfj/A2r7NbmYfwHhzFFcXu5PdKtG5H3LCMGC//NAhwXzEZOg1KF6eHtubeeAg123+7QbFVba4c0aGnkLKPXoIxfAINjq0L1qXvGhsvbUVq4yYegAZeSXXzRX11xrKGGC8DjBZbkIwAkk7fHoVgruKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461405; c=relaxed/simple;
	bh=aXgMIHimi/XtzLO2hYvD+im1qHL1uHoU59wrbQnr2bE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qzEsZj2oH5T4v5DqfiNb4JKUBzFGjXN8UOcWkV7yYgKJBx2OzkxTvLZCktyzHLd7CqL119NbucKhazX8SnnfSp8zK3xJ+C1XbTaB3q5T4KaDNLXoXHBtvpyBcEmDjjgSWgU0EnIM7rK62LvMTZiZ8qM+GPcrhQpTLppMb1yDS/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFHNkhqT; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFHNkhqT"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-13807d2f898so2837502c88.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 11:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461404; x=1782066204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6uh8rCm3G+Q5haU/Mo8ZtulNeZuEd7lSKdspHGQ2JA=;
        b=AFHNkhqTilfdMAKrxqfHdYsA3l/kKcKPJRuD+yGov3t0+14lrhjNahx6CpKGHH9XlR
         th6/GfRwX7wHWDx67oQxpW7yfyS/3IBJncaD0fpauTl+iRKSgKfA8lxB6V1tXNigoKWF
         CEGOGuGnOEP5ph+qbVtkad+20mXIv4iE70Wfqa2eHbx9yx2eFqLs9JXZwlNWRHpxWpxk
         zEPpFiGM+qekPt7mIhsIYkOhqZWkCcQhNko+q82OgTOxwOmvvAw91JQDk6LDR0YyJ/gS
         ctR2tWP2cx39UJ0u0Flgkl+9xM4xqYecK4XPlDonJ6YmRHL1FUk9ZEXdp2XsuI/nBEgA
         ru7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461404; x=1782066204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P6uh8rCm3G+Q5haU/Mo8ZtulNeZuEd7lSKdspHGQ2JA=;
        b=VBmZbS/Y6W/0+N0KWWFYZNKXaR+xzdQbVSZfyJle1VurMu5V7xo0lP7gLsChHw76Id
         R8Ti6iW6K7fNQeLK3Cx4OQAF72Lpgb65myF6GVOqQGVXzHiweEEOhN52+79Jb7jmRrbP
         6jdVQnK1OZlHsB1k6yFhjdPpX/lN1OK2Uwtf0unin5jYPDLjLBVjBmprUNGESf9s/Djr
         OVbOXBYEn9IMoN13xmv2E+bQY7oko1w0XINBNMADdrukyLR6Q0+9UgF+2NrEOrd0o1NV
         FNLv37KfFSx1YexC9R2X91uh1VF3vgpV9lKiEFB705lFyUuRW+XYjdVKEExgwNelrVMw
         Bukg==
X-Forwarded-Encrypted: i=1; AFNElJ++1oAoqJScHG2oV0UV2AiHheXkzBFA6glGKI72V+yOsxCWi0YLGV35wVB0rirHcGzmBkai184HlfDzR1m2@lists.linux.dev
X-Gm-Message-State: AOJu0YxIvaL/xA8hKsMsQm1UoSgU3/aopWzD2qkYBlLRUMDunt0cVurj
	ELDNA5nRDyHT3uh8mM0cvupnrH4x5dKqFET0+H0QYKC/pPC4XOO70UW7kw7G6QiKheI=
X-Gm-Gg: Acq92OFfdWNHdBBsOREI0d+SjyJ21u8gJMHKOUsg4isQ2zbhmFeqIdPIGLJW/8LFRES
	A0rl1CMpYCReBD1Z9A1ig7fuUkTTZzUrs/PGJ8V0Qe698on0ctZNrcY+01hDUpsq+97/EicvMr4
	CyHCpVQnaKYHy6lRsXQA7OOZypZ/g8pSCGmd+H2Y80OZdknFPqx/TUUDsWjJFEapLp3cFzX3Q0F
	hsQIbmObksmNhjaKr7nzqzKFLB/stcqYpCp2pNOVFowGgtP09DSVnWb0NmB6U0nA2kqiHYbsXYD
	HKDOV0/6FxM1eUeBYupTGoqa8FFPnIS4SIq5zXge72kONiKZPM7ObsXOpgLoLCm/19o8Kj5eAAb
	fcMkwOmWv8X7BHPsCRJmZ0bCPsxyt2Ls4uqDCBG5Et71EoSisK1LcIeMgQSGfwoT5AU1hDSwM8y
	GeHh+/ECMGgoyxr0SUg9f0wmlndiFPxuFzLf3UlqqqMCcdHOrKQF0o6cI=
X-Received: by 2002:a05:7022:40e:b0:135:5d4b:2096 with SMTP id a92af1059eb24-1384bb9b8e2mr4465620c88.36.1781461403621;
        Sun, 14 Jun 2026 11:23:23 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b975e55sm8435022c88.13.2026.06.14.11.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 11:23:23 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: simplify update_attrib control flow
Date: Sun, 14 Jun 2026 18:23:07 +0000
Message-Id: <20260614182309.96110-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614182309.96110-1-dennylin0707@gmail.com>
References: <20260614182309.96110-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace goto-based error handling with direct returns and
remove the temporary res variable.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 25 ++++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 6ab91de472b0..7d10caf8cbfe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -664,7 +664,6 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
-	signed int res = _SUCCESS;
 	int ret;
 
 	_rtw_open_pktfile(pkt, &pktfile);
@@ -741,20 +740,15 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		psta = rtw_get_bcmc_stainfo(padapter);
 	} else {
 		psta = rtw_get_stainfo(pstapriv, pattrib->ra);
-		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
-			res = _FAIL;
-			goto exit;
-		} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED)) {
-			res = _FAIL;
-			goto exit;
-		}
+		if (!psta)	/*  if we cannot get psta => drop the pkt */
+			return _FAIL;
+		else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED))
+			return _FAIL;
 	}
 
-	if (!psta) {
+	if (!psta)
 		/*  if we cannot get psta => drop the pkt */
-		res = _FAIL;
-		goto exit;
-	}
+		return _FAIL;
 
 	if (!(psta->state & _FW_LINKED))
 		return _FAIL;
@@ -762,8 +756,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	spin_lock_bh(&psta->lock);
 	if (update_attrib_sec_info(padapter, pattrib, psta) == _FAIL) {
 		spin_unlock_bh(&psta->lock);
-		res = _FAIL;
-		goto exit;
+		return _FAIL;
 	}
 
 	update_attrib_phy_info(padapter, pattrib, psta);
@@ -799,9 +792,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	}
 
 	/* pattrib->priority = 5; force to used VI queue, for testing */
-
-exit:
-	return res;
+	return _SUCCESS;
 }
 
 static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitframe)
-- 
2.34.1

