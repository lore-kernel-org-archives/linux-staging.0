Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CD933A9FE
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107931; cv=none; b=JVFA5jVgU7hFuvcVVsz0PMHhTTiuVuEedoprZW263vtxeqS8+ulEwLlS3/nIgbYYsaa3WPa9WhvGBI8ORRYY3epomD7vJ0m+aoPEODpiP0xjsMhHR7tv6qR5eugPkYnn3OBG6fsF8o4CZSYonU+ZkKnMAeNS64ydLoMifmNrBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107931; c=relaxed/simple;
	bh=wcHg6QyrrbvIhAvroaLDmY3X7Y/69J6Dr/9egWVA68Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAL15EgEMqAVXvxZityXlmym4Qof/+I2FXFSuoCVbLiLX8ewAaQvGLEVXEzx+HL9Q1jDiJ0eiE2vaLmm9bngv/5149gBXuARgXeYfd7J/SClrizI8X9rMc1VDBwrueYmdH4XSh2T7FK7kTfA1D/TMp71j1WTmN3zhFDWVocaoPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+uAJn+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iskEtSn0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+uAJn+X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iskEtSn0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hiq7E685472
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 19:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQ4/br+RH95
	hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=; b=U+uAJn+XBGdMb+GnChTd4WXzIGt
	21mHhuEBOT3UPMVRFSnaUfgff0p/MLIjrIDZBWyr2ioHNXcJIJuNHwRCxza8nzx2
	o9BU3TUQivd3BsDI+F/Xt1HhgcFBA46i6EG9Y/VKlHlq0xDKl1Q5EPjAF08z1PnI
	N8t0srPzLC3Kd6GWPYmf/TCHQ/ySQ0/hUoM0qzlNv/jaaMZt/hRDr70A5UNnlQ7Y
	sCLDAvCv6zIhx6R3hl2Yx7uA5YiLPndDBfBUeutebe8Oyr3UvI/DqN5c2OwMqCtk
	o63F+mp7gBY0t3VC+xOOXXf2vjJKujUIMvoVs+xyURl5hGazRpjC8TarFyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qckf3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 19:45:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso852861a91.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 12:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107928; x=1783712728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQ4/br+RH95hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=;
        b=iskEtSn0KjC6zbLHX0Exp389tSbFbgcvMJwDOBhJd5ii8A2iDGN5TPoe2GUl9wpex0
         6hhNwEVTRaUcOIlpMzyodLl6D0S2wdBEGIwKbTj3YKoFYXNnEPQSpaUm19AuoX9IpJRW
         xHDVFX2R/TzK69G1vOJNBKkXI9F7HVFDTJBIol3w//haH549d/pwkEOishVol74Sh8jF
         NSvew/hpgic8tTfCBj+A/VkWrpd8Dkqdzjit98ZuAS5gqHik1sjxw+CNheVpvJkkzFAC
         VXdShxsPZ7TEbXyFzB8/H4U6ypuEtb/dRGax9ncB0O0fTdNgzZ5ThvMOv63aZXs5wHFR
         rPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107928; x=1783712728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fQ4/br+RH95hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=;
        b=sGQ22hVd1ujJ+KeLuPSwD80LYbVQPBvRBXPkx+1oWQ/f8AcVdZEbW1kz8w3kziD6R8
         efIb1HDD2oPcucO0UgHidA1jf7UTX+Iiqos/OaBnFCrDich4Wssm4/Ek7rKmPAQrTk0x
         DH1QCxzrRjrOueW6Pyoh7PSSXBwsESup0K6JOjjHoB4Jf+mvUIEsbHtX/nJkLewOdrHX
         tFLTrbY2yoAG2w7IurDjRZsE94gRNz+TzSc9iL8LbfYBYFqJ+RE6KMyWiQmz/zuf0kuv
         YMeGznjHuF5ER5cFY51/hum1TffQnxI8+MwXtzkRDPChCOqYkzHf9h5QZV1t2D+C1q1b
         6lMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTKCMsPTfi8m9FVERuK+Sk7Jvviw1qtOgjfF/zpdFsCGv/9swTmAk89c6RSNO1hYhBi99hbf4Me9J90okC@lists.linux.dev
X-Gm-Message-State: AOJu0YyiRwkQvjm3X/WEPWdfir29cbJe7OD+zatrNv0KHec40xwIubPv
	KEnxIY5K86EMV4fZPYhl4akW7z7fJcJzXqtYpyeHzZni+HD8KTQzIgKkwTKKo78kVMI4E0GoUgO
	NPoT2jMlEs7pQhtwV6OdA95tddrlnNadZ09jy5DhJvHz0/NpYpnjKJ0QLtDju9f0RX0sz
X-Gm-Gg: AfdE7cmb5wZgnlUWG9nKQffF3gwm9qjpj6ZCl67In08yDgXX+T9IGZwysIJQG0aUWmD
	bI5Yr+0qB2oa8bNCFR8rqczC/Ox3jzrgg8Bo3jh7c3ScrOWJySyXaRIQtjD8dzqwv4E0asG8zhd
	FJhP6L6QabnzS7zjYDLRYHP3lodoT6/8LydGZ3yNF6F3e+ZqR44WfETGHB8JmEqrydeWiDU1Fq1
	PYgwYrM85ktdzhDAoF5QQWQh2WaHL8Ynt08D28vg88NuGo87TnM3nGiw4KEhq0hf+XHyxK4lB2m
	89WtjmfiF0DUDhgTqEFI1gc8db8ggYyoDOlOY3knbk8BeCNsKqL7WRVvWS5IzEVLO8HlrqroXDJ
	XufkGR557if2pQxY0Sdyv2KnohryTxfghtaYspg==
X-Received: by 2002:a17:90b:590c:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3829f5e72d3mr636906a91.30.1783107927711;
        Fri, 03 Jul 2026 12:45:27 -0700 (PDT)
X-Received: by 2002:a17:90b:590c:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3829f5e72d3mr636834a91.30.1783107927089;
        Fri, 03 Jul 2026 12:45:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:45:26 -0700 (PDT)
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
Subject: [PATCH 15/42] drm: komeda: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:28 +0530
Message-ID: <20260703193855.110619-16-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: KMng4fclkUazWXuAoiKMq0ZpC6F8tGG_
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a481158 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=8sfNmL5Et35J21XlSqYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: KMng4fclkUazWXuAoiKMq0ZpC6F8tGG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX481ERumu0XbC
 pCxq6zgQV3Z4AOvG/QgnGouD/ihDPsMxgys2ew0GhRsawg7VJIKkDZrwfqQKTCTEoWfkKkaNH/A
 rnfKcwU/LUuG14A/7zt7a4wKVnzek8Ctt689GQzNNNSv/DlXv8ENbdo0F3faDz6Iv7CAT9xhF4F
 xBlVZ9StICojz5oZXO8zAPrvs0b2Uobv5cWYylz56+TIp3QR35r9qkLaYfdpBLaLKCfH04Z8Oug
 GYXPjvYHLocnryJRTZPpXzNP1PBhh1uQK/pgBqu1sxU91ceUDlsL8KUsm8mH2NGdtd9JEfYcRb6
 AoP0SnVw+LMOXgrJ0+g9cwwgzrS2vQjjno8jCUYO/RZ/uXM8eWlQJwESjdt6xDx97v6fU37L7/V
 TymdUAC/x6fHH5weSVfe88IsNGOvF4mns43afEB8AH1ISA3kQ1gj324jf/TSOYZIqgWCBf8fxfE
 BzpBxG+MIplSKGHUw1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXxPM7UgFShvzJ
 RLiTJVf7C3z6EbM37TuYB1zi4A735H/6aMAly8CgOIW9rngXa7zqQzD1QJ45CRYCZALQ0zVxXmx
 q+ciA0r24OP6Yije0itWHFep6nXP05Q=
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

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 9aad1d1d28ec..8016f5a68cba 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -145,7 +145,7 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -292,8 +292,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 	mdev->n_pipelines = 0;
 
-	of_reserved_mem_device_release(dev);
-
 	if (funcs && funcs->cleanup)
 		funcs->cleanup(mdev);
 
-- 
2.53.0

