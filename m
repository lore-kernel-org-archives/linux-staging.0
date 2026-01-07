Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA093254A9
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779271; cv=none; b=hKX8DuEGZxZnLKUK0c5uHao/2A8+jO65qMd0ikYJ0PFuINoR3uiKCP1vkv+9/dbctAujAQ4gaKHET7vdrZjxF9DEM+CCXgexi9PmqYzfE8c/iCACE7CsJ91vxGjbc9c14aL5xQIyyBVA6daZqoXGXIV0qqzi0S+83l+wFM7Z9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779271; c=relaxed/simple;
	bh=18+QUqCvlJscTQnkn5gMK30nVEEEfSeMF7NdykjrvOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSNGMudlZca62G5DycSVTUb4JyfjM19QOhQ8Kb0upyUd7ncCtjwdsx4okdT383VUeONEZtjqeyIjIKcbUd2xvmXFnhpsurYiZvyAJkOm6/6pdOMuCS4NhtbWFqF5HiAez4YI+UOiJ4Z/IBqXeJhMP55Ss48Izys3+BUlPDbVc8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xtl554K8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xtl554K8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so10516385e9.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 01:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767779268; x=1768384068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EIdnk85uRd+b7kAIsmpKRxoysfQFgjpX4iJZ9B6LB0=;
        b=Xtl554K8d1VquCEe4tKdmBBqvnOi/dG3Pr7K81u/oVNpMI4h99CBzqqVRm65rPy81d
         ZbZKuvQMfEHLzbS1tfmTbQXOlxIxUnTSqC5Yg6o0IV7z3SDslL6Na8/P9eRuxESS1Ni1
         04r+1eThYZdWk8Y2L0lgqMzMqmp91gGkt9G+FJfJXiIvLzoTMwK/Mog/NyL7TTIDC5BQ
         ewFiJG4q2rJ0JjvOWgp3lRsZVERkQg4cJF7aZnHTwoB9Dh1eEuNh/8U1BCR4OH/c1ehM
         VBiojiogb7qf5jFkOUAreJTQMpHM9Ex4xsflwJDONGbOtlK4ebjvfGLWqjrWV9pd7lJz
         8uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779268; x=1768384068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EIdnk85uRd+b7kAIsmpKRxoysfQFgjpX4iJZ9B6LB0=;
        b=TKuaPGNd6IINSKGo8fqqL/+pO/AgN0E7oZqiPZ4fPW2wW9oKPS9vVWXcmlq1F1nEHv
         pcsjuR8BnTLuUVKY7I/kqekhN00Dyt26yZdMeAOPGoXKuxFMxLbEkPwM4qLZm8IhkAf5
         geKXDNHeBfRD3ZqDPI5rombaIPNi5PeAj4cyfWj6oBLjmF3lHZZOgDF4hZodgpTgVB4Y
         6qXwpNm9s9SjDKX2zSuR+dtak9lRAUguF+nDyEce43yarIZGxqPgfnEzb6jWHSbsUiqt
         ITqFZvfmlx/s/U1ZfJhLWp/z41kksNhqMW8bTb6wsMH8y/vYEUYIi3V0Ys/BuQqOWl2l
         i/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVoOhxxITR8LhiSqQ13ZwXdv9ADBdFa/iF7WoUltEwDuXwMrNYfVYB7VkrHrHzuqU0BlZPP9/nSw9A3PEAb@lists.linux.dev
X-Gm-Message-State: AOJu0YzI1JZho/HPag/3CmlBO+YiKf4aCAKJ0yFzYd2T2fP4TDEJ1RQu
	uYp3FlSBSefDZpFF5EX1aUOEp6ZGFrjKFSqttnVu6lSgC5rqluNyLOUw
X-Gm-Gg: AY/fxX4B+a3sbIVwszSaGWQ9Tr3V8ne2/ZGUpnjACCQzvj/mSWPjNJQE3FPN51gyPZN
	LdUIMJGAjKi3UoH+nYkH1D5dXO0nvjEHDi/0rn9MBeSTDD71O8MSOICdWRW3Cf0WZzgj8vY9aQ+
	Drc1hBhSBscDb6FCUuZ9kVyknUNjidC0vJuJxBNxranqOwxEg4bKIYA6TkeuaBZc3mKD5ceFBmr
	m4+ndLcpU29rrabpnL0D9l5LvDAbcIDkTvKc9M4IncaQWMrInZLEiIKS+iCzJgsRSam8QVL86yy
	SrEBSWGNOWU2lylN7Ncn07Bcm3ogXCWMjI/un665Ee0UsrVMfA3kNe3dfExaZ+qb5N+moWAHF1k
	jAOkLXS0MSJJL16Z7znuFvT/fohShSNT1OPjKW5MYGzPbmiCAMN+ncBcYDCD7gAPibdXscEBR9Q
	RLpfbCTYv2eMuG8/0Zsp5vUlF7fb5LtYBhRykqJj6WMPFnPlsVVCqNddU0/CuwBHvwpsH1BtNFX
	8eXOJRwwBOMeCWoc9iBYuoIEvs=
X-Google-Smtp-Source: AGHT+IGHPuibPlJxce/9LTU/PAqmI7i3ikEEBj6Fszu9bmdu6Z+KPfTEwz06ZCNEW9ZX7UwUV2l8bg==
X-Received: by 2002:a05:600c:620c:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47d84b3be47mr20755755e9.32.1767779268211;
        Wed, 07 Jan 2026 01:47:48 -0800 (PST)
Received: from fedora.homenet.telecomitalia.it (host-95-244-124-236.retail.telecomitalia.it. [95.244.124.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871a10f7sm7423715e9.18.2026.01.07.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:47:47 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove unnecessary parentheses and true comparisons
Date: Wed,  7 Jan 2026 10:47:14 +0100
Message-ID: <20260107094714.300380-4-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107094714.300380-1-lorenzosimonelli02@gmail.com>
References: <20260107094714.300380-1-lorenzosimonelli02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up unnecessary double parentheses and explicit comparisons to
true in rtw_mlme.c. This improves readability and adheres to the
Linux kernel coding style

Signed-off-by: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ff4e668f1..d9e6778e1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -468,11 +468,11 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		&pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network,
 		&pmlmepriv->cur_network.network);
-
-	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) &&
+	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+				      pmlmepriv->cur_network.network.ie_length);
 	}
 }
 
@@ -710,7 +710,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
@@ -1386,8 +1386,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
-- 
2.52.0

