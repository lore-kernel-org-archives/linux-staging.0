Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126E3314AC
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 19:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107714; cv=none; b=OQTUM4c3rIiRjWmxH4nFROXrFgyVa9kIDDVg5YJpCa/QZ25xHvAuR10OoNLHnySi4jAT4/zW5HIxoD+SY6myzhOwP93A0/6V2dKiUv5wuGUpoFGr/pESzxhPj62UVIqTUugsr2q8xsc6I+F/dXp3SIY/C/Q0+KbQx3a1VxB584I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107714; c=relaxed/simple;
	bh=gDs4Oen2DDTezMfDmPJCSVtzQ+287D9p3/klzuY+bXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POlCG5zcxxd3gi+GplWcjmBerdRFD11YiIENP6N0ALEM0+p4D4lS7JjUMxEvkmw2FnjzctmjybptgS46lPBsXT2WVnnOJLM+Ndk70GaG1T+kd+NvujzU+OyHNOAVr4ezX0BCI3pLmv/trPNB9WVZbQNTz5XlHZUbbVJiKxem4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBbUqtax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zx+AqcZp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBbUqtax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zx+AqcZp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HibuO494915
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 19:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wgBn60HnIhK
	vMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=; b=RBbUqtax0OnhW8ww+r+abiXC7bl
	aoj2BEWb6XNcMTtnbQ/eZQQJxadf53YUYpMb9HDQFPKsAxYE+WHfUJzjV5P7b4sn
	+Z3ANHcjpYktEAFM1C4CV1k8NP88eUtR7krkUEhWjX0o5ZqGk+Yvz3NJ/D7Kg5gZ
	iLxwHLhK6rE6HW9etExXvSejbzzbzhvlqP05WbAXXc3gJ7C0dwK72SOv94lYCmOv
	5FQ0R2Vsu2aQgsQFeztF5gpUm7zEWsntIJWZB6Bx1yTiQ1unY38c+NcNI6Nd5Sl0
	RQ7JIvskzNJuclWDN805IAwFDfDq911B4kqC6csAGjbvgwL75Gns/PO/jfQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytkqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 19:41:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1024034a12.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107711; x=1783712511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=;
        b=Zx+AqcZpxJbiS7aJP342w1URLYdouE/5p0+IwYkDrJchSKU/QntXuttyr3pxYugJHg
         apzt9QjIMZ79FW1cbjUR1w/CGow6UrF5+Qqp9M0s2zYhtaEy6xs5/DrK0s9AQg/1BLFW
         PvTYtHz76xkAmrO+5LO4qAZnYRxi8fWDGNG/obKcwWtVkYPSQ0QFXAGv40HWCR2O5wBz
         /YZRrTfA2jXr8rt/uiwJlE7CN4WSQNxcsrHbvznxyjrYn7UwsFLOWs3bVS7/OZ6+C5DK
         P7KX37K33+w65VNzFXnW24ePmIa8kZlzFMipPsK4/veXnsmdttH8n5VDe12EQfkiK/De
         iq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107711; x=1783712511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=;
        b=lNpxq5VBckC99pggCZ0THLmKn77xjaQrmnLPkH8oRVR1hhSEFpvQobKLUt9Vx3JDlJ
         8VxhZDtw4SZCgRh9jpQo/q6GWADKqxvOTtTdPpXb3YBMi6IwMjdoe1spxtMC4muz7MAv
         C42vSSSHy+xLwMgzR+WDr94AzvWqXoMOZfayAt21lIrXXZa22mS/uXKiMjqiuPfg+avl
         z+ea1jS7M1h2tLFYT9jIQQx8RWFaPUHqRTxS9j030gt+oyhdFlyTkeetjU6uDnEXUqdz
         PxGpd/jCz7ZJhOUUb4vhzdX4rijZjBgR2kDTrjy9sLXgHLpwyCjgInWxqInyM9Ql5Ebd
         Sz2g==
X-Forwarded-Encrypted: i=1; AFNElJ/DOYNp8Oljh9EK0am6xuZitIHq5gmiiXQW6yJshasSXXXqGXqW5Cb+2yxVP7Y9aGVt8jiZ9jIxcaqwNbdq@lists.linux.dev
X-Gm-Message-State: AOJu0YzstomDLw2J07OcmdbUcWXoIvsE2bIW3CaqgjCpsQmWoTb5Z4Uy
	YpeQlpYeCvgKMHJZh6zBF7GMHysRgcR4E0ELRi089BEQmE0sLHYWBMXgT+hekeoLhh70e45YfpN
	z2qXxJQTyPx15HM96624ggFZTE5LNtw7i/LuPfQDtAlZZzgFv9l6AOjiEFlGQJ8Vc68sr
X-Gm-Gg: AfdE7cla6SZgtg/UK6c/EzJR3OycZa6ULsalcCQ3ZvQr5c1C+XrypcCwEY7TfTcm/U2
	mYPwzrbe7PlbWLxgSy8jTnG9d/E+ZxAVWq4NLd4jWCxMtoR3J/SrzEhsKgq/npCXY32gT11lPTe
	dRxGN27jh2hSY5Ol1N5B3JG2tozqDLxSoEDyVHNWtlEmHxLq4SVa9oW13VM9TXO4JCAZulfT8BT
	YdpVoUvEBKw2pcodvjqdnXQN+Fw3gusj9Vmd9XtcbqUy031BzvuWhBtQFmY6OkcytTWCHEPDeqh
	1oztwa0YKAsjDGibUrRCYzAU7J0djUWGH1yDFc6KP3yzWttKLpkWA6SFXlAQvwyRHBnxs0Jg1Aa
	iXYsQ627eHYbYAlXgV3zVprlTJ1/7OA1Hoo3+pg==
X-Received: by 2002:a05:6a20:734e:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3c01cb9a275mr5809466637.30.1783107710466;
        Fri, 03 Jul 2026 12:41:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:734e:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3c01cb9a275mr5809352637.30.1783107709738;
        Fri, 03 Jul 2026 12:41:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:41:49 -0700 (PDT)
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
Subject: [PATCH 06/42] media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:19 +0530
Message-ID: <20260703193855.110619-7-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX6W2ole6J6vPM
 dA4xDC63fS3TDRiulWzKCOD3pF0cJstcvU5TnvteNKoNsqgS5eJA21072lM2yeT6AxYfIIUza0D
 oYGf/dO67uGIbdIUyWJ8P6ZaO9Flijpg9pi9uA5jbX3WL8yoH958nfN+iuPzORQKkqQjbn3SE/h
 bKi+4eBh/JP1NdWdGd8sNCHifxa+dMA/SXHelGWgvlDE/cgBpGBZulKvNB5WNVVyalskEROvilc
 D2/i4jTW9TP1vbPtrOFLDWudhLXm1Z5JVybzgwBLwcjScJBRXsph+DNuoLQTOQnj9OGYPeXexbc
 /YTKR4ob2t5uQWOYaQgbOBUmlbaZWyr5DRpLmUSeLNbIYxQwK9dLWvROb9gSwMdehDOdbcezLIb
 JcZfh9RlDFVL8v1gmlqRwd9kAaldSAIbLVb0Ia+XcCV5LWX2pINFLMOgGa2L8u2owDLzKVqMhTA
 1X5tUIV7NL0cKwmIRNw==
X-Proofpoint-GUID: u4EfoabRDZJiGYIT9wMikVGEaq3MFcjF
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a481080 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wxxTr_YEz1i4iFEBgi8A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: u4EfoabRDZJiGYIT9wMikVGEaq3MFcjF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX9CfTvjQjkLAy
 FkbTfSP5NlPLITRQ7PhjG1eHsqMh3R6ecKFvUppyFXnX91eDcaybdoPHboDK5BO2r9hLdFMijFT
 PxhzWba6eiEF/rAVVpuKFja6MhhGFVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Replace the hand-rolled devm_hdmirx_of_reserved_mem_device_release()
devres action with devm_of_reserved_mem_device_init(), which handles the
cleanup automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

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
2.53.0

