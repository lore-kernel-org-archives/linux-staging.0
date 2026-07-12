Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013072.outbound.protection.outlook.com [52.103.46.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B813AA1BB
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783882206; cv=fail; b=nHT/8YBJWwK0gVj6trLKH+EgrOxR6OXmcTTVd9BXE5qcX1j28taE2AdJUQL4KM+yeBg7VDtNIYn7nUJA3WFiFcf0SS3lT0jIpsR8tEvIIq8dSckZedhsWFv7akNN8iH0Vmrbns7LMbKKZloGZ2bNHz4bUqWlXrIMNTj+KmQ1oqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783882206; c=relaxed/simple;
	bh=Uu28R/RL1QCHlLqJeeUkXfWogOI8+jD1AQZxp0eRGWw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=roCSFOTdsoXS7oYj7x2BaP5DWI6pKwCDe+EYWpenVTlDGIXpDXEkZffV3Etkey2N0DDJHvIO3azokyUukLdmg/14UiVSgDVhTEYQoX06LLd+kr9gkad7rmeFDjiuHet+7W9ukeRIut7+L9DFonLZKZ2uQtTRh5GR+E18gfTPL4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.nl; spf=pass smtp.mailfrom=live.nl; dkim=pass (2048-bit key) header.d=LIVE.NL header.i=@LIVE.NL header.b=Z+13Batz; arc=fail smtp.client-ip=52.103.46.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.NL header.i=@LIVE.NL header.b="Z+13Batz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL3FwfzNG6+c34t1rU8UlZ++I6O+kfvIDenkC3i5w5M6sJ+QCo7rpsObFwc8pRmH514XIakKk01NtdD3f+uVkDrqA/hoUYpqVyM6p6ZdfaOMIf4UhBbnCJNlI807i+OBHkIXA1xPhDVwaK9QgIvkxcINgMw0EdMwFJ2gQYH18VjvQGRFXO9tnbD6kd4xp19zvy6P4cfCN6cCBKOzRez/C53gd4TcayRZkQoD2+kROJvcGsbb40LCeAHOiAo50gS4kB66QHk2D6lvF0w6Eri8iPxBLqg3rN3Iq5UFoydeDgnHHZSdkpkGBkDe0FpiSupm1UB4jbKQfn10910gcVqOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUfDR5lAEXbavB82NH1IQ+/Mi1X28sFVHWlIlSpsAlo=;
 b=g7trVGvwQ187eD2hjhECxpvLWK6zpLCA5Nb2Ugulv7h5R2YfmbpQL2PNGkOmyNxh+DeCL0fSH2hOJCVuEI9YMK9u7ticdHcc6t1eVjjXjPWU+J2tAddTRPn+FxaMHOpEiVm6rhtKE0zZxfd0hW3i9F85x0gofT2D6yyt/qFV4AfkBsgRu+wyrJuggIbxPVB4hCuU1SZpRV89xJVb3iG8Cp5Loj5UqHGO3VDw3t6VAOpxZJZdsjfQrpnJ5C3sMJH8rUxRVYW//1oo6L5yjeOQChWV0JBykp3TqhUCaSRDqc/F9eqCrXc02UQEX+Hu7DtswKT3303W+0vAvW0v2TWYvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.NL; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUfDR5lAEXbavB82NH1IQ+/Mi1X28sFVHWlIlSpsAlo=;
 b=Z+13Batz4p50rj/8ujFoICRZ8lDdg0oAMR/JgiLGtudV3AwPf48/ITzDiF9I1ufHbw+Qor3uqoe9fYBOOkHDaz94WkUYN6eHUL/t7nqR7GLxvRAAN46ietpCsevsXaVwr3RDG45St02godoUU3L2sg1F0OYVCoekJm6W3on8bx7vRYCobn/yw6q35qbaZDmyUOkV6M/HhuQ72roZ91l9ap1VBKdew/cwjh3ZtlzkiRjSDl4R6E3XpYAyixEyw4GDRbJo32/rnFUFhcwG87zogHdjlWnwJ8O+591rdivUiBwI5rDdTjVOKw1+nUkqP2YGFHfw6UhuChqhVdfoNlOOeg==
Received: from BESP194MB2832.EURP194.PROD.OUTLOOK.COM (2603:10a6:b10:e7::24)
 by AMBP194MB2753.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:6a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 12 Jul
 2026 18:50:03 +0000
Received: from BESP194MB2832.EURP194.PROD.OUTLOOK.COM
 ([fe80::6620:eb74:9691:a8bb]) by BESP194MB2832.EURP194.PROD.OUTLOOK.COM
 ([fe80::6620:eb74:9691:a8bb%7]) with mapi id 15.21.0181.016; Sun, 12 Jul 2026
 18:50:03 +0000
From: Jason Winter <jjx@live.nl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jason Winter <jjx@live.nl>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Remove space after cast
Date: Sun, 12 Jul 2026 20:55:55 +0200
Message-ID:
 <BESP194MB2832DD527B23F20198ECDD9CB8FB2@BESP194MB2832.EURP194.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P251CA0013.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::18) To BESP194MB2832.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:b10:e7::24)
X-Microsoft-Original-Message-ID: <20260712185614.29263-1-jjx@live.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP194MB2832:EE_|AMBP194MB2753:EE_
X-MS-Office365-Filtering-Correlation-Id: 1167f64b-9d7b-4297-9ddd-08dee04661f8
X-MS-Exchange-SLBlob-MailProps:
	EgT5Wr3QDKyfJ5ctroE+AnoJKQNH7uyZpwJIclgDpiaAJ7fJkF8u+yZFUNdOoNzNebHR60UrWvtvSGYBw4VaAQfSCA34inToi7qAZ/e1VvBaTElEkBhkPJnebQ5Szu8UNGW6uFQBa7C/0C69RPElJnIRDODaivv8feMf8fNTFnt5cd8XmRgwqyh4K2j+ZmQ2uyu6Py0k1DdZYUVO/YMaAuFKKE5oXKsdFFnX8SVnCqk9RcluMiTFv2laBoDh+u4GwYeB0m9ROig7BRiAVEU2uQJjMSPOMlXIdW/NJF+UlS//uhDzVH10iSRqnva63mE6at1c1o6vgCSrs+YM45ZXI2QBhdqpVtcoUz/2pOWJ/fm0h4Tuh13RRdEGwJ6AwyQsyYvETQHDhC2cNtYjtL5S7GzjGazVJijNl9Dh/7uQOcCnxyofdTxT5rQhJ5p4vfHb57OPAhSmn4hX8LuW3S/UjbJznwLLDU5+vsLzCpwbrRCT3g70g7H+P3POYJMQxJCPAcR4uYcAUgjOnV+6xnDNVl977XpIpvBxtZebZRYno3k4N6hR2m23tUMDImiWcmkupqh203+Ae90USKg5NRSUELHV0Rn9qltvJteGL0Njdj4KrEoACYsCtI6nNnBlDKCfsJj+0mgDCrcZu7MUh9rTDwE2ZZ1dI3P+/OtCnlgDJ/qIHjrKq98BiwIbaL/T4FkpeEWkSjmQPYl+HZeP8dCzaBkt3LEkH5xoXx77XU5Ufyo=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|5062599005|4140399003|5072599009|8060799015|23021999003|15080799012|19110799012|24021099003|55001999006|40105399003|52005399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d8otzd33NOcGbEDOUYtAE7A4T/KoQFINJylWN0W8bpEJe+hqUE3rcVpm3T0j?=
 =?us-ascii?Q?2U2bp/GeCoHoljToYmz4ZaZF+iLh6fZRBKpLwi0uwYYzxVIacoBOuRDSqxL9?=
 =?us-ascii?Q?SBYHU/+CqCQBEZR1YqUlyBURSMDvMYzjWDcBFnueS6XXmaps974hpc3rRZCx?=
 =?us-ascii?Q?shK9mwFiDv8e3PWarmYtCTWc+TCY80VKWFK1Hxt3ahBtS0M0Tzu3C7ZSk4nO?=
 =?us-ascii?Q?hlH5SZ52Le12f1gg3XbO+kgInJd7esrUHYWOHTTn4nWi/zu+kqxqGDR5oLTA?=
 =?us-ascii?Q?rynN+DKEzn/CNfY+1tSDgkrTqx07NvbaHUZKQAPUkvmBIU+HcqAWM+tJ65sr?=
 =?us-ascii?Q?ZapTySLWNjWi59W29ukBCeqZTlHabBZuAe2l2wengxipO3f9F9RGECHmQqo9?=
 =?us-ascii?Q?b7rYX9LcBof0ecSlRv4dR2xWEC9jkjmdvnhK8+kNfpdeFergLpmg/qMbGsZo?=
 =?us-ascii?Q?20h3JXqhFkcvHucXVgcv9f25ToLx/ls3EXZIZjFT11fkOkSFCOy5rQcCu3Fc?=
 =?us-ascii?Q?+Va33gKpUh7Br8NG8SreiEonsAQxCvqSY0WONWxFLzbMlFJ2x5EHcSWv/z+X?=
 =?us-ascii?Q?jXW5GClzSoOL6FB4mlJA6C5EJW6VWRj8exe5BX+t/0ATyZ6v3cvNhqdJEynx?=
 =?us-ascii?Q?AdSFR6A4fYxWxrcG9OVFzElQvXq4ckW+AuA/7KZR4oUUJVnSlz/hePNwezL6?=
 =?us-ascii?Q?NBoIlgR5L+8Sht92O7tjuvuD6EEkqUwBa+60u8BQjf8hu39llCNv7C8P1e62?=
 =?us-ascii?Q?ZlgaPcB/2Sg4TsIFThtONFmEmqspbuAgr1sYZfxKeDCQKnT4SjuqTXj4OOiN?=
 =?us-ascii?Q?FbUhMf9cRaP/fdKm0ghSv8u2Jnac7qtOq/rpi5ba3dS18ijM7vefA0cAmHZ1?=
 =?us-ascii?Q?26JeeWIoSr1DVRIQCwHcRrw3nsFVnAtbzZCT1TUdX6rfIn5DSn8kiRchy26f?=
 =?us-ascii?Q?p6TD8fKLTK3SQn5p+ir9g8fVHdSOicK0vmIu/zwjTGB3/KqWdGwj05BwC+5b?=
 =?us-ascii?Q?xmjAMXuZXTLOOGAmBoJP8VOQuA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j5kzVLfULGn9oykw23v2N1Y9CezU8IevBGcKG+UJiT7ritMdVoefCXg/Ru1d?=
 =?us-ascii?Q?uafjH6TzRGsY6usNlsNE1/h+NTJCUi2CpPGMgD/0YfUWuyU9mINsVQZva1vD?=
 =?us-ascii?Q?GoJ+sgS6J2u107GoNaH/sBKIHRD0xvRUeLlAEOURnD8QO0pHq6UpwyOpX03B?=
 =?us-ascii?Q?nynmCCrHHciqDdCQvlTDVblN6SSCxSf13sBalaF+hSQsyr6FFQI4ON5vUoF3?=
 =?us-ascii?Q?iDVUio/sZNUV/UMeizf6K5CboS/7qx/M3qCVCqHXTlN8eUAvgjRGs2Bmju/+?=
 =?us-ascii?Q?9Xm9swX5sp3XzQkFITyYvKdTLh1CTmOu9sipaj0bBaq2BMD7jn2Cp7FpkgJ/?=
 =?us-ascii?Q?DxYx45fBfp7AHcdu4sVBNke43alZcgmKMVcLYbWhHOxYN+qb8kbXR0Dh/tkj?=
 =?us-ascii?Q?xhrGSfSEilFhXSQ90iM8P/gUnl0nUBDzGnF0ZdK/NIChdmWJh3cYWT+T1/my?=
 =?us-ascii?Q?liYxnDvSMm4fXjXmg+h5y36rLh+8XWK4vXbGzXuXY4L/fePZrDZyfg14wVBy?=
 =?us-ascii?Q?PhMFlGZ1V3xvuikWQmArqKeyXC1VDtODiMELus5qPJlZPKmrUyZoT+j/YAUO?=
 =?us-ascii?Q?xjV0AsYo6oQGP+ESY90c9rJSuGBcbTZbGUumEAmy1Q1CowsUSvVbbZaLuZ5/?=
 =?us-ascii?Q?InQrCVUmMe6Js16xrEV6Fe+b9szbI89jXD1yG1ubaep9B/mQ2B+2WgcAZDBZ?=
 =?us-ascii?Q?5QF2u4JKuyhPlQQLPhpzTTN1ZS9K/dd+/s+Y1UPYCizoAwiClbJ8Ag8Lat9Y?=
 =?us-ascii?Q?mAL7QlzshOVLuVaMMWtDGEjpUjvMbH8gFCEgfn45z27qwGLxVhHSpFaYjKrh?=
 =?us-ascii?Q?hRLvyDj/lm2JItSeKhA1ooTUQSd9wRZq5JVdCExozXAJyVLXhsev+49KPCBE?=
 =?us-ascii?Q?8+swX4FBzviiwmtp1EDKZYfPS8OIgqghEBl1vJROfgt99/fbbTjoOf312Ctx?=
 =?us-ascii?Q?dDQ3AruB2Z3fmvT6fTuYGKYwtrZuOl62ERRtwQC+gEXc3OtoiNQ9ytT/bc0o?=
 =?us-ascii?Q?VIicVk4vzZsH4e4mPeDk9dZy8Yy1Zx7ZoAGVVsfOTz0HCN1bINi68kTTBAG0?=
 =?us-ascii?Q?T+AeefyPTFkn5xbnOUfMwZ/f3Yq7YLcMDAtXAxSQ463p14/M3z+/E/LpYpA8?=
 =?us-ascii?Q?PTju/LBHvYItRM67K4SSAF9kn3i7Ht7eoU6oPAW41kgrtXw6WxNd1jj96thh?=
 =?us-ascii?Q?Y5UQG8WVu25feQfB1clJ7KomVbk19I3GN7Lo9Tf8o56YyLyL58QV9bnlcdGG?=
 =?us-ascii?Q?F9VKxypNhWM80tNBiaBZN46hfsAbfR0oFk1FCfmWRniwpqFEXyoTjG6VIdxv?=
 =?us-ascii?Q?64GYO4pMTF9I9Muv21RflmLIms7wtf4rm+w31XOhXXGVDmxguya0jnOeKDj3?=
 =?us-ascii?Q?e5FqaB4=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3927c.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1167f64b-9d7b-4297-9ddd-08dee04661f8
X-MS-Exchange-CrossTenant-AuthSource: BESP194MB2832.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 18:50:03.0979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP194MB2753

Remove the unnecessary space after a cast in _rtw_init_recv_priv() to fix
a checkpatch.pl coding style warning.

Signed-off-by: Jason Winter <jjx@live.nl>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 16ec2248b083..7946acd8869b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -56,7 +56,7 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 	/* precvpriv->precv_frame_buf = precvpriv->pallocated_frame_buf + RXFRAME_ALIGN_SZ - */
 	/* ((SIZE_PTR) (precvpriv->pallocated_frame_buf) &(RXFRAME_ALIGN_SZ-1)); */
 
-	precvframe = (union recv_frame *) precvpriv->precv_frame_buf;
+	precvframe = (union recv_frame *)precvpriv->precv_frame_buf;
 
 	for (i = 0; i < NR_RECVFRAME; i++) {
 		INIT_LIST_HEAD(&(precvframe->u.list));
-- 
2.55.0

