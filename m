Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874EA2D3733
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280467; cv=none; b=l7tmzGwQfYi6KvFcWOoorNOvzG6Oive9sXvEsGGsX79HFmFEALxIpP7QemVlRnR3+CdnCeZBxyBrOF6oLzV3vMkoVUOR0urM0nk8QJTWmvMsS/aZsBwwxL3RuZ5j9n8EsIzOfQXpW3AgKjl6nggi/+mxzxZp1VtOnoS3TdzOVdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280467; c=relaxed/simple;
	bh=aDbMtkb7vLXS6gEaXl0MiYPwbTWQdGwMD5R/KH8kYUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHBVQ/LkmUXKYTwIQ82PD/kk0DkjIaOuXnxvPWZ4moayKvEekam5+10kHobmAGfiyNFgIT4coGXbktGld4/c1HHj3pH36e//6u8b4Tqft61Ylh9f64820O3lUs1wSv5cSl94hvoFeeHrxxZvE6IklPVcsuk1TLyE79WN1/Cf48k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gu2AUpMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+kIV2g4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gu2AUpMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+kIV2g4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hha232324468
	for <linux-staging@lists.linux.dev>; Sun, 5 Jul 2026 19:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YE6y7UueLsf
	6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=Gu2AUpMPsdWihBeIKFaHZTQdE6w
	3hlEj5FaB6LO25HrrwgnnnhbotR4nd9Z4wSGwf4UfkCGQV/6ByGXzYxc9t77t1UR
	KxydvfiZRzO7LVQt12P9iUwRudBr1BpCa8xRlWA11APsaC65cFh9VkqkdXLfhVEu
	RS7FUpWGXF4DoGxxuONB7a1iHQSW5kUybFXNTGlhVzncQd/ITVBR3Qzh2FEbhv44
	Ssss7TOOyxh8WnUK7ITPBb/1fcoeLek05gTbaYXanK/TXcrfcsX30aor/3gRRzD7
	xH/7V5eC+aAPsHQJS4BlpVVOM2yO5umWhzidCMbdBGwQ6NruQAfsY+kAKHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgum6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 19:41:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c8018f11fbso24015165ad.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280465; x=1783885265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=A+kIV2g4I8QRIxcOBT1tqyvQ1ZNDtCY5prDWBNdq/inOGR2bSJ1/sygE0TIVmesVwK
         k/odRaY7JDgY8/K5KFxKLTGOFdnXF5K9/nkIUT5UBGYYy7Q+9t4VynFN7n5qUFzsUsB2
         M3bqQvo726XdzGtVYWen0mMP3zdXHQ245NUgNEB5KyzQroq98NK2eBNhORwtg5hZKuUM
         fG3V1FxMAxUr9Lz18PilWafsTvmpyf7agO+zMfe1mzvPbNVqpv3XaWumYAlcxRdtw5A8
         bIhyqpejKiZwv7hh92LdnTL5hvcjot0GZAHoUf2TOqFpT4/kiDNVioEnnBojJU1VoFSH
         8oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280465; x=1783885265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=RwGFF9mXj3AkpoKOwC84ieFiJjHolUTW8Ta2i0V3rHONjzO++LeF87rEXeviXwdIIq
         7t2gYJwJOYGE2UC8C5E2ExmtShb7EbK8cx/ja/idr+tFRdVkbBHJzv51rBkOrrHfYiIG
         x2epQ2HTSSaB3xxclULuqae/g2IQUSMLLgrxOUZGHLP4HIu4YDv9ggmYKaafAI42OV2C
         VVlADlV22Qnwfze7Sg9CYrU+ZINzyALNZA8QyfMcldSpnmYJczJfo5wWTx8CfAf8Rb31
         3D9Trwmu2UJXrKV8it0iHC7wxLhy3LvO08HqDzG03uRA58ZO36t5zSLcIW1eKeiN0cAi
         RyTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXK2J/377byyO8J0/Ig9f9syLMKs2Vj+t8VTZsgiP+fJD+H/GnDP13jtKX5JYC+ipnaiVvF+ZevjQn45T9@lists.linux.dev
X-Gm-Message-State: AOJu0YxZWgI59yk2wEScB9Qt3aAuDxOZJ7n3bzciQPyp3ut1ITnR2yje
	+yAvJdoJvafp1YH6azrMPjLXyPQqMeXMgVFEmNpW2jtXtACFPBNO/02gFAnV+MxSnLTKE/iyF84
	qXnFc8l3TEH9MzkI3kq/EFpTKS3O3oEtJfRqdun+1LGdTAocAJaif9JDu0vzn9ajdLyO7
X-Gm-Gg: AfdE7cllT1BmOdJgf6hvmCXHS3AgSpS5eQ9BFpg/Eg0z5AXqZrdikKHcYYHbqc8UhF1
	ldlANoNSioRRmrfVDzLCdP6XEavHtbXiFK+K1598q4+r3VY09+I7/XyTqx61uXLZgHyQUiG/Zom
	GOsufuEH3oyiT9e/rm+D92SEZSq9L3HG9meM7S9R1C+ykOZokZaD6HtgCg9LY21fEAMuG56HvXu
	wTUg/v6hmAMTIYOFBbCiv/P2JxXOgoRgHze9jPf7hMZmyRrniEGTUB2K1Az7wCMbyvsrTiZjIWm
	4y3V8wWAsuikorm5pZOQaPZeQTAfbs9ZVAXLXuchJvtQPqgahnL19GQiLuT45oOQ2TV5H7r/Iru
	pfEOknENfv4gANYv1va8Y8UVvvcZrY6eIoZFzZA==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673585ad.17.1783280465194;
        Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673415ad.17.1783280464710;
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
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
Subject: [PATCH 38/42] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:14 +0530
Message-ID: <20260705194019.2565498-6-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4ab351 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: L2LJX4SaG2c70J_NsLcGQAsjbvnQGU5x
X-Proofpoint-GUID: L2LJX4SaG2c70J_NsLcGQAsjbvnQGU5x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9kJGCKtIRTlL
 cIcUVmfx/w5ATf6yQLgKvhDVeywbtZAxDyTvm6DEB6KdL3QK3qJEjj1036Wmz9Qf/mOz4IA3sh7
 kz7Z6RVk+FCZZYQsYYuXvO9KiVxBjMs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX7IgaPDpwbZWb
 pzZ45a9kp86TbPPbku3bYw8Ib9VeBExGm6rrXtbXrdSFCgpVNUa75SLO6VDtZ75nbuT3GqHi4UK
 eLyxIAfaksk2Ee3ddhkLQ17WLtIfQSxBV+wpzBwFbVKQb2Pz84EcZ716QNm6gLARgzAVamvkcqg
 TTXSJ7ZnKEFLDg1nO+H3LtPW1MFMpVcF7x9SysW/Hz7SLjpbKKVhfQm6W+cVQFILDjJog1R0bqg
 UFO4AuEgb5j7rVQJj05q1MssoRSrQ4pCn0q5cCvheOHGCxJLdilwtRVhMqWzKM1ByxJBsaceAmD
 8YG/UZnIzrgCat7CD3U9UHLgI3U7OFomKGhhML24Vpchhb93+UY1nmKmLhRyYICvmPWLRqlLgCr
 juTf++ZoDlIT98HS3Zd3hOUaE8TT0ySKci/vB5Wm0EdjpKjzaq2L6/UuNu1Ip/HPuqnSEhnEtMy
 GyZNWk1kGJ0v5G6fHbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

