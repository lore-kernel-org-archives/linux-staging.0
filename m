Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B08269811;
	Fri, 30 Jan 2026 00:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732211; cv=none; b=ViZjD0VkKxz5m73OqOiQ8nTCZf1m/56JuYa73z2EJ5vYiMe7cLl5k8V3WeIiJYqcQeAmqbCkOcTZJaqTLwQKHNGVD6BJSeMdapj7DyeheNeb+veU6yfvZEMwgTV18r5NRlKKmhSQQ+ACxFFPS8kOSFWU0XEW7B9f9UTQA6h/IiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732211; c=relaxed/simple;
	bh=LDO4wnjirwwRr9RpEg1ZK920C0c2biHvXmSTgEPy3lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5ZkbmwfXy/G3cQaqnLYCBYmcYGgHkLwnupz46WxD6sTquxwUrWHi43Rdn6fYSrzMIGDV3s875lQYvdR3BcJt+rJhiMxkIzHkCAy8HB1ppqT5+Z74Zd95d/waPNRoArGbnw1Oqgi3jhr0q69OHMK+oX6RPa4Eh7p1eRV7V7ZMHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b6DYUYkv; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b6DYUYkv"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TLwXkY676717;
	Fri, 30 Jan 2026 00:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=LXWH+
	JTvYpqBkRtPjG3XgN9A0XTahvxPboYf+d5s8ks=; b=b6DYUYkvDgZ2UIofNIT4D
	781+03TmcZ1iE9AhqK+o43uEMbhXD/Ch9QpcLOifQIJTBnwcgcbkefYoPRtMfXFB
	578WocVYrvCbgHnksRdCQE6dee6UMeosdILNG5ZNsgmQ1j2CNRBZucrD0/9Gs9/+
	d37Abh2xi9hXQrZJjgsIftitUEAdduRi4tRVbOJ/u55Oo/V8zfwEefmK1gv9qKtN
	TpEIhf02y1OZoWyIM4FdF7yy8/X8IbfOAgZiWcbZOpomAXAnf7GRbrwGg/4EUChZ
	F6wBIEsYIHAfOmoeKtvwp5NMAW8yP48Fdh/Cv3ErqpAOHOCTR+YaaREFqV6qkJ6Q
	g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4by2vgmbxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:16:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60TMOcSh010548;
	Fri, 30 Jan 2026 00:16:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhd19ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:16:44 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60U0GgZF007973;
	Fri, 30 Jan 2026 00:16:43 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bvmhd19jr-3;
	Fri, 30 Jan 2026 00:16:43 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: dan.carpenter@linaro.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        samasth.norway.ananda@oracle.com
Subject: [PATCH v3 2/3] staging: rtl8723bs: fix memory leak in rtw_cfg80211_inform_bss()
Date: Thu, 29 Jan 2026 16:16:40 -0800
Message-ID: <20260130001641.17941-3-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260130001641.17941-1-samasth.norway.ananda@oracle.com>
References: <20260130001641.17941-1-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601290179
X-Proofpoint-GUID: BlvrcBd9tZICaep8USu_8uupuPCmlf5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfX/EOIYdkmKBJf
 L1i6WoVQSNMISzfpVHDTJwSK6HbtzAV6U1ja/SWC2aMLMbaxsbhfh/B1NFjgJukt/1K6bXwOTq5
 LnQ7OzA4xE1LgSMobJx6iSGobOYI/2GH0rZ4Cl5O/t/X4J+8/vPz7dw41kLWwlNW7KAluQgYlGq
 bJCFSudqiwtwC6zLmXnhfUM/eNFctMLdrGCPCZJywbmytN2uDMYY8CCQ4+3m+whip/lKcLS9+KN
 dJLuaVDJ03BJuaGCQKdvIO1T0b53w5+Sl0rFaw4ddiyp7oQAZ1GKlMKFwA3HryCENMwxYK5fiDx
 oPIQPwqEn4DFJ0+GsDKY4nGYP5erbZBgJhyty2lIl1CmIPIcVTqDiNJFEgxyvUpdmgICxR7SoWZ
 xkHN/GBW48ZrSuekbr8ufXGU83gqSN/m3UBJmDuQw7EKkWQZ+COILIlgFMlIEomF5mysWTxSGAN
 HXhrVh3jqDu4or0Lt5g==
X-Proofpoint-ORIG-GUID: BlvrcBd9tZICaep8USu_8uupuPCmlf5m
X-Authority-Analysis: v=2.4 cv=a7s9NESF c=1 sm=1 tr=0 ts=697bf86e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=KKAkSRfTAAAA:8
 a=lX7pHSL-l9_-PgaVgB0A:9 a=cvBusfyB2V15izCimMoJ:22

After successfully allocating buf with kzalloc(), if
cfg80211_inform_bss_frame() returns NULL, the code jumps to the exit
label without freeing buf, causing a memory leak. Add kfree(buf) before
the goto to properly free the buffer in this error case.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 60edeae1cffe..d80e23cfdf8d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -314,8 +314,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	bss = cfg80211_inform_bss_frame(wiphy, notify_channel, (struct ieee80211_mgmt *)buf,
 					len, notify_signal, GFP_ATOMIC);
 
-	if (unlikely(!bss))
+	if (unlikely(!bss)) {
+		kfree(buf);
 		goto exit;
+	}
 
 	cfg80211_put_bss(wiphy, bss);
 	kfree(buf);
-- 
2.50.1

