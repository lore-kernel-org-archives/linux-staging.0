Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ECF3403E7
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302701; cv=none; b=gsR8ZLSa/h7cra2+KTXuQjgTGsoT+HJ4NVS79+sxw68rm+CEd1LleDw2z7kX8DuqM7x8yD7uPtUSbAsHoyh6Yar6HtC4qD142CQ6tHcSux7xf+I7BG/vYoKxfrH/FlPQLUPkSLuop4hzBlvtGM9/1IeTDuuZrwKjAreXJGM194A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302701; c=relaxed/simple;
	bh=o05B1sznnG0EFm5f12G7gh70bDdeJZm8AZ8ddNvmIWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBC1c20S3xpo6TGci3Ocwi3RCMNqhtnEmGQww1eobUoCO8pLUezZj5DOmntkTOyUyzMFbCXkvfIwIezNaQNkNUAStAmYYAHoOGtEM7PqUbRTSpyliDtm/R1Kxq+an6OQyu5hg/Z5vA4oTVEYmVliUik/ABuw5JZlR0VatuYcKnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ym4T26FG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIikmyM/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ym4T26FG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIikmyM/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE893k1839203
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 15:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mU5plK4wOuXslrH5tzmT1Lzf
	M6TA652cX7f9RNduBGg=; b=Ym4T26FGSboWTOc59JBr4POlPj3J+PuT82mbDSwY
	XRzYDLR7OkRMjCjKvvmpRPZUEZNEZMcUJ1TZdM4i/OaecTGpd6cyft7WENJinH3I
	tt+dg/pjeYGey+bAGfsUAHGHYuXb2P2XVE+y2CZlw+s3g6Hy/zxMT+dzsg7x9s5B
	aEFFYNAT2NBk2//h4axm8Mdozm7fS+2wo7KaY/Zvpq078psWnAojwMnMNp90TaNv
	f4rpRtOOsOiOi80JUSgnZflxbXIVULuHMQJnsoJ97l4BNPwX9SwsLB1iLasZBlsI
	jxlOgKg2QlM/2l2jEprhcugzH/8XqpQggUULE2Sxb8hRsA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag9yur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 15:38:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38869800848so11959442a91.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784302695; x=1784907495; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mU5plK4wOuXslrH5tzmT1LzfM6TA652cX7f9RNduBGg=;
        b=AIikmyM/JPsdRgE8BzXgJ7Jgfj5l+XQKrlrX3J8AhIoFuy2Fly47LpbcD1q2Qk9WI3
         JuDHgu2yopyy8mZwrLlM+GHyKe2TS2mxvY+67rR+wIc8TgyJkH+WSUPUr3/cH6P0KJKs
         u7Rj3oBUdcEk4F3WMh7aHJrmQ2WPGlrerK6ciyC72DlUWHO4xobbZnD21Eu8ozAPNuvR
         QkEI9LJUuOL8NyqrqTKPZSMUnDHhn7faOrpFgkOEGrg5RZkTQhuHo8YDXOKMsBw3I0Ck
         p4HQEQOP98MXWWnAuPRrYp6CSzEUxAEJS16nyJ2NLqdp27Wm2dUrVHbdpyibS2gb+PhL
         xvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302695; x=1784907495;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mU5plK4wOuXslrH5tzmT1LzfM6TA652cX7f9RNduBGg=;
        b=KJvkGSf3gG0yf5UY7KwXf69iKkJTagGASTvunp32s0LRlc9Uj4rNT3VkWWBStM0d8R
         ldSFV80p72S/7qGYERbAP9molcXkbZPkf5wQJPJtt3JARtRHG0j3AHm9k0D+3IXiFlX2
         gc3VAn1d8yqSMBif+zP0k6Sk5sUWjQyEye3nsS1+gFjdsHOecRzvB+gqiLJ1xufJ5u13
         SdR5B9hG+1960mV/uZZtnW+E08mXwpH1/qXwUvAQFYXThEwc0m2PnlMXp0lCz9HZyv3s
         OXtOCFrDwlKNf2XYyPg0bKrHnFzSt4l+b5WB/WB5o66k5uAwL1uFZHwZpNnH/TjC/7OF
         LysQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXoR5qrdZVfaJjQEamtkP9f4mz/lvbaU8xDDyxeLcI6K0xs49LP14hTKmmJrvM+04WXGqQYpV3DwCu1duT@lists.linux.dev
X-Gm-Message-State: AOJu0Yycbm2z59KRxOIoU5tWFtJjVB4m996Iyjj0EoAZNvqBRvfVk9Lc
	Gb1y8BcfXaLvfSC4E34pJNLAdNLuTZWjTY/3b49DrOZ05HyWjvVKaMhbmeJ9n3SZVVLUahf+Hw4
	1bbMbTPV3pF4u7beAlrCIEvRkG0T4/qywYXkkmDHMIapBv7XONXEQJNsXBRvxWd2AnShO
X-Gm-Gg: AfdE7cnIUio+4aVcuBVs8UCPnq0DVBMw/X/D3AG34AOmr+g03Jt1ENER4oAR3o3VciS
	i5BYFXc7N+XP3ST6zb831LACJqLj1FmQz1RWpiKV5maIGrrIGzeZiOPNk9a1kGF0opu/rx8K37K
	6GanGndhLK+JlcKwtNy4EVH4Rt4+7WCOyJsldM5LzsG5wiU7vSnuMui/Jwv+xbAt/zjANYZ24y1
	lKBTCM0bNGXUBHxx2bB/wanh2K+VYafXeLI3JKFyerSEvR6irBdCB0NjUm7Chz+/Qrkx/v373u2
	L/HgAyHtBzKkXQfnxwwei8QVd7uBfLVwTDhYcQJBfBRtSZwzdPvK00mTkbyh89JoQwl/9QiwY4c
	BG7hgEqpGehRUZUoliJ1X2ynYRwU=
X-Received: by 2002:a17:90b:2684:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-38e4b3e1473mr3203832a91.1.1784302694253;
        Fri, 17 Jul 2026 08:38:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2684:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-38e4b3e1473mr3203716a91.1.1784302693542;
        Fri, 17 Jul 2026 08:38:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1ddeb6sm10087302eec.20.2026.07.17.08.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:38:13 -0700 (PDT)
Date: Fri, 17 Jul 2026 21:07:45 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Ulf Hansson <ulfh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
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
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 01/42] of: reserved_mem: Introduce devres-managed
 initialization functions
Message-ID: <20260717153745.geqmmgm4o3j3vhom@hu-mojha-hyd.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com>
 <20260716200048.GA1183026-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716200048.GA1183026-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE2MCBTYWx0ZWRfX7mxZV0yUhXGK
 Qp78BJ7Zbp1khQycu4ScOCHUp5hcVINrJ1lb0sEDsfPv4z5bF9nfjsvhyDT713FZMy25n+8H9K6
 bgE1hd/gA6hk+Vt37FyxfiRXLqcpouoS8SA1q1IeiGmKYATUjKUSnJadObwB6obZIWPd1Kdnlq3
 zq2hgRa/2Uxen6fnlNEtO72GFTWvWXM6iZLkLKP7cXdsbKm8up6hCB4A3b8aNmHWpxsM5qTYwYV
 8CRzjh+3PsnMdtMVMSsar7dsbbF733bu3memyo3djjCLGH4QaSd8lNtzA7wTZF8wWTYuq4mF6nv
 p/Cg5q8NeMk1gaRh6Y/uWeSgME9XSWXqg7vCQc4qRgoICzA+QlLBTfwKS+DEOrZRgLU4+EHeivf
 8u/GL05KDSndF0VNKNM//l9IzJh80vP5TpgADn8dqzyXCE3+9RjrvZeTktQwOzkm37XKOHLuGOS
 wptYidxnzk4LhDjh2Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE2MCBTYWx0ZWRfXzQnYW+SmIcR6
 CYQmsDnsstt+lYC9UO13u1oBwZ8CHRygYEFSUMZOaUrtQjxLellR9+cd8eYxO7qwSAjEI/a6Vm4
 shMC3H9YReHxPKfqSHWiast023G5c90=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a4c67 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9JV1VVRos5_Q502CX78A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Tiawi1ll_MBFBsZbAJ_BqLrn0pYkUEiG
X-Proofpoint-ORIG-GUID: Tiawi1ll_MBFBsZbAJ_BqLrn0pYkUEiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170160

On Thu, Jul 16, 2026 at 03:00:48PM -0500, Rob Herring wrote:
> On Sat, Jul 04, 2026 at 01:08:14AM +0530, Mukesh Ojha wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Introduce devres-based helpers for of_reserved_mem_device_init(_by_idx)
> > to help fight dangling references and ever so slightly reduce the
> > number of boilerplate deinitialization calls.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/of/of_reserved_mem.c    | 41 +++++++++++++++++++++++++++++++++
> >  include/linux/of_reserved_mem.h | 25 ++++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> > 
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> > index 82222bd45ac6..b35541e9fbe8 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -787,6 +787,47 @@ void of_reserved_mem_device_release(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
> >  
> > +static void devm_of_reserved_mem_device_release(struct device *dev, void *res)
> > +{
> > +	of_reserved_mem_device_release(*(struct device **)res);
> > +}
> > +
> > +/**
> > + * devm_of_reserved_mem_device_init_by_idx() - Resource managed of_reserved_mem_device_init_by_idx()
> > + * @dev: Pointer to the device to configure
> > + * @np: Pointer to the device node with 'memory-region' property
> > + * @idx: Index of selected region
> > + *
> > + * This is a resource managed version of of_reserved_mem_device_init_by_idx().
> > + * The reserved memory region will be released automatically when the device
> > + * is unbound.
> > + *
> > + * Returns: Negative errno on failure or zero on success.
> > + */
> > +int devm_of_reserved_mem_device_init_by_idx(struct device *dev,
> > +					    struct device_node *np, int idx)
> 
> It looks to me like the only 2? users of this could be converted to 
> devm_of_reserved_mem_device_init() instead. The mmc one obviously can. 
> The imx one depends if np is dev->of_node. I'm not a fan of APIs with 
> only a few users.

You are right, mmc can be but imx can't. I can make this static and drop
the API usage from imx but fix the leak by release function.

-- 
-Mukesh Ojha
