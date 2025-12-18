Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D6203710;
	Thu, 18 Dec 2025 01:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020459; cv=none; b=hajQSKtN+VA1kFjLOnYdGb31/TYZEs6Y24P69HD+J3JbbK7P61HAOb4r5NU24Ce3GRUpHIAdiLNr3jdtvylLzQNaNPpFYirkhedWugyAwBx3Pqwuv/qlKLxZQD5jK4Bjx5FI9RfFfekfCLyZsFWLYi0yUv/P5I+XGwVuhEen6FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020459; c=relaxed/simple;
	bh=VBj320qmqVsfLUVJZAnB9NZzs9AlQ43D/LLGRmiSRC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hk8Ux8g2ayphSfqCWKDPCfzLPQbH8t8B0tVNrXlGrdLnENZ0qi5zbMYhdFjFnfJ2Cvi4ZZTfH74M7a04FHkmEpYKgcPyU30n3PvwlZz5iXQte6/plgLs4zslL7ueC7uPcFjQR/4mB1HCm0PgJrqd1PpS3UNjuamv4n8H/SWUo+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lR3b9oLp; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lR3b9oLp"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHMNhhf4168326;
	Thu, 18 Dec 2025 01:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=LNqgl
	OVP8MzBxBpMF887kypIoX7uGBh7w+0vOnNA158=; b=lR3b9oLpD20Xvb3j9msv7
	S6PNQoeXpqwRWCjex3yQ6C8LkDsbu2qd5E3SBqRSfytFc4b6khEs9Vfq7LYZJ0yO
	3nu1i4GgCo9UiFUaoXmM1ijyiaxsJtnFCeMYpfaNawVqKl/SLqG7Dh+JgvwtgUwX
	XY+ow/mjYhJf/3hG7NGgD3sSv/Hg1PJBGFko6/UEYJlmE1mQluFO6VtgTfPzR6ZW
	qWputzeaG6zzKeKDJ72Zlu2a9qNbl7ySj/WjFzEjTAuCPPCKQauLCCLqWU6zt6/c
	i/d0Fgnu20U/6EHQA4tUqm5cPimKqdstBihchM4zoI5ZNgQ0Hdt2zwqiI5b2h3nl
	Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0y28f4gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 01:14:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI195XR025249;
	Thu, 18 Dec 2025 01:14:15 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkcgjna-3;
	Thu, 18 Dec 2025 01:14:15 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] staging: rtl8723bs: fix memory leak in rtw_cfg80211_inform_bss()
Date: Wed, 17 Dec 2025 17:14:12 -0800
Message-ID: <20251218011414.1781294-3-samasth.norway.ananda@oracle.com>
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
X-Proofpoint-GUID: S_JyHXCbFSaMQRagAmVG0HQupwsheTX9
X-Proofpoint-ORIG-GUID: S_JyHXCbFSaMQRagAmVG0HQupwsheTX9
X-Authority-Analysis: v=2.4 cv=fOQ0HJae c=1 sm=1 tr=0 ts=69435568 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=lX7pHSL-l9_-PgaVgB0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfX2m/auvf68heD
 5VOjR+BGF16o6EFPSYkYJBo4VY56gFHDHHspsjaJd6WaJb6Fqp2DHY4u5if4R1P4BiBeEUy+sSC
 Z9bKulsIMGypxAW8NLAa1B/dEzVnAQ5iubAOJ4oqSY4aQbb0vJ5hYp/g8VViaLfYCAwE1YO+34+
 LhEkwh6PMXs15N0tb6WhF5AZb4iwqXJxJjXaYypVU2ZrIGxnlLa5N6xiOWaWI8A1YWOSF1aco75
 PVW3PyJ970+m9FrXzRIpee3r9l2VrlDUBNOqBdaUDZbquBb77+59HWZKZZhwN0yVpoP1JbCrg0x
 bliSDfdw+v0ztsUnboZVMKtlBQv9uwnBEYgjFZWbPIk45l+ArF2uBMJkVxirGa74NEv26isq6y3
 eEsY/D+hDONU23Dz3uXnqSW6A3Qs+A==

Fix memory leak in rtw_cfg80211_inform_bss() where the allocated buffer
is not freed when cfg80211_inform_bss_frame() fails.

After successfully allocating buf with kzalloc(), if
cfg80211_inform_bss_frame() returns NULL, the code jumps to the exit
label without freeing buf, causing a memory leak.

Add kfree(buf) before the goto to properly free the buffer in this error
case.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
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

