Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1F2C0F90
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 22:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768171749; cv=none; b=QYJ9VjXIlEOCMBPxAmXLZNFvx3hggvqqXezm6jWeGKRlvW3gEBMXiw+rl1em922/+9mbniVbqVFnZ2EnzMybo+f3Lekqa/4D9Wmpd6FwvTEQHOyjIbLrUdgUBnIOUFPAwQT8bOhNO89Sd2L6z+u4cP+RlQFGyZbmJoyZQJC2yBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768171749; c=relaxed/simple;
	bh=TgaxDYXDe1wLlmXq/qRsJsmxFFexwnYoeipf4tS7IhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbVBpucY/7JqP/JvAFggl7ZMvCmK26wv0OVXrzMjhWEVMS4hjJNujyDsI1PCJWUZWgzg7Dlte/O8bTunTai5k/K+AxspSkaCtQMDVfBPsNxHDF18h7pOnUEREbHskIQBz22Z8PtApbSCBFAMzBRfcHaHeoDSCwkCVDDmqQW0JMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ezl7ziCc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ezl7ziCc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47796a837c7so40375305e9.0
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 14:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768171746; x=1768776546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jow6nPgiScr68hh1D7QfZQhQHuBe1lnBb3jBitQZU/U=;
        b=Ezl7ziCcHwfzcPcktVbC/bAh/IBQHHqIQMqhja/AGG/v7xhztESDhAlFjvPduCxPW9
         yWUGWGNdMAXcyY8TgtVgr2hhM0toRJVL8Ouivlzk/xwi+FqKIAIrfeWqMNLGsjq2h3n4
         sTM/Iq++PTAXRUJWwhEsh2A012jlsW7IRd45G+kL+4XlFVnyWV/FGk08YKMb7HgHNdZx
         XTq4OtIAzZFOVk6QE+hQf04dl98979+WI6pOXNpeL9EKqr2jhhfBk0Q1ldDYn0JX8Q/j
         SBXww6/dFyQiHa+2ZfL/Mrp0CXuzekx8vsZop2l/RFVL5OolwLhAqv1LIR9iGOXKAa8X
         wdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768171746; x=1768776546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jow6nPgiScr68hh1D7QfZQhQHuBe1lnBb3jBitQZU/U=;
        b=ojjfNZwTDygb1NkSz/37xDMJpJwxZVQN1Y573dpE/w9hRrey/xEouBj/x9CvIxjvHY
         aLNBPPpYO9DNuGD0AUbz/Ub7sqQIVAY85ziNT7p5HpzsjjwijhN5yOu8OGUKC4BwCmZm
         liKjeXFIThVwQRQO9+FokyQvKKk9VnrQas3K/J7Ujze3XcczfX8hsfDtX8HNS46snbro
         cD/98V+oN2Qe9vJFtSxk6wdbYDwzapdaKij+TXQhymyc36zWaAcu+fOFfxe7qJcyvdLg
         AY4bove/GNZZwM01aXf2RzLvj4zBY0m6zqcQg2Q2RGrhBc1fWjnTsgN3FRSh5hZC8074
         U2nQ==
X-Gm-Message-State: AOJu0Yx4uwt5sDtJMbHuC7dRXRruAgnjCYncrLOrIF6c2M4Dg/slZc3M
	sp6Kn9TJ4tq4VfqVFPsFMViAgalpsJyo+4RJ2fpZRq+RwjlGc/uasagm
X-Gm-Gg: AY/fxX6g7ALGLen3eNN/TD3QI0WN2FHqdgZVNmx5RcssHu6tMMpowA8lPB/q5LUm0ZG
	EWcdNDUfamzNRnW8eXrL4fz3f0DmU0u+TnuBxle3NkUj9DAtVkrERqa7GBZpxxciPRGilmHm6Te
	eEQclKipmvg+o4n55r41hhYWonbopBbvHVO4pSz+sHXh+SwAvPB9b80EArjUAsYwpp1xVA1sCd2
	mM9dkVKobf0QtH7ElvmGQpT7dPczIWQEOMiOb8ZbLlGbpcIUaCz4HQIeVNKzHyMUoj9cyD+vW0z
	S8qwPzev06DRwwfYEa8CT4ItwUlB4e10fMl/Pm9Tuc3W/4mczmVTDw1SykJvhWlQWvpwVOhB06e
	FmHrgSY8GxuwxNmiWLLaYBKDwjpclDFMDQ2D7mTPYlph/tanBULNuBPAm9jMzphTWh0xhktpKXH
	I7/xZtA+rlThQxKJ9/zhQXp+Rof/OXLo0rGiLe0cH7DwF1AMxnRqiQOFtMe/aUjjc=
X-Google-Smtp-Source: AGHT+IFsXxkvSeT38cWh6e6JADFfmYbDvDeg672RxhjW6tSI2oJqcUd6+AR9sJh1CHkus+9C286uGA==
X-Received: by 2002:a05:600c:1385:b0:47d:4fbe:e6d2 with SMTP id 5b1f17b1804b1-47d84b2cd6dmr184064875e9.12.1768171746139;
        Sun, 11 Jan 2026 14:49:06 -0800 (PST)
Received: from fedora (host-82-54-122-237.retail.telecomitalia.it. [82.54.122.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6953fasm316075625e9.5.2026.01.11.14.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 14:49:05 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH v2 1/1] staging: rtl8723bs: style cleanups in rtw_mlme.c
Date: Mon, 12 Jan 2026 00:43:42 +0100
Message-ID: <20260111234342.290733-2-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111234342.290733-1-lorenzosimonelli02@gmail.com>
References: <20260111234342.290733-1-lorenzosimonelli02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179a..d9e6778e1 100644
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
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.52.0

