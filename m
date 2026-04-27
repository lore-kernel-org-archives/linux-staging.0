Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F5C3B38AD
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316773; cv=none; b=KkPEisdJOaUhJXxyOv0X9DSqRQHhgnap/kmN0RyizPxo9yWUKrcuqr7EAbFaDrpPI4xqI6Q/3L8JJX5Ixg+xFJPWXfyfYuk8BYTP6uW4Br1INIgfT6o1p0mZtm7iovSmu50yxOmJBa/M87oqq8+unP8YlIHG2bIx7AQ52u+f0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316773; c=relaxed/simple;
	bh=C3jvPVkVItK/QHf7qWQpFO5a2Gr2szmPEERX++pvDCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/1DcUWGEp5i4UFhbSkuSYBhnZyyep6GiJw9DN/FUgT4VVRXM/sA1CH1wMmR5kxMgl9tZVgv86h0FJKuwI4T/Rn57w4jEg+fjCY4bfbQimmB8fvM18JfVDOBGeo1yZG330mWEHYLAlxg7yEV+2m+JG+Ni5n+LTEnPbdueT7FZto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=w3JbQBDK; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="w3JbQBDK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E513A84F26;
	Mon, 27 Apr 2026 22:06:09 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777316770; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PFzDNO+TvnHEMf7hIqVKHgy5Or6bnN39Ug1allaItdw=;
	b=w3JbQBDKRgW5wz0K6n4nhv/8x0gGeKCpgVVm9ILxlE80p81YQjo4Wowfey1SjzYSprwjPT
	B3G9SWr487HyjQkGkXuFpwjlwyOZn91cve4EAyX5KF/zVHfe9a5r3/v5xhcQcvQIEeuYNu
	XHKaaRvEMal2tOEIyne9LixC6oUpNEoCj7MY6bE+JCi+6YjiDG+k9ePFQMAIKQgLe3Z4kM
	r/aZzwpnBqtwfIBc2JzWy4QEXZGr839veZuJm4WQIBwUvHsZVP1XQmjuACeGhUeNbqORLS
	iwFjC8X8gjg8sXezY3mDTzbcvqm6XXNKtpT79sJwXFK7LplOhQiFfDSrVc49elSNmTzBRW
	s8rJkv8A8apysU4SCijC3qq9yLCfCdXWWyP46KV1l/GYkv7ix4wXLE7Cj2a291UyS50Ppp
	x0gkQGPTh+lTBjsG4hE3iTKJiNLuq1UTSsK5reOHoVLzfK/fy2Ai6gDAe3bMYjs6tSv8FY
	IPf0Ppd7WdoB2dfNsqTkmLKcf/8weoExZzwUhgbn1g1zgc/vXHOKD+OfLQT8MbNHwTDq34
	VL5G59POp2lIZNd02qQ0oYcnv/U+HfIMDAllUmYO1KN6Ibh1Tda45DmHIi+ClWaxpW7eIK
	9qltyldQcyd6qo0afoyhOTW1A+pOoqU5OhxwN2KLg271ngOClvawE=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
Date: Mon, 27 Apr 2026 22:05:34 +0300
Message-ID: <20260427190548.156499-7-me@cipherat.com>
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

Place capability comparisons on single lines.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 47c0d176dbdc..7b40e24435e2 100644
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

