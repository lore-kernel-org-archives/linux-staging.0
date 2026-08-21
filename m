Received: from CP3P284CU006.outbound.protection.outlook.com (mail-brazilsouthazolkn19012055.outbound.protection.outlook.com [52.103.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4B237703B
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 04:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285592; cv=fail; b=mFImxkOyVYd+VL2G3HP2grEeUWBLIXZnOasrDgWEstLf+WhykLmP4b0u5s8S/qLvzuqanIUhuHqIaT8dhMwD2eKBNpdMtUjQK4HzqArMIWNUB94+QApd8CUNMYfWeYlU9VGL2I0dOlr9BE6yca+iGcVcfvHunt/dJZ9hc8eT2gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285592; c=relaxed/simple;
	bh=WOqCyiMLkn/g75jzq1fpv52p+obH9n0LfhsZKm6JNo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=inej5s5+3hIh0RmuzsCT6fuAtk6H7tLKaN9W0p7zcdXRe9bxXDAHPU8sxOndkKxaH0d/QQif40DfC0jk2qaUZ3HZFeWHPNZfItuAoxgiSRFvbbTAPSu+MHZSzMweCeIzOcI1FJzO2E1yCsVgQRlFvWMEc3uMWznyUqOOr0WXnLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=A+ve/WuA; arc=fail smtp.client-ip=52.103.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="A+ve/WuA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQDY2aHVN+1lVJbdjIwDS3EQDu4pkHJJYPeDgrJheFYTX7qFV6uAzCi4uwZZ2juyTtmAlEyjLxqHV1PT/dxA6az1gZhJlMwiZbjOkmPwTnihrpPxzB9RMjwxMn7Nx/Sv2jzcpO2sGWJR/bAd5KAroqC+slrW4lIivlGsCpSzAlLj7HcQIp4WYxQgoBYxJqPusoGJrtRVqKR/UbYo10M24Js1yvbrTHJb92jJhW/huLY+1AxTDTlN6rc82yfhPESoWvft2Sv5B994sarzq3WVqw6TiPClvwbVZpe03zKp5D6jZ6nDYxgeKg40TwSikAILHGFfd7MnPb2pCDlx4/wDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShT52kYITw8nuwj1VyzbBx5GoNdW36px4LWUVvMpFzs=;
 b=eTiBPvT87oA0t8ax6ZAinpVb8vOKBaIzlva6PXvB1q6v/G3QyT9J7Xh8jlic11Sk1Yr8aN4G7GxZqXVpBuFlgFIa1KOjMeM8XOX9IPBjaYAFWmxXITPLanbzNrBhdcE4kfHAVyTmmV/WgTNOGWlIiNnHkeMNznphxIcJIV6i1mbwnwTOf6hvOUpPQ3d+ru70GugLIEdToIoMZnyUTH/wYtNR6iiJXFmVLd3NMAnnDc2zYM/Hj+5cZtUFDGuZQpPfA7UIFXY05HF3/K+s3r9LgYYQvVpAbEPyQ31irJzfuHKCLwLtEdG1pqtcb40J5OrcHZ5G1f0yX3b/z367AtF9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShT52kYITw8nuwj1VyzbBx5GoNdW36px4LWUVvMpFzs=;
 b=A+ve/WuAAd6qCFAeF5Q953AyZCah2uJQg1we+j3kgUyKGMCaBxcCGphfS40/md5qFn1ymFso0dvANulU3j9wf2SbQEc/c95b3QNeubRzu6DsCrm5yjYplqSZxEbGz4r4X3KOzf+yjMwKyR/3zPVwofjVtDsDVodetSq4XK+zWwtnMJZQoTEafJ0YH1DGuhvT8/PZ2iEAK1ed9TQezuSar13ZLKPCSkSWteitZbusO9uR5s14nVRf7Ywg5v55pPHiUssxN5ObmXxJMQaNerAg7n2bIikrktqsZgqXF/0aQ+eKqeXJmdL0EK89ifysi3wMpQ4tFCHPzywdvHcYaSL9gQ==
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:9c::8) by
 CP8P284MB2735.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2e0::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 21 Aug 2026 04:13:05 +0000
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f]) by CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f%6]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 04:13:05 +0000
From: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
Subject: [PATCH 3/3] staging: octeon: remove unnecessary parentheses
Date: Fri, 21 Aug 2026 01:12:55 -0300
Message-ID:
 <CPYP284MB0854FF3AFACD50D8195E9BC5FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
References: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP5P284CA0120.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:228::20) To CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:9c::8)
X-Microsoft-Original-Message-ID:
 <20260821041255.1616843-4-tiago.panizio@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPYP284MB0854:EE_|CP8P284MB2735:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4016ad-6536-409b-9fa7-08deff3a7fbc
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|15080799012|51005399006|12121999013|24021099003|23021999003|25010399006|5072599009|40105399003|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+8rCddeydbQC8ZRRwI3JT1Q3FJmoPcj4hJV4XqbGc31FLJd4vky3sqp+1A9f?=
 =?us-ascii?Q?0czyHsKA7BBrjnfmSWwwumsx+uTKxny1IDDtYYx4/v1J7WaMK8iB5eAGXY8i?=
 =?us-ascii?Q?B07usHVHY4L9Wjqjs2rAuvnTbwbboIjR0FI8JlZ0AqJaRklbgdrMO8XfdjDd?=
 =?us-ascii?Q?2bkGIljwtRzoorEf24JQ+xdo/U9O1ATaH0s+TK97wNI9tJs9nCdG/ZciY0Xx?=
 =?us-ascii?Q?q3YIVoh92WF4BcCvJtwh4OMVpG1sXOGJREJ7TKWTEOWyVTqX6sMt96Tpj7su?=
 =?us-ascii?Q?lJq5RvJPXNKCOithWneuJsOFiBCxxMoQRtV6aVfycYaDlulIkewPwxHzwbDv?=
 =?us-ascii?Q?OSG7yTJ8tGQVrn2/zEr8ldSPXFCSeVBk4deraQkr3WNsRHnwGmyl/4PU24QL?=
 =?us-ascii?Q?Um+RX+BWKctH32MLEZsKhW04MbbWmv/51OvClfM6kp96qoeXFgErzt58Aaxl?=
 =?us-ascii?Q?d+7jrjw9nRjSvRkUcU2QlEwziNB0BHfTdUE4hmPkwO5/ix6VIRjf/nk4PcUD?=
 =?us-ascii?Q?6mAYoKWT9mjpHgpc0+fHqnNjFb73ZL6QS3TfNhDozfbnIFR8Kpwv2SAiNjrE?=
 =?us-ascii?Q?HnU4WHVB45tlpjK0FmIEDB9ZI6EsVQiQJRDAEt9Gf+aAfoHOWiHF+HK5DJGW?=
 =?us-ascii?Q?JIxwc7PXV/XIN6oJuizrQA+Nm+HNlFo1MSTj3vP8Mju+B0bTZ70FCub/WQan?=
 =?us-ascii?Q?mzNUme6NUvl52m2rWKraNi4fScioBrQWskfUIltbT9iUE92PUh2oQ84No461?=
 =?us-ascii?Q?nN/T1cFexvsqJpGLo+F4PUXQvd/skWSHjhHQhLVpL8Vp5/0ddoWupzBsP8ny?=
 =?us-ascii?Q?zoX86PiMQqgxNie7h08ulYa1Zo2v4iJACXvl1zGG6t7aTpFpNC/LfYZ+q91o?=
 =?us-ascii?Q?uPQ4kf5tCmXz1Phx8MqtARBJgzFgHpkhV3IFwUhIvyUKJsSC9nTuSwIXCjrD?=
 =?us-ascii?Q?ocMbbkENp2YHSzLGKaOSHtaPqaCc92xsBmFzb5N8z06NhsbG8hTotUvBUZSF?=
 =?us-ascii?Q?/h3c?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qj9rW597fRABx0mxnuWlGng1BHm7rVzHdF0emCX5EAWoUOqWW5eRatvqAmKL?=
 =?us-ascii?Q?AlfjcQpj71otwICD1+woKsaSl/hh97HoEF10nZ8kO58ASE9R0xxlADERSViI?=
 =?us-ascii?Q?HsJVBxtFw+m+SD62hNBf/ir0QChr9MEhY7QIEd1UBvxGwKGLzBh+ZEVIVeJr?=
 =?us-ascii?Q?0hWjdsQ8VZ9Bls8i5sQcIOr07QOKxw8eHg4AZ0cntzjz0SgiQFWgPBzvcCCc?=
 =?us-ascii?Q?4MNgKU4NBILsglJlxoERLbhH3z8xxNxGlX+5+JW/gJF2ThVvUnnRlR25iADK?=
 =?us-ascii?Q?L+ekKzA29VtRADWZ2MdUyP7gXcxRT/xufMwk1zL8cqJKTIVGr/MKIY/JFf+L?=
 =?us-ascii?Q?4lqaoNjh8a1Qw5aLbFPLwRrBVAGrGMuGFup2a9GpEEVrL/Lib2iZNcxPfE88?=
 =?us-ascii?Q?wC5URMTTnc2eMiLemvDBCIP2ijZkSLqte0MN55iqtuFfBoIFjuSN3uRXcFrj?=
 =?us-ascii?Q?YivH78GDCI9haq4prK/LuTNikGBZ836mC/a5r0YaU6mJDulso/oOdfaY5siL?=
 =?us-ascii?Q?e7EZ22J91w7v+KaUkaSqQtcxwLEHJGBnyWRofcY4Cbof+Dfk/CrDJ1/1I4SB?=
 =?us-ascii?Q?Z2yq31+ZIZtErR+GujY9La8rl8bn9rdX1B1T5cE9AAIVg3IVA8a9Vp7sPOsT?=
 =?us-ascii?Q?ypjybnelBZbv9JT1xZUTZlI/KLC6h5DGumYue4EVm0rNEKhH0BwkPDgePeKQ?=
 =?us-ascii?Q?NEU4NTlzLUotrQHqr6hoPiBgC++D+MEFUypheBPyOVqdFbprlRuUtUXiHpUo?=
 =?us-ascii?Q?MDU+QDr7Ybjrjy3dpD40uj0CwICpTZNL9b79HYHha2LN9olRNU1nTtPLC2rt?=
 =?us-ascii?Q?U5hgAquXrxJAeYUst9wYimDdZUelTP+7vfyTIw4LN8OpmD5IgmmQk2l6zKKg?=
 =?us-ascii?Q?QcEaO/bDHl+b4aC1OTOVuUtGzKLz6PDjmXmrUg7fzVN6KnudQHTQ+2r//AVH?=
 =?us-ascii?Q?GskDqNS1e5Jw9v6SsMYD1lb/KCPuY80W9d5pLWOD4i3HNRPPt4BW3+cKH0I6?=
 =?us-ascii?Q?ZX3iaZHWxp8/NkfNzQlJOfabJc+OBdc9HkerWsziljQnxZnRLWTeOLUPVrTl?=
 =?us-ascii?Q?ogKtmzSWTY9Qi1mxukkmv2TZ5SOvnprt42VjzlAv9abRC5YArFUmyvas28IZ?=
 =?us-ascii?Q?nScsNgBXaZIrU30IF9oklhEoCSz+27z9AkBb4WCz1FXr8PH4fNGV6mN9WWh2?=
 =?us-ascii?Q?yBFLugHEx01Fu3LofB6Up+sXBJDG3jid0ScAW/aJWQCYJasoJIv1aNPkiOHC?=
 =?us-ascii?Q?ogt3DWMuMh+tPWZDSITlD+trP2JTixZQYPcm9o2E+eia7Y+O+pbcLFAmyb4g?=
 =?us-ascii?Q?zCZv6l6E4QjOsio0tp6dajRyHYxRtUCkVLTMK7DCazu2iWe3Y7gzxDC6Jlrm?=
 =?us-ascii?Q?AoxTQoD6976Hyt8blMVsR/aRghIJThNWyyFSBZGbGkDWFIjrc6mnn3z6B+pQ?=
 =?us-ascii?Q?qJFwXMt/S64Ff8Bti1RBdacPhWiK4OE88xlFVU6+zRm3hO3FmMDBQw=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-da224.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4016ad-6536-409b-9fa7-08deff3a7fbc
X-MS-Exchange-CrossTenant-AuthSource: CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 04:13:05.3460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP8P284MB2735

Remove unnecessary parentheses from boolean expressions in the RX and TX
paths.

No functional changes intended.

Signed-off-by: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
---
 drivers/staging/octeon/ethernet-rx.c |  4 ++--
 drivers/staging/octeon/ethernet-tx.c | 20 ++++++++++----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 5be43bbf6a1d..e3c773e468b5 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -66,7 +66,7 @@ static inline int cvm_oct_check_rcv_error(struct cvmx_wqe *work)
 	else
 		port = work->word1.cn38xx.ipprt;
 
-	if ((work->word2.snoip.err_code == 10) && (work->word1.len <= 64))
+	if (work->word2.snoip.err_code == 10 && work->word1.len <= 64)
 		/*
 		 * Ignore length errors on min size packets. Some
 		 * equipment incorrectly pads packets to 64+4FCS
@@ -321,7 +321,7 @@ static int cvm_oct_poll(struct oct_rx_group *rx_group, int budget)
 			}
 			packet_not_copied = 0;
 		}
-		if (likely((port < TOTAL_NUMBER_OF_PORTS) &&
+		if (likely(port < TOTAL_NUMBER_OF_PORTS &&
 			   cvm_oct_device[port])) {
 			struct net_device *dev = cvm_oct_device[port];
 
diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index cc20c1e6791f..f13069d6bd2c 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -154,8 +154,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * completely remove "qos" in the event neither interface
 	 * supports multiple queues per port.
 	 */
-	if ((CVMX_PKO_QUEUES_PER_PORT_INTERFACE0 > 1) ||
-	    (CVMX_PKO_QUEUES_PER_PORT_INTERFACE1 > 1)) {
+	if (CVMX_PKO_QUEUES_PER_PORT_INTERFACE0 > 1 ||
+	    CVMX_PKO_QUEUES_PER_PORT_INTERFACE1 > 1) {
 		qos = GET_SKBUFF_QOS(skb);
 		if (qos <= 0)
 			qos = 0;
@@ -225,7 +225,7 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * no room to add the padding.  The kernel should always give
 	 * us at least a cache line
 	 */
-	if ((skb->len < 64) && OCTEON_IS_MODEL(OCTEON_CN3XXX)) {
+	if (skb->len < 64 && OCTEON_IS_MODEL(OCTEON_CN3XXX)) {
 		union cvmx_gmxx_prtx_cfg gmx_prt_cfg;
 		int interface = INTERFACE(priv->port);
 		int index = INDEX(priv->port);
@@ -360,13 +360,13 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 dont_put_skbuff_in_hw:
 
 	/* Check if we can use the hardware checksumming */
-	if ((skb->protocol == htons(ETH_P_IP)) &&
-	    (ip_hdr(skb)->version == 4) &&
-	    (ip_hdr(skb)->ihl == 5) &&
-	    ((ip_hdr(skb)->frag_off == 0) ||
-	     (ip_hdr(skb)->frag_off == htons(1 << 14))) &&
-	    ((ip_hdr(skb)->protocol == IPPROTO_TCP) ||
-	     (ip_hdr(skb)->protocol == IPPROTO_UDP))) {
+	if (skb->protocol == htons(ETH_P_IP) &&
+	    ip_hdr(skb)->version == 4 &&
+	    ip_hdr(skb)->ihl == 5 &&
+	    (ip_hdr(skb)->frag_off == 0 ||
+	     ip_hdr(skb)->frag_off == htons(1 << 14)) &&
+	    (ip_hdr(skb)->protocol == IPPROTO_TCP ||
+	     ip_hdr(skb)->protocol == IPPROTO_UDP)) {
 		/* Use hardware checksum calc */
 		pko_command.s.ipoffp1 = skb_network_offset(skb) + 1;
 	}
-- 
2.55.0

