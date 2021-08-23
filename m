Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60F03FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:02:27 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id k8so25912935wrn.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 05:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KxckDw2JXa4ldQzXueminO2tKvea3/cdZgsuvf9IC8A=;
        b=aat7G1oKvN1HFqRl3dmnKk8bBkoOfsPkk6Km4zotqpZsCvkCKxxmVaApYeKoMgTX9V
         vNvFJupOymowYdrd6iZLaPzrSjJ5/cu8J2q68M7uBi0HgQm96U4e8xqAmPVRb7t16+WN
         jteDT6LW6M/ZdW5qc4+zDkDk2ITGjNvLFdBJx5q4NWS9QZhBkViFLUbV9L0stJhkO1CD
         hGdE72+qjPG7NwHF0fvnbkNCG/hIxnaZHA54m5XJpUDqtKQ8LODxKnq2ofuai8JdYXR4
         koTDjOPezwlqUYLFXE8Yg3ZB2LXgR5HZrzWEQ7iAqygDydV6PcZhi+rEg1Idylkw4ZvY
         evuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KxckDw2JXa4ldQzXueminO2tKvea3/cdZgsuvf9IC8A=;
        b=neVBf33oGERzLBzWc2aicbG1ssxHWoOTZcIjmYlwqXez3qTKkwtowW7pSdtviI4oAG
         ItxtA7GF38UAP3IwRseTtUQe9O6oUK7Du5GNQJMwiQ+k9dT58+J/WJm2YZsyQn4rPyo0
         6tFC59Lkm5Y81TjHaXrEG5hBxqA8qaakTxNXsuatJMoOgXq+Abkyiymw4i39RjKwxGHX
         epiAEaz3htdjX78mPmUUzGiIoEmWQCFv0YuhXX2/GiWdqmQnU4EQPrqAtCn2rXwVgZ7M
         BbiGGeyNv+6/K1zjYzNL191HUZeudOlIKrxt1nNYWUuSsT3BiEEWVktb1xeK8aFo9pwW
         dVjw==
X-Gm-Message-State: AOAM532sUAWnDHoAm0gnx5xs/Ui5tzMlmB3byMILM8FZObx46mtorycY
	3n6l2fNvf/wRk5P6P2G1pCyww4VW7f0=
X-Google-Smtp-Source: ABdhPJwhIv1sa0eZPeWm9ttqpthQs0tDhvklS9rwin04fcsxLWabnd9XRjytnY8vvPnytU3OJQciVg==
X-Received: by 2002:a5d:6b8f:: with SMTP id n15mr13311059wrx.241.1629720146209;
        Mon, 23 Aug 2021 05:02:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id g5sm901332wrq.80.2021.08.23.05.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:02:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/8] staging: r8188eu: use is_multicast_ether_addr in core/rtw_security.c
Date: Mon, 23 Aug 2021 14:01:03 +0200
Message-Id: <20210823120106.9633-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823120106.9633-1-straube.linux@gmail.com>
References: <20210823120106.9633-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use is_multicast_ether_addr instead of custom macro IS_MCAST, all
buffers are properly aligned.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_security.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index b9ab4b20ed8e..5aa893ab46e9 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -538,7 +538,7 @@ u32	rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			stainfo = rtw_get_stainfo(&padapter->stapriv, &pattrib->ra[0]);
 
 		if (stainfo) {
-			if (IS_MCAST(pattrib->ra))
+			if (is_multicast_ether_addr(pattrib->ra))
 				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 			else
 				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
@@ -608,7 +608,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt == _TKIP_) {
 		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
 		if (stainfo) {
-			if (IS_MCAST(prxattrib->ra)) {
+			if (is_multicast_ether_addr(prxattrib->ra)) {
 				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
 					DBG_88E("%s:rx bc/mc packets, but didn't install group key!!!!!!!!!!\n", __func__);
@@ -1188,7 +1188,7 @@ u32	rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			stainfo = rtw_get_stainfo(&padapter->stapriv, &pattrib->ra[0]);
 
 		if (stainfo) {
-			if (IS_MCAST(pattrib->ra))
+			if (is_multicast_ether_addr(pattrib->ra))
 				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 			else
 				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
@@ -1421,7 +1421,7 @@ u32	rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt == _AES_) {
 		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
 		if (stainfo) {
-			if (IS_MCAST(prxattrib->ra)) {
+			if (is_multicast_ether_addr(prxattrib->ra)) {
 				/* in concurrent we should use sw descrypt in group key, so we remove this message */
 				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
-- 
2.32.0

