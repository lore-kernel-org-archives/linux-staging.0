Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7366C45C706
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368573; cv=none; b=kIR6PCUySQP8f62jUtcd+1TidrxsrWgdUkP/SbC2pFnPWOzoIAKYwAzb8eKnbcBIb6VrHO7Fx5BUlvtXuk1MOW+br7+O/mdMiIhaZ79GcXbWOFj34NH/SdeFrewgzniQEXXACy3a39DND/spGDpCmhMADgdLePg9p1ehy2VSnp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368573; c=relaxed/simple;
	bh=F54xiCetdpvrz4vgiBtSpiFLIWtTb1I9iqKAJNfnnFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PIKOGEjCuG274yiKDPIQ4U7xtKN+TyfS/ofqZjF4p1zim6C2+4hCesjfxU4zG5iSOkVKpnT+PCXqOCa5QFfEw4MINuly0bEqNpzvZqNn9jEyX+TupjM1hlSz9Kfo1NiOmbsnu7OOKfxce+CrCFwrJArMVgUMs4HpoI7sm6Df1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LLVtSrL4; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LLVtSrL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1T
	XlxLl74G0vZJit78lbEwFQKAorFZikf8iecNbpzco=; b=LLVtSrL4koqsyiK/9Z
	HYfK6bT/ixMJyPRvvsfiL68AZlIcIteQXW/BNi7PwlFR0KyPQLBvI9r0Cf5AToxX
	KFmVj37acbocRpN4WbfPlf2ppzpb2/RuFQCEPXhMwtT6jDggFJZ1LS5wGrcc7iCa
	Uu3BuYDWW4nk11cAbxLV2y82k=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBnjvRlHcZqLFSMCw--.58404S2;
	Wed, 07 Oct 2026 18:22:29 +0800 (CST)
From: Feiyu Wang <wangfeiyu_mc_code@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Feiyu Wang <wangfeiyu_mc_code@163.com>
Subject: [PATCH] staging: rtl8723bs: fix logical continuation style
Date: Wed,  7 Oct 2026 18:22:12 +0800
Message-ID: <20261007102212.112463-1-wangfeiyu_mc_code@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnjvRlHcZqLFSMCw--.58404S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFy7GF1xXrWDXF1DWr1fXrb_yoW5XF4Upr
	s5Ca4DKr1qgr13KFs3CF1kAFyfGw4rKryruFyrK3ZI9F92vF45Xrn0gF1avF4qqFyqqwsY
	yF1kGw15W3W3AwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRlks9UUUUU=
X-CM-SenderInfo: pzdqww5hl13s5pfbu0lgh6il2tof0z/xtbC7AWs62rGHWU80AAA3W

Move logical operators to the end of the previous line to follow
the kernel coding style, as reported by checkpatch.pl.

Signed-off-by: Feiyu Wang <wangfeiyu_mc_code@163.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a715ac6aa6b9..5dfbb8d9f6ed 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -393,8 +393,8 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
 	struct wireless_dev *pwdev = padapter->rtw_wdev;
 
-	if (pwdev->iftype != NL80211_IFTYPE_STATION
-		&& pwdev->iftype != NL80211_IFTYPE_P2P_CLIENT
+	if (pwdev->iftype != NL80211_IFTYPE_STATION &&
+	    pwdev->iftype != NL80211_IFTYPE_P2P_CLIENT
 	) {
 		return;
 	}
@@ -462,8 +462,8 @@ void rtw_cfg80211_indicate_disconnect(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wireless_dev *pwdev = padapter->rtw_wdev;
 
-	if (pwdev->iftype != NL80211_IFTYPE_STATION
-		&& pwdev->iftype != NL80211_IFTYPE_P2P_CLIENT
+	if (pwdev->iftype != NL80211_IFTYPE_STATION &&
+	    pwdev->iftype != NL80211_IFTYPE_P2P_CLIENT
 	) {
 		return;
 	}
@@ -971,8 +971,8 @@ static int cfg80211_rtw_get_station(struct wiphy *wiphy,
 	}
 
 	/* for infra./P2PClient mode */
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-		&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+	    check_fwstate(pmlmepriv, _FW_LINKED)) {
 		struct wlan_network  *cur_network = &pmlmepriv->cur_network;
 
 		if (memcmp((u8 *)mac, cur_network->network.mac_address, ETH_ALEN)) {
@@ -1507,9 +1507,9 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	}
 
 	/* TKIP and AES disallow multicast packets until installing group key */
-	if (padapter->securitypriv.dot11_privacy_algrthm == _TKIP_
-		|| padapter->securitypriv.dot11_privacy_algrthm == _TKIP_WTMIC_
-		|| padapter->securitypriv.dot11_privacy_algrthm == _AES_)
+	if (padapter->securitypriv.dot11_privacy_algrthm == _TKIP_ ||
+	    padapter->securitypriv.dot11_privacy_algrthm == _TKIP_WTMIC_ ||
+	    padapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		/* WPS open need to enable multicast */
 		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
-- 
2.55.0

