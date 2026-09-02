Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597A22D2487
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379686; cv=none; b=G+T9sLkYMp+rljtlk85hhxLWNZi6an/95dYQRJNfOcvQRyE8AJ2AydpbiOGOtlSuNZ48zbrCDh4CTQ1FykqfjVJJ9HpIjA9D5mw2hYQaHj1EQGa2gVyVOE9geoLFuTM34dcWEaXio731vVHne30Ob05BFdBs/gCa6QZMIRQ774A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379686; c=relaxed/simple;
	bh=7irciqc861lyg2o5ao1Cr0/B5JpGbM206OChW/MMQ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzR7jRubVY3mxM6fAnabODgjRr6TG6o9Qq9Z4HvHDpCPdWxlBPso8T/9u9QRrVMukZgfuapATesrMtZ15bnLFSnwtDdUse1dTZvcWckR7WPKsOvScL2ZIyTQQTwd/yy6Q5cOs2b495baJxZoJikdWy3uEbVp2Du+MwDsYGXq/o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tz3iT1Z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cfyXNEze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tz3iT1Z0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cfyXNEze"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqrJ11071708
	for <linux-staging@lists.linux.dev>; Wed, 2 Sep 2026 20:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V62NrpgUOu9
	gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=; b=Tz3iT1Z08cE3L1Tsg6uwOfDDlUn
	OlK172bribh74PRXIRNSvRLnJcuTmAmGXtzeJq5+oXtGDt24T0SgWNFTKMUvsN2c
	o3xyvGkqECHDErCIEqxM99+VAwarBlIDHogFfV74HBGoCmSh/+CnU44qEFsEgMc0
	LpF2U7coKzkS1YPs0gz7Hbj/JooKnj6bCPL8V1vKhdMaLff6/5fMHjACVdDv2QJu
	tO6X72JpKItRX+1tQrpTgNjGGbGiD905GrptgN/0LH1HTDuNsrLJCjw3enNv9gfP
	TCtWu6AsZWs5xIO4Z0Gu480RmSQw51flp895ecr+MPU1PEDsQtnsH27/A+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1s1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 20:08:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d55d8cd938so25692045ad.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379684; x=1788984484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=cfyXNEzekvn3OJLCZ10njZx4oTE6nAMQIhdx12Nj5hZ4NPZ7c3pVg74I53kkL9Q1Ep
         8XvYdK0T7lYvu8DPkJfVPhCV6XXwLfbIUfRd/u4eJko64eR4iYpODhxWiUaa1l3XWRJO
         cz+DuEAtqBV6aazorWFbTYFlgOwJpMNA4HPu/q0uAAJMsoxj8gc9tg7Rp656+yLS5kyk
         c4zDUiv2BCZUQGR9G98wfNRmacNNSQvK96aHmlBgbPE9st7eMNHbl49F5BdwH10kDzI9
         jQkyX+G7Z7CYl5XsbmEWUKDXW7woaf2XOqmoxjNgCA7P/y0mDPLTmlxluu/mZBkpXnz0
         U4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379684; x=1788984484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=mQrXSEifztPiRov9xwiDnefQByUU7thh9UwK12FnGQ1TJChKqABnTuxwwipE9tWV1v
         d32rZrWobNO17GWVxo5eZEK93GQAaJZwbvUtoib355wQFFQflujbLU9rUZ7aOA6LeBJF
         v3B5uMC+I9rue/gNm4QX8NRo/Cpy/EuaT0osIueOhqL/btmwEynZ/iM1mU8rS7aDlWlo
         fHWhpKxTc3norrLeQkay39AaoKgMaEK2bdokXmBABzI+12eEmnXY6IEI6RWrsBtrtOFT
         dvI9PVb2PJFvUntUjsWVVn6/JSB24FPNLuIu1tyXsNjPO5H5L+bLPWWza9qoqcW2oGZ6
         6jXw==
X-Forwarded-Encrypted: i=1; AKwUvByxymK8TwDSZLWqYcPPEtPRmE+k85l5tyfLTlKGqRBsUuW+POz1a9Hex1yWVx+rbKLZ7GoF3xDNrFak3ghX@lists.linux.dev
X-Gm-Message-State: AFuF++k/MKo5G/gDR3Uk5+D/1XckCatN6AlmTg/teVrTr5DJgeGNcsa4
	EGQoN0t34eUh06r0i+xP1mUPM//8fks0ggshPduDZoacmNBmFc+u7+U8uaHhImJXNs1aNgIshTE
	yK+FILhp1u2xURJVk/zSEVzTxDYJMjnxW9foZzDhihEzHwJhxzUpLb9BvwpnP6anvD1tP
X-Gm-Gg: AYBFou2rDWK6GC1ZixRI+VGenLgyw2u01L2KTQxALxml3ijPvaP2Be//gvFZ8dxnrGJ
	LKwXol8+W/bN2wY7zpZ6Z85WdKL96md1s3V5iD/mEYD133B9aiCAOn5SRnrgfD+TNbxheq0lzS8
	0dedLpbMNv+dseEGx43myd3ySO0EK1uLuH4uwqrTE3n0Fz8YgW9S21I+cs8bi/iBfLyfteOHDB1
	+wRmi1L+wji+YOuiVM2sPTyspHuMdK5j5Xx6IjwsVQmhMwLmNQ9dv/mRI8KPsD7Go2s2mNqPY53
	dMSuak7FuF8XJM+SZDy/O3nO0dDAOYkWDYxEwwxCK/zZ/j5YCjI6B9tyLzjTWHFxi+N2nubgxY3
	HCCcekjURhWYic1fALa4QOiXOv94=
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445945ad.4.1788379683915;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445245ad.4.1788379683366;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/6] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:01 +0530
Message-ID: <20260902200703.2016410-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ey9O68peIPEjtAV31Ks3sKSujB0Jjbu9
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a988224 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YVK2hjuZJVh9DdmUNrMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX8UCfAn7VvAi6
 qrnSuS4cx4iGkhOcjF6NZ8DWsEEnaC8I8hUqw+6Fo24lOq2OxM42NdYZjgJK7VrZAtd3BDxFwpr
 4Ir78HAtKaxChGfFbJ8cGA4ko8ZUrsM=
X-Proofpoint-ORIG-GUID: Ey9O68peIPEjtAV31Ks3sKSujB0Jjbu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX5+F8ozd0pcNz
 HmfuCp6vzqrBjPFiAebLH8Cf9Cg2w8YsLbGPNPVehD8b/p3drzBnfzcLQcLEKGnmXIZ+wCQkhig
 t7OZd4+xhsRhgquWizPswTHT0DnKjXGlNbPjpYK7S97TI/vYqR9NUaMMXGF0Qaejn57jmir6tA3
 seOaa6odSbHXYUbyQu8/xtCr3XYOR4ayxRZvxQcH9RhroTQMz/lDOOU9u77cetrcB/1lAriTAt4
 V1y1mCH1pYxJw4iW3KV5eyKA5va+ysY0VoEKfKJbW9rlYgY5ZMxlAlYlnBFghRgmBVDFV8UhOVM
 KYwBAY3O5ZT0MiIjphozSo5n7iwN7uxg7wS7oyweM1zTUig6AG4XlcONKNC5j4eKHy69TpoiH0o
 DgPQxCbz2Aa3r0OF8d7TJJjCc4a3xmrhL8P++otlu7qOW0J6T5oRKfsNadB/xAAdco9jYXB/dIQ
 JdaiFsaBqwIE61lF75w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..3d37cd446583 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -803,14 +803,12 @@ static int mali_c55_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to acquire resets\n");
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to power on\n");
-		goto err_release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to power on\n");
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -849,9 +847,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -866,7 +861,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.55.0

