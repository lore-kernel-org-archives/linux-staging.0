Received: from CP5P284CU019.outbound.protection.outlook.com (mail-brazilsouthazolkn19010015.outbound.protection.outlook.com [52.103.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFFB234994
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.21.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324031; cv=fail; b=d8PQQAKmFcdE502scEPxrJETezuQOzJJ/ZEOE6GjOw/41QU6UwqJqb/02JKZlqykswWJghUg9ZkGpyQbXYEhkEyTtumtw7SOAvoYbIrqMWnXC3QAPD5c57uymtVmtxh6j2QImFfW8RO+ju8N3/oL8b5xvjuxtOB6vHnIQEv+8ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324031; c=relaxed/simple;
	bh=UIZbHjYVZG/T2yAuV8RT2q5AlhztCbLLXR/AQkMV0ig=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jEKmTLVKaG6XaxUz3uEBGPfJzgMf+mZan+1OiZPmu+k/aX69NWFCem6WvRE5UQ2ETqY7x1FgoMzz0ozVVXce/OvLyzsq80TEcQGetKrhsDKECD0JQkyZoFWBPnA/rRQDDomvyEGAgjismdYoM8Fmi/oCRdxpQdGu3rxFRNj/MLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=fk5Yg31m; arc=fail smtp.client-ip=52.103.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="fk5Yg31m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUJWvCjOeXo+uobMx4XK55nlM7sBrNEY65NFiVHI8TX7Z9UUC1KGUuwttTkRtNYgtTVutDlczleLVsDjX0opxl5VWk19cs/5PlyM0/GoOPL15f1LOkaV9pj/34it2iJGPJBpfNAAJLiC+1gHBBa426TMCnSA1MUe24IXvjASDhJuA6vLoEjcMd1cX0PsmKwTg9PjmSx8E0hZB5C4B1BlKYPhH0oZsRpYwBLCLB9iCHYpqBp1kGpNUZK35A4eRppX86kxMdqbD6jzOIkMUGa4rqcjqvi0fNzjGP4+FkPGf4htDihiNWUSMbe9jeJjmzpbwS89iwi9rb8Xvcw4N5Dgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnJ3cdfOeAE+M5BY8V/tRwysgmbwFSU/V2IzhnUJ3xo=;
 b=E/MqWeWmNW6weOQ9RNYas1dAuJi+Jjm7ghZ+uDwSWRFuhx06zcSqiWPLKTovT0Uj3Pm9RpfT5ZK3l5TRTtgjBhYlUgSN6jNOAexZDVM/7BaN81Ph6p+FbYFJ7OitTh/MZhEsJYFIV0uu5vBO7+ubvSbgKjpm7jtOHkbQVYaTTnCO/rvxRcZYEdhPFwcgMnXRkSS+rfgCZXLgPb/a3NrcrMBv8CGOG7mIfoHw+0MJ92ti7ZPt0RJCNvzZJkjfFtrGQjPcc7nkVkBoEO67dDKywiRSVb6ooI34UsVAZaJ+dXjD0s5myUGYb4wf8wj24fqKD+zOHfgCg9ClAvG4eBfCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnJ3cdfOeAE+M5BY8V/tRwysgmbwFSU/V2IzhnUJ3xo=;
 b=fk5Yg31mLw9kZrvaSLFqEa2qspEXC6BoiX8Szs4aKZVORjzjBRSAYgYrbQ7ixpgXpLJkwplfElDk3h0qlJDvGDTkOb/bfjt7SH8rDXWStFR+U0aFCvubgsirFJE++sh+9T5i+QwBQeykkKXDD/8baNDuiRqLxMPnH4Qo1sUsW+589pD9/3IxLcgLrRoff5M57RBJML+MGUEy9+Wb4cJY2HykkxvLf4VurTvnGRPN36+RFF0myWvaI8b7Z8Jl8SdiuUNiWIpxhSwDAV6CopFeIr19r+cGEMeynl3ep1A8ARIpJlnh0kJRBy/zKj/j9oxHETMAExAOsOmsUHo5o7cRzw==
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:9c::8) by
 CP4P284MB1928.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:dc::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 21 Aug 2026 14:53:42 +0000
Received: from CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f]) by CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 ([fe80::8363:d684:fb6b:3c9f%6]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 14:53:42 +0000
From: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
Subject: [PATCH] staging: rtl8723bs: use bool for PMKSA flags
Date: Fri, 21 Aug 2026 11:53:39 -0300
Message-ID:
 <CPYP284MB0854D9AB7B360D108DFC7116FFA32@CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP5P284CA0196.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:22c::10) To CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:9c::8)
X-Microsoft-Original-Message-ID:
 <20260821145339.1820913-1-tiago.panizio@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPYP284MB0854:EE_|CP4P284MB1928:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5cad01-557e-410b-d368-08deff93fe34
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|41001999006|23021999003|5062599005|8060799015|51005399006|19110799012|15080799012|5072599009|4140399003|25010399006|40105399003|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0B+hzZxEFNJZu2ROKGz2uQoYDpTHhLTAcbvsOYFR7YHLnurhEHUgPHr5Nd45?=
 =?us-ascii?Q?DxpDKqFca86cRptv6D4W3PGICo1K6Rrk5DP7ayhkT3OD/gzReffrYyD2WwqR?=
 =?us-ascii?Q?aXXtP1+BvLJar8OY3Tv9mTNxjBLELAuryjdq5dpOm0hCuFH+MqOCfeJfBPgG?=
 =?us-ascii?Q?XtTBbfLACgbgaZK/kemQIkIi1h6rFWt+gK+jamQL6lN7ym36pU3e+8XWIeUl?=
 =?us-ascii?Q?6pJjwK2rxBKOZYFoB9osFIdmqjiCrWupyBxOE4G/7Geh+xqlbFASuHDKuHqD?=
 =?us-ascii?Q?CHP9HE4+/yMRIUkwQT1e6T8jEQEVVhIYYfnzD4akP7y/8OijlMNrW9/1Klb7?=
 =?us-ascii?Q?hYV6OqRHGbG7r0VfV1AFaCl9gs+wLS8GzuEvH5Om8BrrH4lxiqCjMq14o5mD?=
 =?us-ascii?Q?tYKIKwjE8ixBTxeAwtvKdvjGDbtXX5nteAVk8oHx+g1xdmAXg79YFb9N9+Co?=
 =?us-ascii?Q?EwosQIk+CQxlFjlj5DQEbNXx1BZ1g8OIJU/0qHis1rGnm2kbuyI3Mpzyd4Tz?=
 =?us-ascii?Q?c0MoAOcfOwDVOVauGTXi4Kmh8y8hJ7LD0oxTL175/2xqmsV9vQrYjI1CFFuV?=
 =?us-ascii?Q?8OrNIt0D13O3ydCBp/6C88tOd2axxmmJF1gumrGSobQws/QMEfUoCzt99F7X?=
 =?us-ascii?Q?NOUTM1PcfJ45FKJ3El5VmpTRFXyEToX1NoBrave4b35Uug8/7iYFYgoJWATW?=
 =?us-ascii?Q?SU9gCWVEYkrHYtbNNJx6K3/HTLI29ll6gUv+5adTXPLd+CCS2E5KaR+qdVKP?=
 =?us-ascii?Q?3/jbAaTQKlD3hFhN0LYltI58eli2VKLZIvngkD3o+cy1GDQZ4n84LZOARlcv?=
 =?us-ascii?Q?kNeIboQ8q1O2QGa0q0ULPRN1ihTc4pE2Sm7DpnfiC0mLD2f8Tc0GyHZEPSTJ?=
 =?us-ascii?Q?0mCmPf3VP2k9PS6HHgD4BeiyTUpTTIr/7Yt4397sMjZLYz9rGJY4LxVEpzXb?=
 =?us-ascii?Q?ARxsj1k+VFjTF+6J21re+fosWTuuB0YiKBVcRd5sj6K41Ks5sssymV2jhLOR?=
 =?us-ascii?Q?EE66lfbPR7rkOPXPVx7BKszHUw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ijn4TBy3CEN+eufQRNtQ0DYN8iI36E6cF76uvkeH0EH+MFpQ/7lg27i0/c3?=
 =?us-ascii?Q?OvOIaKaJMxpm+bDxj+XmJGmEeC510qPfbyTPnxwMv1SMqhvMbnl3/LtPEle7?=
 =?us-ascii?Q?025gFIeMXkicGGKobmKDS9omohOYV5DsApNvPif/bNPvKXDnJxMNVDwCZ4+H?=
 =?us-ascii?Q?bWsZXmqIi37KCocyAYyhNslQPqwRXewWyh6qaC7ED298KCm1GNAiHT/jLDT8?=
 =?us-ascii?Q?+L3KcfFa4nJRtbCCYckHaTuzKDVEDDcH1tsHUAB0U0KWIVcm+JtNbMeVNNsA?=
 =?us-ascii?Q?bnO9ELff8RumPgOzL/xnrg5avxZAsPkb9Y9IJbH4aXumZX5pFMd0IUiBDMOx?=
 =?us-ascii?Q?eGhqvbMvpxgLtkVaJUgXRroSzGHGfSQzTGyNP3p03wbTWHHfyz2ReLWVIE6n?=
 =?us-ascii?Q?wEmSB/b8gkh/2d0fTnr7aahEsESFMXTWSyxY0YNYUT5UjIDeALV6qGIfG2Wv?=
 =?us-ascii?Q?j/k6TZ/o5p6C5dg0g9RZy+YPs1FySHaEZL+JsVkoVRIEJeqmkgX+8hGBVoMz?=
 =?us-ascii?Q?TiIX/CEgLHP8DnhX3lsPR4AFKd72EtRY9HqXqLrZiJy9JLvXdpQxys67XXTq?=
 =?us-ascii?Q?h/qILDYdDutjDj+raZOEz7FOAvTmTA0WexN88worh323ZRY3VUgVcY1JUKH7?=
 =?us-ascii?Q?R26bH7cMlPP3bsRHwRM2G0t9xoRcks4acvohYByMQYnITnPwstRAxaSO1Rgx?=
 =?us-ascii?Q?O+DTdOv7QVSrWFTEzUJhtvViS3N1belOc5KmLOgh54NUvvp6jcTU41WdE2cW?=
 =?us-ascii?Q?BXspmjdBYXGcEzZMxdtLlBmMFHeThvNH+S+HJclWao6KTIBCfAqGViEDwZbH?=
 =?us-ascii?Q?nO3/WS+TYd8mZwunSRMkefl4r3Kb/g7o/kd+nXBw0GnXmk/SRvHxxQ5XiDMr?=
 =?us-ascii?Q?kL5lFTMbxityc6ZyP+Sm9E6zEAZlLcdtzNWd23Rbsp0fR/x+PZkWRy1Hgsq/?=
 =?us-ascii?Q?pqytB7ttSlCEnKShLP/CzAdVPgJmT6BAalY1DpBAfhb23ClZDsf4GL4wVhoD?=
 =?us-ascii?Q?q8IZTwTU4F7eyuYgoCzkhi9+j/ZF8sHun7P3Ev6W+uoby0NFzZghwLPGevpR?=
 =?us-ascii?Q?tP9MV85/uvZDc/vJ/W6wCSLQe8hILKAUcCJLnN/kdX4OEt6gvS4fmiyKWv2i?=
 =?us-ascii?Q?1qOXUTGwI4q0YAFXt5lDgrBSIeAqDnQn9CnqahwdrtiVLG7iyuATMnWZBrAF?=
 =?us-ascii?Q?b3HfjgRvMmxOkomorvmXypAjgAjMFnMO7Sa60WmE3i0kxOfkCm6b1PK89Lqv?=
 =?us-ascii?Q?kGSGGSFGbrJhfPv7n1HCUgfQGutlI1vAo8gMILHqxkiHkNHm21hMeAG2Q32H?=
 =?us-ascii?Q?Vdxz3rx7kd3pLRBe6jSX62Pel47c01rhxRFavTiilkYa3HQYSdg1wFq4B1Il?=
 =?us-ascii?Q?qdLFhOZLe6fF1hqqMai8tJP4rqXseJV/f5n8DFeM9Kafi4bBLqy8Eo/XlmmR?=
 =?us-ascii?Q?Y5FjlmteELvns13wjRB9LmSocV3kcXegSEH0VC8GWcVlkyyQKe+dSA=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-da224.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5cad01-557e-410b-d368-08deff93fe34
X-MS-Exchange-CrossTenant-AuthSource: CPYP284MB0854.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:53:42.6853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP4P284MB1928

The inserted and matched variables only track boolean state in the PMKSA
helpers. Use bool instead of u8 and give the variables clearer names.

No functional changes intended.

Signed-off-by: Tiago Panizio Gottardo <tiago.panizio@hotmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a8fa485304f6..bb3db79c99cd 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1830,27 +1830,26 @@ static int cfg80211_rtw_set_pmksa(struct wiphy *wiphy,
 				  struct net_device *ndev,
 				  struct cfg80211_pmksa *pmksa)
 {
-	u8 index, blInserted = false;
+	bool inserted = false;
+	u8 index;
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
 	if (is_zero_ether_addr((u8 *)pmksa->bssid))
 		return -EINVAL;
 
-	blInserted = false;
-
 	/* overwrite PMKID */
 	for (index = 0 ; index < NUM_PMKID_CACHE; index++) {
 		if (!memcmp(psecuritypriv->PMKIDList[index].Bssid, (u8 *)pmksa->bssid, ETH_ALEN)) {
 			memcpy(psecuritypriv->PMKIDList[index].PMKID, (u8 *)pmksa->pmkid, WLAN_PMKID_LEN);
 			psecuritypriv->PMKIDList[index].bUsed = true;
 			psecuritypriv->PMKIDIndex = index + 1;
-			blInserted = true;
+			inserted = true;
 			break;
 		}
 	}
 
-	if (!blInserted) {
+	if (!inserted) {
 		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].Bssid, (u8 *)pmksa->bssid, ETH_ALEN);
 		memcpy(psecuritypriv->PMKIDList[psecuritypriv->PMKIDIndex].PMKID, (u8 *)pmksa->pmkid, WLAN_PMKID_LEN);
 
@@ -1867,7 +1866,8 @@ static int cfg80211_rtw_del_pmksa(struct wiphy *wiphy,
 				  struct net_device *ndev,
 				  struct cfg80211_pmksa *pmksa)
 {
-	u8 index, bMatched = false;
+	bool matched = false;
+	u8 index;
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
@@ -1880,12 +1880,12 @@ static int cfg80211_rtw_del_pmksa(struct wiphy *wiphy,
 			eth_zero_addr(psecuritypriv->PMKIDList[index].Bssid);
 			memset(psecuritypriv->PMKIDList[index].PMKID, 0x00, WLAN_PMKID_LEN);
 			psecuritypriv->PMKIDList[index].bUsed = false;
-			bMatched = true;
+			matched = true;
 			break;
 		}
 	}
 
-	if (!bMatched)
+	if (!matched)
 		return -EINVAL;
 
 	return 0;
-- 
2.55.0

