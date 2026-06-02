Received: from outbound.st.icloud.com (p-east2-cluster2-host8-snip4-7.eps.apple.com [57.103.78.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C8938656D
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 21:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434297; cv=none; b=D9YNbV/1zNGgYyjywlajA57+MdIiSeSYR/UmI40sH9kIOOR4+rQPqfjJ0a/SQpwRJm2PSzjM+6cn24f9RVDL1/4PV3w60oifnkLZ1HtJeeXuSr/rBBdf/an3oBzaJJlLKWFjbarE5Ei7ZR4WSUG8K04o6rmUX823wuyIfVg5he4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434297; c=relaxed/simple;
	bh=1hW9BEaJeaTHknvuv1niBZ3z9D6/vLD1sOyYrnJvllQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YUy34ueJP5+yOaihJIEx3llCCy5TOZwHgUedTZTkX7zxHys/kmAPYRu4ZSSPyI1vqUvUKXjlT0tzq1n4saAz23I1dM5jCt7qz/GUe5vQEgC5DwXEuiLiRg1TRrs6L9nJ5bwEE2uPP/j5gRjPoGmlg4sMAN9ycvLh96sHk0HbJSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=WQBgQ7WR; arc=none smtp.client-ip=57.103.78.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="WQBgQ7WR"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPS id D738F1801AB5;
	Tue, 02 Jun 2026 21:04:54 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQBLHVQFRQNHF0kEWhcOVk1TDV8IRA9XElsZRhl3AlEcVg1XQ1QEX1BfHA4EVAddBV1WUAJaS0ATBEsTBVIHXU1WDUcPWB5cFBcLR0NeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQJGCUoBXAdfAkcXTABbA0YDXVMNXwhED1cSWxlGGXcCURxWDVdDVARfThkMSh1SVlsTVRdGCQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1780434295; x=1783026295; bh=/YH6e6NN12Upzr1zYZcbbnAxBWWNTZ9WjcXaPrtyxvA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=WQBgQ7WRJpowgqowzj9X5uthk/zS94nMjZJAjr7udfNZC4ZaoMIwO/ywWRVy7TNOKeV+olNkdL5TLoG7gou/qOr6fKt4VjHnAqBK9+WNOYsGqsx4/+VDWWbDQEgdiXWdoWsX+nlPC11fvZIRirW8K3a1i2/+phhoiyk5sp7ux71Qad5mEOuU8lGRH2qf/i368gGlH9XaVtZVyMTfisUajgqZ8338A3DcZz8o7LwwLRCz9KYilWNVpqBJuASeLFN52VAFlyteuEfpeoXMqWRd0qQz58KyVXJ2CLjw5Ex/+Cc6K00fX2j9qbKhP7yNA4R5+TiS9uBdb2udVsCxs37AZA==
Received: from DESKTOP-MKLAF7C.tail7ab390.ts.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPSA id 748DC1801FD6;
	Tue, 02 Jun 2026 21:04:48 +0000 (UTC)
From: Jules Debbaut <julesdebbaut@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jules Debbaut <julesdebbaut@icloud.com>
Subject: [PATCH 1/5] staging: rtl8723bs: remove unnecessary parentheses
Date: Tue,  2 Jun 2026 23:04:03 +0200
Message-ID: <20260602210407.4364-1-julesdebbaut@icloud.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4p7OU6ZHCfKp0zKVcPzJT-CovMqA0f3y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIwNSBTYWx0ZWRfXyqLwO16elP5u
 BsJ/a97TpiqCwusZQ0e9GPLOoyC9SbpM0mBgWyYJYqJNVEtLBVBovtV+g03P+rbz92MiCfYybNc
 BAyTG5mZqHfsAYciTB01qe43i653fNy87U6UBSWb12z/KUhKkHSM78bOyqAupCwTk7Ib9sMNMFa
 OJwZgIHdbJ3NaqO2iUF7gZ8kvSua7TliA1yDgDbcJAK9gyXldna4lVG2ZDvpWup4gC/rVfEKncY
 YOSuJsWjQQo8wKCiI43Is9quupKu7BW6LMH/2AUXTp3YhRS6m0e4YyQwp4+EYs5XOkbrvVN8X37
 Utc8sR2HBpsqsmCyAlNwbi3Up36JjMBmj1quE8GgAp5CRDqtRFRnEnm+ezlxz4=
X-Proofpoint-ORIG-GUID: 4p7OU6ZHCfKp0zKVcPzJT-CovMqA0f3y
X-Authority-Info-Out: v=2.4 cv=RJ6+3oi+ c=1 sm=1 tr=0 ts=6a1f4577
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=FelO9ux0wxsA:10 a=x7bEGLp0ZPQA:10
 a=PddA0_aAOYkA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=kTlGs7-RRlLOHoDjyUsA:9

Remove unnecessary parentheses around struct member access
in address-of expressions, as flagged by checkpatch.

Signed-off-by: Jules Debbaut <julesdebbaut@icloud.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index d0bbe1bb9..4db605aa2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -336,11 +336,10 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 	}
 
 	/* DS parameter set */
-	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&(pdev_network->configuration.ds_config), &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_DS_PARAMS, 1, (u8 *)&pdev_network->configuration.ds_config, &sz);
 
 	/* IBSS Parameter Set */
-
-	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&(pdev_network->configuration.atim_window), &sz);
+	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&pdev_network->configuration.atim_window, &sz);
 
 	if (rate_len > 8)
 		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev_network->supported_rates + 8), &sz);
-- 
2.53.0

