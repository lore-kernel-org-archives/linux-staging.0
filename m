Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3B4372B28
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776200164; cv=none; b=IVUjnJ9IiNqOqpfUjQnwTOTpf36A6UYovf/hNGUg1Kvdes7Lr09rmpnPSCP/NB9KfgCpubWwyuv0uDTcF8wP6WoDozdLoCwsIBKAh6FWZ8YVDEc72g9icPhrfrL7WjR5dzVzDLwWkqU7Sl7LumymfLPCYC9Ww36mC8lyFFuhZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776200164; c=relaxed/simple;
	bh=9DFPAVujpGC2GbzOGPxwNbfZ04jWH6d6SPDB/WPoKNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzmkPwh7mZPYj7/H3p+LS6rxXWVkM2zwRytU7aUsUZkP8RwVpayFI9PVJQXubPzsuoZrrCiftLkrxOqn9o6QuRHVDn60k9lkf08ELP/gbcCVn9m1lMGHDmokGJchLrKrowv7YVUv3dXQ72Iif7EOaDf1cgiBK4cX9xVPLgWhwLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oseNf73+; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oseNf73+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776200151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r6P0nneaaLMO0SWxip7riotnZ1csgytFAw0HMmy3OdA=;
	b=oseNf73+SKpQHNvMZ8YKgRenLVDRdLN2Oz8hqXGRhfANwfNce3TpX62R5NYaDxumesQuxQ
	OBB7jryuyrZmiHWJDqAhrSD2VlOeTUpShfNnpRNULCW/KykOlyQQcsdZLUj1Njfng/X1Ui
	WzdfU3dPRA7PSbDNbwqPPYJ1XL2Fsc0=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix null pointer deref in rtw_check_bcn_info
Date: Tue, 14 Apr 2026 22:55:20 +0200
Message-ID: <20260414205520.157861-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

When parsing beacon or probe response frames, if the ap does not provide
a valid ssid ie, rtw_get_ie() returns NULL. The code then blindly
performs a memcpy() using the returned NULL pointer (p + 2), resulting
in a kernel oops or kernel panic due to a NULL pointer dereference.

Fix this by moving the memcpy() inside the if (p) block so it is only
executed when a valid ssid ie is actually found.

Fixes: 370730894bec ("Staging: rtl8723bs: rtw_wlan_util: Add size check of SSID IE")
Cc: stable@vger.kernel.org
Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
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

