Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E207330B3A
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107570; cv=none; b=TCwiDKRruZjpHuzq+ncDqzFTBObbNmGZ5RDSGYtzkv6sVdbu2YnyQS2HY+tIRi2W9rGmWQ8I86/hgCv37rGLgNn9HmBoyrDLB54o2wYCE54yeG87KHmucDe/j4ZrqhaF1bP9dMf/E609zhKLhSiaRxrraJsvY0WKihLWod5mPyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107570; c=relaxed/simple;
	bh=gf0y849jqsWicWT8x2zXtY5gzlbXBv3ZHwVF2zzNRiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SHLRmFQSsZKDT5MHN+yJXYZ/MXhxinDCYUamFdm6vbUSyzdxfvnfajrMgsLT0/iPKgHuK83P0pBIFqXeLBfSaZXHEeOwK418U4teFp1FT1xmtPA/HFhaht/GU1wam885phvDgDYaiEl+iyvSkuo6cy1eMoTQ/J0L/vd229LP7f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEMeysY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3CX7G24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEMeysY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3CX7G24"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hj7BT632611
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 19:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yuDgKoAlw/JRHunDNfGXYB
	YzhSRLVnjx2xmNmMEK1vs=; b=YEMeysY1/myhDao0i74e7TNlV74ktXTCfMwdq9
	CR3QbS5AITeviE8hf9EJ30WAllVldtcYL4AMMm0/LzjQKzr0t0eqDF0S43incuSV
	MyApeWy7M1IbpM60LNShiFzTpmwg+/W0PKTj+Lp+cXYVgARiHsuxhXD426SvD7cT
	GGZrPR1QcL7iICOr24d23aBH8a/MPY5danZVa1/zTiMmF2fSUTDZMyH3oHPCfVAv
	4nbvlJJiytEOZCVzenusm2J4e5XUbEHMVWQY64oswPjfiGG059bwY0hXxdENEoJ/
	sJbKqjoPigEwtHk2s+fe6Ba9Tfz1f/tpFlGt1x1q0Mz2ipmQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b039xpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 19:39:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe2607511so1340900a12.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 12:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107566; x=1783712366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuDgKoAlw/JRHunDNfGXYBYzhSRLVnjx2xmNmMEK1vs=;
        b=T3CX7G24pTJlbOcv20xZiaBzoybz8ziVqSSnCAIklI2GOLlBpXJVwwAdwo1dD2dHmb
         x1KilBE0G/Be0zynoeup1XyI2dTiyqc+OqilscIFQU2c4KouRQFC4DK3l4mlJl0e+q5O
         5a4E5wvBBgsDtjnZyKjMwNO5oM0epET/PcjieHXGOq002o5C2/C+djitE6K/R2h6TZ6B
         SqmOEsf6HRD+0tMpofhE8Oyh134LAl5Z0NS3lFdP2SqC8DqUC+SRqSZjNCKSbsOI9fZ6
         brA+28zz3HHqpgPApgcPGbKKLl8h6UlpLRFl/WFDMHHugUmroJAyChJKSNBnvC/VNSOD
         XagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107566; x=1783712366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuDgKoAlw/JRHunDNfGXYBYzhSRLVnjx2xmNmMEK1vs=;
        b=YJgRkDHSGFc0zukyv1TYeI4B5dTTAx1hIPbITCMXxXmQK07x7Sda3abOZjyQoz85ru
         Enb85lmR5xnwXPGV3bCZ2qlRz9KPIAo+3HJPmFxjKB86Z1XKJsbYndC1WLIZOglH/Xaq
         og8y5JzVF5pRhEVx6w1ZZVgZrYIMdA7IhQZ/vauvliy9s9idCb7RJDNjVQ8BjDHW6VP1
         IwSPRzIFePvfFj3O73bxtohEQdWsz7o6Jokip1PkCADTZ9oWfkVv5rQf4iyR4wMgtLYf
         N0q1b47u1crJVdOi0HbtvE5Ecuc1288wl9JkuYctlKRVIDXqDy3x+cGCglIubqCOACqZ
         eNdg==
X-Forwarded-Encrypted: i=1; AFNElJ8r3ZxB08CMps7+HiCCaB4RQubNf+nqn5bH/Xk29D32FVlV7Y0NXxW+pLYPjtYFvoqF1oKFcDycBJTC8RE8@lists.linux.dev
X-Gm-Message-State: AOJu0YzuVALIg8TtpZs6YsMnnmUiyBEs86Ss/UTAZV1SyZjS4CdrCOri
	rJvaW7Zu4kV3EGRe//FwIdQC3vZ/JDI/og60j86lohyh0nS2UCdZwE9NlCUnzkZR3OVOizTSmpo
	CnS/nsoPJp1U1sJQtNsu/2CHNIhO37PTScxPEPO9jB0M0Iv9xrbOnmvKr+d6a4KAr3yph
X-Gm-Gg: AfdE7cnG/TtUHQFhszuXDSk+XzfVUwlzwaAJGiKtF9dD/L49RbgEbVVrzjOMmT6P/M7
	/+4ltRdzDrTqc6T6+056Yrtf+9hZ/11ONdRGXke7zRqPO4yE5CVK4P9h5RQPC3f5HowU9gSO6+T
	Vx7nsJyWD3riK3kj5O9S13rW/lzztrECdT1lkztiANQqhYuLxwBKrJr/ah0Q/oIpINyKr58isWA
	Cmh4RGHl6M/AVYrda/xLquJW0YSAdhFTOb/9qLndNZe5JpWifA7AshV+W9o2TkIt1AlhhhhI9SJ
	QGwxjEDe3M5jovFSbDwyslD5VvYTK+4PXf2ajGvU/u00Qkyc44qdhZgRICNEDsSRuwBAhpgdyyp
	g2A3eZiR9hTbDVT/mtQsJz2rUbkbNiVUbc0f4cw==
X-Received: by 2002:a05:6a21:4c81:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3c03e298475mr701967637.17.1783107565974;
        Fri, 03 Jul 2026 12:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c81:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3c03e298475mr701865637.17.1783107565344;
        Fri, 03 Jul 2026 12:39:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:39:24 -0700 (PDT)
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
Subject: [PATCH 00/42] of: reserved_mem: Introduce devres helpers and convert drivers
Date: Sat,  4 Jul 2026 01:08:13 +0530
Message-ID: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXxnO9FJeL7Nxr
 ZPq1KT2w44fN0U2PPDF/POZCGc4Nb34LWdooE7J9rCvrYPX+RmxVJIsEY+rXH9YS5CQGco7d4UU
 8BvEP/I913up7BYHIdO0U2hKd+0eg08=
X-Proofpoint-GUID: 0MxfUehrp9XYLuY0HwX5puKfERohfKk3
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a480fef cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c_1ikP4J58vCyc_cPHMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX0kQPJof8vpal
 1tu6/paZVWsifpnPvFfXdxgDObYlOlLhY2MUvzbkdUl4qR6M5EoumhPk080Xfk/HndF4okL4d4e
 iCKyWAgEm+lCGVCCXehj1NCbP1xQ5hdZZBsRb9NuD5Z29EwT9X68hah9O9YKAHFrglnBxcXv9w9
 3sW1KP4jr9UzASAuni3rVttKpc1gvVYHewHZhAv+AclbsWjNYu4PjB/SgCtGFYCB2Pcaru922hO
 0Z+CWObVCZvd/WslCNVpLIZKnppi3g/VRhm0yyXLbtlZQnItjCdyeJKcRarmv7ISUXuY8W8lZih
 iOYJY7+SVUF2039XlZwn25WicB1Dq4IVNnTh7TC00Absu/FFVlcH25cceM9RpJ/+vw6eO9xgbLe
 UeRKTGQGXqTK0E3WR9DQyn1VoQR+sB8cEhpGyZb0fGC62jvsgqZtkeg4Xvx7D0S16pTg8U+cc9M
 PjNApkGfAmFfrGBOIeA==
X-Proofpoint-ORIG-GUID: 0MxfUehrp9XYLuY0HwX5puKfERohfKk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Drivers using of_reserved_mem_device_init() and its variants must
manually call of_reserved_mem_device_release() in their remove and
error-unwind paths. This is repetitive boilerplate that is easy to
get wrong, and several drivers have open-coded the teardown
inconsistently or skipped it entirely, leading to dangling reserved
memory references.

This series introduces devres-managed wrappers —
devm_of_reserved_mem_device_init(), devm_of_reserved_mem_device_init_by_idx(),
and devm_of_reserved_mem_device_init_by_name() — that tie the reserved
memory region lifetime to the device, releasing it automatically on
unbind. The remaining 40 patches convert drivers across the drm, media,
ASoC, remoteproc, firmware, mmc, memory and misc subsystems to use these
helpers, yielding a net reduction of ~90 lines of boilerplate.

This series depends on  https://lore.kernel.org/lkml/20260703164457.4040457-1-mukesh.ojha@oss.qualcomm.com/

Konrad Dybcio (1):
  of: reserved_mem: Introduce devres-managed initialization functions

Mukesh Ojha (41):
  of: reserved_mem: Add devm_of_reserved_mem_device_init_by_name()
  firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
  remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
  remoteproc: keystone: Use devm_of_reserved_mem_device_init()
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  remoteproc: omap: Use devm_of_reserved_mem_device_init()
  drm: logicvc: Use devm_of_reserved_mem_device_init()
  drm: hdlcd: Use devm_of_reserved_mem_device_init()
  drm: pl111: Use devm_of_reserved_mem_device_init()
  remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  memory: tegra210-emc: Use devm_of_reserved_mem_device_init_by_name()
  drm: komeda: Use devm_of_reserved_mem_device_init()
  drm: malidp: Use devm_of_reserved_mem_device_init()
  drm: ingenic: Use devm_of_reserved_mem_device_init()
  drm: kmb: Use devm_of_reserved_mem_device_init()
  drm: sun4i: Use devm_of_reserved_mem_device_init()
  drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
  remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: imx: Use devm_of_reserved_mem_device_init_by_name()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()
  ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
  drm: aspeed: Use devm_of_reserved_mem_device_init()
  drm: arcpgu: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  misc: fastrpc: Use devm_of_reserved_mem_device_init()
  ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
  ASoC: sprd: Use devm_of_reserved_mem_device_init()

 drivers/firmware/qcom/qcom_scm.c              | 22 +++------
 .../gpu/drm/arm/display/komeda/komeda_dev.c   |  4 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  6 +--
 drivers/gpu/drm/arm/malidp_drv.c              |  4 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 13 +-----
 drivers/gpu/drm/kmb/kmb_drv.c                 | 12 +----
 drivers/gpu/drm/logicvc/logicvc_drm.c         | 21 ++++-----
 drivers/gpu/drm/pl111/pl111_drv.c             |  4 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  4 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  4 +-
 .../platform/arm/mali-c55/mali-c55-core.c     | 12 ++---
 drivers/media/platform/aspeed/aspeed-video.c  | 12 ++---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c |  3 +-
 drivers/media/platform/nuvoton/npcm-video.c   |  9 +---
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 16 +------
 drivers/memory/tegra/tegra210-emc-core.c      | 21 ++++-----
 drivers/misc/fastrpc.c                        |  2 +-
 drivers/mmc/host/sdhci-of-bst.c               |  7 +--
 drivers/of/of_reserved_mem.c                  | 41 +++++++++++++++++
 drivers/remoteproc/da8xx_remoteproc.c         | 10 +---
 drivers/remoteproc/keystone_remoteproc.c      | 16 +------
 drivers/remoteproc/mtk_scp.c                  |  3 +-
 drivers/remoteproc/omap_remoteproc.c          | 13 +-----
 drivers/remoteproc/ti_k3_common.c             | 13 +-----
 drivers/remoteproc/ti_k3_common.h             |  1 -
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  6 +--
 include/linux/of_reserved_mem.h               | 46 +++++++++++++++++++
 sound/hda/controllers/cix-ipbloq.c            |  2 +-
 sound/soc/fsl/imx-rpmsg.c                     |  2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    | 13 +-----
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 +------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    | 11 +----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 14 +-----
 sound/soc/sof/imx/imx-common.c                |  9 ++--
 sound/soc/sof/mediatek/mt8186/mt8186.c        |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  2 +-
 sound/soc/sprd/sprd-pcm-dma.c                 |  3 +-
 43 files changed, 162 insertions(+), 249 deletions(-)

-- 
2.53.0

