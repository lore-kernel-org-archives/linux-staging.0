Received: from CP5P284CU019.outbound.protection.outlook.com (mail-brazilsouthazolkn19010003.outbound.protection.outlook.com [52.103.21.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A122931C0
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.21.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321063; cv=fail; b=CiGTYe0yMaEgI3ZK6lH5cLG+ssryR4lWhbY8FUw+giWYEBC2n3ARzPhKuABaX6jajzbSS7lPxsYHTXzVsfMrFOk5PFYnRfFvYuKL5Cgxg9PIlr+/BWs9E9/CYX01wog473sa7WmaCC8e+5gkfA6FVCU56rT+6k6ex1ntJFTVmUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321063; c=relaxed/simple;
	bh=7rrQcCdR/1qg7Oszv9Lxq6P2eM99EIl7ZQIO+m0Gwdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XtLUWZdMwmHh5Zo3cesVCYl2+SWkro0sW1UrkCuZXNzacvRLBEzkomRobni3UY/lKNVjAq82KtIxOlwPV+6EzyL0f8t+7Yp77fTUJRkUL70CQr+IUiswwKQbTxu6RFuuqwJ7Jwy39nsi8Bc+AF3++2OXinCtb+6FDnxs4OyFV3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=JLYAK9+v; arc=fail smtp.client-ip=52.103.21.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="JLYAK9+v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lefxHjjretsqHcryLWS4ThZHfv0wHScCBsTYHnr9aoDjQzSbMP4wD66qN2Sn5CUmu3rpRZM7LLThv8EioNoiKEs+j5OJzpSOHXC0l7o36nmByu8RS9LITcRq1R46HL4pi9Zn+UdUbQpN4764ufaPSs+ozHkkKZMsh8gPVrygRbfenK9O3poGC6j3rUJTQ3wHI7NRyN/7xjrqfKXB6557XaJb/vRB15mftb/4KKD1+UuCnHCCHq94oZbNx9fNj1G7HGpCxtZil3RERCMjUBDuIyOdvU/F9P+Y172qjd2ZjIZPEjj+3P3roqI8TL56K/joMGnbDR0qcLd7O7cL95/f3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXP9p0hHgmAIRmMCqbGBYJTOy0b+fAzRYiHJ04GvWKo=;
 b=yj75LKEryJiFYiDP1dwCcs6VSaclxfdwSTbDTFPQkHBvVjpWP22R5GGtX286bbmARV1Z11iTbklNOwbwQu/AHYA3sPrrs3hFjQVe6tV3gifeLKLX55OyXNciZlOb/eO4qUZoiS/snY0I9ziqLBpWhEqM746MbEVc1+DbhA5aKyCgFdWR0WNbo29LT38I8evIpo3w92+5nygXiAbnAbmsvVwBUZ2iw9ro43lKAKZ79/jId1WttaFpSuMpST9s8lekuI2h2mJVPrnY7vCA1GSZHa3WGA6w7aMP/tZhTju1hRTfuJPWrAobSoOijIF0fhqET4lYbU/DY32dyR/NnDT57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXP9p0hHgmAIRmMCqbGBYJTOy0b+fAzRYiHJ04GvWKo=;
 b=JLYAK9+vvWtMIUxXKsJPIanrFml7nS2bKCokznQxqaGWaKcGc6G2XMh0WFMZ7U5U3bh12F1cGSiO9OebN/ljLxIc/s1NMCPk4GzkRCjhyKRDYDloqMBBuGxWNz71/kIbbyZSNmmHTXvPsLECi4+yla6omGtvLWxkQ24urwn57fmA7dsBoxwr5Z9bZfvtFuhHA7mms1Y3LOlm50w46NXSpuaDj8vJ1Gr+fqBxHhxIe6Se8khWt1+h8lNZ76morZownJuu40dUGLX7nX38klmM8g809lOTk/t1NVhLyL1oSSzCqAn8rt+2J2gZ/ssyiGRDYAaI1PJ/ZHMIs1wGAyGhDw==
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:9c::8) by
 CP4P284MB1859.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:dc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 21 Aug 2026 14:04:17 +0000
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f]) by CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f%6]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 14:04:17 +0000
From: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
Subject: [PATCH v2] staging: octeon: fix function declaration formatting
Date: Fri, 21 Aug 2026 11:04:09 -0300
Message-ID:
 <CPYP284MB0854550BAD16664CD1110456FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
References: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP3P284CA0128.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6a::13) To CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:9c::8)
X-Microsoft-Original-Message-ID:
 <20260821140409.1800704-1-tiago.panizio@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPYP284MB0854:EE_|CP4P284MB1859:EE_
X-MS-Office365-Filtering-Correlation-Id: b7753ca2-9eef-4bd9-273d-08deff8d1688
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|5072599009|23021999003|25010399006|51005399006|19110799012|8060799015|24021099003|15080799012|3412199025|440099028|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TqsTXrzqUMqnF9x+ubKwLMPinaxDmGfMlS1L9FKYPrwOBh1NYZ0E9ejG95E4?=
 =?us-ascii?Q?779gNVpedeQoLkOkJ5/tRhUTeOv/BU1Y1VP/HrnrSgh2pz3DjbdUwMs4eU5y?=
 =?us-ascii?Q?c94oewP98A4jNUqwE3ZYJCCtmgfT+tpKHE4gE3EadJiSY/tD1H7lzLozGAJg?=
 =?us-ascii?Q?ANCgwjeMGtlxyOiKfnkSqz+0qPMLG5gbOdWjM7EtyTPhghaOY0X/s0yfuHAs?=
 =?us-ascii?Q?v9Ki7XrTV4CurjtkNbMw9plkPhAFgGmvrQUf6fDlS7vPe3sDZNO9XSJFDO62?=
 =?us-ascii?Q?KGKeaGakdrEcxsnswea4TMT9o9RlI9SDTFzHYtZ4gxIvVyNvs7qT6tjBYnzZ?=
 =?us-ascii?Q?cj23pTH1Q10n8eQfLBRcssWZJMgEzsAuBKaqwbFLvAOnrz93rVSBxn9T+pUN?=
 =?us-ascii?Q?I37bAu+ljaBBWp7KHoDF/2G6OoobxW/56UrKcb9W9jnQ19gQnrlYbPBPkB79?=
 =?us-ascii?Q?MXgZKt5xNVRtAzkuPdUKghxzst9Yfp+RCjavdSBmndDErk0bW4DGyVULyPvp?=
 =?us-ascii?Q?eyGLp9H4rA2+dKEErkjlBtWoXBShnUuAJZvbocuEa3rLq7TkZYwdULl/1rOE?=
 =?us-ascii?Q?ZVilNkfbWKW6npFoLZVO94WK8IXPUideNlTdfWrKdRmVykA8zGhkEV6AHtB9?=
 =?us-ascii?Q?R/EZmHYyRgVnMmIpBaGGpgA+LFQ0ccIzgxp3pgoo1PWw8C9jtujip4CX1K3m?=
 =?us-ascii?Q?s/3rnPA/BEAXYDtFw8UDxKp4rQgCjs4Mt7HyVEnjdkNYzyWgYm94OBxcRh4K?=
 =?us-ascii?Q?LK1Ud58vpSRBA1Rwe3GNsByTFm+sW8ylw7waZ/JRGSwKERTLAzQ02JpvT/OJ?=
 =?us-ascii?Q?Q9DZFt8ecm/ESeHAu/OVnipx7T5SkZENO6IsvPufRSTnHlUoY6xE2Uqk1QwP?=
 =?us-ascii?Q?zQai1VDvLVSPjf1UYY0wKfunjryYK1qUS9XBWryIpJ/6Yzrhnp/qUr3r3oiV?=
 =?us-ascii?Q?n28AX+tp+Txu/TzZZj2P+cTjIm0Sufw8bXKF2eq4DsfW1blL1VjOheLcM7el?=
 =?us-ascii?Q?tIFN?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YF01UHSOEA2V6Mn6sPZvH2snkZdNphgqAaSszIw1ggvzQ6+q/NOxwE54N0fz?=
 =?us-ascii?Q?ZlK63S3VbAWUa4c9fhP2KM0h52oJa6GTHLFhetO7rA3wBx2++WuXf2QuL7t4?=
 =?us-ascii?Q?MS8D8vBHC01EyaYwSrzd7201NI4TgcK0gcDQvKd9/Qmssta+Q/l3QqWdYDbW?=
 =?us-ascii?Q?PCmAjAQKJqZRZxv2KcR9Ft9L2lkeW2W5d7kKUiMUzno+/vA0dbAjeCD5VUno?=
 =?us-ascii?Q?cACUHyIPZBa5HwEz4RdFqVmcFxn4Bawcd439nla2IU23GfskRSMegrMQZB8n?=
 =?us-ascii?Q?O85PyI12GloP8JO0ahuwvIDSmAX4GHhWdaJjsYKDf0ZaLOlYcgMrOh6ywESp?=
 =?us-ascii?Q?bIl3iglZJGDGvnwYmhkMzfxj9hvUFy4kaxPSNGw9+3RKzP2VTsU7sl8qG/nY?=
 =?us-ascii?Q?8be2lSRUEGFsyAZUbVJ/Ef9CC5Ys97ocwM4KG6kdPq1Bmbxfmt0X33PdoG+E?=
 =?us-ascii?Q?11AvgXWqalv51hUn912TakA0hAcXU+kZYQLECfGGibVSXPU8A9DMFd76b6Ty?=
 =?us-ascii?Q?/jc6oAbqkV7nmRLtCKxdENoX/Ba0ge/M9Byfp/3orVkTW3I4E3k2hOaqrUWn?=
 =?us-ascii?Q?AJTNVr4kZD9C3pjAB7gquUSAMxfc1L7yK3ewqtCy9C6pJWN/cVRvPUp1ok6x?=
 =?us-ascii?Q?aZzeo0PTI9s2i1IcmRfWq63hYo0raXeJJ0mMzJXBvklGxkPFRVZRhWCSkkPW?=
 =?us-ascii?Q?6APGq2DfPA5nyxPpDs/CgHkAecQbBRWYgWoQkItzZX+j+2yH5/S9y4hqezp0?=
 =?us-ascii?Q?t9GnEuInpaJqoLi+8Or5tAmrOuDFUls/MaiRrP+Ru+fU011AdgfALIi24iVL?=
 =?us-ascii?Q?Qo7hJlAkW+v+H/gJXQ41ComrO2noLcwOevY266EESz1RMQlK1GtM5aX71cE4?=
 =?us-ascii?Q?T3I7Ls/gmCHevqZWpKeM0OL3N2XfQsS7U6+HIMIl2SWp+qawSvbODmQGFB29?=
 =?us-ascii?Q?YlKh263/XRQoWlxxtceM634n3mqcDnAYfpGCo8pSjPDQ2Yy0duCND2JezCQm?=
 =?us-ascii?Q?rbKFj15/ciFcL9VrGcjX+GdLJFkXTfDscYF/9pji5W6SnRZ2mbytyg8EIXEc?=
 =?us-ascii?Q?FBKGn0TnAXh+58zcihOYEtPpdoFQwF/xWBFv95bDDQdnsHrtaikLMddT5q+2?=
 =?us-ascii?Q?GXsvWqweWcRaTMFkcuhzu/29l8LcTZy2fkkxfOgThIYSb1QaOODW+0GSgB4A?=
 =?us-ascii?Q?Gvg4/BaHJHZtnASSMgSEIBrAjcTY3L7ZqfMZwCJBA23pqq/zT4qEvFFsYx4n?=
 =?us-ascii?Q?yRuT9CdNjLOrAdfsAG8uHklRSZ0ph4oxZNDQBX8bk/UUH3d+5b49/8dp5nNQ?=
 =?us-ascii?Q?vGGfCtDDfNW7TsPBAh9hk2TKsmH16fvO6LwN5G21PKwbWw5goYrsyg0YY7oq?=
 =?us-ascii?Q?zmPvnjrOLWRAbODGiWqFqYCfQL4lw4Yb4qjXWbRdVGR2gdRxHcf+nPxWv8sX?=
 =?us-ascii?Q?3omD55WHBIlfyUp1ry/mOYFhVZ6BZuI70TYuWWAGUZRaniyj6vXVgg=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-da224.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b7753ca2-9eef-4bd9-273d-08deff8d1688
X-MS-Exchange-CrossTenant-AuthSource: CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:04:16.9612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP4P284MB1859

Move the cvm_oct_of_get_child() return type to a separate line and keep
the function name with its arguments.

No functional changes intended.

Signed-off-by: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
---
Changes in v2:
- Split out one focused formatting cleanup.
- Dropped RGMII formatting and parentheses changes.
- Dropped unrelated alignment cleanups.

 drivers/staging/octeon/ethernet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..e668e3baaa31 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -621,8 +621,8 @@ static const struct net_device_ops cvm_oct_pow_netdev_ops = {
 #endif
 };
 
-static struct device_node *cvm_oct_of_get_child
-				(const struct device_node *parent, int reg_val)
+static struct device_node *
+cvm_oct_of_get_child(const struct device_node *parent, int reg_val)
 {
 	struct device_node *node;
 	const __be32 *addr;
-- 
2.55.0
