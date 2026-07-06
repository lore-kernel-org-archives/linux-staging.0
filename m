Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD73E92B0
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326777; cv=none; b=tAUXde+OpEFo9X+kFI3E4lOK4i91SmQuTok5jqDDaELIEJkBIyrw7jq35X7LFvXRWVF3UaDPObkUn2j1gdVRhMnRpsFWHUFegHZOxB/Zhu5XBnihqp0j5dY8uAftePDWT/pZ8BlIVFXAtywTI79Se4sBtBmGxixJ0s2q45VkNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326777; c=relaxed/simple;
	bh=BOh+Hb4ZxI0byKHwLdu1YMSdOQ8nQdY5hZERfclrwks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbOdpjR1+/ezFzsXs27de9Cw4c3T+ZIaKgFaioXsGJksIs6rq554H+gpgVFcTXmSIJ4b2rYgEtGrKD5kLRI8v73IK0F1tSiyJzgwfaKnG/17dC74xIBD0T31F0fZoKPrGx5wwrNYuUCSJF2DgMgLVYJpDMgTCtG3vykNqvGtK2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tt1g9aWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMW4acm/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt1g9aWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMW4acm/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641ZfT3614039
	for <linux-staging@lists.linux.dev>; Mon, 6 Jul 2026 08:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=; b=Tt1g9aWRdhyI3BpO
	bvxcoGq7kYOipwI8sI86zxkmNdiblCbEIIy0D6ekqZISLjLM2a33y7RzY76GbicN
	Opq7MS5ZQyamKmgeZkedVYAFfw1KRPYi8hl3Y7h7kuir3yf0DUot7pMFqfcV2RX7
	X6ly6HXPcg70fqU+dH3N/iuMe5KE0DqLRF0s4qeJ6w03zgeEubZlkFJyH6FDUo2t
	Et+Ig2j6kpZC/v51lNaj0P+xbzzB2QuKkvGbM4AuZdQSxZloAH/4eroeiJwOgPxx
	kOehTF0x3+rZPy9CPDosN5R/kMP09AyBofAR6Pe/VMGVWMs1S1vCPm7OD23UZkSl
	ZSPxow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnc6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Mon, 06 Jul 2026 08:32:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so6470591cf.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Jul 2026 01:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326758; x=1783931558; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=EMW4acm/CXU04ZJP0ae8AaGHpbXX+rbNW+Vmq/6h4t8eN2fpEcfh5RnkeyYnZ5N2ys
         jAHPMbOFF0z37KChWuFWf0z5aQGgcRNLxwcoqBRl3qLqthUP0+JlJumUMJlGrTRE1Jit
         zW3epmMTypnceRZlZWa3hDJ+0ey15iLPXFzbrdo0lfGo0Y2/Ajgv7PhdBEFEVPcD/C+P
         lBuSMPWEW9eJqPQ4eUeb0eaYRr22bCPiJzTB3oPOUCmU8DirVRqSBFkhdI7zX2aYK8W+
         rsZiH0s3ZgN3blXaVTWaKw2JZDS11Zatz/JjlGxXCT3+14kPHOhJVmUHUBm1aKLyUSiL
         N8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326758; x=1783931558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=jAhxLTUiYpX5waGgAdVXqL39ZM5JkayWyzv32Neh7CodNR1Y1JrrtLYGgAO/XPpVfl
         vhj2FMJjg3+Qmn+IrQBCrkYnpD2abyDX9dkgZYRUCu5ZNLTwcCl0g2gbgKDlYu+RNrSl
         2rMyt+OOez+xFqveKgIrljaGFRS2hxqQjneMuwhAZ5iAwQ+/B4yjb4OZLzNZP4fRaYFr
         swmpV/fTecjZSJfNvHwhtcM68S1cSmhRG7jBJht1auqyiTc4eOU80jlT7zlStqrk0ZhE
         Qu+PXqyagQRwf+GlZN7nebHMNmVJWSCZVwkqIFlc+NS0wgrJRfDgHx2QeqCjFBazKGOT
         Whjw==
X-Forwarded-Encrypted: i=1; AHgh+RryZlyTXVC/uul0BvIWtY8ngdpDGWMf/fSr7Fpmy3TCTtmfWl0iLL7hZ1odtR7ZIBzTutfMK4o15RXJsXkn@lists.linux.dev
X-Gm-Message-State: AOJu0YyqzOrNiG68TsxfMiDMDIYBm4I/sihzUeHhuiVEJLVCBFGENg6c
	1jaSyByjeNBEVBvxgwZ4sbHFN1Asc4K1JnXNCbjRih+1CEbOlMfI2avgVmBzt0rAza2Znytmc3O
	guT500qp1aZhy6rdAwFpDkMfDYKBtDTgQIs4tVwzo56dmQBIZ72Aw9JeUr1jA+ZKb/v3/
X-Gm-Gg: AfdE7cmty6AgozGkWJVTaMi1C8R72NsUqMxN/RIA/4VZgJQGEbOiFNmCgdbOp3BRFsh
	/gp+zLorCBScp/UAiUUD11CW0p9kX0bJH8kgUz1XRggb6Q9DPHrefRif6ATgTgw/kfR/YNW1yue
	D3ajKOtQ/G76mAi7Yeg+0LjrzFsBqqfBvG8pd86X4jLgvyhv3+tRN8qZIfGLJ4CRjHcWzCrhLLh
	+KmCvABDAWhulRpxq3SyudmpF1a2lIAVqSyYYuZOkgV1pE3OPyN0zT7srkL+lrss9XPYD1KVzw9
	0U1DLyiBmkCwOre8BwKXGQFdNmK9z4JRC2GAzDyFEnnX2pVZqKNKNtAbDCDIdAvOkRSD+KE2P86
	L9tTCdGtopBQpWeL7lc6EtTCIOA/HTFkr694=
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79017001cf.5.1783326758006;
        Mon, 06 Jul 2026 01:32:38 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79016281cf.5.1783326757507;
        Mon, 06 Jul 2026 01:32:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6093786sm694743966b.20.2026.07.06.01.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:32:36 -0700 (PDT)
Message-ID: <f1e7ef14-7186-4854-a832-a34596d3313f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:32:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/42] firmware: qcom: scm: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Alexey Brodkin
 <abrodkin@synopsys.com>,
        Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
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
        Ge Gordon
 <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
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
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b682a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7yxQZbK4ublJ3xJh_1MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: gub-cWQkfFnrW9-XYKXV9C1qfBrdOjku
X-Proofpoint-GUID: gub-cWQkfFnrW9-XYKXV9C1qfBrdOjku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX4/za/W9IVEB6
 5XILlFy7y1BFKKSFSo3OuAquQXvNA9I2MWtVhKd/2CSdLAapATWrghYkKUwIdHZuT04q1tvK5QP
 CE6fG8R/0EyNa+njoe26r/duBTLvt0kSacfPGYNv87Nn2T1r+trWDoZe9XkvBZlCSUnk/FBvsEu
 ylszJUuj8b/+87gmjZ6vixoJVYEWAL2Fy1RAhoIk6nZ9S7nV/I2nEaAiuwzkIG+GiBFnlau6uD4
 sMGkoYI4QRppDeUyOQ72qjyEin79tTKtXudlbShySa0+Z25p25JwuDdAAVJUtq+WlIRcuGqphuk
 dw7uYZpNc4cwMlVbhOm4EzM8XzC4Kq345vjgDKxOzm5osrUg0fqp+aLqzFDxmsUl4LRkhZjcHKe
 lf2ruDkUI2ighsPtVgnGC1uA2bnfod7eUrqUmedFTPtx8xpxLjarPhfBiJWhC0zuygaeXl8Wzev
 pAkXhfBEzEpGcGc/0Zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX3sNRBX1ooGon
 I/0fdXpP/BxIKOPjmcMIA3A65U/Ba0c/vTq6+9e6AjNG0gvSImoCqmCpTyvDLDFN1o9IFjVZFIE
 Bwk0Jev0sxs50usLp30r3AO5HRZMNI4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

On 7/3/26 9:38 PM, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
