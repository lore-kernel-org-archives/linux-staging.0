Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA000BA3F
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768138271; cv=none; b=t3IKMCitnpvtow/auSyJNpljjXp6BiRBDW4Vgb8tq6VSvGflknZxaDhQIwiXUtOEy2z/v0f+MaF+7ecGTaKoFN1LhvkGxJD5ApPqHP55loo/TZDDzx3bBhmEnmFb39rutg6cJSk0+zf9TUDyMbYNumNk7j2AU2PDEsY5NYQwERk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768138271; c=relaxed/simple;
	bh=TgaxDYXDe1wLlmXq/qRsJsmxFFexwnYoeipf4tS7IhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIcXDQmbRG5MQWTCCVUd2MQ5fTY3Fz00gWIoVg7GyTteDlmzpZmYQBJtIFzOy4iPDesBM7StI/+ab/STa38wy/ZyUjJJA5Shq1YfC0hnHC/xdEM50b/9hZ3uvQVOIfga3VMnHlX/yJMbWs5AR7Z+FXYI68w9VvWOopZPbBBpxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEc1vGtP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEc1vGtP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4567044f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 05:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768138268; x=1768743068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jow6nPgiScr68hh1D7QfZQhQHuBe1lnBb3jBitQZU/U=;
        b=LEc1vGtPmf+EGOLYaDtQMWWmX8sk8s9hVAtYz78dGtY0mtrZ7/9MHIc/jN5kVkRNbp
         Gc6iUB1xalagLJYgraOeIzqrXxvJy0zyJ+YYrPbAvaYV1n3AMecYHHUXjL9JqhFwDk73
         HESgDbdc0FUHGNlV9FXM7D4sdr6+/K1gY72cnuCTA60Jbfp/RLzqNEORCyqXz9o8DRav
         YxJLcU2TGiKQ55D91qbdbmfdoOATqIdmQFRXc5q/X+qHGIYyP0EN7RRmEW3PEZl/0axm
         Bzju0PnW3vHv6eoSWVSk6dQfDD+pNjQFHJVelyJyjFSHvK7Lg7n9GcWtP9qG0wdKCrhx
         zfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768138268; x=1768743068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jow6nPgiScr68hh1D7QfZQhQHuBe1lnBb3jBitQZU/U=;
        b=gk5iN9Zzx3Urb32CA7vlD3UyX2CFUSl3Go+od/BhQagkEDEpu+up1PLvLGcgfgP2es
         x9Xbh1frJBQaHZmLBIfrFl/U+gxoa6epPQrjzhQE4WUXDBYRwvk3VjSggGAr9Z/UPSmD
         zJSmLeZcqqvp2ywzcWHG9Z7Rjbd04cHKj+KlAwXo3631zQVk6cgAFuH6iL6P5OUh4ctf
         2qkoImMz4AY188oOLN39oZ7i9catV16mifsvSqXeBpbTcXij02ioJVfDvg8/UaGnifEz
         rxfPbveMTfBOxs29B6+TSeMigmTcGBUJ9GfRASx0+ah92lX4JwtvIlIaVQipnyfjgJfJ
         vQxg==
X-Gm-Message-State: AOJu0YzVg1Ofoi6Vbz7COTpXapbqFXrxJIKLYVk8E22WWt1VOQwpc/FZ
	i3Mco0idM6jQKk27dQkY1Vkx4KwZjScLFhJhkIycns9496/E8uY1mW+8
X-Gm-Gg: AY/fxX5ppp6UqyxTuw9gKYGRfR4mrjS4qUYDT0KUSLsPCdfvsuFHaENlzV7eIqWDsOp
	rQDaTHuKFnUzRHupSXm0M6H4WeekrbvGu9l9ag52RmVGAWrIvke+RVOyOrcmssbKh4wJiylSYWZ
	tsDVYabGZQtz9gKRnuoty83VE4N5FbU7nQl7BZjtYS5r1kwP8+QqGMMUMziduTerGsCSH5UPbVd
	acxzjdJEsVPIRyslJUUvWM+HKz8Muzc4/LY4uZp5e4bhjVREbB4LDLEB7z5oPGZWlPclExIQ524
	izABX+9k5PKAVQajCjTg0iPu2S8A/YSo7xIXrWwbTvN1v2suUYhJi7CxTRHtLIjQks9CMnC7INl
	hhJj2Yct6In+Njub06R+WUsppxmHAseVx0zJDKqNOglv+JngHZYmMl45uiz2ZDq3oqlUcOgPBuw
	fYT8xMwU2xTLyXihaSKy1Ut2EtQXD8oWzTcWcR5c2kPndrBiLK1uOW5VTq5lZVBKU=
X-Google-Smtp-Source: AGHT+IGJKuVi1SC8CAxLBMGZqaTdHPI9sUROC9oNgjWbLxUy7d450f2riCX8GMmSHFFAh8WNC6sVXA==
X-Received: by 2002:a05:6000:1861:b0:430:f6bc:2f8a with SMTP id ffacd0b85a97d-432c37d2f87mr17817701f8f.47.1768138267966;
        Sun, 11 Jan 2026 05:31:07 -0800 (PST)
Received: from fedora (host-82-54-122-237.retail.telecomitalia.it. [82.54.122.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa78sm33379635f8f.6.2026.01.11.05.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 05:31:07 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH v2 1/1] staging: rtl8723bs: style cleanups in rtw_mlme.c
Date: Sun, 11 Jan 2026 15:29:17 +0100
Message-ID: <20260111142917.166565-2-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111142917.166565-1-lorenzosimonelli02@gmail.com>
References: <20260111142917.166565-1-lorenzosimonelli02@gmail.com>
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

