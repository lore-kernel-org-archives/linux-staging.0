Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE0A3314C5
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087288; cv=none; b=lPzL6WTc6BTQJBwJxRUsjhmv4GGN0PpL/lc7xgvfLEZRjnyAoROd/iewkBTojrG/Mjz/9br07CnZesqy8Fz7DOJ0QwcKmb3+GmOoKyx2GfJfQjLCgn9M+uAp/sKg4tJsHC7Y8p+vbtecOHakzzCoh1G92VP0JQxPJxwiJKudDSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087288; c=relaxed/simple;
	bh=cwU+a4VgRVqvsopMIc5RXqxgi8unKzO4+cDfkH6XEiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMN1B/ZHNYsQ5cMy3scieHPXt7vIB/JGCmyOjpNgjJttwzsWvf2JO/AD3pygz3L9qXoXhLYLV+RgBHiAAJ6nhnBQBgzboRP/7D5r8dLNPk3EDczpWlQ/5JmhQdZSTdmicAhJuHoV4U49YXmB+oHPVuOZe+f/klmfeJJ2WSCzdik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nps+5xNb; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nps+5xNb"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad019bbd4so10928174d50.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 13:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773087287; x=1773692087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlWFwdlCSiXwquzMSu12GvdJpmDejbpiA4JNqpDqt+0=;
        b=nps+5xNb9rAaPZQCu+JFW/ZSdj5oTBq4gAxDE1H5H+UaYr1RigfHmvo5m6D/eLzBbK
         VIVOH7mq+Yf+lRbWeWGGnQAfTUL34eMQTlvNT9truIY2YqeNnOqg4s5MGBHGVW9/Jacf
         eFcmeWe9gx3WWu+G95kdbOr6aucyPITulkPXf/RlV4eL71MiV1udkS6dJy3qA8oe63sD
         N4eI6H8tkjIa001PSnDZCsu8j2X+8Uc/bqkvBoo0TfYAOTxfTlYumQwZzwaxyFYjtcuv
         TbsQRf/salqPhwR9OykAey1Qv2jU7bJ7ejaJUpRR/t3aQrSKlgAprzcLqVf1zuoD9NNe
         Fm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087287; x=1773692087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rlWFwdlCSiXwquzMSu12GvdJpmDejbpiA4JNqpDqt+0=;
        b=bhq47RN1nr4CM/SyRLIVG12cT2w1yScicSvsPkpSGuliQDmAHliFk7dlZsuFfaIMoT
         j4KsAB8Ew9A71xkL5ViRD5V7GB1PvSSzSb74ZFEgFTFi1dacaQFjddrCjik6OGbx2tqD
         uQ7NrG7evSsBBq3n01CSTR/UmZEnR+hbfKFB5CNIqntCOuoMUeci7f2sTkWQp/3uiZuJ
         t/T9y/QBTORUSYw1wMN7jlmIb2suaVm6q+uHR4mR6isZcnZVfa4qqHg4Wm63U8i2p60g
         I8FimqDIw4VASwjL1ckmvfcfGeEidASk/EqgXQlbmFXaWuBRqbYMVjG0arUBogJ3jBC3
         x3lg==
X-Gm-Message-State: AOJu0YyjSjCFkncKHzt/wt32CdxyJaLnsje7AZc5MoqbKvHq2WefKDAJ
	QrUVUhd/GfkGpqmplL9eeaNIoPYPnfvtfFnG/+zEAXcX+RJJpjOfQQvu
X-Gm-Gg: ATEYQzwhRYZrlbJu4XfY81svRNMqujFBBZz+1Vbhu7qmq3tf1PL+km/Z+lgmLeRhaV/
	jEb5VsBwdAf0/CLOmNv50rtoHkgp562th9kqco7C29AbRvdGT8p9v6tY1/2GtWAkOg/09T5k5cL
	DJMVxnu4n6MzJLFQ58G7aj7xyzwzOafQ1H7Ynb+vItJ5yeFZLM/QLw7+gezni8bP6ZzPVuejmQz
	Wz3sp3VUKQyHUotzvS8qMJXBioqCrEJM8AxQwGXfP0+KONwSiFBymGr63LVNn31EKH9/+/7N2MF
	MhZQeo3ZDDilz1LCPLTAXQo4KZi5XCfB0CypOoE5A4ekgDhKtYYC9LMpyFTZMh+kxaKbjpLcLA3
	mL1nHHAwwPXkBgyf7OwNWgxRVJub2boJX09vCyCa/05uesWUBm90tn1uYT4dyhWGkNqJZjuCfSg
	AaAAXu0TUaknRPlc8NuaVz0du3
X-Received: by 2002:a05:690e:1409:b0:649:b943:2caa with SMTP id 956f58d0204a3-64d142c72f7mr12207833d50.59.1773087286630;
        Mon, 09 Mar 2026 13:14:46 -0700 (PDT)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175e8300sm5182999d50.7.2026.03.09.13.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:14:46 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 2/4] staging: rtl8723bs: replace rtw_is_same_ibss() return type to bool
Date: Mon,  9 Mar 2026 23:12:19 +0300
Message-ID: <20260309201257.16984-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309201257.16984-1-nikolayof23@gmail.com>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
 <20260309201257.16984-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_is_same_ibss() returns a 'bool' value, but has an 'int
type. Replace 'int' -> 'bool' types to make it more accrurate.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 11 ++++-------
 drivers/staging/rtl8723bs/include/rtw_mlme.h |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f6ee2a2e595f..244dacbdffaa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -326,21 +326,18 @@ struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 	return pnetwork;
 }
 
-int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
+bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 {
-	int ret = true;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
 		    (pnetwork->network.privacy == 0))
-		ret = false;
+		return false;
 	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
-		ret = false;
-	else
-		ret = true;
+		return false;
 
-	return ret;
+	return true;
 }
 
 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 96a402328398..9ead083e6b95 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -379,7 +379,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitframe);
 void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len);
 
-int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork);
+bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork);
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature);
 
 #define rtw_roam_flags(adapter) ((adapter)->mlmepriv.roam_flags)
-- 
2.53.0

