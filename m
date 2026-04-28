Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E733334C1D
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394733; cv=none; b=gnimvoJ+SSd30UlKyPkt7T/5Z/jxBTrT3Gdu/6dAtmgGtZNJVHzZNdWTwclvCG4svFVUgKAeUfcBnB7gUPrvb7D1MOErwindOTuD1TIQWscTuU73P5DBmK3GbNM9PnpsMA68ibEx1wzvakFt0mwEh1WQDxZGh2uuxWKtDrV6XJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394733; c=relaxed/simple;
	bh=ogfnSpVkWhJjYE4H76H+8fnS1yys5WSfk3yGwfOQqio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRqgdgO1MUmM/4ZyDYi8xKrrVCvau8hwTz8J44dMWFEddMPusgW63XPY1zpZ5g2dRrVWlSlSiq4SJAOS23eGEuHA+QGU6gvJShAs1DuZx1zB51XOfXrJUcivTdLXZO8LrlbjxRSIlgIRQc/3iEHr+g5n9jAiALg9yH6+7hxg0Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=qT26olzx; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="qT26olzx"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAC9484F96;
	Tue, 28 Apr 2026 19:45:24 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777394725; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ds0s6x/IEdSEFe5Ej/ZAy7XvpQEIA8Z6370zk4udx44=;
	b=qT26olzxfOYlI7aGzKRaFmghr4SVNsFTGGGyCe5YKMDVqN6qMW8Dh6xRCaz/1pC9CF2uCG
	Fq8oRCLaoVQjnG/jw15Mmi0vIdXZF+bXin51PmQxtjm4ZOM7iNtH0z3m3fPW7jFHK7r0yW
	29R/0bRzrQcrmsxn+mmAAGOz6XxgRbg1KZgCV6+Y4K7KpxwnECB0gP9EJghuicZGdG50ip
	kHp+rO8wY1U32tieddWPnI27lqcwxZEl894V6pDgBJXrty2pGsAQ7HWSt2H/CBiRiV8OzN
	vgi7IWhEuLQprFh9xu/44aq4ymxxojt5e26v2bGOS/JCFK2DrKqlCSl4FPqWe8ppTakEH9
	YQiHGwCkDjF+5XaDkBkmOS0vSD5kUEwWyARpqnRxm82DrPr7Zjr01KksHgGCumeN9RVmLb
	Lf7VDwvXQj1y9HXQhxkHiwj6GT3maGN2NksH2vlwXBX0GMAjRY4cU5J87sQqZECq72KlPu
	RsA1LDlaJwCrzS2AHGkHKH6n8DKsPTXY53fsBhZEibdaKJUkchNeGkYpdRZF1mYKwHFTBm
	QxCxge5ch2GVz8DnE2Vcl63JLQ9ubYVektq0Txf95/FTNM1uK8lrVfBJEnzQiCnG7zgegG
	q7I8hPledvt1+Ymn18OlJrcs9lhwRxJH86nF0h6iDMClHg7keuB10=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/8] staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length subtraction
Date: Tue, 28 Apr 2026 19:44:32 +0300
Message-ID: <20260428164513.763471-3-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428164513.763471-1-me@cipherat.com>
References: <20260428164513.763471-1-me@cipherat.com>
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

