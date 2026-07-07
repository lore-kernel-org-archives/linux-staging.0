Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE95C3D812C
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423538; cv=none; b=ofqbRtsEfLp48vKGDTL6wGj7SBbX1LaMJzDeHwmD9bD55MYGhMNBZKfj2BCFDR5Inwv3CJHkkke/G67lsN0xx3H031Uann0m1iY1gl0xxvB+gYOfBYg+6CgQWHh7MDZRs95aSyVIsr+QTxa+HerHIHmYwbJYNxoGEmrF+zT/cA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423538; c=relaxed/simple;
	bh=oragdnIPKUqYSptPQWcxL7fDSWqsFmpaKEM1+bZE8aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5ZI+nQonCooJfPL3cElyzu5A5qQ6YqKgGe6MMOglZWemdGlTxtGizOMrzs6Q+a6FO/2zdVrnCbPM7vAsCRpKigEli5UcfkLZaG5s9o1bt43LXesd8YtwpRsXWr5jUbPAwdkGGmMN3+1nVCAwPMaNpHkFy2nYaA6vDuK/MPf6Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okVUr0sN; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okVUr0sN"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2cabe9335f1so9969455ad.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 04:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783423535; x=1784028335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8Jd8VlbWFkQwjU2122/GkhH/Z70hMuIO8M5Yh6Wi/Y=;
        b=okVUr0sNyJBFpvNnqt49WjWLAsf9hE8p0huczlqd9637SXHj8b4Hn5FZts9Ip+M/LA
         Nr396MyskH2M8nexCypzFmtS2R0QxFdyn9JTvzpWYD2cm/0N6k5X2yezQIasjNq2mEix
         kOexI+GbUdFuLgiklTKFLLIY9uyU18gfdTVypHfD4Tdh8Va6VCq52JJ45IeO/O11MCcF
         uUg6XNVSfsQxcWgOJzfEY567LHM8ELZkpDK2OiySo3i7DEK0HSsZTSlUQS+yXtWGNPS/
         6mfginJGDgCCzVeca0WAPGqLEP/fPnZG0zSLwai2KqcDHtzsaZTUVmZP5dXobVdnXtCQ
         qsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423535; x=1784028335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8Jd8VlbWFkQwjU2122/GkhH/Z70hMuIO8M5Yh6Wi/Y=;
        b=s7OrBpahVnEdS68m5p+Dd1+95wsCIE9wZ3DbogeDBIE1v+PTJcyK9hTMnAR73VB2k5
         pP+cpoMXpKrbmO1ZPOwltsjHj8q0WLNlGPzwnFzrqOPl1/XWzXw+AFZQqr+fdf5Z5R6y
         kDS9tjk6xArphtJlzglmSrqFB2aoEtxCPTjCV5LTFWBvkwuNHLQDXy7ez5lRvpqWgupL
         PuKd/mC7B5eGgioMngVAE9o0WJaHzZZ8B2CIh6zMT5hYxky7d5IL4H9rf65FdDtRYDXS
         umlJoOXn9ktZEi6L63I6Ibo+kZBsOARZPgBjGfNZIc2/WWKZCjvoATxJPMofS+SUllp+
         fxmg==
X-Forwarded-Encrypted: i=1; AHgh+RowJgkxggq97nyg2pru08J0/5toa5hLbkM7p9MYzwas8Y4HVbun2edBkQeRu8/K1vMvYuX7e4uX9WFTyRHd@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg7UnmT9Tmn1uf8V0RiZR9ihyIeiwp6AAZ25EOcFJx2Q2mtpqE
	ZP0SVjJv/JwOL2XxLcpdtTLbcGPzsuNmjKI4OzEVKAYGLcj8WQRO96WB
X-Gm-Gg: AfdE7cnYCRhAs7uuejx5PDTmSJQ+8jifdhIzmRm+LR7xQIXqBuP9KdHS5JFcKF+4PTg
	80HxeEQCidhjGamNTljKlfgo8JRWqBHfGePuWI3l+RI/e+GLSNnC4iiulJSMxSR3Y/KyEddoeLW
	KnfQqwvGKBJph3l6XqTYFsmgFNQIeWBwMI+kwzbGRqH0NGahT/j8oAtzE5wdQDOMrZYippwFooG
	uQzDj6QLfl+b5jGmwBKHf+rvLjJLhGzgc8vBjMzIz8zITpVBPB/PA7KnFw5TB5ND/OUX0JS1av2
	TCDUEiwr2WD+0c0D86Edr589kYpnThCUTapwZH/2IGp+b3Sp39Eg/Nz7XERnsWA256Wq4oBy+jl
	jqz8QvYO6PwxTkZS0Ku6Rsm9lUHzqcTpGCY4dl7dI/l2Q2HTHKc3+LIV1vD8BwNBOqjdsJFB6NV
	w8HJFp4Ws1EcNwx7qhrZZ1XbPzkGTAWiSzqE3WK+rsqf+5
X-Received: by 2002:a05:6a20:914d:b0:3bf:bfd0:2a11 with SMTP id adf61e73a8af0-3c08ef7243bmr6324499637.43.1783423534665;
        Tue, 07 Jul 2026 04:25:34 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b65960d88sm6548721c88.6.2026.07.07.04.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:25:34 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	marcosandrade95963@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 2/4] staging: rtl8723bs: simplify update_attrib control flow
Date: Tue,  7 Jul 2026 11:25:01 +0000
Message-ID: <20260707112503.612-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707112503.612-1-dennylin0707@gmail.com>
References: <20260707112503.612-1-dennylin0707@gmail.com>
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
2.43.0

