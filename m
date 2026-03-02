Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F4A3FFABB
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467740; cv=none; b=lan1lEnd4uR0bH4aH6S6EpAtzxvSzXI6HhxHPZiNU5ZkZBoZBH9oO++YhCgpGc7co2OzVjW4agGh6d6OvUG8c3mRC46ebQvTxITEeovYQreMiwk+6IPJTWhehAnTM3yxg34NAAcoAUeerzk9TvenLsUMl+XdFkwoR+8QiWWtqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467740; c=relaxed/simple;
	bh=Zho1mbqOgOkH7lS9e0nVEPUcz5GB46Gm+0BhNx/GM70=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cfGW/T8b5tRhmBWeZl4ej3kIV4NEa0sa0UMS5M5g9fFhGMu6X4vkY9Nec+J8J1MlwiMi38dlRhACQVUL+UxaMHKHyMDBkvGCe2nOWiu2jxUkRAgUX1EwTrUjQEzcQ3Qloj0poZi2uCt+oaEqkI7hoa0b4A3XFgrirJWwps2yklo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEUiwCMG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEUiwCMG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bad13a9bso54346f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 08:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467737; x=1773072537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=35deZF3YQPu99oWlFdTXp+7uEV1Gbie7Qa+6V4hToVQ=;
        b=QEUiwCMGMb2wW40A9Hs7XqRlP7J8HDtji2UPKiHbUx/2PJEHSbl8rnqWp3MqVaU/br
         OBrwnMMSr+7RHGYxH0CzKTp8i9jgMhY55HfIhvlOlyOPdgkgcMijEOkT+hHgbtNxxtkx
         u/SYstOp9Owa9KfcQ4FzP6eobDoXYVANkDcs65mHVUzw8WeuB0zuUlzqit9xL5HBT6NZ
         XaBV42Ga+yp/TUTBBUHPK15lcSyxkZekXCy4ZIMUKaiGIJNRaSe9mZBIaqeS5a4pUm2b
         uwD33Eg5Ebd5O6Rv0B+RSrlLiJTCiGjdUnMJoEHKlzMWmbCF6Rdq59dFJl/x3kcczZ4d
         wiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467737; x=1773072537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35deZF3YQPu99oWlFdTXp+7uEV1Gbie7Qa+6V4hToVQ=;
        b=j21yS/jdOMWj28kLY1q68Wkr6a1zkCq9z2x2pPIpMflFCOWAc+3HFL/bxBarNeGtRc
         aAsW8EGV7IZ3B2Ik6MX0Gk2bRFReiE4FMILqVCAcABVW0JxxmgA/YIYofvhzCmuFvI/K
         +0GYuw3IQ6wKivhgBww0E8RXRvLrg1PuJJ4zeXH33uSiq+wsQq2NVn5fb6aOXMsN+djb
         tHcIXbrRuCJa8TZjselNeFW+FXSSBOSCGlgf9W7ZNm82I/O9xxsgcGyaDSPAJZLr+CAz
         BlX210FVEOy5+H/m7cT+SJoMhz5kxfs+conAWDOrSt5UGrLcnNbhRIti3aYNBVW3rTzJ
         If6g==
X-Gm-Message-State: AOJu0YxGMMUk6hnBaGUvXDOrFOxj2OgOZE4L0UD0HSckkQGa883ZswEr
	k6GXs0Qdnx3/AD1rWDn9FY/rhTIWIIbgT61L/BeqF4B3Uq3fqJuQGZOt
X-Gm-Gg: ATEYQzxoIgyFL4/A+vo/K1guVuDPwel06DohonPycQWKOR7/YCn4lSlJelU6v2VzG3n
	jm18NXl++WSyDrk0LWqk2DuSt4lR7vPZK3q33rnU5Osp/6z+ghTs1CgI1N5cu7PHeHiwF3wNFIf
	UTsOqnuUUQ8YVUnEQsHwSBHr6Qosw18Aqk9Zmbepwf3Sy0hKk9EyMPsJBPllNJsAAEHmx1klzDM
	EapU9qMSkOhEwh3ywZUHJKrdgUXi/1fivPL4ix6rsAHTzIcyuoZmKqblOzznBZaZZsHQzBPBN1k
	Iu8D6alX3ly9DM20t81e03YrCAfPPRirUaopL2yO8oP4VESaXRSg0xBB8HM2BNA97gDfUSuyCkv
	4tdxtU5FqTMmUt/DbtWhq3CVN2k3a98dUbIkQ3J+TM4SBlA5vtS/1XlaWLVMKKAwGjbgvjJxWIO
	pzsE2/dO/AGE+tt8CIvYF2ALb53S5ZHZm5rrIu4H75u64ubOZQuYM=
X-Received: by 2002:a05:6000:2583:b0:439:9025:1560 with SMTP id ffacd0b85a97d-4399dddc421mr13039656f8f.1.1772467737322;
        Mon, 02 Mar 2026 08:08:57 -0800 (PST)
Received: from rivka-VirtualBox.. (px140.isp.net.il. [195.60.235.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b485a0b6sm12504838f8f.39.2026.03.02.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:08:56 -0800 (PST)
From: Rivka Bukchin <rivkab300@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rivka Bukchin <rivkab300@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix CamelCase variable names
Date: Mon,  2 Mar 2026 18:08:49 +0200
Message-Id: <20260302160849.2693-1-rivkab300@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename pHT_info_ie and pHT_caps_ie to ht_info_ie and ht_caps_ie
to address checkpatch CamelCase warnings and follow snake_case
naming convention used in the kernel.

Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>

---
v3:
- Rename pHT_caps_ie to ht_caps_ie for consistency
- Fix commit message format

v2:
- Use full real name in Signed-off-by and From fields

 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4..fa833e992 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -801,8 +801,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 {
 	int ret = _SUCCESS;
 	u8 *p;
-	u8 *pHT_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *ht_caps_ie = NULL;
+	u8 *ht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
@@ -1007,7 +1007,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		u8 max_rx_ampdu_factor = 0;
 		struct ieee80211_ht_cap *pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 
-		pHT_caps_ie = p;
+		ht_caps_ie = p;
 
 		ht_cap = true;
 		network_type |= WIRELESS_11_24N;
@@ -1060,7 +1060,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		ht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1095,9 +1095,9 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		if (pregistrypriv->ampdu_enable == 1)
 			pmlmepriv->htpriv.ampdu_enable = true;
 
-		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pHT_caps_ie);
+		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)ht_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)ht_info_ie);
 	}
 
 	pbss_network->length =
-- 
2.34.1

