Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50941A507
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494641; cv=none; b=dhw3SErq+gBgsVwV6VwimMEdJyYh0eklj0DTZcC7LuoDkyNDtnyavTUFGClvFlctkOuG5JEsZuvNquPFCKtGZmq+OHbwMvph1+naXLyA43H3WKq8YAAWE5orEFPe6jKQpXOYm6w+J2CpUADsbiWYkoR4iz2mD80UaltBo8ckkZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494641; c=relaxed/simple;
	bh=Z+zgxtmIQndficnjRwz1PVF+bTlc7EWti7Zn0qC/GJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdmG8s6NuSrx9d5jU/zEzCHCo+OmcxsU5/86BS4yoYunSz7KICuP0j7dnVcGa6RaoZIczadiukEAi+ExtOouxn94bUUH+SDIUwgcqqKPWtYNku7pCyVQ5TIltezEt0KHVkJOqm/fFPfas3LBK5k2gOfJuNaLBz+xjtSFIy+XMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJq3q3sE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJq3q3sE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47db714766aso1128999f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494622; x=1786099422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQg1Q5CjP6rI4wR1ohgm86WL+dcEyP9rVnOpPx/M1TQ=;
        b=eJq3q3sEF7FkLYZeLBMizugdAFynY3fAiwleCUSif7cJGDxD+BGt7fdF15YkQqZSdZ
         I8vcPoQE/52xGL40drwYsLuA0NC7los8EZcC26PMzqzvDoEuoECOQomydUkr/0DJQHF5
         4kzHru4UDKVD/92hH4VZ2nIC1wwec8VAifVP/fktLTM5lWGUMoTTZqL5Lgw9qLoHU71j
         3RZSQvhKn5VJMs0AqXrjIMS4knOFI8B6M7nSeAlIq6h6tLcbCnfXTYvvvQ2l1bCcZQi2
         VR4sq76AhG5QZ/YLF50QWP3kFqaCltUcjOOjA+i2xtyESXyCluy3fxYynk3/35BNJj2u
         mCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494622; x=1786099422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQg1Q5CjP6rI4wR1ohgm86WL+dcEyP9rVnOpPx/M1TQ=;
        b=UP0dyyUI7s1ZJD/anYqngz4t1f0evM4RKvMq2uNmmijyNcmQauXeeB69Yc7TSb1DtL
         ra4GUqAf0OXyddlgwQvMP1GdrylIY/lyB4pV3UAxb7+AKFGYttFpxf6ucd+/52Dr16jC
         RQ/j7TyZSJFBpccHCw0WjYH+a7p18nTc/Zqu/kOYU3xUVwemzGgALTIDvSZNNxN7ZlXE
         3JJJI+eYg4uvAKou1jfobVRuIrEY+C4I4PFSRIELQK5LobqS1I5RJDDbJjRcODzeyrcA
         q9QlZLohSCj00SX+FvSXKRBa0ud7eviIzvOuWvufmtu0bIGisTs+bvtK1nxiuU8FIFf5
         kWgA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7W2GqAeXaenwSLyThn7J2rKDAeQkvb1dZs/ILQ+beFBEK54R0fRutS8pAV85+AW/alENS/xPDUyft+446@lists.linux.dev
X-Gm-Message-State: AOJu0YyA9xDPNebXq5tQ4ZHLBK+VLu4IdtikDzLQIdMW1ut7EH8TYY7I
	mvgGPsj0DFx0BWHRsbL6KGRrg+vLOop6PPmahmoMukcRUqUPeGw+h3Xe
X-Gm-Gg: AR+sD13iEBWvNwJmIL8vZdAol92VFPavyOnGgGVzy6WhstnXU5wua2MDHBO2EulBBmN
	xse025bhQi93CxWfAQHh7dYhSe4BVf2wUEe/ps1cBsgVNk7xukTL8xH0m2auWNBiAIqwnJLRA3Z
	kEqDxCHqcuepFr3cDqcN6AwuVIjk3XEbnEkjCvNPqinjKWVPuvgYerSLpq+RzJAN5TQr5YZjRsC
	pkkETWV9JqFYd4OorD4OCRBIYAWEK91vwdKpmHPClTFfCe06AqDcuFc3eX4SBsTzxOmXDu18FY1
	i4ye0kcB8TLL3nsLJEGuw2OkI2VjWhj+WqGmtHd+jyvsyI8yTtsZu6b64SGrEKa870dKYlpcNmU
	0F1OHspmU7r5jHPCDiZDuslMrWXXw9Y/bcScBSJVs5TS+ahyDGOyjFjBibEj61RpSr3rZuEjAWN
	rAWJ4ae+lPlek0LGCBbp1sI8fCdVzSdFC5I4t+LEfo3SCifu+o1FJVnJkJgJtNza73l2NzbnBM2
	5lsArfxS0iTpB/ViwI1uLnosg1Dy+CY6Eq+JmW1rIt6ZwiDRIXm
X-Received: by 2002:a05:6000:1788:b0:47f:8fda:1af0 with SMTP id ffacd0b85a97d-47fd32b1992mr3062100f8f.4.1785494621857;
        Fri, 31 Jul 2026 03:43:41 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:41 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 04/11] staging: rtl8723bs: renaming variable pibss in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:27 +0000
Message-ID: <20260731104134.12754-5-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731104134.12754-1-fliegbert2@gmail.com>
References: <20260731104134.12754-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming occurrences of pibss to ibss since the prefix p is an old
naming convention to indicate a pointer variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 37640ea9edc8..761cbff86bbb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -271,16 +271,16 @@ bool rtw_if_up(struct adapter *padapter)
 	return true;
 }
 
-void rtw_generate_random_ibss(u8 *pibss)
+void rtw_generate_random_ibss(u8 *ibss)
 {
 	unsigned long curtime = jiffies;
 
-	pibss[0] = 0x02;  /* in ad-hoc mode bit1 must set to 1 */
-	pibss[1] = 0x11;
-	pibss[2] = 0x87;
-	pibss[3] = (u8)(curtime & 0xff) ;/* p[0]; */
-	pibss[4] = (u8)((curtime >> 8) & 0xff) ;/* p[1]; */
-	pibss[5] = (u8)((curtime >> 16) & 0xff) ;/* p[2]; */
+	ibss[0] = 0x02;  /* in ad-hoc mode bit1 must set to 1 */
+	ibss[1] = 0x11;
+	ibss[2] = 0x87;
+	ibss[3] = (u8)(curtime & 0xff) ;/* p[0]; */
+	ibss[4] = (u8)((curtime >> 8) & 0xff) ;/* p[1]; */
+	ibss[5] = (u8)((curtime >> 16) & 0xff) ;/* p[2]; */
 }
 
 u8 *rtw_get_capability_from_ie(u8 *ie)
@@ -707,7 +707,7 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 					struct wlan_bssid_ex *dev_network =
 						&adapter->registrypriv.dev_network;
 
-					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
+					u8 *ibss = adapter->registrypriv.dev_network.mac_address;
 
 					/* mlme_priv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
 					_clr_fwstate_(mlme_priv, _FW_UNDER_SURVEY);
@@ -716,7 +716,7 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 					       sizeof(struct ndis_802_11_ssid));
 
 					rtw_update_registrypriv_dev_network(adapter);
-					rtw_generate_random_ibss(pibss);
+					rtw_generate_random_ibss(ibss);
 
 					mlme_priv->fw_state = WIFI_ADHOC_MASTER_STATE;
 
@@ -1369,7 +1369,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 	struct sta_info *psta;
 	struct wlan_network *pwlan = NULL;
 	struct wlan_bssid_ex    *dev_network = NULL;
-	u8 *pibss = NULL;
+	u8 *ibss = NULL;
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct stadel_event *pstadel = (struct stadel_event *)buf;
 	struct wlan_network *tgt_network = &mlme_priv->cur_network;
@@ -1455,7 +1455,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 			spin_unlock_bh(&mlme_priv->scanned_queue.lock);
 			/* re-create ibss */
 			dev_network = &adapter->registrypriv.dev_network;
-			pibss = adapter->registrypriv.dev_network.mac_address;
+			ibss = adapter->registrypriv.dev_network.mac_address;
 
 			memcpy(dev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt_network->network));
 
@@ -1463,7 +1463,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 
 			rtw_update_registrypriv_dev_network(adapter);
 
-			rtw_generate_random_ibss(pibss);
+			rtw_generate_random_ibss(ibss);
 
 			if (check_fwstate(mlme_priv, WIFI_ADHOC_STATE)) {
 				set_fwstate(mlme_priv, WIFI_ADHOC_MASTER_STATE);
-- 
2.55.0

