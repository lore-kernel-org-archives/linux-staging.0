Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF32E0901
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704510; cv=none; b=X0bm74LzAMp/YTZ23cyYTzKsO7IBY3mJEJktm9JOvMs2FbCGVSDZuJaF23kOFhdT3UDXV+hjBNMZKR78+lV+5pQHPWdm5kvdw5Kgo5//VtVErRJxvnaNNExX0poHIfBxoBrVCls/lG/RdsbmNzRF1gOf98Y04Md72fPPSU8UMXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704510; c=relaxed/simple;
	bh=2EC2A+KtCVbEkMXGimCI74FV2Ow+nof/vs6LyHEd/IM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Usgugy7Q22sBVP21USOpVsr/9ZBrVP7WsgqLAN1p4d0fAi9i7Cp2hnrE2AjLKZhiO5kC8Lofd0NskMddcQF7pQ58g8x4AjFt7akrwWupp3oUfMqmczcH1OrxgUoUjs7qKYJDnBMBEsHizYUYyBFMTNmy/GsHMbrsrcmKGmx0J3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=FSsaWYwS; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="FSsaWYwS"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3AB484FEA;
	Wed, 13 May 2026 23:34:59 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778704500; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=AqpxKS8ivlE+tUFq+PWlvtMkbw+MHJkFvxPJxX/mejg=;
	b=FSsaWYwS16TXbCiRL4l+pCke0tEECDbTSg+R0GRlguXTgb1bdOs+DD8O4C7Da2Hku0ZywX
	9NkCbSDnBUZRr5+I1MrlZCiNDMV+8uovnkIEt3HEk4BFKCErsr69jP/FDJzL/JbR24zdV6
	0IObROFyYEOH4edJq3paOqzB5KRN+7bz6tAhB0S4T95fcG4+FAw4Dh3K3kCMI6hYbnsJdj
	GR6D597bwJoa6dRDjhREzawXX2W7hLY4zXpmLW5rXrRDXrj7J/AgSyBP1hantycZiN24aQ
	GJ/eOdT/PQJ9ifsED+DOXJOF7Uu6Tbfv3Hv45M06JvM/3Ni5s5ws6/Rj/4o0J502YcjksZ
	+IIIqD9CMzDKxGMBtqkQ0sFlJXeNyDmw8pRicGsejR4esNAzppyvI+godeSvCAS2rS5EoK
	VelMErxMW9zurfRPEv3mNI0ADHUcDusuzoVkXrrctbG3h2CfplNrdRqOZMBRvFgpbpmito
	ZAgtTj/T4nWPz9pZzRQqdTluomG4LRVs7tIpe/1Tge/h/r3Po69dVnoDivp/6933vNToHc
	drso1VibTLhNsH5RgYf193iEaFi0RwFetwMeergN9DZaX9LwLVH+/R0TKE6LfN8RmIUnTw
	bavdo649LoMourvY6NvcAutMhDw/IY9XckuuTJ70xWRsw3xOz1whA=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length subtraction
Date: Wed, 13 May 2026 23:34:40 +0300
Message-ID: <20260513203455.31792-1-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add guards to ensure ie_length is large enough before subtracting
fixed IE offsets to prevent unsigned integer underflow.

Fixes: 2038fe84b8bd ("staging: rtl8723bs: fix spacing around operators")
Fixes: d3fcee1b78a5 ("staging: rtl8723bs: fix camel case in struct wlan_bssid_ex")
Closes: https://lore.kernel.org/linux-staging/DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev/
Cc: stable@vger.kernel.org
Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 268f294528e6..9f21a2226dbd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -604,6 +604,8 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	privacy = pnetwork->network.privacy;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
+		if (pnetwork->network.ie_length < _FIXED_IE_LENGTH_)
+			return false;
 		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
 			return true;
 		else
@@ -617,11 +619,15 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 			bselected = false;
 
 		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
-			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
-			if (p && ie_len > 0)
-				bselected = true;
-			else
+			if (pnetwork->network.ie_length < _BEACON_IE_OFFSET_) {
 				bselected = false;
+			} else {
+				p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
+				if (p && ie_len > 0)
+					bselected = true;
+				else
+					bselected = false;
+			}
 		}
 	}
 
-- 
2.54.0

