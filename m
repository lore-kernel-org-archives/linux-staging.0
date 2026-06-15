Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B2934D4DE
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 23:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567044; cv=none; b=TsVHutWbimceMYqX2341cXF6Q8LTQJhNvN3ZQcQY3NmfetzCwrSPEjOpUw0zrrPta6wUD/pQR7NZbkmgN9gYAaXI9aTwHSPEzRQF9u1tJxnpeDIjTR5o2bM8kPwn8wkrEUJ1gEtFOce/X77E2U1eAquR/AT0YEGVLpUM8o2EnL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567044; c=relaxed/simple;
	bh=lpCGztzB0M+oV02K6JezYWz2x0x5KRqyFcOocnIlTgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PjhuN+hQ+qbQ7UPwm+cbPN8UJ1qrHDXmO2s50SclftJ1+9Rj/BrbSuESx7puQRPhhlRZGh0PRd8Pyegrt+1MGaMzDBEAxbIkBFN9vwIOCe10tNSx+Du3l9bjNXZUSg/qQYWLR2AgUbsAgGlcGgbheB5u+IbgiNcP902JdckED4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIVL12i8; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIVL12i8"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-30759632453so5762522eec.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 16:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781567042; x=1782171842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4SHLN/exFnBg1lCGc0xPmy1xjyK1non5IlHXkrwXcY=;
        b=jIVL12i8YuktjqCOM49ysrItwy0Ck1hfeqaxHL5yVRfWyH/tUyFxvu8KGEChemOG0V
         DReacI4BXphJYNNi6C7jGUebm6kMe38J3oF4E76pnlos9kKCn7gd69cn/g5+O3uAfwtS
         eHTDcYl6qaaUfhBwUkcsNWrt3NNVoQpql/73wkESlRqy0lRQvvyGURf6TjuXkhFjMiKI
         ClXMk+T+Gr4APs52q5oR7FoUI08RWPlQF9m4mezLrFI88190IcxaFb7sBbynej8qQ8Hj
         FEQwTDGDTvQNSczOmegK1iZjRfJPUA2N2gwoOwoadBdNiVxkUf10CeGW2k13w7k+W3AO
         LjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567042; x=1782171842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4SHLN/exFnBg1lCGc0xPmy1xjyK1non5IlHXkrwXcY=;
        b=rjWkI3qIBcddsWNdv+3PC2QctIMKwctnLVoOEAEVWCqPiYfhUvDMASHQ3pop4CoxjG
         4AtaQyy0zu4fVec6rGRLxiFiFx/aEBV9IOCHafM8SBrjuC7D/1dmAT6+24VvJBPiD3sR
         jLeCriQASmL52o3d3pzbfdaoJNlXZRtQ5JHHwPBQtxsQTbCXZEdGTs7CuKidu8h2LNna
         Y2aWJFRXGerP/zUZx4mcEUwt1uivCggFb4jbmV+zrzQzS2x5ubbQM2hp3Z4ugYcpQ8la
         hOioKdPqK0lZZemZVNbrNrcqCtJS7O8Bq94c7bnWrnhkeJDfvi3Z6M9zHnuWuc5e0Uau
         SoRA==
X-Forwarded-Encrypted: i=1; AFNElJ8QVg6oO+p2U7w7l4VwcVQ6xxTmtEdXrhWxYEKTAsfqSpRpT1wAehdnEnrr8Yf3zIdeXvY90elfGoYBWiDY@lists.linux.dev
X-Gm-Message-State: AOJu0YyP9kGk0fmQEFGpjNOiSMBzsjtZnJtfGJEAdtvOTQc4NjxPZ5dM
	sp7xASYEpsLTmLYskTnuJCGz8xm45vJ+4Xxpobyn5XTNYPMmBLplisfd
X-Gm-Gg: Acq92OGk+yppCmjFygRJfFIt6djiNSMz4AtEBEO39P9t8pgJYGst8XdPafBn56o032o
	GK1AyQP7vPp8Z2vym5KsengoxlLfZKUeDMVwOJAgNE6KphaECI9JVV8ixGNym7vdOqS4oS2veMU
	fuO8ydO5vnB1oHjzQ1EcGneY3ygJk29K56pvCHzWTttth+HY8KlMI17plgHrDCMuzeydyOMTwUn
	zA0teMjTKkh9DXW+z7R9No0gseJ66tpXWBbVfb1kJlKltsMMBZilScEEewQIR9RJYk/o45S4I25
	CsDNnF75kAiaya42tD9fLnCtfRmPLVsV7XRDJg9uNsM0bRcVpDh9ayy6yPEBiGP4oIt0O6eJDSt
	fOHhjRw/Uym5qKyV4u4GWT6ajnEFbMpBr2RnM9e4lP+bg6cuwxZWbX5yjHkAAzXhS9ad3MHKo/n
	wku1uCP7ZHpDmn83hDTGg/ZkLwkNnZJi/KrxpFh1jaWMkfBL69dPBQVDuYXBHO0h45RQ==
X-Received: by 2002:a05:7300:6417:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-3081ff64166mr10133350eec.3.1781567042346;
        Mon, 15 Jun 2026 16:44:02 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e92096esm16988335eec.15.2026.06.15.16.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:44:02 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 4/4] staging: rtl8723bs: convert update_attrib to return errno
Date: Mon, 15 Jun 2026 23:43:40 +0000
Message-Id: <20260615234340.97299-5-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615234340.97299-1-dennylin0707@gmail.com>
References: <20260615234340.97299-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert update_attrib() to return 0 on success and a
negative errno on failure. Update rtw_xmit() to handle
the returned error code.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 0fd2415e7bb7..4d886a35f4c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -654,7 +654,7 @@ static int set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 	return 0;
 }
 
-static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct pkt_attrib *pattrib)
+static int update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct pkt_attrib *pattrib)
 {
 	struct pkt_file pktfile;
 	struct sta_info *psta = NULL;
@@ -741,23 +741,24 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	} else {
 		psta = rtw_get_stainfo(pstapriv, pattrib->ra);
 		if (!psta)	/*  if we cannot get psta => drop the pkt */
-			return _FAIL;
+			return -EINVAL;
 		else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED))
-			return _FAIL;
+			return -EINVAL;
 	}
 
 	if (!psta) {
 		/*  if we cannot get psta => drop the pkt */
-		return _FAIL;
+		return -EINVAL;
 	}
 
 	if (!(psta->state & _FW_LINKED))
-		return _FAIL;
+		return -EINVAL;
 
 	spin_lock_bh(&psta->lock);
-	if (update_attrib_sec_info(padapter, pattrib, psta) == _FAIL) {
+	ret = update_attrib_sec_info(padapter, pattrib, psta);
+	if (ret) {
 		spin_unlock_bh(&psta->lock);
-		return _FAIL;
+		return ret;
 	}
 
 	update_attrib_phy_info(padapter, pattrib, psta);
@@ -793,7 +794,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	}
 
 	/* pattrib->priority = 5; force to used VI queue, for testing */
-	return _SUCCESS;
+	return 0;
 }
 
 static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitframe)
@@ -1954,7 +1955,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_frame *pxmitframe = NULL;
 
-	s32 res;
+	int ret;
 
 	if (start == 0)
 		start = jiffies;
@@ -1967,9 +1968,8 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	if (!pxmitframe)
 		return -1;
 
-	res = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
-
-	if (res != _SUCCESS) {
+	ret = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
+	if (ret) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 		return -1;
 	}
-- 
2.34.1

