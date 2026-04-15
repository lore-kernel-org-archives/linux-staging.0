Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581004A0C
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243429; cv=none; b=KobN5RWifdVCwb/NbE+kibyuyXGvyqTPyq1v2ITNOgPVgwWObT09UnprHcKIc6ZmOGI3DcsAq9WyhdPYWlpiN6P/JLzQeCyXcHBz2pDLh4v/yDRVqJLd9PlEiH61gDJ/Jh5m+64YfbTlwAcO7tEz6JEtR7kbp2p3RKAXgm8MYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243429; c=relaxed/simple;
	bh=Ikv0KBOpAaE5uIkJdq2SET+5L5V+sLFVbvzmWObsAI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BY+sgswF1xU5ieo1wdOHMIzOyEsHh8KJ4PkQE3NTNj4E35hF8sHHYIojsXuVwRYKNHrRZn0m20p4aBSwD/Faj9zG29tGRtawrHeDSGlacFvmyHWuiCtd6GlkxitPJTWX8Yw4AISDeblGaxVulKJcVdS4Vdqo0C8IvKV6aKT0VTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YZay8jgd; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YZay8jgd"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776243425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wi/1XjhzAvoUwAibboipt1jA5i2kyXPwzodMqFiNZbE=;
	b=YZay8jgd0XA70YZe70pkMOVF6lpFw0ZovPyg8uZW/VvMUkstFFu5pvvF8aUf06fkuiRiJG
	8khOFMw6IHpUbdyv1pUzLNk052tG9sQwIXg8hu6KULPtntsQJpFVc050XMVJ9Xo+BS8eYo
	AQ81jV72A+DLpXiaXrqSe/aea5Z/FFc=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: clean up memcpy() in rtw_check_bcn_info
Date: Wed, 15 Apr 2026 10:56:38 +0200
Message-ID: <20260415085638.6427-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Move the ssid memcpy() inside the ie null-check to avoid calling it
with a NULL-derived pointer (p + 2) when the ie is missing.

While the kernel handles 0-length memcpy() safely as a no-op, keeping
the call outside the check is confusing and poor practice. This
change improves code readability.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
As Dan pointed out kernel handles 0-length memcpy() safely as a no-op 
therefore it doesn't cause kernel oops or panics so in v2 changed commit
message to move from bugfix to cleanup and removed fixes tag.

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..2a8aec37d9b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1204,8 +1204,8 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		ssid_len = *(p + 1);
 		if (ssid_len > NDIS_802_11_LENGTH_SSID)
 			ssid_len = 0;
+		memcpy(bssid->ssid.ssid, (p + 2), ssid_len);
 	}
-	memcpy(bssid->ssid.ssid, (p + 2), ssid_len);
 	bssid->ssid.ssid_length = ssid_len;
 
 	if (memcmp(bssid->ssid.ssid, cur_network->network.ssid.ssid, 32) ||
-- 
2.53.0

