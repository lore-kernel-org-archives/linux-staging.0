Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9DF38B7D8
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280449; cv=none; b=mfmQMN8BPlVt0f5vdwjIFU3WjHyYURXJh0aFlFPXa0Ad75r4jKSPJ204LHPhFecRfpCikOpvH9PVA2FRMvO/HkixTokkjJWrudmgzjyAohFX66TVdRWo4uWBiuFPrSGxVHYWZX1LF0oQhsjAY5OHjhRWsZkdIOjl+MNV0Th3BjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280449; c=relaxed/simple;
	bh=uWGYzLdeRrzr6t0aAVNStOMdR0p2+G904nfPHoPwpPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aj6CjiKWa1krt66XFCulTfzDDbrGwBQzhYhyFOieHaitre4AZEA/HQHbMQnIommVPpzkoskPl46KYExUgun/MitVHtq5l8P4CdLBTRAMta5pb+isV3nlLv6EBbxsVikWSvTumAhGU47qeuuBYDh2COzybZN2eNsuYIXRIrhUzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc/WGFTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmXJxYtn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc/WGFTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmXJxYtn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hj88h2329191
	for <linux-staging@lists.linux.dev>; Sun, 5 Jul 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7OthzF5yzbE
	g8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=Lc/WGFTEsBR6FyBf8pb2q2cTo/S
	IRTkAnMpy4BZluObjv10Ds1+8wWUnkRZLMFnZfxn4lwUf9wNpTCxvblYHfxq/YKl
	Ovc/Cj5jLSEuk8ulecmXZk1CDgTUxGIQtjZKnuWR+K1jUu+ftDDZonwnoZEjSzlk
	ct1xTk+NVIo42IekyeGwdAr5vq+YHarJ6RB16P36dz97W6pvhWCceSyR2czSTYp6
	hSXnIp2oW/ZkZTxzubwpV++50pKMPkSorshnXRFfqderNm50KPgm9F/0EgLX4x+X
	hMm6Gy4Wmztc6y63i7GrlHroXX0TGdaLddDcR9h9VbzCKd2rrL7p6658Gqg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh3csr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 19:40:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso3250194a12.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280446; x=1783885246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=cmXJxYtnVmvZD9DsfdolHaRuHkkwY2E+SppdPeLnHGF1lacVpGjOy1Ry0I8tTlmLSE
         3Xus1oIAM0eSarMIkgVHjMZW1u0c8yphaNHkca3ohfvimnQYymlrj1N5x7aUgL/Od8vU
         mGxj4VPdO0hivr5sZRj9+ntpgbimMPCuwQ2brqwgfHg/dvGemrD6QITrsxefpN6KBqWo
         C1f9BXdeZbkJTggtuhnGUajc3+CXCtUnhIA0yIyE2gcIT/tmpB08Qlf/Ve/nbtvktwNz
         hv5o4rCn+bUCPlX7xZM2WW3FcjWm0ZamlM3WPX19mhhBpln0An5gbt5HwjArgLHzb42x
         y0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280446; x=1783885246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=ELlhyDNWJGXfLaX1sGcIPvlCZIcYt7shYKTFFosh7cktWg5AtnsNIIl9kujuyb7+6a
         B7Od2DbG+tV2V74k0lYaHeYxS5PtO8xvXjIPhYfAevyYdoftrUj8/aJbVxPOkEANh7fc
         woRi2lDvUwHzeselOTtOGDPJBWz1eknWLst9oSm0WDijPg+c/IOmI5BRKA7GKqn/Zmhj
         oFkab6H9mkfZjPNw6sBM8F3gONtUAar4Kt3qm+0Y/Xru5k4lNomdMmUe+OsouGsu0huE
         xjCIlOLqXpAHfmnlgfNiXu2/jwOdsY/prDw5JeZwzg6cMQeXG+8CMo22d39Dao1XJ7K1
         x2bQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLLEm8ic+Wnk0rNfXjqHoZAzIkxH0mLTdEsbAa65FsQevifuczL4KXPqPyV4AQocStSr1ZBUrx+6nIJoBC@lists.linux.dev
X-Gm-Message-State: AOJu0YybxDYHwPKoinhM8EEGRZtBwirC6pw0xghmXJMO53WAhtHV2mfA
	KyDj0DRKSHf8SacSA9opPu/YMLbYeIjXH1uH3KmHw5rVQEbcnNsL9Co/5fa85/8Fs/wHA+aP+g+
	WWt1nco3tP82rmH6Rfh0RVV2+p2K2ikbzd4BYJLh5muHiDyg/bnmp9I0Qccab5D9AOpgv
X-Gm-Gg: AfdE7cln/k10JzPmLsl62Z16xNB02qdBN/Hh+r22iDjzSNrOQXLA8gb6pCKrDijO61k
	LBoP0FaN6tcQytG+a3eH5V5BhNbiE16LJA+aczo8c5Vcy8Bht2H3jpouBoX1OhPJuOj7s0p/ELF
	SOxuGKhI9cKkI9DtpNcKTBRnRGcgI+mCg2cqtzNZua+TeAeD9Jw/Z9yMUvPDVzQqjVkgLjE1VfC
	0voi4D56g+Q7xk1/3oQE5C7pdUtxRrNk751J3Rd7WQ2+FFJXqQtPDfsUApWucI2UbgLkdOYDhv1
	u+1epGcDeUn6kCaU+XwK0pP844FyNYdP05WeQNX5sNAd6OMuYQfzDSGatN/Abk5dfD4E4MX1sw7
	QPvnpeJOuv9GtHEW1RoH0jIvUDF8+OdawlnpY1g==
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049938637.60.1783280445928;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049907637.60.1783280445455;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
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
Subject: [PATCH 35/42] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:11 +0530
Message-ID: <20260705194019.2565498-3-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4ab33e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9U8yKjlEDLqM
 81KTjRzriGnIC4SH8M2eJatRv26MH5rp0sV0REKV2p2Zq1z6r8InKHjECM88FKn9adR2WeAExze
 ASN5AAKf/5NwTgVErscPjGeQRUGeyDF5wkSaggWDVzdrgunQO3kRaFh5on2yQnFxvrlsmkIm6n2
 et9+ZXTIfvc3MEV9Z5nSIGIbsVjEM3il8xcBsW3IbboP0I8ntM5wcQ+ebfXhphxXe5htPvUZE4s
 jmaqhtmpaR7pIddWEkAr2qok/7XIjmZY1Q4jJtaknPzX2YQCrKGV8aBojspEWMkuZS1Ys2gOEW3
 8tbOOtPO12gcnEQzkRalCVHTFWcq6Y/VqrhLveigZiCTYHuudvx2WecGlip4pHph3y8eKbMNYLp
 X4qWzPAcx8ceOOmykzVQhHELMj+WBAK76HRxFSzicPzcmR61b/aqAuI5mhYw/m+6oKoYAUurQlj
 569IbhlmDiLDCwyZbrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX5X9LSO0Fkd7w
 stGNxRcyOo5+pNCP/7Poj5PdUW30LFsa+lEeED75IPg3sb/sK7y6a78YiXdfMwUqL7wSp5+EZMb
 0AqrghNN1HrKeohvQMltZoxYKt2M0ZY=
X-Proofpoint-ORIG-GUID: oRGffL5AHHNXJ1ypl8YFrnHitBmor2BF
X-Proofpoint-GUID: oRGffL5AHHNXJ1ypl8YFrnHitBmor2BF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0

