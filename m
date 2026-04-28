Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238F241B340
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378734; cv=none; b=WK/6c0LXt1/IVpeVY5ynQjtiZ0GtnyHe4f9tUYCYUqv6xY79HfXPsXfil+KNkX0F/Jad2TpbuNnGOVTPKD1HlF+Ayvcaqt9vu/ujgLpTNHIhZtLK58fAcC/+J0tecoZzDHHtZvjyBIhur7eBsnaunQNFOK1hok1IKD/YZVS9T94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378734; c=relaxed/simple;
	bh=4oPRHlp1TA+xAu30VMJI2Ziz8BoJI60ei2Jl4UZOEQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H4yunIG1zFUD7fHgtQa+QGIVxvfH2tjORXNmI2gCSveax1rXhL3IXApxaQ2kswogZiQ/NIXlI+o1KwzQTmlR4RvrP2Cq3Vhc4yqal/dKTEaksgHfnnIsl3u7HwIdA3hVg/d5ZNUV+LsNLfSgma+DHBwh9TQhsXlMBWDqVbBgThY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=YEK1zwvF; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="YEK1zwvF"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4BED84F26;
	Tue, 28 Apr 2026 15:18:41 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777378722; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xf24lWYS9QBox5ZzKTLZ8LhqQa88WCWB0CzK6FFDFEs=;
	b=YEK1zwvFEOX9YmA3xl2yiuWNLmdH158q25MqVnKkLTdyGBZjLC9/Ss+z0tVqxxVzh9enuS
	CqZeuaV9/TFsRCMjh6ldqT2EPnx40tlZekrJug46nm5UKKT3GgALKTt+HINutYAqEAyvPs
	54tGM6GSGoOywToBBqlCVQUOC6Ggob8BjY8CStRiDpS9KUadnNBxqbaOaNUVohiOz39Swc
	ef9lcbhhzo6hkYZOINdQX3/Yq48SC9nl5Au16w19vGHKlJ04B67muo57HLwcN5t5NFaBZL
	EsLOp5/iqll2KjweLfFI8mYefCQAyUr5ZZS4LkQD9P4DdhKHY6QTUVYYiCx5UPbRZBJ0uF
	iVG2WgT91f/3sdeTW2C6chmv1o8ANwJVJN9Rse53KkRY0sdpbG/ZBuCmiG8eWiMaLQHijR
	f9KOhodLyfDNHxi/6g4lqifU7vXn/BM4iE5dp8wszTXls1Pfs93xNzG2q/ns5n7rurFvhm
	9X2kVm2kGSmaDOk8Kx5Rs2WIlz8T0lOq8yna2tMyRoHItUFs2NLk0IwL6ODLXzqTCMVE7D
	eAwlqKehuGaOWpWX5sb/AsewyVZVIfOu73rlyQtwgA9ubatGy1yGBp6XtZ5oJiS/PloLVj
	tx3k7LjbAtJ44OkkrEkZcapstF2TCOHx9IIPSftP7o2Cgi+7m29Hc=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/8] staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
Date: Tue, 28 Apr 2026 15:15:50 +0300
Message-ID: <20260428121737.435248-8-me@cipherat.com>
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

Place capability comparisons on single lines.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index df3b31a7b2b2..9ebaed8bd7e1 100644
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

