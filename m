Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE341325D
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378719; cv=none; b=ZyeE6sUHNB0fOMd9mV1JvruVBWwXIMsm3zeyLYxL4N/A+OzD++1DK4kMvLzr8l2HLv7iLuL8Joais+Bz6P9Xux1enVh9iHGxpjnBJ2GRTKQrfZCpPq596O/9zjZRxToU+gZJdoCWqgT0I+iVEjIyvrmdh9QdPb6YevBEwMCQvpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378719; c=relaxed/simple;
	bh=ogfnSpVkWhJjYE4H76H+8fnS1yys5WSfk3yGwfOQqio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUZEdLBmUOBh1SXlk2JVlhMPEtrKLZapB0cpwC7zTWu0Qx1f+gUsPtOKmIsgxnT71DhVmLLRe/ZiPIbQHIG2YKfsM99nkc10AbaweFMILW2ovUzZL70elI2wTPFerB5K9ZYp88+qzSkiPnBKNuxQfSNREjSaIL7Od0yddbIeBdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=JFtKPfwC; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="JFtKPfwC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C20F84F93;
	Tue, 28 Apr 2026 15:18:27 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777378708; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ds0s6x/IEdSEFe5Ej/ZAy7XvpQEIA8Z6370zk4udx44=;
	b=JFtKPfwCcMh2T+1y9xofCURKMNpljz0Ymf55uo358NQf1Xf7Oz3ISUBN/p0Iv33Z7RQMn2
	AQNwNnp6oDpK+lv7Go4VCozdimeXIrnOfPiV5myE8tlgvr1LIrEUniS3PEU4PzrNd/94vZ
	K/IoDxbfO+gDBQjhJDlp4RgUgAPNLWNzwgXYOqywJXx4Gq6YMwjhR4XUYpDaGi8Fxiy6RE
	MhDMxnpGZ4X3l4xPCOfBOqujtsAV2k3hT3NxdBsKAbyaK/G9CjPK+R+ABpUVsQjkFdVFMO
	8/TgvJnaom7mfqgtctYHaJMILZyY5JrPn+KojjLJLotf0KuuT5kPu0gxYn5w9D15AgwaaB
	0YEBTpxn7g3MfnQIHlqRjywM2tEGZWuF3KnyqVh94kouHLs+Y4BpYo/hUc8AMjijsNDH8N
	g13zpz/zbhxHy/231IapHBvxqM4uxzp+RCEOrwbg2HyJ4ypRNmIMjeEfYidmPt9r7a7236
	0yrX/yG1Odhcqp2g1jGjjE6HeAbMjKZH3tCL4civk+21CwejzOxnF1r6c6Om5l28hTswNJ
	IAhazdHp4TagiaaH9uSxYrgrqH8yw9kKRkj7w838WCqzaBrAFRWrjdpH6cAKJjUHaI+Z7z
	s0tZdu39SPhWh8KzqtMJwxOcu5gUVLzXpakRI9Cx4VWnMYvf+mTPU=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/8] staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length subtraction
Date: Tue, 28 Apr 2026 15:15:45 +0300
Message-ID: <20260428121737.435248-3-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428121737.435248-1-me@cipherat.com>
References: <20260428121737.435248-1-me@cipherat.com>
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

