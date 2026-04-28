Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE693B95E3
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394739; cv=none; b=XzNM3gD2lE64YX5xau7lrEE6sy9tTMJNbQVGpUOvXGsw0/ghHFeCuXpF65RARbh8N5L8kSbm77Ar/NqG0J3h7PYMafbvk0Y2+f0+UnVOPrVTIGXbenNXZRSTVim/Vt1vWh4whzm5cYToRFA3Wk1JRISw0C/k9IPNO0VYbQQZpEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394739; c=relaxed/simple;
	bh=M+Kh61XUw5qSuJ9eydYBrMjcoDbLbGczaAqYsj2uK3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WzXkjzJEDKm9CofTLFuImbb/wS7gi5mMWm+XOjvfyJmOGmThvWtCBfpZ7l98N+qE3AsySqVk3dYLXfWopkeXjL3yPIImADeMMPJyI19pRqPuFeAc6psHhtA4sjBlLnCswnEDDa8oCqRUGH+uvdYO925r1usiUznV/7rvSHlzPhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=t23Cz0vt; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="t23Cz0vt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4042B84F99;
	Tue, 28 Apr 2026 19:45:36 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777394736; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6MzwDyMCw+yTZnEHoNY6HNZh+Y9BdZNnBKLOBVGuZaU=;
	b=t23Cz0vttwR74Wf2I+y9ba1ry9j2wSS1ed9MZZxp7yFRrye7od5qqevtpC6NNnl3Tsz+V6
	bWbjxBF/acsdiPKCVU0/mbNmtlHhpCmTnrovQcLSMEkOf30HDE6jttvtcO/l4/LwCTUCvw
	q7hxauPcYPSM5khbSeH+adnoOvusU5ukaqcn26vuwYXKMb1ibiTr567CdGI3K6BkzALCYd
	db2Z36QoJFLRsjolb7IPEWNgJANcd3Z07+uupOq9svtfF1FshN+b3GRArPwA3vGiJyrX1H
	lNvzAJVmiN23GX3aZtxY2Vwr0gEuHpjfNHWn2V7ytkLSIBzRY3iNoOfwPja3V9Yl6EO4BB
	YEsXkJpbrpSzo4hZ4UHlevdmCj0nw8h4lxveL655GEN62H7ymvEuP+Fln5T7Je+byWmTFZ
	LGyhmhgwndDbz2m6HOP57D/B32nUTHjpnPPmcISHxE/nxZ4jeW0OENx3L0TfoY48ATbvkH
	3XgG2EN7P0R+3i1ld060YnrOy4ITmAmhDhRMZTohIJaw8iwrXDa0+79gL9NIjLQLkQyA/4
	whff9LGwiq/z374pTWxH0zncJq8jWjhM9kS7ZAUGciFL45oYDqUkUAuMRomuF77FmBX5Ek
	L/BvaqQ1PkviVQaIm3BOtDg5vjNv6TVB3OQ8ruaOMMGbavUHinrhU=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
Date: Tue, 28 Apr 2026 19:44:37 +0300
Message-ID: <20260428164513.763471-8-me@cipherat.com>
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

