Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8237F730
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704589; cv=none; b=IrH/kfbMV2h5kUy8Z2s9m9C3/5lR4p80I5rKfnnI3lf57YsptQ7IVOyuUgf4+GEgJpgTDHQORqnfkEVq/N5k4zqKcM2NeQp0AF3jqK0sffXK8o5rQklFvpQGQaYsAwVTocwCQ7Kymbhvoa3Nwt8jxkF8fnJz7I9j+4av9WAZs/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704589; c=relaxed/simple;
	bh=M+Kh61XUw5qSuJ9eydYBrMjcoDbLbGczaAqYsj2uK3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oIDOCJNv8X2rExg3RrszYWW08oQvpKpZA2eAwOXSAugr1QNhb/mEAYC872EyJher2czpdmQt+sU4+6dTEbqFPumdACKeb8Nif2WcvnR5l0iKgDKZxQU0xs8AO6DYP9k42RRZPaZu2d6cSLiAIu6r5oe5HE87ync3XPE/8M6AmrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=g3TGDkN6; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="g3TGDkN6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3733984FF2;
	Wed, 13 May 2026 23:36:25 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778704585; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6MzwDyMCw+yTZnEHoNY6HNZh+Y9BdZNnBKLOBVGuZaU=;
	b=g3TGDkN6FVbZOCC/GqFHVFepmHtyEExbuYoODMFyGBhyyhX426BAXtskuWuagHY624H61q
	/gWcPJ/Bg8/WClyLsevbUhnCJxN+Z+j6rCR9jVXePAGlsmKLpO7izaym3mgS/kDW0g19vo
	I/D+MJCdNHXYKU/XUyeyy/m4RQySwv4Ap5U2Ja+Jxoc7As3szroiDPepz8jCrkKdVY013H
	13PQJLr2XU7reXpnT31dmH4iXdUxIBQcQAPTLI///PXP+dhiOJfnT4wSXHCC+FTBJxRGqX
	3TaT/taJuPLG1K0Dv9gzxX1s6X6OxK/ABhjoOG6aErnVkGzABKxinKqm91gDu6v6ULQXeb
	p+9ZdS6npMUoU7NEEymdnG0h+GEszWxrg7URci8bGhnYn6c2U6lNTvuoQ5gFudNtf2np/P
	LB/eI04cwU0WVEWb2ER+wTCfmZquAfy6i7ChNieJYokDyZ1s68/mhVIlLBvf0idfr1hTpo
	IkaF/JTxMMdtJ5d1sjwvaK8Rcf4UEF06T+RpWI0EJVjwYBCUJtay3XRbsnb6++TPm/TPh4
	P7/m/y2nHAfhlvZUiVXYofbnIJC7+jUkicoEoE2Cz9rRNmrC0bXIuOCrvyiIyOJ8XTQ3eQ
	YEdRnu7H035npDQoYWhsfS3Sc9Bd56ZSkPJEbvlyGRl+aKtDN3HAA=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 5/6] staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
Date: Wed, 13 May 2026 23:35:03 +0300
Message-ID: <20260513203611.31872-6-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513203611.31872-1-me@cipherat.com>
References: <20260513203611.31872-1-me@cipherat.com>
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

