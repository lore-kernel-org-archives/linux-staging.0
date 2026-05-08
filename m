Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CF93947B7
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 22:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778279267; cv=none; b=N/5+h5FDeFKC7IkExbzCKL4mSH+ti+TM128/dUYrvmcy07bjcGNqJ7eDtI9xseiaXCeuOO/3J0LamwnAtbzvNfXKd/d8EncDds1zD28cMzglSyaeZDafm8MgPIn7cdisZ/cyg4xAOO+PCaGBvipAZ1CMvd9vo6sIHJOQdBkgZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778279267; c=relaxed/simple;
	bh=M+Kh61XUw5qSuJ9eydYBrMjcoDbLbGczaAqYsj2uK3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8Snx0HB2eXzjbLwuYuUKgi3v6D6Qxu8LmFGEOZSibVtCghSIXHaYzxcz6ePhxBkn7APZg8abMnjNfFMkqV6gX6yfcDZBvRcP/atbhbOXGRagkrvyBWxaMERxusy7H9bk+z8mUTfK7qnZvg1C6EDjOp6eiyGhzMKVLxNwGN/kLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=YjmPFtvz; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="YjmPFtvz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9220F84FCA;
	Sat,  9 May 2026 01:27:42 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778279262; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6MzwDyMCw+yTZnEHoNY6HNZh+Y9BdZNnBKLOBVGuZaU=;
	b=YjmPFtvz1zT47z4y01kCdyk0zcloHJ0pee4MNySGTt3AGO6R3dY+Kxy4OdvQXpHEfOlIQo
	Y3g//q03ani9lGuhwkSdcAWgAN3z9JsAaSkrLLwFr/U0/lzo6V7/zw5K/pzJiHaFLOJBG6
	wY1B+Wa2p9EaMtaEYpIps17orE5ZjE5CHo/pRtJNYr2ldNH8NjZ5llaqODszJaxwuJdbrw
	y9vn99IvWHCcIRWAonSwYe2RZCcB4RuOSzBDOvySOug99CLUv5npDXnukKV3IuvWA/gcmy
	TOcioQlYYIDps6YhLjpEDFZ3di0iV3f3BE9wsg52nwo1xC4O0ybJrDiW6XqTz76YuJcy5Q
	OEv+f8V5Qb4kEXJUmpAyxCSiAf1Zoti8iyXhCZQ8cTUND4ja0ablGEMX7m+k90USYQRC7v
	ty3AeVgc62tRuK8Y1UloyHumeVd/jQxjapnnIilvwqY/VoqM+M2LAtBRHk2WHU7a9lj+5x
	GXALK70f6+ior60VZQb/zXvywJUg/1ibU3xsSZwVczDjkrP2yIzk2+TTVA6NaZoWnWklnI
	opPnaDgfntzOr1dlzDexlZsfQyDkhyeNDlcGCGBPf1fvygMSPDm4V61BXhmLXg2bYfc5Qc
	MbH/XraIQJbPEdvtfy9Tf2t8RvOzidCfutbFCNDBbXLa0zLCeANek=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/7] staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
Date: Sat,  9 May 2026 01:27:02 +0300
Message-ID: <20260508222725.24075-7-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508222725.24075-1-me@cipherat.com>
References: <20260508222725.24075-1-me@cipherat.com>
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
index 233675f3a045..be8b50e8a232 100644
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

