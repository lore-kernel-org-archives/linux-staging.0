Received: from CP3P284CU006.outbound.protection.outlook.com (mail-brazilsouthazolkn19012055.outbound.protection.outlook.com [52.103.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1CE37703B
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 04:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285590; cv=fail; b=UJSC5wro0wzq09nMtgzDZUR1AgV/Jc7WmIlPq7c1NFBrIjwzGSRXpuLqEX9MC9amLPX166BK9wizeizGU0AxCEf3Y5AG7S3VW/tE692gzkh3V56ClGYHynPJ2LcEb4D050RECxuASls1ZONsZCkHn0s0rEcfR5ov/rVLXSd8+vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285590; c=relaxed/simple;
	bh=5AWDHoCLKDGvKqIMFj9SSaEAKw6XQfdwTu0o1MasnEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E9uYuaHcpAXd3Kd/UiETXfP5YDri2sWjfeKc7KBQm5adORAoKdttqFr51VJWqVuHC/XmmHn6ayvMgAdggBgCtpVe2zLxieHdSiDHhfCCmpMJZ7EzaSHX1oYrHYoAmVVDj7vTuwXGTxi+OLRjTXVXJRqFiS055iZgrLJQVciZKDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=oVumV+1P; arc=fail smtp.client-ip=52.103.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="oVumV+1P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olN2wAqN74uopZBUHiI9JtBUKozgkEf2ETqA9J2jh85aBsC1pTMpvcByWPUwvYiXeAU4roOfQQghZrCeJ8Ess2rpcZzrmmKRgRiCt0SyaVpRon3P8/cKSQrIw1aZgmWOrrlQ0qCbC858nUUDr+xLZhR/5xdv9TR9d3aV1eKz3Yz/wwecE7aDXKi2D3vrgJAjWUbqEsPspAlublk+J6Vonkvb9SHLU4okNBZwv8XpvVMI+NueONSkBSqm0dsSHtRBB9YbvNPE3Xy67jWe+tC5aaBVUcVWajovkQABPw804IwsGe+Bq37V2F7gVV25scO3qXF5QdkXxEHiVLwcPWlbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pc3kTTbZ2Yr6cN9H3/gyBUnAD/Zvb4RMrWcn2eYaSg=;
 b=QDWVrlj/kY5z3fso928JOXphn04nAY5IzAvfQtacDeUv6sNuweXZidtFGxJ1A3yQqKaomM1n/fDbrTtDcAl/hWwGj++tD2l3HvjQ0+FHUnYUi05LBW4GiumRQN0jYBu1U5TzjrRZdKgfTifelPrzTL9phd4zt9nwmILlB4od1M/o0YApnRnvAB93tg+bAXLWsRXeAhe4Bf1X+UcDjHbyDp9NivOeBH8/KVFKqk4X29eUjX1ApqlECXutcd8p1RbK7WC3x0s9eEEhBmWvuYkdIoAoRP+YqpZHPSh/ebxe5wqiLEJtfLGvH3r3DcacjNSirfK/LqDQwiNzWP6gz+GGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pc3kTTbZ2Yr6cN9H3/gyBUnAD/Zvb4RMrWcn2eYaSg=;
 b=oVumV+1PZ7MSOPoRxpOoy076YJvcH27TOSqJgf8qvujVOzWxRBcJUka+wgvaQuQh41XEaf/XxHHQD/DsA5dLbRanVJRh1iXhcHGNZLFRjaQxcgQ0JPF1PLKaKIQScQP4ly2JC5TxCq/skIFgD3c8+yQz69RfXcsOQFBE28MKYv2woHgaeO7iGvdoDsc/t31qLehCU2wReAfSrUefS0qTgNM/Gu1fmVsXwj+yFd/umuK7LYKND3prdfW7j7vsHmiUCM6A6v+nR3Bfo0l8kk1UqbZ4tsVm0+d3/Ey8/xT0OWyGE+zOuUsxzLUvMv6Wu4mr+beyMBprkhekjT4XxFlHNg==
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
Subject: [PATCH 2/3] staging: octeon: fix RGMII condition formatting
Date: Fri, 21 Aug 2026 01:12:54 -0300
Message-ID:
 <CPYP284MB085494E6AFD263CF9BC8E9FBFFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
References: <20260821041255.1616843-1-tiago.panizio@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP5P284CA0113.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:228::14) To CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:9c::8)
X-Microsoft-Original-Message-ID:
 <20260821041255.1616843-3-tiago.panizio@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPYP284MB0854:EE_|CP8P284MB2735:EE_
X-MS-Office365-Filtering-Correlation-Id: 741f0e11-ca68-4e18-69bf-08deff3a7e9f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|15080799012|12121999013|24021099003|23021999003|8022599003|25010399006|5072599009|2607281247196008|3071699003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?haJ2PSwg4t5wklZJspmHZlkNnhxv2+RSjwh3NpwiEzg5bjh5mMf1J0HqSZVr?=
 =?us-ascii?Q?2ktvsPpn+wfh85INJDi2vTPlK5cV3sAYVcCMaQHPaXDrS9iUX/O/yyr/urnQ?=
 =?us-ascii?Q?m7XN4n5hAqReeM+8jkw2x0gODxUJI8uCzh1eX5aQVXm3lUfLCxIzNyiv40Hd?=
 =?us-ascii?Q?09qWdGC/FPXOJfyVZtiYZLed0db5v5geuaQHaqD1F2bD+MiHVfQd1vp7SYon?=
 =?us-ascii?Q?kpf/+XXOJQpBR+h91uXqv12BxZ5fpKD8iooVii1+QaxjltdmyTXLYCU6W4R3?=
 =?us-ascii?Q?t4ZAFTNL1chvAbHP7udKOGro7w6iafGetqY/kfqtUZ3c69yJLEC0kqbJyg+r?=
 =?us-ascii?Q?3AIGPGkuToIfPzcb+WYYrP+rdLgniR345/nioJEso1gWZBEz5ndv9itSO8e5?=
 =?us-ascii?Q?YFyhfl3OcXQIahl+2G/EZw66VTIzK612MEl91Vm140zNIafkQcu8kPFUy1bU?=
 =?us-ascii?Q?hVZEKDuvNnsKgnBwidpXe02SSf57N6FVAPBAo/PRmcQFPyoPq2N8zTWA24vi?=
 =?us-ascii?Q?huNph8z5A70Sv+Hca6fOaRXYXbhauOkqCNjoTCzYu2+MebC7gD5J7HexynAo?=
 =?us-ascii?Q?ycDt1K3VMRG3OzA0csM31WtM1QObmd+BHYejtdef1bzDtoz+8gPfSV8AMn3k?=
 =?us-ascii?Q?LbWxpH64stlHrXZqMkya1GbKgOKnAMqjVTCTFei2YnqKPSZydI0NX+uE7KU7?=
 =?us-ascii?Q?0c5G8q7pttVmZBqlZlFWkn/e2f9nSIq6JfhP26wb/EnSRY8gmchtG0YcAAo7?=
 =?us-ascii?Q?hHLAd4jWnRLg57G8ysusROo71xEFzQ6ssO3FzLuwj006mnQauNFuI9+tN4ot?=
 =?us-ascii?Q?WRQO1o6ig3mZkXmzlCbWNLBqTyoEmLjok5NSE/y9IzJcumBTdDysKkJxZYzA?=
 =?us-ascii?Q?xR3sYTyk/Zd7qx+skaCVPCDPbwHjQNNLJ46mqjrMBy/HlvAIrXQvFPQ4DXFl?=
 =?us-ascii?Q?YdxTy02P/uLebh76EDefRa5yB2PxICURnBuRa0TzbskJEPfpLoEYpLZRT99h?=
 =?us-ascii?Q?kkrU?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dlh7Rhda0jRDSSi3usG9uxt5lUoVIf90DIC0HSaVVz1pOa/KMMB4Q/TNNsQw?=
 =?us-ascii?Q?gHO6ieTBMSMg7iStCY0wkf97ZL4XLQwiaShyGbWhkJItL5//1AVx7QaRN1TZ?=
 =?us-ascii?Q?/5D7cJUsTHWDoaFTfwz5EBnMSGmD/4w+4hjKYymJ5yKG8lih8dNpT7XBo0lE?=
 =?us-ascii?Q?vpp/6yCD8wDKS0Tm+njgfabIHU7vFW9Ow3PYu7ZNddVw0Mn0ecTUWdl2bxh0?=
 =?us-ascii?Q?hQB2Tjodx1MSks3F68d5YRUdP0IwEMTyxM2So9GpEz5fPkZXITK67jTpxkDX?=
 =?us-ascii?Q?gzna83zMkihVi+VqIjf0YfB0ywwDPG6sbG9cTFTzN/KkPpi0OGEkjQ9dUshK?=
 =?us-ascii?Q?GUSn9K+azZnO8dDMD4VWwq/WIKOwEZeADs5qzuf/UmgExd58bA5HtWhOsYg+?=
 =?us-ascii?Q?LgkAInNC2+D/xrTQVHo/i91UY23jxlIV75xBX3bRZs7GNfQGIt46YxhJp6k5?=
 =?us-ascii?Q?Qcm7E6dJDDONIgyKv/mB33dqLKmO10pGmFFXe1txFFKihBG6isJ+BXeLtKWM?=
 =?us-ascii?Q?bdKLOf3+Inz5Q9xC7jrtkgyNTQtIKBj9OD7xCFq5eJQKcgQL6aRtgXNuMAD6?=
 =?us-ascii?Q?Y22fFVNG8MXEFYCNf/EKkX27oJumu/pO2Y5r+eYYu5L1HrXIV4OvB4hHSJ7/?=
 =?us-ascii?Q?VjEqThMMVxvzyhjt+BqvyCzeVpdwMUXryYZ5YNoVUyhRyc2nhQAaN/JVWW5i?=
 =?us-ascii?Q?KOdrEQCXzf3M3X1eLGVec4U/jTrakLvSM6ZDQ4+gQLqHXDk0eWmp+RNhwaXh?=
 =?us-ascii?Q?MeBrufsbQQbsrEZoI5QCanYytQdG4MhwxRmkDbU5ua1tJK9NEzyBYz8K54qA?=
 =?us-ascii?Q?9aEFt1MbmFyW7nkyTnLgTcLG+cl3Nn4076YRHk3bKmdR4fZn5AsTFZO4g5ZD?=
 =?us-ascii?Q?SfMLvVcUQy8FEvDXXNrc36m9P4z/QpHaVm1X2t1uZ6naeBq9Cmf0ZcJNteo7?=
 =?us-ascii?Q?hIxStHKLAy16ZLGoKqlLVps/rxTDbX7mkGJee3qbecPRmdw9Se5fP2N6fM4h?=
 =?us-ascii?Q?FZxmsO+if/F4zOFVcMds14eXYWEYTf7PXpVEGLGRRBIKTEirOC0pGytY6RpJ?=
 =?us-ascii?Q?DDkVcz9vY4iRZ5iwKaqwISj722RFf9O4SiUvvcgK1peT9IV9gEYklTyOlbWE?=
 =?us-ascii?Q?dwDovq7kqNVgKtwe4pCWlKg6TenXh75kWwLmDXIqcrifxVXQ8Elqq8f0hizw?=
 =?us-ascii?Q?upY4p3BnadL/r2HFEEQhqpCEvk+Er2g3bw0j2q+UL5XB2zm4zpZtUOuhbPYG?=
 =?us-ascii?Q?qCLxf5Qvylp3N0NIctYDkoQGYueqClX+byBIbN5Fu24f7qYPWzOurzLYIZk8?=
 =?us-ascii?Q?VeHri8wFxa74xaqJpxGggyVx6foZaoftrcTpzNnzWtzD/6inDj7ZXxSVlyM5?=
 =?us-ascii?Q?sk5ua86Waha1WHkYGk9nbLz6+DV3j3kw1zUUenbiExeKTwNhMCupF2XgjClk?=
 =?us-ascii?Q?EnJN/U49I2ashppZe4IXqvSLvTYcbGZ8LYGstSkDNZhW0FOu5YWHNQ=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-da224.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 741f0e11-ca68-4e18-69bf-08deff3a7e9f
X-MS-Exchange-CrossTenant-AuthSource: CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 04:13:03.3815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP8P284MB2735

Adjust the RGMII open condition formatting to match kernel style while
keeping the existing boolean grouping clear.

No functional changes intended.

Signed-off-by: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
---
 drivers/staging/octeon/ethernet-rgmii.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet-rgmii.c b/drivers/staging/octeon/ethernet-rgmii.c
index 0c4fac31540a..909af74c99bd 100644
--- a/drivers/staging/octeon/ethernet-rgmii.c
+++ b/drivers/staging/octeon/ethernet-rgmii.c
@@ -148,7 +148,7 @@ int cvm_oct_rgmii_open(struct net_device *dev)
 		 */
 		if ((priv->imode == CVMX_HELPER_INTERFACE_MODE_GMII &&
 		     priv->port  == 0) ||
-		    (priv->imode == CVMX_HELPER_INTERFACE_MODE_RGMII)) {
+		     priv->imode == CVMX_HELPER_INTERFACE_MODE_RGMII) {
 			priv->poll = cvm_oct_check_preamble_errors;
 			cvm_oct_check_preamble_errors(dev);
 		}
-- 
2.55.0

