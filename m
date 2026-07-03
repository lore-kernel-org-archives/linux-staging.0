Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D273340412
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 19:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108320; cv=none; b=hl0Ef2ZnvWILwMGz3KQB5OqH/oi1kPY/iAhnkvNO8yHkUKAiN4dDEm+mUA1GHiFc4KmWLDgdenwtF40+ek+xrIvWZzJtMeMe3l8OiB0H+9ui6v9FezPZ9xAyYzOHXtAMoWahHd/NrkNdfKa/0Dfwf+RWOXAS6qnUD4nKqV6YRhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108320; c=relaxed/simple;
	bh=P6V+rSsIeUgHst/mR/aTyqKVXN7nAonIlaO9qhlGbAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0uGt37fF9sGypTK90n6MR4M/8u6+Pms3oeENnQqMYj6YshsJG1kzDa4e3K63Bx965Tt8e4dOdJUzfKqJDjGALaiD/0PEGhggbC8voddAl9IElPK797O2Ilwc8C9ZX75fKzUgp6SNrGrDJWG1eBYE58KCiWklgJaMoUE7p6NA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4XMHAOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBcUDcJI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4XMHAOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBcUDcJI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiP4r676046
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 19:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nHoVcIBC9Om
	7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=; b=P4XMHAOoopK+3YamHsJ9mNVAnVc
	ZII9wz0TAH7PLCyGcOHvNPpe8XqRldk+i0My8em5m7NaR8fYEJMOA3TfSO8ebA86
	s1C8rZsx8cpBhmJSifxukuS1eKlnfw+M1GLANC0R6+tDz5sYbHWGfxB1LVE1f45L
	xMO37pCP2ni/j5AxFJWw8vc4pcSLunUSTHMcLNxg1I15ui2AmJ21o0TJBFA3UWLV
	lTNZ09fpqb0hbZNpYHD/mo9UDNSTDfuQ5h3AQpsxCxERdufwt/nWIhySK57UZnCt
	tUZyrGZXbXmF93l53ApgGRVQD9imB0kb5eDmjI0T7vcrptivu9KwnL9SLaw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh9ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 19:51:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso846039a12.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108316; x=1783713116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHoVcIBC9Om7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=;
        b=LBcUDcJIMSVTnrxoPEn40YzgK6sNxvnYEniF+TTFAYivqJZmY1H2EefLXy6E05azEv
         ccHH03cPP/et6m80eIJ/cAhz7GNSu992P5HbyNe0o/h5vB7d70EscoajJooZ6PqOlETY
         +nrUljhx8pewSuPgXyiKTrm0l2Ko7olKONkKU+f8ryt3MXPRJCq9egssUeNlpe+xyyyT
         HOUvwwixkAfVLJPpFc3mPFVsj0ZSE1sWbgZUKIDRKyZMWfolNn9rtpyH2eYaHlOrjSjJ
         mI82vhxWY96I37HHUakc5Z5fNxmV9nvIHfKIQFG9q9lVXlXQM9UlmErOm9nlmtDBEPZ+
         YbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108316; x=1783713116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nHoVcIBC9Om7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=;
        b=U/yD8KaxFS6aayMfs3Ce+1U6BmAOuP0iqgIlQcWGVkN9EqbuJO+8zRYFHC1zJ7EeY/
         V2naIgdhEuFmaJC6ozGYVKXy9eoeRx3uI/2amX1nuwhT5jdJwXmJfmtJ+nSkdbxNTbTA
         sSIDRSSw4nwrDf4lDpLQ31grn6wp/eff00C1wRGsaqSZK2ul/S0csOm+Ymy8DIlKFHyj
         VDawUx0t2BWBJ0cB+DemsNu0N3Xy387fBRrMjC/GmqxB9eZ938iGtJFhgCzL2wdS+9x3
         OthMIdZ4VmVNFpCnAz/zGOOsX+Wk7elDOMNt8Pt57PkGoGkBnDPhPGLjpmDmljEjwfGo
         wRkA==
X-Forwarded-Encrypted: i=1; AFNElJ95CN+XDEGg6dYNcEkNZ4ZpfIXTVAuR3Xh1tBfUofbOx+MxZ7Ur7LH2fwhrtRW/reCi26GPSw6ohS3xSnUs@lists.linux.dev
X-Gm-Message-State: AOJu0YwvBiPIfL1A9pr4mUYOIpgw3m3uiEE2h/xu6BooRmjfxY6fgCdU
	0r4qBhOl2tgNl6FrNLfloT99eLexRsTHfnN1lwObr7EalIEUpIstvI+aaIJcXXWsB/zEVDBnZhk
	NeTsS03OVJOpUOuum3WFTM0LiSGOJeZZCk7VfwXrgYz8PPImkIgDSWqK3dQ9fXTwr+ZNo
X-Gm-Gg: AfdE7cnqINErj7PzEnQXz3j9Bv8cq/ZdBYgCEPycVgfOFMI8ZKYBcfZjbikS3kmDvCD
	fzClLiqQK1SDfu2tzm7oeizULf66uQQ7W9meNoJVZR/UptsUpxeip3T3gY9odEnzRkVLRse76kZ
	Y9j5JN4BenZfOfVbb9QnYByhiWSNRjWdtUsOyFOQJWhLfs/RfzYJK0GvIl2mxb1GYGjnSsy8lk3
	tb//xbXV9bUTaj+4OBHK/ME8i22EHnVPTm8sOSOv9XD2V2/pRPAY/ZU1Ue/Iyxx+q2GaKeHQh0l
	ZxXIdif7SpQgjSWmvWtORq1aIXj2PKZZRxx3qIEGdBcMMeyzs9BRv/1AyZPzrxTJmwNdR5tUQEV
	scfII7frCrupbbJRc0oOI+ihYm8yqjJmA6bWXHA==
X-Received: by 2002:a05:6a21:310c:b0:3bf:6c07:b2f3 with SMTP id adf61e73a8af0-3c03e5af99emr767049637.54.1783108315189;
        Fri, 03 Jul 2026 12:51:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:310c:b0:3bf:6c07:b2f3 with SMTP id adf61e73a8af0-3c03e5af99emr766979637.54.1783108314658;
        Fri, 03 Jul 2026 12:51:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:51:54 -0700 (PDT)
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
Subject: [PATCH 31/42] ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:44 +0530
Message-ID: <20260703193855.110619-32-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXyBsk6ZSoPHzd
 F/Lyog98wWhqSjVGVRyuu8WE5azf0kS5QBda1mhzPIS/h/xygYO6lpwQ+KDhZ68s6T/OYAE5cQa
 9iHuA27XKubWPZ0BrR0kcImuiFoFiDqGAL1DzdIRRzjAeDmT4wEVL6RI+wfm6MXSg1LnkTxoSNh
 ESAK0OOlcNx8lu4rGsiMo6IzxcaijqWCfaee8v231ywhjFy23B3YDeRjlljD+H5bzFvLmZp7NOl
 VYxtZ4C87EV0zHGycfrCLBPC+U9CLIqFtnCITZe9RDn6VknMtj3RFI7/DzHoLh5rCO7ryVuju6+
 BM7YYaecqnNmeMajCPWb1xdVlZ34JSFyCCjZmciGo3tsYpXl8ex1hGLnGMHZjvUT++1NekxgKkG
 Kk++pg17oTJvAF4GIl95TGN6AhIxZSasWnQhzI/4sBD/XF+kzi7Y5hStBtgGlCuuu7iOZgS6Y0E
 P+ocgTu8ZeuCmGnR19Q==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a4812dc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iqpFDo2SwQq5gjaSpEAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: E-RGa2UA8U0fQ7K1kXHzgnAa1FHORRR1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXyUe1kzkrFsbA
 idxJnuD/BC2SpKDpOaLibnHFuCPPFakmnn5HouvdA2ETQH2nRgE9l3Ij0Lbd1bYQFdYFoYj0d7E
 jqAeSV63+XD+JxqFHzumwGNxyppMkYQ=
X-Proofpoint-GUID: E-RGa2UA8U0fQ7K1kXHzgnAa1FHORRR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/hda/controllers/cix-ipbloq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
index c1084a915c13..815932e5c58b 100644
--- a/sound/hda/controllers/cix-ipbloq.c
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -257,7 +257,7 @@ static int cix_ipbloq_hda_probe(struct platform_device *pdev)
 
 	dma_set_mask_and_coherent(hda->dev, DMA_BIT_MASK(32));
 
-	err = of_reserved_mem_device_init(hda->dev);
+	err = devm_of_reserved_mem_device_init(hda->dev);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(hda->dev,
 			"failed to init reserved mem for DMA, err = %d\n", err);
-- 
2.53.0

