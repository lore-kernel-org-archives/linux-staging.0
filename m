Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE992275AFB
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 02:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775314; cv=pass; b=iquQbAqkpp9eLM8q65szHwzvxN7r/kM5RhKThA+0oq57K8Is07R8fwcE9KGrJDor2xWq5rQxZxSxojLFm+AlWzvnYbUrt2chIVCLqe4GA3OQOXhNelogrSytxmDdvqICl890IiROg8L4mI6kYd+ADHWkGqVM22TGkCfnaC+EXG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775314; c=relaxed/simple;
	bh=O81O1cFDK/2jT8lNmpBwRn4iq/qFdDfaNckxI/4jgV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nb/YHPrvYWq4C2WBQQtcqGnK1MvQSpVM5LaDrT+DIzze+RARjxTXfrw1ffdrk5YNcObs/ZqXQD2VQIbYYbXhrK0SqCiXF89pZ7XLsLCgSR6FYAbaV/sCu0+7TYEwcIt5xNWUlWfhfB1KCjKYsn19HIKf8LWFcZRGjinKNwAw94o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=trunixcodes@zohomail.com header.b=OFMonTbH; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=trunixcodes@zohomail.com header.b="OFMonTbH"
ARC-Seal: i=1; a=rsa-sha256; t=1770775309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V4VoOLZ27DMB0YizvJEE70JemK2kZlfT5NZlQlrW3sGhHDPEIEIOZSLWk3XWlwswh6lisujn5yK6nSrQ2zac8FrgyTm/gK3T9gYNb3DbBOk6t1zmxZDLGgTXFISUhH5JAUB63fCj3lHE1P0Gqw5ZkpguzB0TqR00eS1KW1Vor84=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770775309; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RC3QTVfUNUvLYULYO9tRKeQI6FuXHDZjfovCnoXBchk=; 
	b=QcXx8ESEneQHu/PEhM3fAKFLPMrnZbcAZCxhBIvIHqObsDPc8MZWgnncXGbOhpfY4bf4B3Vs90AMcYlnkMGqYZASQ5GrFNLLnxv6raP71MV6z86mwzK6+P16qu5kVkAsVYXsIJX26hQbjz2/2iMlfeAlCtYbA1Wgn2Rw6LsEuFE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=trunixcodes@zohomail.com;
	dmarc=pass header.from=<trunixcodes@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770775309;
	s=zm2022; d=zohomail.com; i=trunixcodes@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=RC3QTVfUNUvLYULYO9tRKeQI6FuXHDZjfovCnoXBchk=;
	b=OFMonTbHyMb7uPPh7AG61L/PucjzV5bkoG9Y8ePc4j1Qw/BVi9D144v3RR6i3qX3
	V2Sq08sFsqfHL8dYu2GlD5w3W54msnfoqMjzP0LtCBGeLtPjXHtgvVFJLJdFPH/pp4Z
	DoSSnOmNN6e2mpEEAKOAsoDEbmzzJzRF4mj3Ar3s=
Received: by mx.zohomail.com with SMTPS id 1770775307584657.2118242926099;
	Tue, 10 Feb 2026 18:01:47 -0800 (PST)
From: Ethan Luna <trunixcodes@zohomail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Luna <trunixcodes@zohomail.com>
Subject: [PATCH] staging: rtl8723bs: remove NDIS_802_11_RATES typedef
Date: Tue, 10 Feb 2026 18:01:16 -0800
Message-ID: <20260211020116.22524-1-trunixcodes@zohomail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227595897c7b67eed0de914704300000e03d7663604596fa70a5d521b470b21a1f142e8cbaab00107:zu08011227cdfc24cfaf6177e6db0c04700000f3e57ca3ecf14bd760102bb568f6fbea55effda58be0ff87f2:rf08011226cb6dbeb9fa689daf9942e357000070f738d74376fa9d5d3c87c15b08bcbc2adbea65b0ce30fc:ZohoMail
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

