Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647BA1DE3DB
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770777706; cv=pass; b=lUD6R5Opeh4MbxUSb5Hr9vs8psEm/ZyvQhkOTETMMTztGNu6aPOhYuwHe8rToIN8uJkc2mrPflI61PRTVxAp4Xqdse+XMJBYed5QrzS8z6Z540VQRHztMJXl9OSM2YmCUsLdfTk50NtapV2RpOb78S0JZfPcd4BfAw6xscp4cco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770777706; c=relaxed/simple;
	bh=O81O1cFDK/2jT8lNmpBwRn4iq/qFdDfaNckxI/4jgV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S6Ir4UTtCBJxRsJ+Xs3WKvO5rLDGrpCoL6Wx648I8rfX7DnwMcmFDBcXAL0dGUt013BPErbhHFgBEnhJbtn16BOfwRFUwWhGG0cQ4XrtpYFg9RNL/Ro7ZZvSJzfWPXbNKoKfsbZLQYZnBZia0qAd6s7TU1GI0akfSWINkRcl9C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=trunixcodes@zohomail.com header.b=YZuWrdfi; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=trunixcodes@zohomail.com header.b="YZuWrdfi"
ARC-Seal: i=1; a=rsa-sha256; t=1770777702; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W8R9qbkL+rJldFGfl1M16qlL5C9jY5AgwIWlvDV1dIy/0400iqX0k+28wheijfr3dYCRZCAUv1AIySASGUXDgss9wdEdX2yfK6fIwcQvYNSYkE2NnG6hrTADP1zjK7iEyj7qZfLoiafAmY0xz1YDYQ0/SDYO5145lUpHIseaHXM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770777702; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RC3QTVfUNUvLYULYO9tRKeQI6FuXHDZjfovCnoXBchk=; 
	b=KGK2cc6YTpPI58u80ev0CuU1R81giipBKF0jUsdY29hHylFFzUTp7J3QaIHq2BSFcsQRGkNYYEawUF+U3M9txuT+sXMGe5YxsDtC0WIL+dxoyI5cmZdx7W5ChxyWg0ihu+yWZ6qAfwMyVSP0MbfFdkGnp5aCqF8b9OJDCTLkROU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=trunixcodes@zohomail.com;
	dmarc=pass header.from=<trunixcodes@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770777702;
	s=zm2022; d=zohomail.com; i=trunixcodes@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=RC3QTVfUNUvLYULYO9tRKeQI6FuXHDZjfovCnoXBchk=;
	b=YZuWrdfiwssn7evTIBS9Nhbttz4pt391Tmy6+1LYMTBV4XR+VMW+US8yZEJK4+al
	P5pmZOu3lRWA8fvRUrN/iDlLtCZMIHuGvTGqt+Uc7bg0ORocwefGCtGdQkXGVhJ8bJi
	HmLpXwQhQDmEyV156U06jFdeuz3eAGhQAEZqigGA=
Received: by mx.zohomail.com with SMTPS id 177077769984958.17767501375829;
	Tue, 10 Feb 2026 18:41:39 -0800 (PST)
From: Ethan Luna <trunixcodes@zohomail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Luna <trunixcodes@zohomail.com>
Subject: [PATCH] staging: rtl8723bs: remove NDIS_802_11_RATES typedef
Date: Tue, 10 Feb 2026 18:41:14 -0800
Message-ID: <20260211024115.31339-1-trunixcodes@zohomail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112278328e63f83793306b0c8ce1c00009870645e82247493533bc0c280c9b4f3c39da521e59af96051:zu080112277712f303f0d07aa647a1d32200002eb9bf0d1f4da8b4fbb09c4c5596190f58a2630be442f0036a:rf080112266c971aca2d1711be4d5fbed1000022439cec7157fea69ddff36f3d8a9c5096bee576d6ebb07b:ZohoMail
X-ZohoMailClient: External

The kernel coding style discourages typedefs, especially those that hide
array types. Remove the NDIS_802_11_RATES typedef and replace its users
with explicit unsigned char arrays.

No functional changes.

Signed-off-by: Ethan Luna <trunixcodes@zohomail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index eb38594c8f5c..6ad73d4de6bf 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -16,7 +16,7 @@
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
 typedef unsigned char   NDIS_802_11_MAC_ADDRESS[6];
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
+unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
 typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
 
 struct ndis_802_11_ssid {
-- 
2.43.0

