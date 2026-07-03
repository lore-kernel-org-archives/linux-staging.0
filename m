Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01A6331EC2
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107665; cv=none; b=GvulmQEhhcxP9GNx2UO9WxGXeYZgfMbMzkQxPpkXRjQbz52aQP1ynfeSQtyE8AMz5/kwmfuwcRleSk2pnOxNcWsAOp9y2BgG97dhn0aol8fpG9xOjymoiOM8L75SMesWThOBHaBVK6CuFVwZR5KeEpASRjH0Gl8Hg5a3BONIuK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107665; c=relaxed/simple;
	bh=petPHqnrzINJgJVsEujeJj9Mg/pmjka7fhYUQ3WA6Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnZWL7WMvTcC/p6DuZ/zt6EH2a1toLKsa3Xupw8F11vdl8M6lJRwZdgB65FFc4EBYZdC9FYmF3SXxH3t+bnkPr7eaE1V2+nxtkn1U9dysWouEUTVTh1nv0KNGCAfRqBFbkktUMMndI0Mzqgd1F65vcC0UMVYW+680wkqxtVz+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BWHUaZWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDlZVyCP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BWHUaZWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDlZVyCP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiOmU678075
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 19:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7S6HE1h6m9l
	hE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=; b=BWHUaZWv+bF9yKBF+/TmAfINoX/
	JDQrYh1NjTGMSYWenUzFcBW7g0gbb+J+tyyNa56aj4sFeHGr3rPjjEDb8QbkBV3h
	KI3Vv8WYnY+o+4H00pvmBAdFK0PUp1dOXrM7+u3zuzfdWIdWke9AUcUJH3uUSxPT
	vQqu36jx0ftIDpgqrT4zTl9ahgQOi0NiCOdoTQREaXeNRfTSMs5kjjOCwlH5Ue1k
	zLbyHuCkxdDFhfryu5s/sG/7LZMR1EHCn6DL8cTFv+HpaM0WeShlHADd+PvnW8Xv
	B2oy+EBhx3rxbvnLnT43149pGltQRY09RsmrapivIiWSZbFohMSsgSevu5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u32jdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 19:41:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fec599568so1494146a91.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107662; x=1783712462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S6HE1h6m9lhE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=;
        b=fDlZVyCPTaBNwIyrrYVa5nrX4BuqpJZlSyXK9iIDmBsd2n9AUtmfHToEkUMTyk4qZy
         FGZ+gbw2S5W4n8kam/5djaYNTgogspK7f/EHVpz3IJThCdawRDMFmcymMXskyVM2HN5b
         y9JNirAva3mbZ/C3pLYFevgWpU2pEUOK+/e0mfSoG/DiRq/AFk3T5kYwX8mzucHLmL2u
         MwS7193iinLtkZbHbp6sBYZ3iYdALZZ7HqLgwsZo6BXQhiHhS9Rtu+qZ3xuqx8EZVYRL
         l+gUpgdxv0HUTx6t+N46cvDDAdlsJlMulWHScLEW755o89qbGg2K34VNBF+G06Ofnrpv
         mUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107662; x=1783712462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7S6HE1h6m9lhE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=;
        b=iHPpLENl0ljaseHwwOMcHB5Cx2VNaw/uIv+Ziibs43/Ghn6VK+xLy5UskriXwqf/Tw
         PFE5inmGNo/QZz4vZmn4jjGjh0XvbYmb41XV1zN9OZ6jUzxsu/Tvxbjrt/FZNIG8LXza
         8hzdSXni2qd3j0XuAb1aQsIJlbI/hw/VVtNOhAmP3cq0HJwq0KI5tVBfyTlv59LJg5iI
         2xp9kTgK0eq8bjvwSX8QvXw+rcgztgxoYbmHWyFEpybBSBoHGB+xEirtkkVJzl2hhq6O
         HrzTKDAG9xvnrf4HjnqAmVvbnxH6Kk1shnkwQi7y+nh6PTi0KAvcZxYxsqNF+old5rkf
         a3zQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKr21URNMP5Hux7tVA80JyoiTal9RC8W+o5JF35VZ4ekb7CvpVy5QgI3MyQrJiUO4MjC6yYQ7+5bsoytMZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxOfjtn55hc5FI4f5fP0U81HCEH5fygRIn1aBX7pwpn5oaZI8MF
	yzTbCiUAmDIqlA7VDW0GP12Ob1qz9eJ7i7TdzIUS5eIdaboZIqCe7iJqgKv5XFPgLqPNnP9bN+i
	xDbI3y1I49OTtKUh4ixHToYsSPlnoXY0s4UbA6rfZ35/kwW7GOsw1tkiCSndtd72zzTEx
X-Gm-Gg: AfdE7clN12sMFw8FQ3xvmhccfyfrgn1Fcifj8C6+3U0rthJZHjM2bCvifgjd3BeOq2M
	RTPG4zItdiKs/y+hVrtXU3QhbCIO3ygDGpua4G8d58qgW3gndl/sM0vJ1cPA2pDT1cWeCp1I4ib
	tRH5XItc3/lDO7ItiErFJKac4QO9125oEcElkg7tDYxJ1spd3tMV5Z1Q7h9LcgyqbzEYxAkYbuN
	ox4xf4zi32mSn6dHrnvBjQVh7Z9sWPgoRSBlg7tqCrl4VYGTOHRPtgKvY7b+uLLQW4SkNlwJmSU
	dE2Y8By+ZiO+TmL+iMtb8Z8Klx7mvsRN95Aj1/ROpk89PNzSO2KnH0f/t1LTJZ70S2bPS7At+r8
	59pZJTcMCMwqebokj12VjNb41iW3BsTqyrjn4ow==
X-Received: by 2002:a17:90a:ec8d:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-3829f7e92d6mr770721a91.27.1783107662204;
        Fri, 03 Jul 2026 12:41:02 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-3829f7e92d6mr770661a91.27.1783107661655;
        Fri, 03 Jul 2026 12:41:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:41:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 04/42] remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:17 +0530
Message-ID: <20260703193855.110619-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: k5CJVDgrwnhXSwE3ThOrB6DmYoiAgNAP
X-Proofpoint-ORIG-GUID: k5CJVDgrwnhXSwE3ThOrB6DmYoiAgNAP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX7yot3ZyZhQpi
 uH+EUDmM6TAj26Rfy14bmaUay6EWA6lUUEXY8X/dE/EtTw/YB26X6Lx0H06oVY7+hOBud90tdyH
 p7lshpx9nPEZL3Wk+Bvh+NmdawWwqV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXx6TVmVf+yMuX
 gfdvvqV4fiBZlfZI7qwuwyoBlKReUCUxlNLmLyBnpS3SB1OAFh90l9VOwis2yOEUL84X+lD+bci
 osKMg7cfwTGjfadhn2gFefxD2CXw0ia9xpUTDxvBK0iN/WwRzbjkV11JWVTimmvoV6uCkmr2XLA
 FoFompT1eW8tt0zBhoxKlaTfldzEa/bmN/SvdoTFiHQc+URxO/ENBsC5NvSF5OYSnYqZcbnwSX8
 Zewm8jt7X8eUFcMseq5qjwC3Yk3RbqkLrR2sFXLb06w3srWLzH0fGidwZT7fe62f9jVBl8XzKip
 pc8EKAIpgc0zdnG6s/O+1LOe5urGyfWUxuncX/8PkDFP3XYONghzPNRhpi4+6tDmENEo1gzAvNA
 XPLyO8Z8cDqwbBi9dW89DmNyUIfiYa697BpaXDaofjs5wZwXDMEe+ETVVJgzz3qj0fpkQe1yKla
 uU0NKowPF7c7K+uuSYQ==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a48104f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MiZJTWugLlTGxHTZgFEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030198

Replace the hand-rolled da8xx_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 23fca7176539..cd9a8f2b3163 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -230,13 +230,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static void da8xx_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int da8xx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -267,10 +260,9 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 				     "unable to get reset control\n");
 
 	if (dev->of_node) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
-		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
 	}
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
-- 
2.53.0

