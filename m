Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CE23EF0AB
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 19:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316763; cv=none; b=XrzNnbz3AZIBFfH12BFvGYsFIx8qpg/by/Xp0kdFLBF3b+D8jJ0Prmpf0hZbFQjQAD8g18b68KXoCglfSGEAB4Ohvj6Pqud/k/qX69l0oUVTDEyiGlptsz5szrRLJbbRIN24cVau+v1StbXRCqoJq/K/bda9oajKYOJ8s+d0a3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316763; c=relaxed/simple;
	bh=ogfnSpVkWhJjYE4H76H+8fnS1yys5WSfk3yGwfOQqio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bucc3XEEthjZh+DcT6cpil/AmyifFKaUZIAVlrxfQweuKSvzUxIpUQ4uvBk4n4udBUrvnA9ZDF6zeh4i6MEOrZkyfQG6ZqXKI12T1bNXfwoD2NEB7v+bUj46F2kiiwPDCA34hTRVtQXqZiSvQakRMVEjqsIIl4AdYLZTnYsyljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=LWNzwYkX; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="LWNzwYkX"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B986884F35;
	Mon, 27 Apr 2026 22:05:59 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777316760; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ds0s6x/IEdSEFe5Ej/ZAy7XvpQEIA8Z6370zk4udx44=;
	b=LWNzwYkXTunQ00pDAZOOCtDCKYE+VT7I9UGY+Rrgu813kJsmMFgumg6UWjGzsRrhrJryVC
	51T2A/bhyfhHSOBn1q4I+Yv2NxQ9FJfqluzpk+2gJRweu75rcgsJ21+vtngWJuZBqNvFkU
	Z9GVHHnnJO+RrdUvP8cYcz8WsZGRwVFSctGPTlo7JxRC94D5JFZZaVu4Mvji3OdHY6huXa
	trkyuytrBLRHt7y3K7l2OUkV56H63IX8bn81Zh/MMOPt4ACsFm/Bp/0DLQnhWyYpbYPmmL
	E/IU8UfuqD29ifRsN2DNfFRlFvVLCqYRDC2SIZn6l43e/CLCZcO2P4qYRK/9HiJzt1+IRa
	X5HodywoRznCa2P4phjnkAuA2NI4J9rr6rbvvx9YO7qXMv72Z5yxrpPtQ7+wWJrEs+5R0P
	V+/mykwz9Vr0K5wI9Xxikf5jlZur4ApLCdGJW2NyhuGRjeqfaO3d4ZZr9v/s8M0ldMy8lY
	1B4Dlu8l28j8A7/CcxrI2PvpVtkzoqukLDYCdA+t6Zx839bbLNVbAVncSO2QJkWhezpK29
	EFPdgIoPiBAlnDrwpzMHCDCL1octruPRDzYEuDuCSMy+mFbQezrLo4YGfvRco3sPSb+1Iw
	mveAyk6eciURcNx/2dxPRky9jWqxfeWGd1mJSDzcehS/K+074s6IU=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length subtraction
Date: Mon, 27 Apr 2026 22:05:30 +0300
Message-ID: <20260427190548.156499-3-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427190548.156499-1-me@cipherat.com>
References: <20260427190548.156499-1-me@cipherat.com>
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

