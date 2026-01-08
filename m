Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C232930BB83;
	Thu,  8 Jan 2026 18:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896183; cv=none; b=QpKvz+uOG+RjfMR/jEiqI8jj+K01rquNsfOkU2Y8f4frixuFhSZCQzWLxKPakux9Hw0SmWZf9gz+vC0oQO9R26T+PB2Ljk9GrenBtbj+JVfXWNDgvciH+YxpSU6lfbnrUUXOKKuXx3RsNW1PHwVsI4CBOM1oNvzux2BO9dXNTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896183; c=relaxed/simple;
	bh=EW56otuXZvN4lMmy44nU/ZLsNRlFl9KPRI9408Hthac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sc7K1OnVZIVn8TGIvmAg3jlHRMenciebrm7A9bT1SJMoxY1Igg2DBGqDmeNFxKwFFh93QK4NVeRXROJCkJR0VyjfQNQB/06DsXo5bJEyMqX9dW7ZfO16hkvXBTYTBe2jhbIIgGko92i1lLd+Hpf21ndkr1e9WYug14T/B7AQ7NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NkyciEL1; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NkyciEL1"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608HaCNB804604;
	Thu, 8 Jan 2026 18:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=dVOFp
	N1ANTfLITaCz7gEuTC/kjtkKEPRAWzo0EVCm1Y=; b=NkyciEL1NesawEqWY6aTF
	6dGAWH0mlPitJTa9d/z8P2pYISBNBdT/s2GFXDfhEgJizTf3D3KmHr3sEjGA1Sjq
	MxX2TVs31KBS4r4qneC9ivybhm9+gjG39z26MPkFTcf8Qqxwmkj80CVT9JbeTaao
	SeKyWoP2uNVFhPdYc31+x8TheBcR9Ntfxrb+Wfg7cOwUyB4NVGZ74WczBCbI0KOL
	5iRF25/pcFpO48TYH9PChYlhP0mqcvw9Fp8Sa4rs+dU3HZN9C14c4CBdQ4RghVlz
	YsFdCK5tfB76oSRqc+8HQHsNmt7G6O3KXR9kxT2ng14flOtVCzwacml463hBhTYy
	A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjh4hr25e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 18:16:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608GYJ0e019956;
	Thu, 8 Jan 2026 18:16:13 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4besjb58a9-3;
	Thu, 08 Jan 2026 18:16:13 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: dan.carpenter@linaro.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging: rtl8723bs: fix memory leak in rtw_cfg80211_inform_bss()
Date: Thu,  8 Jan 2026 10:16:10 -0800
Message-ID: <20260108181612.2340796-3-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108181612.2340796-1-samasth.norway.ananda@oracle.com>
References: <20260108181612.2340796-1-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEzNSBTYWx0ZWRfX43sZFD46YDJZ
 KsU6+FNA3qd5HpUmj6Kd5UNfJ/6LBk/9QyT2TbL9llt25vE2XG103znI27hNjFGf5UWJ02foVDk
 6ZCOyQbEvA7ebrENatuSf3pwiSj8Y2uPM5TMFiDmAEzp6gVYyQFT7M/3cuOu97VjIDK9G5r9eBf
 2KG03GSMUyvsSL1MI89ZhbwWl6kMHxjTsv43SmydU1OysoJ8AJ68et0JFU3yG/oW+4l8nOXfvhp
 GIPs4ZYhLIGXT0+y49i0WjjTVqSK1mGbprS8IXIPt/PU2O2EKRtP6PVs96i5/5Md8/QvQmYJDhc
 SFiyf3Gt8Zo8O6dMXguRMvdUOhAqY5lVFsrTtnEc8dtRrgwUUCCi+SeqnWwvp3+XLQpgIzvt1Qw
 WWGIo+r1SSQk8/J/huZ1vKLmP1G0kzhRA75MOZzDiKS2jv6utLomIC5dahjkm61zFbY4I2VPkIr
 xsVh149oh0Wx6hjrtpg==
X-Proofpoint-ORIG-GUID: 0THlW4sSNXnLzm57eshixu-NxZfaunx3
X-Proofpoint-GUID: 0THlW4sSNXnLzm57eshixu-NxZfaunx3
X-Authority-Analysis: v=2.4 cv=T+CBjvKQ c=1 sm=1 tr=0 ts=695ff46e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=lX7pHSL-l9_-PgaVgB0A:9

After successfully allocating buf with kzalloc(), if
cfg80211_inform_bss_frame() returns NULL, the code jumps to the exit
label without freeing buf, causing a memory leak. Add kfree(buf) before
the goto to properly free the buffer in this error case.

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

