Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA306282F30
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 19:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108054; cv=none; b=uDMbzhx4L0OU4LHvyKFiF6Ky4kmHUx7EgcUqT5hCdNKNVZFR8QBLSpA6CWVawsq6a4Tbt5a00pAY/1HTn0NsqMkiLcIZeIELyXdaLDPKjXkdyoPbHwhu3LhQu9M01x3JahSE9XXYQr4lcMQzxaJrp9Le7OcX7VZo6V7fblnvb+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108054; c=relaxed/simple;
	bh=At8Wt7o6pRvY3dFu6Ohp+t05xcj/3UD0u2f9eN0rFGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjj8LcaoiR4DBrUpFKQ533yGzocpUpFogeI3Oes+trjRCSqrYGkOUTycmEhQ5cNDlPA9bcTiQn3eP/wkmOSTMJQ3F5sqra2a3YBAd8O8L8B7gwaS08chHDeFmfMDS1VaDRy9eBi9StxKLGhr2f9ZS4tKDNSVd/fx3LZ/1WXp1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fscb3jby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ek8lN5/k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fscb3jby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ek8lN5/k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiODr676040
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 19:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XCVg1Q659eH
	nqGdg2uBsHFKkAe+klQJjKZQEFOh/ZPY=; b=Fscb3jbyODRMP+LYFIFJPrbKW9j
	T7wz8PRC7scdBXFhD+ON7mjQ4uJAAYX+dl+COgx1dk9PHFteC9Oom23fyWpv4Tv2
	faD22dG57wKf0XAZBp4MmlExqTGeqybkUdTWUKEmMh9sTp0lRLkkAwYSfllngB79
	Fm7q2qvKn6tFDy4yuommj035Hc23xZgjZqav+jb4ZX8a2fUwTfo/8dYjPzaXd2gq
	xGcAxz4IYt2RxUoXKTu97fNE9L/YSHwH1wX3qDLrOYLJbdKAQA37AL15B7ldtQc4
	5OwXQoxeM58coao0hEc5yVFAK+/31GfbEZmpTdRT9RqL4g4fRuIG022A0rw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh9d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 19:47:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381120d6d62so1547411a91.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 12:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108050; x=1783712850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCVg1Q659eHnqGdg2uBsHFKkAe+klQJjKZQEFOh/ZPY=;
        b=Ek8lN5/keDNwqPR27+C72GzGCTVe2y/z83mWaXS7dT1BEwp+UKDVeXLqgkAQvlR5B0
         0udmnLdtVeWiPZEj46yPw/uc00rAwDfc8nAv4+CoQwdVy/ykxkuMaLSgP+W0J7ENSeYm
         LBwdnbQXCp7WE2aDqMUhhFO9lXOtq2QvRM1ZhUJqQMdjm4uTCMpfjlVOxGv371C4XkRN
         beiVh1Ja1iEvmo5KLglWc40lJ6C8kJxabEeSaKx8fuo51/oq2rrYhhR6krT3aK/+NX2S
         8Y6ArBZ7sWh+uwdSJjTQjtRw3Dc46KprnVscfNewJoWow2n+qpFKp4bW3DEQfKm03Cz5
         SLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108050; x=1783712850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCVg1Q659eHnqGdg2uBsHFKkAe+klQJjKZQEFOh/ZPY=;
        b=rHoGWJpDNt4KQ0Sdyttt8c0dnbRxi0JByizEP1T08GWqEDPphzQlmaraT3D/gJ8+rD
         3UQXUPIPZ0HEcNDZYS+/qP0TyKNyTZBI9evP1Cc213zNvEQfs1d1WGlxYXksTanCtsH6
         HWFcIe/8qmGU4Mw95eb9+oAhu4/COrTOJlvp/LdER8jv68ghz47+ApWBQYsa+0YLrVMH
         GKUMmVLZefKi/6zqk75dvqjMXbAmezap7y6BZUypRZ/9BovwTOm2vU5EQUjpaQ4JI6vj
         ziF59nRxmdoXy3yDKY/N7s4LWxtNtIq0IJfnLfqVbRb3ordqPFs7OSaXn5QhgoM+YyfD
         z92A==
X-Forwarded-Encrypted: i=1; AHgh+RrmBVi0BHNsQEXdWLjE/m4z4q0zXBMsQNL79QElPUOZOwtfYcmOPTdIAAYbyroXwWCKefJFt0ATc26u6geh@lists.linux.dev
X-Gm-Message-State: AOJu0YweoQdN9xyLV7uAXGgdyUhOLTKj10FyoXALq7+pd0qgSa+194Gq
	mmDp9jVBvkO0pvRC6HpdprTRl9M4K0bn9m2Y6pjZayUb5jQfhTbymUxt/Oo/HdspyLvFZi6ArH9
	XXgWMsoKE7MyH9/wTS0SUZt68Ch8p0D+bwTfQMcGhU4DdLagc1foOdFWuLvwFRzwyuPgV
X-Gm-Gg: AfdE7cno4xfLGWUEHhufTfBuZLg6C7p7pHYWBaLBH78Tu/qJW+MF3/4GsKuMlUWReAX
	VIWlwyowuBQsxMxSPiCiR/Vi7zOyTy3Kz3Ug8wEeLC0IX/IVoScoII7KOrCmTSsEr5Y4sTumzwn
	8jLqPOGfy74KNEjsq5eMHugFtZa8EMpOJsv1u4BM0EiFNdR2Bj3L4sl9h5aocZRGY5KiTdGoAzy
	yCVQBBkK7JvGNDeDpXlhR3Loa2h6LcBLBwmxb5ic/vqGmRydPFkTil0ku83Tm68OUY8+7VgU5vz
	78a2H/PN0Nc/B5W+kGVX4Fnwsk0MJZinma/4gY6ky+SgHHvMe7GsDHgV1N261w3KYAl7g9CL6dV
	WjC4n38na2NQR/dp17AZIanEbD0EkMbYHRSS3jQ==
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr810894a91.24.1783108049768;
        Fri, 03 Jul 2026 12:47:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr810815a91.24.1783108049130;
        Fri, 03 Jul 2026 12:47:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:47:28 -0700 (PDT)
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
Subject: [PATCH 20/42] drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:33 +0530
Message-ID: <20260703193855.110619-21-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXyQfBA7zKH86A
 E+oiJUE+FDNWwm4fmaWE0JYZeRhklrkzOvTz++Vd+b97J5EfilvXiNpBojP4gtMqH0qKO6vLjnc
 F0LjLgftpnf0oJoverOM/wRmV44NbdB7MVwgapOxNUjKNPO+AC5+z/l3gsy9r4HQZ/cIlXBXU6I
 1/vkWLFhwzuk7r7N2VgU4FBb7aHe9VyhjhyjzoqTLTXV344AAlN77OLhOMs2WqNwCyaTAtJ1cER
 G8rlKS0reyItY2iIUNMBYrMjgSGzGozYIqZBeGo75nez1BTmYaxHkqLFKwSwfMWafCFe2hwe9tF
 ryfemF8yoQmYRt2Wp0sUQf+qzKpUgRAQgV5Vtc/LW6fO5TwPSvDRgLFwnW2WFJh3NSN5us2QOfa
 uUbNXb+fTIUqNQGs8HHT6zDnBpPvRUxqSLa/blWYGPguDX1/ul6HprvtgV5ojdCydlOxEflzjdc
 qyyP9I6gYGMN6KVWBJA==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a4811d2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QbF1duAvIEq2M5YqX_oA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: tqxv8AzKU7wRqzyHEJ_qFpurR04awaLn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX7lAn0DPxK44z
 h5WV2GT/JRNLj+wNG4ppebmJLdb6vuE5pUOPxEy0fuPP/+gvZ7XYAISvIla4HOElx/KmefBw+0h
 Q2EaMDrrj/IvDQYgzOmDmRCn9j9cXV4=
X-Proofpoint-GUID: tqxv8AzKU7wRqzyHEJ_qFpurR04awaLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 53ab1a2a5aaf..e93a7a299b52 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -203,7 +203,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	/* Try the reserved memory. Proceed if there's none. */
-	of_reserved_mem_device_init(&pdev->dev);
+	devm_of_reserved_mem_device_init(&pdev->dev);
 
 	ret = zynqmp_dpsub_init_clocks(dpsub);
 	if (ret < 0)
@@ -255,7 +255,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
 err_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
 	return ret;
@@ -276,7 +275,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
-	of_reserved_mem_device_release(&pdev->dev);
 
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
-- 
2.53.0

