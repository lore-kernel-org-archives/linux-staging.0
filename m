Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E52939F162
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280456; cv=none; b=UI8LkSmZOUOm1VBIH27klgXj9WIk+cLch0fl4y55TKwGW1QHxiBlhX1iGRHKgJxpyWT7KxxaltS83t1V28KKNOfI1kG/B3cQWHcbhFGYN0mx1cz4el5qXkU1IXBtH+1Q6kj+/fyFlXljOETv440Z+mHoZ8jWTTU7EYPM8WVm4zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280456; c=relaxed/simple;
	bh=MBCzqv0j+WYMFcF4TKWqHla8911PrHE8zUSaVvk5eeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RChDB/t1Km0cVZoq4U0SclZ7NTrKnvMZtyGMg1Zo1nFbA1X7d5JMgGpfT7L3ZzcjMetDjEHYAPZzwG0JWy6WsmUh6Vu5mZ334xL8Bk4YRvN3tIXMy/+yzH+f0MoSTXKEJoo3+cOw0RdPoDdW792HMEwJZKPyAM+dMQQZdoJUXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtgGyEI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPj+VFRd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtgGyEI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPj+VFRd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hhmbd2341830
	for <linux-staging@lists.linux.dev>; Sun, 5 Jul 2026 19:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hN6fEXJ0a4t
	H3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=FtgGyEI14vKK9OqT430xUfOmGLF
	J5bdRwGnYlPPVp42isHulDlrVXRumzlXOnWaKAvEqFlOMf4WK0t/UVb0tPS4H/wS
	PtxzMba7S17DNMo9ExtOcv+rJsW93dNgj/CIpMpvyCzFyneGj05+u1GK8iECoqyK
	WM1mPqrqXajrrVrH8/J9pdvK2VoDaXNIt2t74egeo5x9BAqNhYqqiB5QdwrFv+QG
	jv/TZ5nh6enGJUvvqqxYx00YdVL+37mb/7PnZAc+8iS+maLp8PJIHST5NiO92D5M
	ugD1/b8iFPnLJM/Dv5JgaqSUO0Jj7Rg0n1nlkl2C0BeSOL69BMELnoL/dgw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvkbv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 19:40:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so3254359a12.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280452; x=1783885252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=jPj+VFRdrUF2NUAH20dlNQJLY6/N4lJCS7OtK/hp2eTIL/TBIxXyzjGTstr5gKz4TU
         5outQOJnAb5lj5LVQ3Us6FqCkVU58fBYPfJBmrnIHJsSIWxKD61CYXJGWWFnnUVT5SHB
         2dskVJ8j53QEUzGpCrXgi4jNCV5qKqEKXpOoa1GsYpoWPVTdT+ehnO3RGZ9jL1todl70
         e1W0rFf6kf2Nu/+pgxdifvovKSESbtyb3w66FRaLCEp/UMgcj9fBpMAFJPFNgt6QI2Sm
         9SDz90bf+uEjKLskvtx8whciEqUGnNYdAioRnxwCMVeTXf8bwCenHBy9/yTxATit2s92
         7gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280452; x=1783885252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=WTFiFzabWYeu8n8PZz9/tUOcJeX5ptnRJ3LFivm4KwM+1yCZrb1ECUfajNfTWj+iWz
         iXDN1jPWPig6W4Pk90yvYWJA2J6H8/95Lfoc5Dn+6q8kENfYFc0N2dksHv5DKLkk4Jz2
         sAPP9l5mxr4JCkwQUZaeq5vIczcjtRJRM2Sf6OOXKKl5+hXpkYjoDrSdq1WZbf54bCIC
         XfAi7c3VoS8E92WDOo56yHV/2gbZM3UxLbIkyJiXuMxGmnZYpTbigcHpmnIFSN6QipI3
         N9P4z9p5i8PYYcWUKEqw5SeV4xz+1CzDDkkPZ6O+P4JvkGcj70JOHokoAPbRTqC2Kw4T
         0ynA==
X-Forwarded-Encrypted: i=1; AHgh+RoDCrIfNlMjnsFi13PLcp1s3HGjqmrNna9uW/HpayGNBNZk2v+RTLyEME6F/DHxYKxDdyfCGj1cs0tq0T45@lists.linux.dev
X-Gm-Message-State: AOJu0YxtWPKJnVmzBmpag00qcSc4WGBJlqjxi6uWr6Iz+X8rQNqySZj4
	VL3gSgfkBjLK+lgK2fy+ErX1UpLFn91jO58t7+xuTd2MFqsJSjaPQtkg4zSnpErmXH1mZn7yHEq
	YA+DPXOWCl+Ch/p9jpzATh1w4DRGKWyWiH3415af7skxi0Z9HRz/LmZCwQp1ByeVFR24y
X-Gm-Gg: AfdE7cliUkr4Uyo9QqmoFa/0sfxrKkCVP1A6VFTT6Oj7MElKkNyDmEpeCeP4jZjbOGZ
	r+FnuRJYkoGHYMrvzU/XtlNdc6Jokbny8xaMV0WPb+njFUotU/GAYcVNXQMPg0Kh6hUgdbAwuq0
	MmA4yT5Aulcv6faCyo6tCELniPHxh9LNf1I+2+ptJmM3JRk78OZRrooe8D7o53FlTGNykc90J/i
	11JEE9nRXCAkN01qjU4bEO9m7QkiyZ1fxF4b+FspzWYJQADLkx8WyVUX0fXy9iBEOZqYpzJD/zc
	jG94KnJsuciUHYX5NdXK81O/qDckRUsKkEHbeGqBxOJNrsyMphQ/vG47LOTb/m0V90hqkb99xc5
	rMwXfYvdD1A04q/rvRlyIy22IiYD9m6CKUIHRig==
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386835637.37.1783280452365;
        Sun, 05 Jul 2026 12:40:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386810637.37.1783280451853;
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 36/42] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:12 +0530
Message-ID: <20260705194019.2565498-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4ab345 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=16fIdGUa3qEwhQSg-dQA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 14FrxlqLxegFF1VhZ5J5u89XfadPs5FE
X-Proofpoint-GUID: 14FrxlqLxegFF1VhZ5J5u89XfadPs5FE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX0Z34iXjlZT+u
 OsOP/H1c25d07Ob7kCV4USeBOlGMMDOfwZUrtubJt6BGi48mlX4H5+2upu6gNNk7J5Ge7ixxcI4
 HV77QDEflk1rrYF0lK3g/YYvoKLBgxLcGvoctC9bKqlUb8HrKgacUXDK5ldIuF/L3cpQl4kjZV+
 xrJOT+EwIdv/4mrYtqzYFKZ6OwtlGOH+eWsaixcEm4a6fctarKFuhhO/v9HQXDe5jfG+2UcH150
 V5pwtaGet44GdW7x8jGXCaAEmBKfqh/yMtQZ0wWQFfJ6LtbiffuTEltLqiraQo5bd9GvrhqBhbt
 IydXYW0J4KEiptO2SDkreY0H002wl09+giI6IebBMKfwaDttuVSpdW03g/ijrmgN9itCMIb9JWR
 O2EiSY+B7KiXx7R2R5XRXExJtr0mmEoi8MbrBqeqlF9qvsHFDYk04i2TrpSwkpTvZzRDdeKKTLO
 n/lnsyOgK8a64Gj0GpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9+hXRQxMEXGV
 fomFY5vjnNeVApJXbAC2/RXKAHbmQrSN2BxsDq4tjsgtRWr1uhM9Ed7PIqxfiwuCG4Ghe2DtI3q
 CKM9p196LB/xuMM0Whscj1tzSBDbhZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.53.0

