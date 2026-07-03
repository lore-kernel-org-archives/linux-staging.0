Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B43438A0
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 23:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783120367; cv=none; b=Vdg29dLHmzCATAzi2ctMkHvvbx8WG49wBZBy+ameANgnEz0iM1Xl0hqtd94wQKr59d/9P/anN6H87OT29hOBEspOdEbfUROqUE9feAAqr3Kf+NfUJVgMbQe3GqiBJ226XStOQAIHsh2aN2r+dT3f9SfPuIYqm0Ovw8gSRIfr6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783120367; c=relaxed/simple;
	bh=u4LQYJOWirbCrWOLISyUVhSJn5uCp/8k1nYDfOpOI0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NntSNrebPFWc9Z3xeMxjiecWd6YRlcQmCvC/lBcLNz4ojreUa8uluyAHP8Jjr+rV9zuZJJ88GT8a5QrBew8Z/n1mkZKJlsMxPY1tC0EcMA5xARxn2knEWnvXuxJRaw/SHnJfdUX+Zr9FqmvRlwNfMk5A1IhxB5m0VZrUT4de7Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwuefZpS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkI87y76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwuefZpS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkI87y76"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPt6L1021761
	for <linux-staging@lists.linux.dev>; Fri, 3 Jul 2026 23:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ptvjiVFY55mHuzyR7IOPZN3q
	jRdO4GwgfZdidGQ+xdk=; b=MwuefZpSFTvuNgJyrkHy6OEbxdQIh4zwoxkeV0v1
	SeNT+DdlpzYtM/NzLKO5cRhFyyJnebuIF5IKibnQH9YpiTNtspV6uDvHww+LUUZw
	Z26z8Ghqy1Bdy97MgjMlCybQAcNvxhH7AanAObFO0nN5IPodyrTpWh3DwjILH5JS
	lGZlFabkn+OlzqLPqxZPmZYtMum9AdRVSTRs/wP4GOzKS3Aj0HWCmra/f6MkDSMw
	qYaBJCD0DDY6/4P6Rd9xzPP5E3hUq7S5beve23YXYe29Mo8LO5BMBx2bJeVN/Pjr
	eFrVkDRH+FB3sjLbh5P/z/JAV4UUnzJ+/KZJdzBA5COZEg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u330ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 23:12:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso20865476d6.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 16:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783120363; x=1783725163; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=;
        b=VkI87y769gpnpSQ326vdVQQQj2N+BdWgOhG6u7nqUbNEALVAvpElGXxWoxNDGWYkdk
         y1lLmwObiRqY73Zxn+qXYUZ0CPe+niVPQdwVtLRHrikY01etdmW8xC7YIbsQ9kUkkcXl
         lTV7agAK4HJ07lyzmyJDxpv3rtHScIHooFR8GZhJrmew2vyQbgfBktv2s02q0d03Q6GN
         2CPCHVYpKMiRkEppN4sfNQgk9HrWKyDPBXI5XFLvrtzekdIbJuX22pmPboQFMYpH59IK
         4RXxA5rQ6RsQRJhl6bkmTa3ryXD6Zqlbnzf8Y8E8lvOjhTK/ztRJH32u0Dbnuugz3Dtd
         517w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783120363; x=1783725163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=;
        b=KrNShXbIc/fHmiFaYoMRTEFjLSxFHH5brsZL84uInyzCwj5VIlbjV+sm376MpsY7fo
         GmLvyH7r09O44Szwcm9WBPD5eqsv8+DieHhOQUiTfnNYo76P1Dd18ftu5w9g6yfXtvxi
         un2ixHGCR+Wcnc+7kYXdEU+7Ow439Km6ub0exxifscYchW+vE0qG1dF5b8bvI5OwZyND
         xDB2R9s7Y31PWcKzUE2Y9JybeaE51c3N+U/lE9QoZ1jD7GbezqF0hTWwn3zQJPSH2w7r
         iRp/Q2+OjrsQ9GAOGzJPVIMu9pi1WYCpGBZRVtmWmKEV4iKmppeH6N0lesfwBsD9XxPD
         JroA==
X-Forwarded-Encrypted: i=1; AHgh+RptTqA1OZBVP3mCheh+HbCntRifIYBtNX7pzDW5nMFTXjvGITPlLR9tlp8A7NfCO8cUXVV80tGOy2hhPRn9@lists.linux.dev
X-Gm-Message-State: AOJu0YzTVwLICmMWdyY+AbNBmwzPs1auiquOCZwe6f+Sqv3E0JAbrsC2
	4D0MVz7qAQ+9fPaLR4AyTlRbHXcVNcAK4n7x7j8g5xr64jgysC7BRm/hJ9EYmeMmCSLA71wtY2N
	LmY9X/9vh7VGXgfCyC5q08TlnLd6Aw231gdORloQRl/l7prNkiHSF5Uj/SWqiVnoDnwx5
X-Gm-Gg: AfdE7cnY3W+rIfqc9kp1VZgy5QG2IBiC+cK/TkG42Ukh/dzJtEikN0K8yezm8Ij6/5v
	/+3TeQ6J8nyZxRiHdYvEDCYEGXI1IZ7mAyGfMoQ9AaEBAKaNkTFiDTi1eupP3sn3/s5jUt/obZ3
	WeejmM21P8YCpoMXyvyosBGqgCC40kBF+J7bT9kzgcBSiDqpplWCVoWtmiJ8cnK/OetvqiP6Ae2
	3ubZGD/OHPNkBSK8SwAkbADd4ouNvUjRq4SILUxIkCHKwTXVRj8T4rNj6OoJPjh1y4qvxU69hcP
	loO6IKFYdJzQd7RNA43yHJKhNHyf5nvUP8dym416Omr2OES43WqCHjPEzMD5zWHacmiVKhQlh8F
	ky7K1Y/qWobBY/gRhbvOBF+GOZhhDNPhH9dZNq1Hg43bkpwvCKpEwkpWuzjC+fTVOKuzNgaz86D
	kBagF5BMXartpRLcwqjglGm7e5
X-Received: by 2002:ad4:5c82:0:b0:8ea:efae:ab2c with SMTP id 6a1803df08f44-8f74c0a468cmr20755546d6.38.1783120363150;
        Fri, 03 Jul 2026 16:12:43 -0700 (PDT)
X-Received: by 2002:ad4:5c82:0:b0:8ea:efae:ab2c with SMTP id 6a1803df08f44-8f74c0a468cmr20754586d6.38.1783120362600;
        Fri, 03 Jul 2026 16:12:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a0asm815528e87.71.2026.07.03.16.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:12:40 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:12:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 03/42] firmware: qcom: scm: Use
 devm_of_reserved_mem_device_init()
Message-ID: <6ejxrh43bkhryudrxk3lkzf2knlgv3mxtfgzhrzujw7km4n5bq@4bd2ahopzs4j>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: tWCo1ePodre6Hf2Xv3o_o0uTV7Cy-sRE
X-Proofpoint-ORIG-GUID: tWCo1ePodre6Hf2Xv3o_o0uTV7Cy-sRE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNCBTYWx0ZWRfX1zLxV/X2BhYG
 GEG9Z7SxbmW1PJv+ArjcaEoOHGWlDzp40LbdzXPHS5u1UfqnZXh7yxBfn2H8H7G7z2lGcbwmQUt
 8tuI2PnoN8M3qOmkLMjxi8jym2oi+no=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNCBTYWx0ZWRfX7tr5uIqmRQkS
 TGCyITKK8Cp2XBAPMrelTb8OZafqM/aRU9rrO1SIj/fMgrtG2YMXeBmTBjyoh8Qk/fDDahvTgId
 dpOZ/dpvBPcefHuWadrBnCI8RxXMwmZ7wrSK3A2sovVLLAnx8qBmGpWKZTBxP6WHjyprBM37xnk
 uoyQe/8L7B3W8ZpzFUoDU+wpOyZ1tpYbLyF2SUYDeNUS7nTcogje3snkogg/0z2EKFN/AGKLjLZ
 NzJWUzMza0Y9QWgeHVV/eL8FxvXjX/G0Mz4DzQAZpnKZL75LU4VtYEt/TDBumWNbl+NXw7D/TxZ
 6NWNENbCryPI/4thV2Bdt/Gw3PVi5YUCDLYCedq3fEaI8aoQdV0J/8CivW0mdj/nw/IgfTK0tu6
 qW7mVolwmUKl8hsoRxmKLRlSDASJfYQnRvPTdqIl8QC0KjaQygleDoYtdGMpFnLJgWer1UNB6P7
 /x/fk0coYXGvQim3MEw==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a4841ec cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Dn8qeLIeI0d_esIdenwA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030234

On Sat, Jul 04, 2026 at 01:08:16AM +0530, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
