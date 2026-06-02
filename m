Received: from outbound.st.icloud.com (p-east2-cluster2-host4-snip4-6.eps.apple.com [57.103.78.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC313246FE
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434300; cv=none; b=Yn3jEas9zHckbhWUszKFL2NGsVkTm5GZAd/b2IDRtNr1xX3kOJYqrtA2dmo1ikq+dooQqY5q+m5KVWFZb4wAE44abILY3iFz+RSDZk4st8wA6GTDtyuWTgwdpXqY9M5MUivsYxa9fEQdWAKs/gK35iydGqzOcB6tbZyMbxsFp7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434300; c=relaxed/simple;
	bh=3VjeJjhYeSjEjaKgGd4dW6uI0QPsqgfONfzHjIoUsr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDIpByfwduSXsepvP93EBh+7kX20yPEGEY0l89MfdcqUwxSpkbD6QhwhVMqm9PQMopUFxI9KhWc3KhgjnvH03ArS3dOXYrd+xwoF2caimjSHsjiyOUy0PdYBYTpa+6yMT0qNZidfypvnerip5AAWrJygfKb85UuxDtL3MuJSSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=1S224rTx; arc=none smtp.client-ip=57.103.78.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="1S224rTx"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPS id C133F1800AA9;
	Tue, 02 Jun 2026 21:04:55 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQBLHVQFRQNHF0kEWhcOVk1TDV8IRA9XElsZRhl3AlEcVg1XQ1QEX1BfHA4EVAddBV1WUAJaS0ATBEsTBVIHXU1WDUcPWB5cFBcLR0NeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQJGCUoBXAdfAkcXTABbA0YAXVMNXwhED1cSWxlGGXcCURxWDVdDVARfThkMSh1SVlsTVRdGCQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1780434298; x=1783026298; bh=U54tfLOLmSkIcdBvOx64M4L2KotnsUUcXxZKx4Cl2HA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=1S224rTxotkR5+PckZFiDFX6JDEiak5Df/M6+l2FjkkhK8I7Ln/mANKX9zBxTv0mK33K34fEDa2VkAwVj91iAmTXy9/mQe9QAhv2oYa5CkWSlkx5ojOu3hlP8TtIuqhNIADo5+coSpIS6J1LnJ0rJoJP8jqwhlbo0e9+qK4ZDA5APEHXwL/V+/ofEiZSVxKWQ8XnEMqkt6RMgZUY+RnxG565nxxswy7DBcVDy1FRo6LiUwFJBPfo5dq3DdoodpFxdGYnzHLyMOJcb88yqfuBbmPTRAI4OBLBYBxFzEN6rYMExEr0bzGumeVtfBfwCYciZ1t2KALuoQS+1faLFmYr1Q==
Received: from DESKTOP-MKLAF7C.tail7ab390.ts.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPSA id 4853E1801FD8;
	Tue, 02 Jun 2026 21:04:49 +0000 (UTC)
From: Jules Debbaut <julesdebbaut@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jules Debbaut <julesdebbaut@icloud.com>
Subject: [PATCH 2/5] staging: rtl8723bs: add braces to else-if arms
Date: Tue,  2 Jun 2026 23:04:04 +0200
Message-ID: <20260602210407.4364-2-julesdebbaut@icloud.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602210407.4364-1-julesdebbaut@icloud.com>
References: <20260602210407.4364-1-julesdebbaut@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIwNSBTYWx0ZWRfX6vLT/2NmK3Dh
 BPQokpALdtGJ2ogI936kJfGA+2hpqJ/2rPYUGINeaH9ux14sjSKcPslWHO+hM9+Kv0y9RBq6+Ak
 RVO9iFMT5nfitTYSLtIft1Y24xmiTCmoibCXGay8jdmVm5TIGQfn1sxRZnOS3Q+yY6zMQoP00LB
 mtXnYnOcOiU9XvNZ73qeNdflECIc8QNBifWgb54yOBYEPfXHICgWGwY237OgSK/76XBX671O/UC
 ROLEZ1MQYdnXDhIqkSFpxOaDSpS9EUmfexYhczMeuOG2C+jVsYU4O6kb4/syfHmp1ejoZoP6757
 uGCoX9JxfC8fo5Nf/RAsrlZvzGjjfx5qzJS1avtWpOZKff1s2J/BWwR4GhcDAM=
X-Proofpoint-ORIG-GUID: BfzVetGrv8SvCmykdXTgVt3XrpRZe9zk
X-Proofpoint-GUID: BfzVetGrv8SvCmykdXTgVt3XrpRZe9zk
X-Authority-Info-Out: v=2.4 cv=EbvFgfmC c=1 sm=1 tr=0 ts=6a1f4578
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=FelO9ux0wxsA:10 a=x7bEGLp0ZPQA:10
 a=PddA0_aAOYkA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=ee5qmE45Nn0OXPj_kYsA:9

Add braces to else-if arms in rtw_parse_wpa_ie() and
rtw_parse_wpa2_ie() where the corresponding if block uses
braces, as required by kernel coding style and flagged by
checkpatch.

Signed-off-by: Jules Debbaut <julesdebbaut@icloud.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 4db605aa2..f5a6f6e1c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -471,8 +471,9 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 		pos += WPA_SELECTOR_LEN;
 		left -= WPA_SELECTOR_LEN;
 
-	} else if (left > 0)
+	} else if (left > 0) {
 		return _FAIL;
+	}
 
 	/* pairwise_cipher */
 	if (left >= 2) {
@@ -491,8 +492,9 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 			left -= WPA_SELECTOR_LEN;
 		}
 
-	} else if (left == 1)
+	} else if (left == 1) {
 		return _FAIL;
+	}
 
 	if (is_8021x) {
 		if (left >= 6) {
@@ -531,8 +533,9 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		pos += RSN_SELECTOR_LEN;
 		left -= RSN_SELECTOR_LEN;
 
-	} else if (left > 0)
+	} else if (left > 0) {
 		return _FAIL;
+	}
 
 	/* pairwise_cipher */
 	if (left >= 2) {
@@ -551,8 +554,9 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 			left -= RSN_SELECTOR_LEN;
 		}
 
-	} else if (left == 1)
+	} else if (left == 1) {
 		return _FAIL;
+	}
 
 	if (is_8021x) {
 		if (left >= 6) {
-- 
2.53.0

