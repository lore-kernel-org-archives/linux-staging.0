Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D5A39F162
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280434; cv=none; b=M0iLraGjFKHJk4Ui2hZu/kxvKz32wQ9t6OkfHyu6Qd2agX0eShcBV/cMCNgnO49buK1/C/fjbBbi4WoZDuFcbmmfqzd0YwmXFYiurba4C/FIGCuj7S9DLshJ+LYE79QDnwJ7YvLuJxDjaV1NniMQjginybAB/yxZxO87WQtSLcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280434; c=relaxed/simple;
	bh=hPzzIh+00z/2sTyljZcHfK6TfnoHNAT4ontX894B59I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxsKvfKockIv8xiJjwZAIqaLaFnf8VfAHdZDb65DL7m+GuLlgwGzo1BaMno+7INWNiIpmeuDMTr+IBByWcPYq1a1ZeK+u+QHG6j+b6rq42PpXrNKXtjs8/OpdxPCykZ6ndRDVhnjegsWul/qEjVYlWY5Uw+s3bPGVyNu9Dw50u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDqYFdv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H60MQVeW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDqYFdv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H60MQVeW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hirwc2170497
	for <linux-staging@lists.linux.dev>; Sun, 5 Jul 2026 19:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03p+FFlmwi4
	5suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=EDqYFdv4Pmeqy9IR99dcNiLiDAT
	/yuTE7Ljg9Hev+D7GIua619X8FUaXVlexko06UWo2I1UG1HwTHa/3pcOiO1FNKdk
	YiY1UO4+AP6rm2LO5F78feakLwRgePs5DdWtrzsXwhYCgTfecFqPFRL/MQqcfyO9
	pb9r2UQAkfcA5gru+dfTHa2mdfv7340zDAANejxt7cH1lKuJqEenlOMOzxtkjth3
	hBP3jcZzSc9vRDjWjL0r4gMT/svWmjZh1dvVGSJdpYFTDJ+ZtuRTINMxgHG6Wmig
	3zizUVw2wRtMv7D6VUvWZqVy2hRD9jXlwyfLqvXinpJSMddoU1sfRGdzOYQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8k8rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 19:40:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1766755a12.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280430; x=1783885230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=H60MQVeWtlvAfuWVTZThlnb7VuYCdgMUN8i71jzaT+TvemNvj4lu13+783Y02wQHI0
         7yWAv5AVV0p1I9dJJ/1EZlUfDDXa/uS3VSnygqO6aZWD980/ZNbCT/4ORBMPrMsDpNH/
         iS43gu9KT/nOCBsXqCeycG+7bKp/Erj8ndv3R4uQE2SjGlvIQ5vCK/7oXGoKtuPdvE6j
         822z7/BGxErh4lnf+j/IO5vPQntAv63sJaaJ+ybm+femKMeSBpm73wgtVVcBURniaPn6
         J2qgSDxtWrLBY8jHhTm9Wz81p1asU+ZIx9xTX6BgB2t5+rnbpJVxRiseY1eGthaWKEaV
         Ic8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280430; x=1783885230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=fCLzG+4r+YLQMGkxha+jXvvkaqYPN8LeNPp+BGBs2LK8iv+Bs6VTff+wPMXFjtNFvi
         qokzUKviBXovMsbp80re/VzeaSJv4kaBNXeXCBGojocKDTrNM92u8M4C6p2eCOc8SNgl
         9ALHTQH98rN3QGFxvRKH7sEI0gn8NygWqPdBUoiLqhobbMA85ZD1fVZUvn9HamB32DNR
         DoORv3jJjtQ8bT70NZ69xTdippj787vYNu6nI3xh3adQfRb3V/axgOOk8RII/EqZVdLt
         MVtpk3DtWpX6Key5brZJwFLpPWtmvCNp85PxSRVPYsWk7AZ2eToHMsdgSHdJ1YvaUAz6
         AqbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqm2Mj4dp+7X3KdEjAzdUfZruZREtNVxxJGIqjLv4rkrRkAP0JTdRBJrsdntPGZlLtp3LCeLYSPxTE4H+19@lists.linux.dev
X-Gm-Message-State: AOJu0YyWnLOOrNvGJV4TCxt13tfigVQpln/x6ApjhVvpAypv3rddhf1K
	oL5MH8oNjkjaxTVOJlnahhRB7z4psiFJfpUmodQ1HDGRluN+gNWXKuaY12D4ensH064azdeT9eI
	xsmRsnDhzC3y+/Jxg10Yg2iXYWhtFpzqxCDZPQe8h6dkW+2zBe3tPrjErTQ+MzWmPbRmR
X-Gm-Gg: AfdE7ckXfNWKC8EVFIF8NP8+TQvXJlTfcBDUhsoR+WQEYszrRhEhI1M4E6yw4tXOFgY
	qfQ8T0o2lHkxPCs3g3GR4i6fLOy/S5juQq7ZhyKOtX4ZBCp//JMhP30Ny4knaSRMaeLu02JoSeZ
	3OjEuXOsSg8+GuUFkCd0s9zfM1Psk5sxkdnADIqJJtEahJRnomPYb5YVU8NhP63adxtNhaKJz+n
	RI4Apy4hihzhDTSHNeGU37Mv6+NrlDt8vSfwCrU/2NDTArWcl2G0d800AnfxAf5N+aWnYY3OMo7
	PE3OYZWPMV4WvYR6qbWshhDZAp7dNRiWME8aFjrvE66GqdgcBo8Iy+E7vFUQ3LKABLzTCI1/qJR
	Vvbh2rSQ6NGumm0q91tQehz9o6dlZAZTme+IQcA==
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693675637.34.1783280430280;
        Sun, 05 Jul 2026 12:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693658637.34.1783280429779;
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
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
Subject: [PATCH 33/42] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:09 +0530
Message-ID: <20260705194019.2565498-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3UlYO5aIl5Y2
 h800o2bvkD68RyBXM33u4hGxTrxpTpwYR5HLte3RNw3J8YCzbAo5+M/S+uC7OAGz1plbqSF1txS
 qCYvh3BFj0tWntd3HVSWyr/IfLyIxfSNY0L3m6eWdc8fL1rqtSY7PF9z1ZBHUajaqdejfOqr+Ns
 95cKT91zRGrUlto0kPqELOrmgDN4wLDWxKfgI7OcTESkLkv2aK5PQt1N53UcqzX33gze3jtIQ8z
 pai90aAGqnm7J5n+inZS0K06+PLH4i26SgB2/HtsHJRqg215Ar+kWOlZ+LzwL3zrycrJ894OHtJ
 Sqs8LBTePM7sK13fggXIxzghot2BEwrFDMXtBQIGmfZA7aI/ZqFaPFRQEwkLjU/hVxcUqi/ICyw
 99tF16rRMvp0MiE1aPjYSA51/kzLySqUnj+dW90qExx1HDYqMWyH7I2qQmzrvhqyCR6fITHD65Z
 wB62wbgw9YByMaB5azg==
X-Proofpoint-ORIG-GUID: t2l8M-pXXC05i1wi3WU5cncPLQI9ZJrn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX5fOyHuCsdbaw
 FqyxhEZ7ruEZEeapDMYrESjDjtK2furYpYVeoVDMpLzQzxY76TZxHfZJnrA9LYJrf0hEDCquUIF
 n954s2uneHHwzDe66t63Yfpul/20lbw=
X-Proofpoint-GUID: t2l8M-pXXC05i1wi3WU5cncPLQI9ZJrn
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4ab32f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.53.0

