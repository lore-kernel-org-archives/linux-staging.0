Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFB33C536
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108006; cv=none; b=gLSU4I5DhRuDZ0ARtljsbH/ExyMzxHCT+cs4MsTeb0zfHNi+ErYUIDPnFkubwScQLCfmO6XXtPVaJeQyU0ujXgrjiKHNVimi2nDj8Bmvjq1hl1c33oJkklzkHjh58Tzp5cuw4Emd/42o9c+I1lxRFFrLIEzX2RZ4UjC00LedY7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108006; c=relaxed/simple;
	bh=bmJzWNZOp2dOjeNu7Y3PNQKP30bPclEVOKAYetSec1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaFJw+5kqGBZXWzvs1HuVk/cZ4dhBMpXh1FcKhXJ6py2EV5wRkkSO0P3Iaw4dsM1Dj7RgcNvACRLlZm8QAp8r4EpqGxCMwfCFLR4WWzU/MpdbJEgkmIqy3cGZ5WXuWfp1uyKdvtD0YCR7NqfRx3oih1ztrKZpiJ3/naNlnQ7D4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bgizp88k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHYXrkYJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bgizp88k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHYXrkYJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjATk685978
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 19:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IZtPwgb9C92
	gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=; b=Bgizp88k+UDI1BLUoJla4GGkC7G
	QalzzIQo5HOKqdySyqouNh7+fTnqdoAZPLfvNE6WIQ8ehkVEc4JeRhDZ+Orcj9oI
	vlzg1Soy0q7BSmJNaInnjhEUveTV3Q088y76VQo+l5xDTYTd6AcH4BPQvyk0utHM
	1H9aAIqqRIpKRozXZfR1zAhCOSkc0A004ZMHBVJFw9l8zneQ1vJ98wBZEjm1ggA/
	YmlraZaHuss0dzpOBmhubqznt2yTpsoXkoiutm98MxUWy7jHGcVmDDxzlbDuEDFo
	bW/eC7Y1DIr5p3vbbK2AU9uyIuV78xIPfCmI/lsyvnaAL5Ox+jf8uWb4tPw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qckf8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 19:46:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c825562f8bso15987785ad.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108001; x=1783712801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZtPwgb9C92gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=;
        b=FHYXrkYJYUVsM5rUcb4FwXr+RhKFRLqP/vq75Eqa1IZRUTdawq8cQOQqb5uAKf8x6O
         lLNn5C1pFeuJZkVHZSsIibB0nn/5pidc5nEhDuwQ5EUf01oYu/1XWMvaNieTTIwOXJcx
         /smNhS5YvXpqwAgxSEMp7IN/bqvo60dd9JExFDQWXZklSanfcSNibiZe4Rd+fVQZoNVs
         CHdhm9GDsRqhSQep57hAnyx01mbO40wJPIiZZqceKyQIoXZuKnB7uZrZtX9I92ImKPzO
         7/3737zrBJDFnDfy8bkhfRcP1hpA/T9iCEzF6dd15k/wzrCfG5uB7ZZQbNyug52/0inI
         SYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108001; x=1783712801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZtPwgb9C92gJ/yqDWkTjyC7j4DO6PtnB3p5BLY9VA8=;
        b=aCw4hdvDAZfkabOLFzyuEGnAMgwMLxNn40x2LGxny0+98XkpdhP3yUTXpgqYqTIYBw
         uyF9mdjYuYR53LvHEsi9L5rRytdjNSZbBzX/rPVMk+6HTGsPb0wlI3YWoonz/N9Mfolx
         pi2BxIiV1YKuKUQPVf1Yls2KZZ8k0aS06gsV/xuPmJeeyG1IxwvxcefS5Us1cmqNnCCj
         SVCTY1FRmzmh53L9eEh3gbl6DQuZ/XZYLVdyAeUD3BXxDc8SuPwh9sfnXF93xhZS3al3
         NKYcqOQq4RtRHS4puNYSkeFXqj+yWlLX5MbCBmk0F0FVRFnMjneLX+8pJIPVZO6whlJg
         RmLg==
X-Forwarded-Encrypted: i=1; AHgh+RpKkaLJCsoHTYp/nH7XEty0fuj5y50Nlro7LJIS1XzVIVRmdi9pMVnV4mxQUyGBWE5TuRzy0UP5tgFh+reF@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx44L2SMEVfXW0ebt+nYWB/Kk8wz/t4wJ0E/d91NHtourL+xF+
	iGX3R3hLSeOoel1pNtHIrfa7vBiOs6Ssc2gE9uLV653hdl6wnnM1t5GL6Mt3u+oaO92UHd5u0rq
	0D0/ccdSZTv0ZPyj6dKvqOpgoLRmUolHedBUKJ/fV+PnmMkrB2O6O1DSUgKFojGEcbQcz
X-Gm-Gg: AfdE7ckut9GSfq5wtNcqj32X358y3YT3MQBZPnY0TRSuxWLlqOf1la10WNhl7aM79wi
	22CW2gg/bVeIeBjw0jqhNOHq1mO9Dmq4+rvCoWoe4LSEOTWNlcC2yBVysmH02XNlR31S0L/F8o6
	eJAYzcAMq7DN8avnVuc+ZhswmfGVE/GdFMCH5r7zhODpCZK908zLsZNsL4yn7WHbsieWxYydmAE
	iRDeNLsi/OrP9trVJYcUvMLs/Xw51ZNPn2dd4JG2H7IUmErR8s3GwsfMAhg4ud8Y6/4GztdNTOV
	YQtse8nkhYD71nX/jxUrJmmhUQs1wYGrj5QmVJYdT50byXDiDyU2DCZog8mfBMzOoSiEIhrCLTw
	F5PAxolooSGrv652L0X6NBXwAKK9Zzd6wtfdGhA==
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr762790a91.21.1783108000980;
        Fri, 03 Jul 2026 12:46:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr762719a91.21.1783108000352;
        Fri, 03 Jul 2026 12:46:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:46:39 -0700 (PDT)
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
Subject: [PATCH 18/42] drm: kmb: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:31 +0530
Message-ID: <20260703193855.110619-19-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: -EKdmOqZ7A74J9IShaMFfO_wH5W9nIKz
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a4811a2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WgoW8aVLYYFOpEymBdMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: -EKdmOqZ7A74J9IShaMFfO_wH5W9nIKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX1PpXPDdfhEQy
 2FnXlFZN+zj1oGBzYlmoA/FRyr6YYZCJ+2Z68iRfK/25wu/18pxcQU6zHbSPiUhOWGl5mhY8QDe
 XJMD6T0WcmtoHytLSmOu4pQEke8uEd+eHcgYG3vn6ik0t4XB9ocmOsWFhNCOvHkAjF/wySSMKSF
 yhACsUZPb1PADDfxmIdkRpWJsfeX76FTqWsd814OLIl4pcIlKyC7YA9Zfath06Y/fPgRi3S06Eh
 oBQYLMCWSliK+VYiabO7zW82NGApLMrBmHOGNo7c6R3gGBQ9V8z8gNB4zI3m2pTbdcKglPP5Ew0
 KeQuefdJ4SyZkdYBcfjeIFM0rzsBVF3MUQ2RSjaiprNNZK/XJbtyabzrwZ7GCypUK8/unT+T8fi
 Tz7avDn5YWdpLSnom1VRlq3Mq2lD2jFceM1bOswPfNFw1whXuK2c6xHTydjio52PQ0D1Aeq3QdU
 WacZeYiAtH1r25IKrpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX3FJ4Ni5kq9uV
 Sry1c8sa30MnPAUTZEqdWHwOwcwOfKnFedXZNU8B46TlH1TaFT/j9OjIsPXHJPyV3aGVl1yNowW
 u0Jz20b/KjGNgI9gGctuo6tJpfUXKys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.
Also simplify the IRQ error path since the release before init was a no-op.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7c2eb1152fc2..88fe377940f3 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -140,13 +140,12 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	/* Allocate LCD interrupt resources */
 	irq_lcd = platform_get_irq(pdev, 0);
 	if (irq_lcd < 0) {
-		ret = irq_lcd;
 		drm_err(&kmb->drm, "irq_lcd not found");
-		goto setup_fail;
+		return irq_lcd;
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -155,11 +154,6 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	kmb->irq_lcd = irq_lcd;
 
 	return 0;
-
- setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
-	return ret;
 }
 
 static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
@@ -465,8 +459,6 @@ static void kmb_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
 
-	of_reserved_mem_device_release(drm->dev);
-
 	/* Release clks */
 	kmb_display_clk_disable(kmb);
 
-- 
2.53.0

