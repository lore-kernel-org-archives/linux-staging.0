Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669727E1D7
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 22:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777244302; cv=none; b=XsbEeKyYxbEvQDblQVRPNoJN+iDzjV26xlRIP8ystyzMUM78MecFHfjaVQt12bmVkatuUwjmcAh+dey0NzCj5OjFm4/9sfIPhHf9NescUFhty/u1KDzAi7Td9U5L8lz/1+kLx5hC6KkM4XJtVstuqchsHlkNpizAqKuec8llYGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777244302; c=relaxed/simple;
	bh=JroAYwDCCCSR6fSXUMUM1Lb9VtW/9luZpXb6TBHQvvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQlVYHKl6IcPR4u99pjG5xv8LaVu8p7d1m2cokP18d0QpGpdaQm7f4e3NT6hLD0HTAJBBqPb3ji8bc6dy+LPmysAzVUcmiskCcTdIuqddERVAP2SuTsD3xwuUaXVwHqvTL+A9iaDK2bGSbcgt4hQTAJYxn3wH74hqcyjWySUN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=uiJTEZn/; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="uiJTEZn/"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E96284F30;
	Mon, 27 Apr 2026 01:58:19 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777244299; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SlM9XwMtVeGr4eZLRP0/gzdPoevGFri5WNqHzwN9As0=;
	b=uiJTEZn/ct5w24eATYGTtcsHrHWMuaTdccPiqRNcxoWzZH6HuMfsBO/zS+hJwGLaBK8erf
	G2qKYHIW2S9lzUQY4TYqv6WARB4t4KVjwnIOy76En+hCJ9EHq6H3jvqaXOcgaFE7oboPc6
	HeQBlhm3YLsoLEDU88esU+6oVVq7n7y0kphh4HiSBUvEgUVvgMki2jIYN8HziypKKmZG9k
	T2YElEOpzQeowBUW2Siffkdn4OySj2SvNUMOnKsER63ob8959wINJTFBOWcwPSwZPUddIo
	M2It9esvBrvf5xY3NHVgt8h3EeNdDBi4/dCtlkep2tmZL7w9F3VR97O7syEFmxv3jdFACc
	V8OSgseQTFANIwacBmiQGG11E1YaYMsKarn4U6M/MHW0aBB/l1oAXxOJDnJ0oYAgGxpO5Q
	DCeazK8UEEHmLlQjPuSdSWc41unI74NaFUpsgXhofrOkusF9JWvth2fQebs5WhWxlRQsLA
	eccT/iyZl2Em8h0sWMJa/YCtISnRFtipX7AmpS66twEdwxAvCc0hdFTirlJwSH/HzYFXy5
	IV12P5EodQraxih1YyGRkPAYhkAUTJXhHNBW6yesqLSXAwROOHxgCDs/4DPxYOYHq4Kj/+
	ZyjtcEAbrS6XtOmysbhyknPz21L45rly/4fZ/po5H5JCfz91EG4jE=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
Date: Mon, 27 Apr 2026 01:55:01 +0300
Message-ID: <20260426225552.87114-5-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426225552.87114-1-me@cipherat.com>
References: <20260426225552.87114-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Place capability comparisons on single lines.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c8971c03704c..66d3d55163f2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -367,10 +367,8 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 	return (src->ssid.ssid_length == dst->ssid.ssid_length) &&
 			((!memcmp(src->mac_address, dst->mac_address, ETH_ALEN))) &&
 			((!memcmp(src->ssid.ssid, dst->ssid.ssid, src->ssid.ssid_length))) &&
-			((s_cap & WLAN_CAPABILITY_IBSS) ==
-			(d_cap & WLAN_CAPABILITY_IBSS)) &&
-			((s_cap & WLAN_CAPABILITY_ESS) ==
-			(d_cap & WLAN_CAPABILITY_ESS));
+			((s_cap & WLAN_CAPABILITY_IBSS) == (d_cap & WLAN_CAPABILITY_IBSS)) &&
+			((s_cap & WLAN_CAPABILITY_ESS) == (d_cap & WLAN_CAPABILITY_ESS));
 }
 
 struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
-- 
2.54.0

