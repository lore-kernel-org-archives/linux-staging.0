Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C34324E4A1;
	Thu, 18 Dec 2025 01:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020460; cv=none; b=sqXfU0jruhSLf1zJjZ2qkFD+ANrzsOJyv4rglIUTDNpKAeUr1TCqKIEJOOBAGaBKTgnnEztucCAZGiAaTANeK+m656KLpjUgM9mXm3jPm0fnaTFDzAWOEzwxDdJja1TyLHAdmLeLFxOWe3VfskppQfHQjJrH4xtBnc+Cv4yygBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020460; c=relaxed/simple;
	bh=4WdQ3QYIh2wIde1SJw5zV5Do5NFve00rX6yvj4+J1PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWd8WXszZ3Yq1l07OwlQ/EHNgo6l6ZfScuHx/R7hbl2Q+9xwhpfPUOMJp81fQLUCIspp0XLTMVwhZIiWTxJBT2IwnDLgNgmLyQHtOhQjNciWhVdT6GG2fXMrIC2cvud6zCz+siKZw/t32O2LmD2KCEPz9sRbt0XQsxhKINed4bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qhu5m7uj; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qhu5m7uj"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI0hota3962311;
	Thu, 18 Dec 2025 01:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=THeIB
	JbrIQAufq9OFTrVIJ6Ek1ACjjoTDcEziBQzwZ8=; b=qhu5m7ujp23gv1bHHdbtz
	khduE7AYr/YNoIqscbH49Gf7ExiQm5tzcFwjOQrkxZBSgLK00eI/tk8weET85rsD
	E1zEc+GWH8OhA1J+5mBuAmGn8hYPF7I7seje1IlDNoGMPGWK9MbUd44mtn2BbQub
	fJDDwXKYa79L0armUCIO0+xyO8KJ5TONI8ck/WFJg/Ek87cwlg6u049LDqrWKi/I
	7vWhQo6SM98Bw6otAOwLzAU8BRyt8+IWZ0VqMSrhdzHSxdNRPCFKXjUUI8gPColl
	Nud1MIgcOfA8u6XFZBG7aj56zL4Y/Gn3OL6jmIGkHrXzM7jCYX1UmZdgxvOzjMO4
	A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b47ay80n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 01:14:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI195XT025249;
	Thu, 18 Dec 2025 01:14:16 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkcgjna-5;
	Thu, 18 Dec 2025 01:14:16 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8723bs: check return value of rtw_wdev_alloc()
Date: Wed, 17 Dec 2025 17:14:14 -0800
Message-ID: <20251218011414.1781294-5-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251218011414.1781294-1-samasth.norway.ananda@oracle.com>
References: <20251218011414.1781294-1-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180007
X-Authority-Analysis: v=2.4 cv=foDRpV4f c=1 sm=1 tr=0 ts=69435569 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=QIGcSY2F6k5Ja1lceT8A:9
X-Proofpoint-GUID: -9fEAfGlRAETNy1bmics1gQKn6CaPJXh
X-Proofpoint-ORIG-GUID: -9fEAfGlRAETNy1bmics1gQKn6CaPJXh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfXzrfejlvWgywb
 eXWi8gxyoW0qX99iohZQVlE6MNGTmJml8ZQBoJ7WYQ74vweSJhsnw/ZZB6Nsmg63EYE+Tbwb8lo
 ObnC5ou5QCF6ChzlzQ+XsgYijKM44JpzubWzFTTDkFotMqhI8J5HyGQyQI3vTd3jDZ3QpMFqZPy
 MEuWZrUSY54BRh79M/A0Fu41sIrVF8Jb3OHE1PzzZ+y9/KQNpBORgaBAWsl9y9/do4oRV3yltvH
 x9ql1ccGxjaG7XF/nBePk492MdLxW+IDK1jGx2pgr/qVPa9Fzh7UQ5xSsXkAb2bFWHQVxl3x7lr
 I8xisBJOI8wx3Dxr5E1xgg9J8SePEjj19/dD0OgUZFveoDPurG7aV/GvUL8DX4ocN6PDgSIl204
 daxJqY/3DTk2CRt7XLZMPvbBEMfsig==

Add missing error check for rtw_wdev_alloc() in rtw_sdio_if1_init().

rtw_wdev_alloc() can fail with -ENOMEM when wiphy_new() or rtw_zmalloc()
fails, or with other negative error codes when wiphy_register() fails.
Without checking the return value, initialization continues even when
wireless device allocation fails, potentially leaving the adapter in an
inconsistent state.

Jump to the error cleanup path when rtw_wdev_alloc() fails to ensure
proper resource cleanup and prevent use of an incompletely initialized
adapter.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 1d0239eef114..432bc6aa1d90 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -296,7 +296,8 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	if (rtw_init_drv_sw(padapter) == _FAIL)
 		goto free_hal_data;
 
-	rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj));
+	if (rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj)))
+		goto free_hal_data;
 
 	/* 3 8. get WLan MAC address */
 	/*  set mac addr */
-- 
2.50.1

