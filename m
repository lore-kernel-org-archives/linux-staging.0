Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E04C43D4FD
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379657; cv=none; b=R3cD38GbjiZZUYj1Qfwvk4VORaSpZmimICdvdM3pGCRFuEhrtr5zRaczNpNnXCxV6AnVvgV45GRzp9xuyTsBF1cf9WPkhoSXZYqRCLK8JeqmmvbQwiVWCU3Jsi9mIMqbJfr/bSgz8WtBlFfuTa6p8DUKqRnlYLq/5zOUBCNPiyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379657; c=relaxed/simple;
	bh=SSSdIplKEJEBPlCNjY+NcISoiNn9OSmXZXvbgj2TGBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBfwonqcFKuSUiM3nooZx4VqRbiP6cJzP/EBCHnD1y3/PAnwCNfkZwlVdeSOjd+m6FEfxX/0ie7XC5toBp/MsfPyIgFKEePbWYjNSaEhEN60ynSp7mOPk/TECUwNgnwmClmE+ABw3a56O+nuGVuF3Qej2nD8bpGRZOLL6KgQcJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROdgvEYD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5MwEfk/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROdgvEYD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5MwEfk/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrAPg2209885
	for <linux-staging@lists.linux.dev>; Wed, 2 Sep 2026 20:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6axdt58sY1D
	qnmVQsW0ISUurcHhysngabrgAEPT5NAQ=; b=ROdgvEYDb2UZdpNEhI8RxvnS9DG
	2OQurEeIzPojM+T0MtsUy8ud0+ePaKsegGa2jZIAz+1/ZoRDfQgUPhsWM5VI8Q8V
	8njeua6nNI9k3tuL04Wmg+SptShh5D1ZtQpf+Zrhq47/HGQS6EE4cqFFn7skgYwG
	Z8Pah6EzNrX9zEbaBzGCISZoP7dl2XJBkXOqozZ8Zn62ajG2B3LSVEfCueR2Cs2f
	upqOVyaMpNKvUQ2R4tfkN7yAo4cStnJcs3FMv3FGzcqkoiO7mcmY639u/FVsvIeW
	raqcwHlpDp5YDpK9k9328GUmh7ldi700HT5V6eYIPzoxV9f3VRQ2Xz+Btpg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s3k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 20:07:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so2474748a91.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379653; x=1788984453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6axdt58sY1DqnmVQsW0ISUurcHhysngabrgAEPT5NAQ=;
        b=i5MwEfk/7BX2GLknBojZJjwJ33+HbvvjfjJ+o4tRxBf1u5wbSDuPjpxOAhBRTlsBJe
         YwfP6eJwtmU7+6k/KwwSOkIfk7xJy6mzhvgSGIOiFh0UAkXS+hTitBKOLHxz9DkVqB00
         6yEH0DOVRZ4kAfg1Lp8v5YKwv4fg/0XsRDYcWvW8kz2XnuE/MEaHzBpwFX08P9rHmUS2
         Qzjdy05XpkRsxAGm0mAC8iHYsFzKKznNd7Pv+MJjdVuRdFTXaYdsCIh+Igwi6Ew+nTZy
         3yzVBoJQugB/fiWX7eN7TSil/vvE4LerdsErvH9l4b7DmgntnpqJM9OHDPuASoKKUMOI
         QBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379653; x=1788984453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6axdt58sY1DqnmVQsW0ISUurcHhysngabrgAEPT5NAQ=;
        b=qt/EHiWhpkgVax77G3zI6MLAE4qcFRFIFyZCmH2e4RTEhehslxpFMmT3pIlW9lapRy
         OhlJI6EvLIFQiMzwMKxJx96b1whR7yMlp5TsfRdy1sCI0s9O/9VO8fxD+zUC5TxBHujO
         /K29PDZd0OU8wG4LMreUkQP8P2a91Q0x7BMmX0RBn+ZNAE/8P7VFO1sFTaqSyoh8rFRV
         7ildmVegd+tZbOj3oWtWKcKFkQslR7uRFS7/ybRHT7LjG1IcRhuC4UvAC2xj5hfA6kIw
         soYCCRzRcdbc6hBHW1nrbKuXM8Z/XbjB7wiKUDexqH+lWQYGcIh8qGTBpc5c8Ihw4xE/
         RzAA==
X-Forwarded-Encrypted: i=1; AKwUvBwmue8ZqVBu57jTTtw0moyHvOMIHCC0AWHYx+fE5bMII6Ss/lZBNR4hbNs2xOupUaTkKxpudY4sDHnXHtBc@lists.linux.dev
X-Gm-Message-State: AFuF++lpDKU2l1LD+kWUKXcNKLY/AoPiLaPqTcAFivH8MD/DBDNjFI55
	rioIDPceT2MTcQo2503KfIW4lcmPqrPfY4NvdNyMTIl/vgrqdxH0kitRBXbe6T7AC0CVbEJjAp7
	TdUTjGnQaUV4Boqq2YwM0oFfz3ALf/sfUeKYccRZ5mdNr4stpJUXct5PCuAuwtF0qNJww
X-Gm-Gg: AYBFou2Z7L7pvTW4KM68DwBH8qpIE2uOfzY1fp1BI824IMUWV3J0gl4zBn9kqzlnDXU
	IRinxy9AAVyuv2V0nuwt/dp5QWzifOY2XcrUxVAtEk7kjmcxtCT9JNJJnJPzD4St8rjQzA7BUdF
	1JlliuFrd46nhxzMLCsUwDYZfXv1+KmVRb0FArSG4O0o6sx4ZKGq55QqU+qaS5q/Uq0XQANXJvQ
	lbpG6mbXXtHlkGeQFqm1PfD9jwMwFUvRMD2pYfUcgrt/BiGuVcJWh56LWJaSlq7foBbrIk3OLUQ
	rxF9bMRPL1zqeaVIlhFPrORsCbO22Qm80vVxEh2DuYFNfrvwwUCysamTRQr2NX00ogzV4EmylDP
	WXVeWdnyvHYhGuorv4MUDUEkdoX8=
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr11942912a91.19.1788379653322;
        Wed, 02 Sep 2026 13:07:33 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr11942802a91.19.1788379652830;
        Wed, 02 Sep 2026 13:07:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:32 -0700 (PDT)
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
Subject: [PATCH v2 1/6] media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:58 +0530
Message-ID: <20260902200703.2016410-2-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a988206 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=wxxTr_YEz1i4iFEBgi8A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: ir2W3w-bPzR4MS2E8s6QF7FwknZZJP7N
X-Proofpoint-ORIG-GUID: ir2W3w-bPzR4MS2E8s6QF7FwknZZJP7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX0kfaIqFr4GGp
 r8TspclhBKI7W23vozo4SW1jlfJ/kX/Pgg18n4NQEfKP/LNvN3/aqaovxIba2GotUpPZxzFZg91
 wnyviH41d1OTGmqXgbJcxLZRy2WxUbtkSpYZkLpR+L+Xy16x/nZr+JDmwCPQceGGVr2OUKBaHVu
 HOoBQZohzZTHSDv1/eXqQPuf7wbvBlyjfSY+XXsRPR65jepX/jUqSsBssJHJATiENvX08UnS1Eu
 zL+e+nmXbCFLov01eOKJ++WwaRB/LinaRpAlz9OB53T6nDsdUzmnMRdkLoZfk4UaDMR7miyVBem
 zJSsR171biOcdbBW8QNKOyy/DsondPIDkwlFBmJR2rKXubsQBBCgq0dewVepRFhKVOuOYLERION
 gB5YjlwZVrKN6I6qzOhaANxISsif9EPByDrsLPcmNU4SUAt2PP1Crco2C6fg4Y4C4AMzZRxnBVT
 gOlW+kLdaegMTGuZjbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXyXpFyLOMH0aW
 js/gN/ykMdFU8k4wKdS0r80gOemrg9ad5c3vGgH4IlQ/S61elA5BSr92KBXZfrbj6V+eQTzQRQW
 /N1zwj28Qz5OIAiAdNgsCGMDRJv/GGo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Replace the hand-rolled devm_hdmirx_of_reserved_mem_device_release()
devres action with devm_of_reserved_mem_device_init(), which handles the
cleanup automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d94..7c6acc6d7e88 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2265,11 +2265,6 @@ static const struct hdmirx_cec_ops hdmirx_cec_ops = {
 	.read = hdmirx_readl,
 };
 
-static void devm_hdmirx_of_reserved_mem_device_release(void *dev)
-{
-	of_reserved_mem_device_release(dev);
-}
-
 static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 {
 	struct device *dev = hdmirx_dev->dev;
@@ -2316,16 +2311,9 @@ static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 	if (!device_property_read_bool(dev, "hpd-is-active-low"))
 		hdmirx_dev->hpd_trigger_level_high = true;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "no reserved memory for HDMIRX, use default CMA\n");
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       devm_hdmirx_of_reserved_mem_device_release,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	return 0;
 }
-- 
2.55.0

