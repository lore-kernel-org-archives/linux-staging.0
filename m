Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE33E349CDE
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567043; cv=none; b=D74VUvsMol+ljK95NYG71gsz9FZib9S14aJgUU5e3qMkgDQpUlhjoLpC1hA5irY7IAhKhLLOTJXzCeRKmkaF0d0MQ7OZo4iXUef89MA3o95cC8VONp7lDMnf6TkAG5YCmFLx++8nXXgW6kb1U9d07SMagMOYLpdKozu9BETvPj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567043; c=relaxed/simple;
	bh=ZdPlkL2fyLTXzJe6AczWhp6+4Uqn+Byg/9vH9FfYgIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JxJjPywGGn2uuit53PPxqWL1wzcmroftFwkSIO5PtPHmZphqm7L0Z6P6WLJfUFSPVz9Ibnmn9SqDu4qlj5Yt6Ry7EqFziioPEn3HLBT2G4mMoDOLdkty6C4s+ETO4zm7kM153gS2LvTk0FE/ap0dgs64/p3D5B+ckpIENuy4llA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od81VjSf; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od81VjSf"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4207598eec.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 16:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781567041; x=1782171841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x//OojVdvKsF1B5rqWRkEUus6sx/pFFpIK+ZoZjUJyQ=;
        b=Od81VjSf7Mu9rLs5+s4pqUpIFfS5QLqVoVMCRV+amprKZjA7zz5bY8lUnnjQ7hxHpk
         PL6OdB+tp6X6EimTq6flCNhLO0GxtZQeswiNSxOkZs6IitfV3KujFKUlmQ17pR9gFeXd
         jL1qMYjX7QOqG3FGolcZh0aAlMOr3Zwu+MSR5dv25XoGdMXpNT25ej3bfkgSftX0UQhU
         JN7MtpAFC+5AY0KYjWPSi/bZjFy1DGcnDkDXZcc8fZwuXb/pJNVQaWY4qmMwrOQJFohe
         L+j9U+W/OaDQnxd7v05Og26mQ3iQKASaeY5KF5YJj99A/JJCiG1aoNOQifXhPx6bPFun
         vItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567041; x=1782171841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x//OojVdvKsF1B5rqWRkEUus6sx/pFFpIK+ZoZjUJyQ=;
        b=j9Wt8VyMQYCBCzlV9RUwl9lBVLNictTIJElfF5InOCsBTcRnW3FxKOONmRLpKwgLOL
         406eIuaxBSAlk+TTlZd7qBXObIBr3rV1ILI4KD+Zl/0xsqcNiiLVVcsJ2VIBK/HVGXA6
         +l/MhRa+2rPlEDna0n2zwI9KPkFTQlg/gj9ECCCAoeLtGlbcdelXbP3MnF5ekiglGvZi
         M7uq8hAIv0veON5ApOUdaNifTRGknX25ZWAbPxm5SjnsYZcF/ovFQ571oXOYlr2ZZbYD
         3v7/UZIJJcwAU8eWT+x3JuQ3S7wZvYe8t6X7yzhvw0bNS9G4WjN8JDbql8n6nWv4of55
         JIlg==
X-Forwarded-Encrypted: i=1; AFNElJ+TGzIIBKLYm/uOB/anliU7CI4Egw8C13qVw5Jdzdpk8N7k4oKYOHuO48B+BIGUzV/2PGAgctFxwgDXVVjQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzMkdChkv73IBo4Z5Q3LTfl+9siWin0y2sAHO/JHYoR+HtHW/va
	c+4Nb0uX8NJ1bU92FHVU6SP5RMtYKWfRmhYtEIyM+MNRH04zMqes8mII
X-Gm-Gg: Acq92OF9kC6RBdeTw+feV4XGiQillcogeiLOWvQrn9p6bXCx3WL6nfBLsmmISWajL0s
	L7srhCHpykVVTiifFI7QDj/EMIaXqJDIErYN84aQRy3iQ7a5LPp07auuFBZL9AbhM0xJpayJ5yp
	jScFwcUz8kPvAC3la5sSPan86lrpKEhmhPHE/J3zeYmwy92hT2hr76w3UTnj88iHGG2itfdB5/Z
	kH1C8Gw6QIn2Agc4PYrPKMxMcu4wNRWX7zFr+8Dw6fasTshtdbQXaYoue1iLX0gl2JqXImFP+oy
	AXTbvB2TNwZjsecklgOGHUH6sEmwkY9pIYJPnqTC2vc5nm2QEvdtbOIckpgt41IEYPRGnFW2xZu
	mqDnIjMJjzwUWJkHban+DIQIYrcfbD/8K++mdzpuB52sh6CMh9HLuGeNlkZB2sSzS8cAIOPsj/j
	ED7MBlwkBRkkfN2uYu05NRCZiXn5Iv3xP8cVj/wsKqVAIBa3hyWd7T88uz+1Bye+rUGA==
X-Received: by 2002:a05:693c:23c9:b0:307:393a:8f1d with SMTP id 5a478bee46e88-30936767158mr7390933eec.14.1781567040847;
        Mon, 15 Jun 2026 16:44:00 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e92096esm16988335eec.15.2026.06.15.16.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:44:00 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 2/4] staging: rtl8723bs: simplify update_attrib control flow
Date: Mon, 15 Jun 2026 23:43:38 +0000
Message-Id: <20260615234340.97299-3-dennylin0707@gmail.com>
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

Replace goto-based error handling with direct returns and
remove the temporary res variable.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 6ab91de472b0..69b6d3a2554a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -664,7 +664,6 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
-	signed int res = _SUCCESS;
 	int ret;
 
 	_rtw_open_pktfile(pkt, &pktfile);
@@ -741,19 +740,15 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
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
 
 	if (!psta) {
 		/*  if we cannot get psta => drop the pkt */
-		res = _FAIL;
-		goto exit;
+		return _FAIL;
 	}
 
 	if (!(psta->state & _FW_LINKED))
@@ -762,8 +757,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	spin_lock_bh(&psta->lock);
 	if (update_attrib_sec_info(padapter, pattrib, psta) == _FAIL) {
 		spin_unlock_bh(&psta->lock);
-		res = _FAIL;
-		goto exit;
+		return _FAIL;
 	}
 
 	update_attrib_phy_info(padapter, pattrib, psta);
@@ -799,9 +793,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
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

