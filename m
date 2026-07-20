Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012039.outbound.protection.outlook.com [40.107.75.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2F63AFB0C
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 13:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555048; cv=fail; b=izjUJwP8yEDqstvSIi0cW4tM1I8mDp0pmK03s3xz9NjLsL6+WX4XjDzMX/g/Ia9rAKfTH0HaIQPCu6oUOtRfM+FFKqAd0gy/X8qJVIuXzrY/0+v8oxVy9RzHNJ3mR1lbYpYXBb5qgN/QR4tEadfPtIZfLQ5sdsfidd4NvT9bV4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555048; c=relaxed/simple;
	bh=rTSekzz60lzhWGxUrsOVk/Qok7/9OFs1a8xDHojJ2M8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c0gaN946T3aqn8kI2RcpmZLH1P7nLT7oixG/TS4UlR9jB3WkgkQE5sxNyrOICGI1WqguPDn72a+d4kPzTh2+vwj6uTUP7uYXTIjyGnWdZZ38W2W0dD5C8QKcGJ14WNKJaQLF+Xtb6yor2DvjLOIaalIqiuakTkB6w57UUDX0F7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=fpw1L6pJ; arc=fail smtp.client-ip=40.107.75.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="fpw1L6pJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7/hiMp3bmLy97MxwaXfgdX9Pf2HdBiYxAxPOputtRXfZhxFr8g4DfF6U2MGWzw91ybDwo0zPqqatxMXXA50EqfeVhA8oXmNWKANimNPt7uW4lCync3Un/76gsiR07dD9u+5yYDNF6F5eUEdGqXKKyd/FpilPyOqFlxacjTM6s9JkjZbbzR+FdheM1uxWiXC0HvP+APuSFd1Y+dXetP+DiUJwPDQbab0/AKQlW4oawXb9YCeitf3czBrcRqOpGah97m0tr7TmdvlQj9jL9KMRvkAeiO8/cWZ7uH5kUd1zJqBC6P6sv/ocLqa579jB9m5aAwlhaJYz9j/+SMvlhPZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uie2DK89IhwEufT4MeoGMEiv4xsg+vs9BihJcLJ1mc=;
 b=N0X265qOMlpm5XfhljE+pQiuWagqX5pQ8R9jnfqlIcI2f3QqinymiLgOG3JlJkxwyrxUlCIRcXxURCufLOdVowbZhnTHY1W+VlCUWltKrMbgbsrnxiZFRBD5ISbdsoCm1BRSbN6cC3WWa5ijadVXXsqUVFBBitqhmQ3OP2eDIMcbrvdn9NiYRVq/vVZFocB2oWS8/NPIe6RuZX9mWhronE7g5OUPZV4GW+tqK/aArVh2yoEFLUoBea4sI2yWM/MI1jZSpZ9koxRkx/TjdDvAZZiO1iGisS1uSpVoxr0O+2dWqQJwmOtu/QaSpVrlzFGsg8WDOnt5mMUSMPL7Ef2FGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uie2DK89IhwEufT4MeoGMEiv4xsg+vs9BihJcLJ1mc=;
 b=fpw1L6pJChMdLHtSMJj2p04XzyMqNM0y+mef/2Ep51UD7TQ3spu3Ub+W0WiARhm9m2cWkaMu7y7Xk/ZjiKKvomk/X2KnRLavj9uIV1D9WTRtUL5MK0bagwVYC3eHKP/SKDSv88pAR+z/zxLEa/W49DjQQRsung1eo4VCHvk6iLYWh/7EczC486cSgAuZ2VR5NHlxuxEaFb1qTbHYFcz8jvUk+5O79pu85yIqa2Nv+UokwOdQj4llN0iZpu3RnM6I0gjo9qzjsI850GWQH2yMjc8pIddP0NI9kDtHgmEaYvyX63B1CYYXLTsXNApjKBn87vD8E+dO810WJE993SOptw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TY0PR06MB5457.apcprd06.prod.outlook.com (2603:1096:400:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:43:52 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:43:52 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 1/7] staging: axis-fifo: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 21:43:07 +0800
Message-Id: <20260720134324.239391-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720134324.239391-1-panchuang@vivo.com>
References: <20260720134324.239391-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TY0PR06MB5457:EE_
X-MS-Office365-Filtering-Correlation-Id: ef26ecb3-31d1-4488-ad59-08dee664ef85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|6133799003|10067099003|56012099006|11063799006|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3UGV2k3sKhJmEkmR+4Sx6ATcBkO6nAY+gu6VntIDBqX2g7pufbjuIbgSzlq3cmLnMybejG0CpMv1vNWiLcaCFUe3IBnJrgREZc5woViwtXvyAvIvOIoZlM8bojZWwxQ13jfqA3KfYvFKhiQlRzTpKuxXbLAxA/ZYl3B5WS/DCu/DDyAIoXhyaMbJqRYTRhZ0Xq5XcqWL0TIV//QwWOVqqbCpqbCk6mqIUBRPTUgk6KLH7TkwuiKVYyqxYJAvTSd74hYnCdVxMFIvFsLZEHggq7sD36H5nAnbQ27oiwiz5ZT9iYUlSAJDkPzhhWlYn3lGeSJmnQgG/DskAeyioZT9yxdd1++YZeT/PGyH8sXMhRt+HZzxTXumWyTcRAIqk9Sq5u9VvTrUGSG/wisM6S4Qbc3OXZzpOCdt05Yu8q/oECrCqi2UddGQPbg2zikMbj0/G0c+GqMrrJB1XPDKnI1QgqJ3MgxU043GGv2ntvb61QhUALqOqjP2yXCvqTEaEMp0R9Is5M8Fmdm54jNlaw25VqQ3+PkrkhH6WjOg7jzHrwgyhg0ugeF3fhSQtXizkUpzWnfu06RSw+TnJOy96qi/4ywm4DWTY98nfSBfh+Ycpi3CF0t0r4SmzIwM/scksyrzhZmLYGL7OyYqXKhcEiC9j8rs2YwHclTV/cBKYOdqA0AHFntOie6Q+c//scTrkYELFynsaLnkdumuD71BRrK1FTki4/E17Uzhlm1revs9Tn4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ONDcP5VBbM+N9RIjGOKwYPiZe3ThcJ5Dqh0mvlrLpGxHqPyKSuuk/gQjR9bQ?=
 =?us-ascii?Q?3S1luFjNvPGvRRQoAPzYgG1ZCxfRwqh5PGWHLnYIKP0LtP6gkxL0n5pccpMC?=
 =?us-ascii?Q?v7tNsv63gIRBhamehqqngWRvkXEMIwS6TO62Bi8sQKT+7HsVi6SZtIu9/Gnu?=
 =?us-ascii?Q?kkIQZwtRBOE7yVonKAdIZWgsy8A0Ke4cywNvz9zxPLiqwaxmT/xQCAkhnC2T?=
 =?us-ascii?Q?LkwFJWQnAfhNrASJ0xONeoih8GTXun9VLA+JEQMbhtRn7CxFDHAPCeBomR68?=
 =?us-ascii?Q?2Gjo0aKM6PXxtppj9GN/tikgCYjlxN1cN6K2W6l9jMpsbnY0vFQ1L5fRkYOB?=
 =?us-ascii?Q?x8lJ0e5ePbe7WQUVsq2Ipdg9M61Jo2ZBfAGH8vrKFizhn8jOCoTNWo9wuirc?=
 =?us-ascii?Q?pUDkONcwaKoytXLy9PHwFwog7YKgmNfRUtrZduPuNbC1UTKxNRIMd0XsrPiO?=
 =?us-ascii?Q?f/qS42xEEGXc6iMgEzNGQj6fhI8xr0AzhZRlE3riTuGhuqLjehV/A/tf2qeq?=
 =?us-ascii?Q?pYxhiAsbhR0cOMGrg8gj100yExIc5AUYlvPsHaCt/TM2i0TjAhmxZ5nTSm8x?=
 =?us-ascii?Q?axmjXzrRo3zMfUhdBqGpnNyk1dLi0pLDlz+ohvK4cW5xY/ZkK9fjqpC3G5Ta?=
 =?us-ascii?Q?KBEhKj7mw54WSwmGjxpDGy+LAfp7jBslivRjeHRgHtInlpCsRmJ6c6X5QRQc?=
 =?us-ascii?Q?OWB/Lypa3+ypkqOz8Ulh77nHMPkFv2KOHy3u/a54N0W15Y3kIBJL6xQkbG2J?=
 =?us-ascii?Q?OckCzEd3cBtMbAozEnyi8wR0Ir8519wsBjOkRNy0Av9ZxeSzWGWF5OJ9UyuG?=
 =?us-ascii?Q?SpYIIvp/1g8da+2qOfui/ReV+OuVTJD7d5rZ/vJJtX7Q6kRuQVmrCVnDqHpa?=
 =?us-ascii?Q?Y50ZwJDw/GWxvAr6W7KTTctkenG1qMnTnnP5G7VtAeoa3Fn9LKfz9qMg1i4J?=
 =?us-ascii?Q?U5dgi+E0MepMj0Sl22mWz3Py9Ej765u03FamZNKafJ2880Q2X24tr7/NjHnE?=
 =?us-ascii?Q?PMkvWxoTfOP9wFShqP3mVe33kwjBHo7ST3NMH73cPZWnn/TKU49xQimvilI+?=
 =?us-ascii?Q?7hdJ0rUVNCngPsnT/NoZoJwjB5Qg66CXiyY4PNZEyJ1gdC2s0gNgr+3BIscu?=
 =?us-ascii?Q?fopW8+ztDFqp8lmqUsFsOcn3iPdC2n6EQegiXR69EWwOjAKIX/OwXbTA+1L5?=
 =?us-ascii?Q?IQ9rWG6yCiy1piXrnnuJ9rRxH2RcVbyjPJupNotxHvqwLKA1ujkudjPMgN6z?=
 =?us-ascii?Q?ejkQCdsKJNKn5JvgjnjBDyA71blu7+giJb3MucuAjxMJ+EzjkBBHFD+SWNTi?=
 =?us-ascii?Q?VQZb5KttDdq4RzQV4HjxQOkYkTqH0qyi+M5nFg59mExzAy3nZIBKc0ylKWhA?=
 =?us-ascii?Q?jzGvU0+1CDw/l0h0CyvkEG7NK4PDlKq68D/b4CpRQ5dFPwXULqrKX3ntLmzT?=
 =?us-ascii?Q?DlQGqJFiAMAiNE75O/of9sNA+Zis25Az90Y6e4x3fkQXyljo3MMp3xzH7xRZ?=
 =?us-ascii?Q?xBRIJqMlbWC3RJwxxUt54TYJizNyV3ZYnqw1KKu2LNvpmlbVZDQYPAUhb834?=
 =?us-ascii?Q?cxgida2F7RAcU4aeaovV/CnL/QOgoh3YrANLMsxm3sPwTA8op8cM10huqZ1u?=
 =?us-ascii?Q?nf7P/s2Z/NNpxyqQRbfnS9Am4x/aEFo+brT8TEqt+bcLmE/y+fY/Gm9dsYjZ?=
 =?us-ascii?Q?sVcjWs2ihjE8KvC3Je3kSaHd4UapskX1nGZMO8UV1bXzm/elOG5F2WqLrw3T?=
 =?us-ascii?Q?nkncve7NTA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef26ecb3-31d1-4488-ad59-08dee664ef85
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:43:52.5357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYhfgmXFOKl7iXhGXZih/fefpXg4iBMP6BHY/jKPWX+yON5+zKA57OFVZWWuDs7R7Bn24CnarK9J5c3z5SO9/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5457

Since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
devm_request_irq() automatically logs detailed error messages on
failure. Remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 1c34de020cf8..ab2f54be1dcf 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -465,11 +465,8 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	rc = devm_request_irq(fifo->dt_device, irq, &axis_fifo_irq, 0,
 			      DRIVER_NAME, fifo);
-	if (rc) {
-		dev_err(fifo->dt_device, "couldn't allocate interrupt %i\n",
-			irq);
+	if (rc)
 		return rc;
-	}
 
 	fifo->id = ida_alloc(&axis_fifo_ida, GFP_KERNEL);
 	if (fifo->id < 0)
-- 
2.34.1

