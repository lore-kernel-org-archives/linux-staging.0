Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3703D332EA2
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 19:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107884; cv=none; b=ko9AGvofwtKCAOpwUWy0PWIYosCPRS7U6472/xyz3BY/qudZFvNXS9OePJZb3HLOs/SB/Ce5EUL976SDkf4G0YVvjshRBAtgwDWhQ6m5w+XwC4Qk+STcpqyKWXamxi3ItkDU0RMPaoJcb6zSMjp6umYqh58rEfPbtPv5suDuAzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107884; c=relaxed/simple;
	bh=9VHUN3wrrOaDoWZFUjd59Z16/VB9m0n20/OUvZSYBsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJJQAwI/Dd64ikFOXQpripK9p+Uz5tnutFuZs3cb3BvFXbHGHki7hj2IkbMaL1IPCsUOP4GSYhPqcwWkmUG9MWJouzHR+/zXK9D+0J5FrnddOsaXX2lN7xD5AcBY+pR8Vk7BHz35befarWL9JznbeO/MWHZ/gr8uGSf+yhr1jDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY4Qnsy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GepotVvP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY4Qnsy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GepotVvP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjA7K664148
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 19:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lv1Bj12YhLZ
	GN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=; b=iY4Qnsy8abrOAIAfFH+8FxIw6mq
	Qv62w0poHuMw3XeKHTxiiEV2i9vgpiWUQnAMxg15qwpuMbCD5LHMmPAbxups9U6+
	8Kxg3VkqFs14Nvi5hRkCGUDPNnOZSfE9BVxjERFNOsf8El+epCrhEeCuyT5bWuEx
	xVZiMuzcNy/l+EOoJk0aX1Nx3Nv9PBByY67N2PgW8n4JUwsFXE0n25h4bFlL+ioR
	1v/6f5QLgOyzaQa8dDpqtELNoL7m4lg79GgByHgwIpYh0c/MZ5ZJFB7t/TSt75zB
	Hq0jvgAaxsGIXA6rrVFftF0Whkpojf4qBmtL0jrhsU2GaWU1Wh0ht1sDqrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eycf6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 19:44:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38001e788d6so1149788a91.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 12:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107879; x=1783712679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lv1Bj12YhLZGN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=;
        b=GepotVvPEAlS5gNCeykvmtd6yaPLRQ0+3bLHoPYWaSSIj8hG91buHD/vXtApBffaNl
         vgfqbsUr8ktzlM/kMr8Au+dhN39BE50rZ8Wi9iHa+dmVtuV/Yl17ygFLrcIL7wB3hK7t
         PJyBu203i+ToNwFjUyVlyq1JW9cEsVoAjM52+6FYUiFGp3rKGNeCEnqDHAEDZHNdRvZl
         U7/QKv0Lt7txRbFKhVclfGvnmTWlCDfSYlvxs2CJj2xQ3fWClMDveyWU9UMIZKn1MGla
         /2xHESMYSG0ns37rpHKuVnivjhULR4tKU1+Vzvszr0w11wlPLTwYo0Q/kyItjQ/4qPOW
         mexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107879; x=1783712679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lv1Bj12YhLZGN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=;
        b=fmOh+soPcjDWKGvC15ILoR/P0QGTy9IPkGfiDOXNgqxabbxGXxBi07BUjiQw4JqT5C
         8n/eTlGwG6LoiDf9vjTmmqIcRSL1wi1I63jOfjfD4UtVhZMOivrEAqMcandYUCcaNCXK
         Q5wdpmrk9ycN75IrSMetCBb8bZJQgLjlG/0+wKqiQHq56NICB0HHW9bwAdZ5VgJmzRkH
         xJO6sL9vZBObTAgsOduOiQfN3LzbXuYqOoqOnY8zGWTAf0JROLEI5Aop/yVs03B1/WAx
         R1OEapxhJ94ebMU/kouQjKnZx1SinWt32sPEfD1pObnDHlXVnOA9RphxFmQcqouUjAOg
         BV3w==
X-Forwarded-Encrypted: i=1; AHgh+RoyFSOxRSf1/i0ltYNq55ChsEWuMQJRrbwoFpO7F6rsc76bkMe7eUbXz4J1A6si5qhJLQRiq/zpA1yOgiU6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2UQZBBM0IbNE9gQl83rPoQZZXMc7LDm0Wu2vZVEBxLNFt7Qw4
	9OsYCl/M0P7JvXeuqL+O8oH0bHUjvAkjwKuJwIxPUmt5p8fMELKt91lBvtShOYGe2gb76ndIjtS
	n60zy7B2s4a6hrv7p/PpXnPoMuudVWLs0CFrKYnU2B9vMbr0ZcyaiCCTrLlgmNZ4nRr5o
X-Gm-Gg: AfdE7cndMSSARX0gu7ld9st9hxbXa9auKjfhzDXKJfA9ICNB9xc8fH5VtCCrD8sbky7
	/mAHN+GVR49d5jTOhkBZlJ9zScFrYchStFdc0f81/rMl3g2t7s4fQmDKg79QeZyXvnKctztCS3I
	n7pAA1Y46SxJrL+0R2O3G/WTCTjZzHvbYdnP0G3uPvI1jyVhEZhDGilzG0kMqwqTjvUFAvtP0Lb
	5ZWcnHcmTnfVNak2fi9PGSwdOwNV4W9e3FQuOK4YURtAiTX0rSCKqsp7ho1V/KMIJLZI/Y4OqJI
	+pVVjDIyZw3SIhoN8tYeZceUsRxTAoB4S6pmqETS5vHBxaDfjeHnK/kPiEHo7kzJ2rPELFouRXV
	GURHQBwri82UlnVWwZi/K6sv4vm7SxSubJoahvw==
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr775618a91.18.1783107878921;
        Fri, 03 Jul 2026 12:44:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr775603a91.18.1783107878394;
        Fri, 03 Jul 2026 12:44:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:44:37 -0700 (PDT)
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
Subject: [PATCH 13/42] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:26 +0530
Message-ID: <20260703193855.110619-14-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX+wjB7ogDk8VT
 7JcHiLxa0hMOp+s1x0hMJsmdrkgkt1ZNVt6oeed/mqifVfoh4uLOQSWkekjzZrjs4b9ENf5v4Xg
 K+FkTOg8zTbEkNkYQaNKCry3Y7z7e1uSjubZ2vBJXw/H0m4R6sGAf27pT3O46nmoiTjgSJK8y55
 q2v2VPKSYtz25VSJW3jQ0ZeasT2uupUaLUSU0F20HcyN+iGn8riDhbRxlvTgs2mIMV0HspS5gY/
 Chu2FEN83VLlXVeW5OBsbIVHLeV6QXxxTW3I+CYWI/9IjvbGV/VxevHzTSLHEk1uQ5bT9pwqzuU
 dh4jp8t8SmCO9N6ieHB6fNXSfS/LEKXoz2s1sxD8hCgSYA4XCAxbBX5Bm7Ww9I+2Pa8QFgB6mqG
 g4xzg021nNzw7imURFsH+3vDocnergLcfVa3EhEYJlpITF+viBhI5WKapixkT/KRVcfo3FQ6Bd6
 WCNuKWCljZUlH1heymA==
X-Proofpoint-GUID: NEpG8nEiFE0OFTIKlaVxE-fhPzN29h4Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX2+KmWKnMk9R2
 JtUWIxrHSiDVe/ILKQg6l5qhyrCqCqehFBJNdjoOgEaeeVF0QIb1uE2jOK7QGO+WbPSVdved5Pt
 DLIW0GsdG1HsGeB3okh6TdqXqe++lN0=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a481128 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: NEpG8nEiFE0OFTIKlaVxE-fhPzN29h4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.53.0

