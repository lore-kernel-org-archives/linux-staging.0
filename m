Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E983037BE62
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 22:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778279226; cv=none; b=nvIefIOR97AKJRJxk0XayNacXUMp/bhDe7B6KSRl5roV1m/W0jYytWKJUCh4ujZRwEWWVwhLtzgnwqJrD2oDP8GGqsJwN4f/PiahEqN2RYGmgPkZoliN2068t9iYvpPAQRuCe8VijPsrfnz1B13wK7Ho+AP2UlzFJOj/58TPH9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778279226; c=relaxed/simple;
	bh=rZHYkXggah79PkVFN+6E/RKD6b6tAyfkViysUFDb8oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8pu/DKoys97Soq+8AMPPhsPfnUo1zcf7VicshvwNtWPEltV6OCNaqQAA0ZkhUpajHpiXz8M9nt5muC4A30RWb7/P30UVxs0gw0IFPNSw3i2pEihQjCHr09AVxM0e0/XFjkn6Wfmm7qZdxYOVUUeYI+Y8fcN4Q74+9qyZbhknmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=HjUjVyRo; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="HjUjVyRo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AE1184FCA;
	Sat,  9 May 2026 01:26:54 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778279215; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=9UgJASqxAWAeh3eiXQ4y7gcX7HLK+OapSPbuxmiLW5Y=;
	b=HjUjVyRodngW/H+qn2dcAWiBquCCdo7+YuY232Q5ddlqK7AoC7h1ZxI0urdwJ+nA1FC99I
	B+Ykjf90Tj+1Zk7VagrgJLLco0flhv4gaSCC0RlV7j934e62xlULZHaAK4LV+BvbWFB67K
	HEi8COEYKOcYrTSIontfab9RIxc6n6/CnQ2R5KU4rSfu+8ediVixFzfXcW5bbzXXMAYcYw
	sC+ky/RZYab63qdbKQMOJGTM6NVbxbOwgpar+HVa5AUyiYQLpIZZVjNUtysU0y2Sv3oAtg
	8aA+9dOgRrAZ1kt65YQysOYGyMvisS2yQt7j3F703T+kGzBKjud6ResqBI5PNui+KwmeY0
	OWAB4gzoQM1ZxXPfrHbf4pcR0WI0kipSTmMYEgbxo9D/e/6V0zQxPwo9VwIq6MmyT8pUQq
	5sSpfG8vy03PeIY82vWh9p/v6DnBYVVfyROUz88seH1bNv4G+rkYeZYIeyXL7vpR0g8jhh
	++rSuL62l3E7G/wuueuL1uKBmuSYt7IOyqmY6oOopV5dm8H45CY744c6YDi43TjqxGidvi
	OzXFdNUd02J6R0lBa8jBbdNDhXHKCWrzefGgqTTIKmIug2lCVSAThqwiMVUA9n7mbsul6i
	3dhk1q5nPYT689bJinsovN7q6rU+836s1X6Ef0ISUFPRpKGip/92o=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] staging: rtl8723bs: fix buffer over-read in rtw_update_protection
Date: Sat,  9 May 2026 01:26:14 +0300
Message-ID: <20260508222649.23989-1-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

rtw_update_protection() is called with a pointer offset into the
ies buffer but the full ie_length is passed, causing a potential
buffer over-read.

Fixes: e945c43df60b ("Staging: rtl8723bs: Delete dead code from update_current_network()")
Fixes: d3fcee1b78a5 ("staging: rtl8723bs: fix camel case in struct wlan_bssid_ex")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-staging/DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev
Cc: stable@vger.kernel.org
Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..268f294528e6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -464,8 +464,11 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
+		if (pmlmepriv->cur_network.network.ie_length < sizeof(struct ndis_802_11_fix_ie))
+			return;
+
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+								pmlmepriv->cur_network.network.ie_length - sizeof(struct ndis_802_11_fix_ie));
 	}
 }
 
@@ -1072,8 +1075,11 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 			break;
 	}
 
+	if (cur_network->network.ie_length < sizeof(struct ndis_802_11_fix_ie))
+		return;
+
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
-									(cur_network->network.ie_length));
+									(cur_network->network.ie_length - sizeof(struct ndis_802_11_fix_ie)));
 
 	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
-- 
2.54.0

