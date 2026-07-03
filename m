Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1AD30C15B
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 19:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108126; cv=none; b=VFmIhWOpbNIcu3nAbA+qffpYypMSHWTzie7FPf12Oaqkw632ite6VGJizIQF/REAtKNS+4Ou5bWZtU7mbUkxUpNp0hVxh7TaIfKmSchZsJ2zgRXWV/EiUF2pgsNujMyxeDhcVA93T0oxmRmn2DDh0lrBItH/U17PicSAE0We76g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108126; c=relaxed/simple;
	bh=KKoYBENlGwSryGtgIQNpuBsFHNXkIZL9mEja8t22cvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIC8LYw2SGlt6kLIpVJ7Csi6XfspvHnhha/rPZwcDBW6p0dYCFdWKrYVSP5YXzfwSMXgvfl03GnTDgaHNYpFvY3rw7TCn2NxMZ8edFGE/kkzF2dGyh6CHxlv9om1jPtVTBnXIOpnwwlSPDSvGjAdGzvRHTY7qMxjwu9R7NCYpAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oe2yBMtu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9kM/O7X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oe2yBMtu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9kM/O7X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiYvP662861
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 19:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vTaFds4j6VI
	tza7UvAMztb4cdgVduD/jcDAbw1WAnR0=; b=Oe2yBMtuiakzJoNHyUhWZrUssrK
	VkYy44as8rYFaPVY3qYkY58rW5vsbqBLlEVR1wNCoOP409lsvwRermF3M/2rZckO
	jDRSAa1yhBNtN9Z35pxSi31zhiIjTvpsUGRTw/pqHw+R0wHgO6YcLOKJUyc8SVKP
	c6zl/n2I5OUPpbZRdTcpiWOUvbo0NlKiTQ5N1OKL+St860bWesJlesEKMiGuGXfV
	2eby/uOoEfslWXMef31inHLf1ztWTQyHIMq7e5WpqVs0l1nAzq6GJnq4lPGmaaTM
	w39ZQFAZOHylcs/I2t11wpHn4o1yjBTu6D/2Ao7mpX6BoNbpRrVQAm2oUnQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eycfq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 19:48:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381120d6d62so1548524a91.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108123; x=1783712923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTaFds4j6VItza7UvAMztb4cdgVduD/jcDAbw1WAnR0=;
        b=V9kM/O7Xg5a3eVCII6PVTEasfdzVFaatpS3Me1kysHU8NvUJ22janic9ke/m/5ghIH
         8r/DcRCY2LwxQwUHUoQ3lKqaZw/iPyKlbf+UnpmPm1zolnTG78bBumX3yBU5UmLKO0LF
         JyTEEZX8Wa+RxG+9MRBvKrq+SgNSW/FhZHAMnUxco3t2CigcC40dPxicjwJ8fl5DCbRr
         1lTcCJhX+WVTZS/4wlVK3W9Ln5TTDUBU91J9dZCSNRmbyEmI3kEpN5dW6Vga3HZYBc+v
         bMwu+r/DbeC2o8bPK0f6k0nUkH+9SPx06Qx+cuPMwUVsbCrPnyzA1Q2IwsmZHBO7IEeH
         okUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108123; x=1783712923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTaFds4j6VItza7UvAMztb4cdgVduD/jcDAbw1WAnR0=;
        b=UTYxziBJ14N6GywOhLhMQfpD2W8we+uQOy+eSKNpAsKS/2TJmrfGiajPoTU9egYXVf
         jRBSK+JnBW/22PuZp4tgmyO+sXT7uvjvb70N5TWwvN0+x+1RPEBX0w5Z/tDdK8JgWWjL
         U3BInjJvQAqHuOqobDzQw8Lzf4hQEQ25L1+4LK9UvpBDQnwChZIqi9SwNQptZnw5KnDF
         Zplgg5r0esTYSEgD6eefBDruRtaX2HPWdR6x+g/tkL3TmMOM9fECNq9p+y2CSvLdL6L+
         yHnuj4BO9/wWieJ4A5AkUHb9/spK3UQleqtac96oiiNi9pPYDbKk8gNVrGMefIQULGPD
         Q+DA==
X-Forwarded-Encrypted: i=1; AHgh+RpLv4e2BiBNiO0Y2YLyoj+0OHYiW29oDQiv35sZtJICUZAcbS/afFijWVgHRa0kAfyV2VwDZUZejp1yeX1H@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh5gst8xN88RrBB6tIyo/Dr0vGQP8s5rC6wWU0W4fPcSvrxRAc
	AkETIfOVyfCZ+LQ/znFZ8LumIUoMyjyq9J3C9pk8x+zmfYrI0izXnE1JvhYvF2C0RVLP3quNaXJ
	4ClHM1mC8NNaMNwJcdJH0+uVCuzACK/J9qU253//9d0aLvDqN+Rn5dT43JHyx+tH0/b/d
X-Gm-Gg: AfdE7cl1AO/tA42OWGRyjUmhOLv3Yp+2ew/MoHD6SqYCLM7oMRnR/mOojo2udoDIIwu
	3dGWIqwyjrPJDrRn+nDfOd4qypZhpL6hJpkoqgykwQ+yZgwWnaGwyLsmqADoQZxamMLuRwS7GtT
	2ACC/oXI7bpJb5mcKH/ZvjlDTG97webMYZt0tv0JGBdhseCjImV7NBQylxIXV+2EZ0Xfadp1Of2
	yvDPDMf27f5ZrMNqRJcoUCov5leMiFZN2ebTy2LmiweiGE6ZsHgiRI/nwCxh22LTCccQ1i7xxSE
	8S6UHxRN27u1uJnIivgs/B27TLHnMbTRPDlSEJr4/CtbdlTu+tEvw5/WhCfJ2S3t4fczwYa9bbI
	Z/6etm7wNiPsT9KQL7D7WUffrarSgfiMXovqo1w==
X-Received: by 2002:a17:90b:4a46:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3825c50b0aamr934532a91.0.1783108122601;
        Fri, 03 Jul 2026 12:48:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4a46:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3825c50b0aamr934462a91.0.1783108122019;
        Fri, 03 Jul 2026 12:48:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:48:41 -0700 (PDT)
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
Subject: [PATCH 23/42] mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
Date: Sat,  4 Jul 2026 01:08:36 +0530
Message-ID: <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX6cS8YIaiVSM+
 SyGadd2psPk7OujyFkTN+/T6UGlFHx2eryP1qrWYJJW1RhPSbxGPgeGosKbYbQWREMjoAnSfcaA
 f6WyvHkw3HtmthzzgWMsVrKOOIYbKTCEwmebOOEEFwQkn9VCpUDoh1VLLb4P3Shjs7IWTPHkthk
 aPqFLergreNc+Cm1Tz8fVCHcCJmos3GpeFgzwLueCI/sE+IverdnM7ldLEuHlIHDbD+3M1FLDl7
 jub893dTS/vta7D6UvzJdB3DgaxYhCBt4loVeziLDYFL5w4r0v6qkkzkEOP9KamQ5vuFJR+zcCs
 4ZYMbQ3QomP67CSgh5+IptAmd1JB9a9OtYMWOSYXfZStfy7xDIWZ5OrjmG3z3IiY/1L2WpM53zv
 AmMB1Mez1hH1QiZFLL4j8EA9IyUGnhRDX8ZZezvYRgk6YJ59p/80hfUB6cwYkVHpiEV8ZusgmXu
 vDL2piGxd7LmUnZBfKA==
X-Proofpoint-GUID: dRJaLAYBiEWAGuNQNuRtO-Vgu_oLJaOt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX8Qf70Efz02Mr
 /PI3pc1cJ9WRtYbmu7ww9P9FqKcxZq4yXQUJE9WScTfNAImtlx/+8Xwk5eMp3lOqgOi3F5v+zzZ
 E93qGR9lihRhxeAUOU6jz1RQQBYwHY4=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a48121b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BxB3lidwPopAx76cZsYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dRJaLAYBiEWAGuNQNuRtO-Vgu_oLJaOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() instead
of the manual of_reserved_mem_device_init_by_idx()/
of_reserved_mem_device_release() pair, letting the device resource
manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-of-bst.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-bst.c
index f8d3df715e1a..304554ced690 100644
--- a/drivers/mmc/host/sdhci-of-bst.c
+++ b/drivers/mmc/host/sdhci-of-bst.c
@@ -405,7 +405,6 @@ static void sdhci_bst_free_bounce_buffer(struct sdhci_host *host)
 				  host->bounce_buffer, host->bounce_addr);
 		host->bounce_buffer = NULL;
 	}
-	of_reserved_mem_device_release(mmc_dev(host->mmc));
 }
 
 static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
@@ -417,7 +416,7 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
 	/* Fixed SRAM bounce size to 32KB: verified config under 32-bit DMA addressing limit */
 	bounce_size = SZ_32K;
 
-	ret = of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(mmc)->of_node, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(mmc)->of_node, 0);
 	if (ret) {
 		dev_err(mmc_dev(mmc), "Failed to initialize reserved memory\n");
 		return ret;
@@ -425,10 +424,8 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
 
 	host->bounce_buffer = dma_alloc_coherent(mmc_dev(mmc), bounce_size,
 						 &host->bounce_addr, GFP_KERNEL);
-	if (!host->bounce_buffer) {
-		of_reserved_mem_device_release(mmc_dev(mmc));
+	if (!host->bounce_buffer)
 		return -ENOMEM;
-	}
 
 	host->bounce_buffer_size = bounce_size;
 
-- 
2.53.0

