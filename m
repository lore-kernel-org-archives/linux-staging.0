Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E9F3B3C10
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379698; cv=none; b=rUzvhPSmuLm8zuZ0yA7go/Vhfgug/Jk+5BDE7z0Hm2W4koUX/FsJ9xradisuLrHSdY+Xg4zA2sAWtdNOd19PCRdDwei1z3+79bbeV4dXWULdf2eWKdGAeldYTzIQdLQSOuCGSKWai2/DMCX1uyfcbi7dzG2n7coFOpaxIEvverg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379698; c=relaxed/simple;
	bh=C0TvK1tf0KLvXbbBhNT8Ocws0Ga9btnZtn4piTCQI+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UK+cCf8j7sTA8E/q4hIRxCwhWGZ2ehe6KiI3HnkIQm8gG58IMC5DtbrXTbAwypmFjUm778wHDmDp2U8clYHCVk6PQu828HO3Xsfd5leF8FV+D6xhqza7vEfA7l56vJOIxjLFpsnyhCmchnTMe0SHvI0bCTkP/rEhiqHvF/v+HZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+qVvV11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPZ/4Eik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+qVvV11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPZ/4Eik"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr7af1650778
	for <linux-staging@lists.linux.dev>; Wed, 2 Sep 2026 20:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iYuD0uDqzSw
	HU/LAQJijWaTr64DX3VL/giE1/pE1aNo=; b=M+qVvV11pixl6KhVG9hStD56ULl
	HhKND36J+s25d8SnWLfEnCsAY3W2C+ZhwEZvtp7qAul1VrhtgDfrrq4DaqJ3ZzU1
	z1zZQu9vbVN44CrHCtmJU+rAK+B1f0vMgFdTAr7FwMGklBBSqneXiL8iZGWwEqXh
	UKPvlcpUK9dyrnYdJkNRcw7esBUv8iKEk/AQRSCskMJq0bPHgq21fdTbJ32poy2+
	nMQeKmQOL7itoHtqWbqTWimQkXWx/kGoao7+tLDMxjUAW76/aGKeVdqzanROnKgS
	lo+j+Cfv5Cx+MfNlIJRB/dUJu9xj5DWvLtvOl+rDuVSDntH2ZqBUk0bbQfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sqs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 20:08:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so2182314a91.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379694; x=1788984494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=FPZ/4Eik1Y191rb7YNBkMrLCPGH/409GZYGN6B+QBQvMrQMUxRLeomH4a/hLWdgh+X
         O/xtwNKe4tqnQvdKcZU95GvZ1wiCiMHG+ji7xgGipGmfkxY9n8ufVDDnzyLHx2BsH3g7
         eUE/GG8qMKqp7WePyymV2wWBmDjNFdDdGFUliOah6M9v4E17YzZcQx+r3rb9iPYsW6X/
         Uyi3nnlt5HSljV1tKatboxivpqzRipSmyqQZGeVlXESOPQ1h/Ok1zN92IDqK6jyaJU+r
         CGrBUMK9cWHHXsbaGgp+vjBMMeCVDQJ8E5TQbcXJzRNlq4DQ5r8REII3D3EJoYCRdFS0
         lKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379694; x=1788984494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=p/MjyyElvmJ48MjyhZY4Z68h82is/RLsd3abdXusn/LILpcTMU3xiW+dVAUdecZd18
         CZA0J6alCDLCE7N7QgfdkoEJZBMaoFxhYvolLYEfv6qnOQYMlOJCHHxGP87cJ7Gw1DVh
         cc14MnEPiFKuJeb0HyMNkY4HKKwVYWBkDO3j1aTYsB31RxmsC2uwoCuzQ5VVlA8pamUP
         yVSApUn6p1Ke15K8+abT48sAO9L8Lup6smwgUHtaU4+4jO5hBAAElFsXZaOfrKwaJp2g
         180+2JccOO3tXCojHscft2xV2fzTrvWAhNW834KV5WhZGv/e17bk+2fdY1z117qJe2vz
         U0rw==
X-Forwarded-Encrypted: i=1; AKwUvBxgD8pYPJwhqBDheHXzFRAdrPtWLFoYRmpNyVla+tSPdP+q5Ou9xfRUZpunonyStEqeqAaL1CMonwUupDPw@lists.linux.dev
X-Gm-Message-State: AFuF++kHssq2r1QDCiGaMeXjejSp8q1pgbwZAfgUQI7QUmGeVBNcaZTl
	AwNPiB57uRGog6gE/VZV+5kIRWR9RNB3LMuOhztvnahaoa0XePuv0rDKEDHk177rCsBNOIjFdCn
	7or41LN/XN1hwbF5g+rWl5xLA8pGg4nTc8JUnvSy01rGF9wdDy3fNpvoFgTInqPMCwjcW
X-Gm-Gg: AYBFou0UOMCRB5CV7ezIf0+/VPVhFOn2pFILpPUAidQBcV2thSaO0V/BIMIlioQXTKd
	3g2w2hpiWhfSVMvcvPyRwz1wdpQ1TdetYq/yc066Ukxqa1Fl7wNGQJTNR0XM8lQLVMhTSdMzYp/
	sBFlUI64wMBlXeDs66hv/9dlZ8CkxyrVPkChq/KAq5U5UU+lGGDQp4vq40sztP2DeL7QfQpDJxg
	ZwvMNj+bgdIp1JeYZX3BVUWf+jqB1SO3GN8bFiUgqubJh+Zq9QwmptUz3lk9wCnWvrg52BxR+i8
	6Y4Znd37mFdON8pvlkyGqGR16ozp4AuoNW6Iaj/DsFCs6Ny3l/iSz+Gd5vXi4/XlXwdvdfXbevH
	IQpUa1FuizRj9AOEL8X4/nvMtwnY=
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811247a91.3.1788379694180;
        Wed, 02 Sep 2026 13:08:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811125a91.3.1788379693552;
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
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
Subject: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:02 +0530
Message-ID: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX+FsykQSAvggd
 G0+9tJ12bcMQuM/V117uI//EJlJJYQy3XLuAL4n8cfHOVtccXsFX9mTnPLD58NB8m1a6kf3PhFT
 NiJn85ERh93Wdjbwje0u2WEql9DZl4bCp5Zq2qyDDp+/bDzwqhN4NlerNtpRUlpoiQTrcqfsDz0
 N9Y4M7dy2N3siKbQECUNuzBgdPVz2nezqeyVt2sBfrlIfm9CPH2M7o9i4HG3646JUP/CogP9vF3
 vviqHKRem7qhRUO6zo0bEcjvuk31HalPph63g4R1+RFdWoYvQhYuYkdOQE6qahZ7u7YE35xxCMq
 CbTQAQdguMEYciQKNti+V8XMEu37IwmkanJsmnGUn0YGT+qDPFK9JxDcEVdnQ+ZHRIu24knaKzp
 vklCyr43R2Ur3ChIQ65lOvGdq6uF/zT45VOz9rYAYVcGouIfWVvI02OpzO+5HGVkkn7SIUXuC0f
 a5lF3BRKzn8OGTx2hBw==
X-Proofpoint-ORIG-GUID: Y9wlPAXaYxAIG68EAmC2AgNuxw2lWVfC
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a98822f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gqQKJLWYzfjTGvuwkdcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Y9wlPAXaYxAIG68EAmC2AgNuxw2lWVfC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXyDs18+cUP5Lq
 bIXWGuwT+NGb2RS6CJsKNXNZX4qrWqCtId68sebGCq3gV4xn78X8MKM2iM2hs0ezqc9fKPR0a2Q
 uSio+/5ecTi/Mzdx/87FNa/naIjLts0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..557bffb2c2f1 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
 
 	if (vpu->enable_4GB) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			dev_info(dev, "init reserved memory failed\n");
 			/* continue to use dynamic allocation if failed */
@@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 free_d_mem:
 	vpu_free_ext_mem(vpu, D_FW);
 remove_debugfs:
-	of_reserved_mem_device_release(dev);
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-- 
2.55.0

