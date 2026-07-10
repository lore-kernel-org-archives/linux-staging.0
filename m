Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC2B42B738
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688931; cv=pass; b=DaSjwyYcptkYu7JHuU1U9fajULc5TiIDLt+TwttmaeAiJOQEYtM57uUfL7PotcLWCetl1FrAUOhkDRXDVU0dIfEHmLgRwVfD7DQnqyKHgQHwRve+V5zd3ntfR6vwNoozDTGXnPMWWGZpWiKVqVmTG4oqNMnyzfCRxA0zHEGYp34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688931; c=relaxed/simple;
	bh=ps29wYiABii6l1raYJPu8jGO+QY9Y08lyWKo6XlwVyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHOPAukRjk600ewArPT+TkMwGC7nnlODqsgZn98Ti8QzebRlXsdt0CziXdhEx4q6iqR7BlNPg7vfgjmPdVQysESJyd8i76tX8FqEb5XGaDpWHdSat+9084V+l/udVc08+zF4So2UqHfTuGQQrsJnboRzshiL8qEwDUdAFgaCa/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQbhMoe3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2rpq2LM; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQbhMoe3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2rpq2LM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6MH5873460
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 13:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=; b=PQbhMoe3PoBcb3Hs
	/DihV9aYD7N2odD9vazHqRjsDv89h5rZHGphaH+tpWhsa7+af5rBKTPuJdW8LPZn
	Mk39Wieqo6Mw60r42dLUd2Gxgi7p8bxjZpLshjrj7AzbL34A0DXvPUZmVUH4NX0g
	MgtJWs+BKx0AJ2Ezx5aSRboaeoiSWTe52rVeK8zpfzJ0RAwKpEqAfSYiOKp5qRRf
	EsdJxs0bExnyDS3qhxtop/v2dbSfVm0i9jaV/APL5yQgCnzY8s/Y1+SDeOsMMPGn
	F/+wgSzwHMID5UrcvHdiCAnKRs1pvv9gBeLt9XKdfGXLhg0wmyfSh8mZwn6Udt4N
	ZKZX0A==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8rgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 13:08:47 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-662f741fe3bso1177558d50.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 06:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783688927; cv=none;
        d=google.com; s=arc-20260327;
        b=ivGUCxIcYBSVI6J6W9YgbLqLXZb2txEXs+W9q90BXLMi6AjR6ELstBZMOz2mNllewX
         TI1f9FE0pjMyNSBjAJC3Gxf+7vlK9i5QT5Q/kLzNo6CQnu4CfH7cd/W1Q2bwAmDoxDAt
         BT7EWCdWyWjCdSFyMQ7OroKDd5k77zYrWhl1+WtgGuZnHlW9t187YSynBOWfnIevcs3i
         8vaDxBckbEMKx/jycOViZwwGuqEM2ZOCH+bY25te3AzQRYNMd9ydrsfU0FzZ8JZD8yyu
         c9pI9HuDV2c06ERG6FBbv7vYdc5m3C23SPYDRwLLk0qpSlmqe7IjuDiO/RntoLq+31+s
         obBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        fh=VMkAonXq3ANpTesoVG2UKQjOdKtfnn6tfgs3VnQd4Sw=;
        b=KQVoutMW4UCjkpaBF0DHGz4HRW+rrVyXxNJO5cUYCMnAhAEPGdiStvRb1LPIYzab2w
         P+KLqU5ywuuRJJyHJ/XO5EmlSNrU3RV7ggQ+DMPYLJxVsif4PGb5c75kal+h/tAY/3gQ
         USeQ3YEmTSQuF17akeiAhHlwU9j9WDxjhDyvbQJ6gByY8shOZubpxLExyFbk5lD7wNTA
         rWz9yGJraznt3AMrPocBdCKpvm3vZEyUa8lxoduqFPgySUyzsJO/C6pKNC9PI2ZxGxtY
         ZPZQ184fa9D5YRpBMhwjnYo7fhsiolqqO1UecAE5yWJwY+yKLpeRMhJYZWG6hreMhXMa
         Zbdg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688927; x=1784293727; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=O2rpq2LMX+eyHpg6+0uDYTLWxjuBcpUXW6luq1tqpwo0xHDJpluYEsivikOhvPy5B0
         gcxVOSGHR7EmCCX48VpzSvCwVwNN1fFNlt258400ODdaWKXWMXq3WnajMa45P01DbvmS
         oexu9pCeH8wqtV2AJ06luqPBsOFEoL2LhxmmNVSmmr8M4CSzfuHdkwJ5B8khvBRlBYBl
         lEof9TghcOSby2U2krgr+SXo5oqk3J07dFdXvRjdmgcOh7VpOLr40oOCNvnmcAfFrjN8
         0ZqX4EPOFpZcS8tqmlfEAbd4jZWbUgubi3ap2sq/A6JZhkadJ8AY1EhZUJEftAX/PFtQ
         0oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688927; x=1784293727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=XDS6anGUcydVfqJbLcnQ4OZkPOlv4p41ypMOWM2vSuKq5b/AJs5jigPaSQ5G1oSD2i
         GtzylWqPhr90j6g34vFHsOn9k9YaICzIWfaec4XahWvV0gSdQcqCOd/rPxZRWhRvhie8
         p1xXSsWamScBrOg2j0cQ0XOrAdpZ1Lbc1ELPwd5dBBqWbrwsTg0iX3Hve42eiJ4drNcV
         F7jwAvfM2OsTD4fODuhlIP8zw1eRwdK42fIg5Qgleu/7I4xlzv5BNKD7Zxpk5Bai6mcT
         XLXDIDE9C4/sApMCz/53pJ0V5Ns9xCAllYUiENqukf58MOEKYFo9mTlhXRz/FBAFkox6
         sDdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8jhR8vJgmphDPNkrQ+NwH5DGI+dfLPaVf1ajiicZd5PpJRdk4e4hedEF8vaarjw7t7d89vVZPDj5zUktI@lists.linux.dev
X-Gm-Message-State: AOJu0YxzgK2t02utQZWc0n+3WRCOeX8HHZ8n4oLNvTvoJ0vOUslWuKIF
	EfjG6YjKO8SDKkDvOpu+/eDwsLTu297yweMDW/Ect3/LjwOsboLmvMUGW1dkEmVw4/HuPqyyOlL
	mPQ7nOg8fkew5gnEH7Qs9QO6LihSW10YQulBHyFu7/4s0RHvqXtuproCzkWBH+2Sf9ZpOvWM/s5
	YOz89jT/lL1c3gyW4Su/EWy1ysxf5P8M26Jw8FZhYG7f8=
X-Gm-Gg: AfdE7ckCYj3zjJ+wYAncO7onxrJkfDPCRV6YYNwb8hc+d8xyyxya1TQx1BGM7IiAkhC
	OfLuSTvhSkr77dhyJhOECmqslYbBEvYE+k+uIiFnR66ODFa/WrwJWPkD2v5H39nOAcRDYZoXEzA
	Up/WWPsWRgroH+clyEqWhO8kgvm6ek16+aw06i5QygJ5nJ70Y5bJGMaOVH9JCWDZEdvYWu
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id 956f58d0204a3-6679f245672mr5946030d50.92.1783688927296;
        Fri, 10 Jul 2026 06:08:47 -0700 (PDT)
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id
 956f58d0204a3-6679f245672mr5945969d50.92.1783688926691; Fri, 10 Jul 2026
 06:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com> <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:08:34 +0200
X-Gm-Features: AVVi8CefhojPUiWasaXCCjZmJBb6K9Qzlv92c3u5BPoEMYadIduP2fyzpl9La3Q
Message-ID: <CAPx+jO-hkYQoEOj1Jrp7sn5HXYTDbfAG4U5rpNBW2Wue2TZxhQ@mail.gmail.com>
Subject: Re: [PATCH 23/42] mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50eee0 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=z_eSG8vRrt57AjWXvbkA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: EA0OPIue9ZuBCy3VpiQKj_9XgFbCMHUV
X-Proofpoint-GUID: EA0OPIue9ZuBCy3VpiQKj_9XgFbCMHUV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX7ZZGRHViBsZw
 6aRbXqNJb6ZfL5GFEAnkfuWWmSt8KVwy1waxcYweNY1UfcIRxbZ4zRzEXHGgzgZna2P3kaL0uno
 nJpJkoiIcRnbBn6DABj2JuakwE3Y8eo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX2PFQvN1uWA4F
 zmg10t7Bcmx0yPsnX7MgM5NRkT05ARqs8eLM73rqyzVJbCrF1EVDVglNSn5aiSwHlb/3xaHodY4
 djFUGOAFkiNDjLDtvHKY+57SGVOyVzqyCtY4qNWOdzoSxnwMa0J0M64qJtsqPZjkEqSUIjmdTY9
 OjtUmYW9cAzj2S1U00dRUz6UTMl72LU5b9pI91CimtOG/Cxrs6uXCkCa78Njix4BUsPBeISU6iT
 TQkVuh13PgxSkMcgou7VxKSeoB3wk2KQtxTWb0YUOtuhmzUSi26P7mq1Z+n0biMmcWevJ9fo05M
 vunp0HdxFLmoe/1nuxmqVfI2teRFbqr0MsAE1s6tnERWhSheUkdWk2I03wlbxa1TDN0rdqjT8V4
 7tPTmlGn7c1g/sGlrNbhYMIL8FfEgCgWJRTpaMh+qSnJ7jxahHe360kuQUT2VNXFFR43vVBrFVU
 haN/2mmwLyA3WLhpj2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100130

On Fri, Jul 3, 2026 at 9:48=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init_by_idx() instead
> of the manual of_reserved_mem_device_init_by_idx()/
> of_reserved_mem_device_release() pair, letting the device resource
> manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-bst.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-=
bst.c
> index f8d3df715e1a..304554ced690 100644
> --- a/drivers/mmc/host/sdhci-of-bst.c
> +++ b/drivers/mmc/host/sdhci-of-bst.c
> @@ -405,7 +405,6 @@ static void sdhci_bst_free_bounce_buffer(struct sdhci=
_host *host)
>                                   host->bounce_buffer, host->bounce_addr)=
;
>                 host->bounce_buffer =3D NULL;
>         }
> -       of_reserved_mem_device_release(mmc_dev(host->mmc));
>  }
>
>  static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
> @@ -417,7 +416,7 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci=
_host *host)
>         /* Fixed SRAM bounce size to 32KB: verified config under 32-bit D=
MA addressing limit */
>         bounce_size =3D SZ_32K;
>
> -       ret =3D of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(=
mmc)->of_node, 0);
> +       ret =3D devm_of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc=
_dev(mmc)->of_node, 0);
>         if (ret) {
>                 dev_err(mmc_dev(mmc), "Failed to initialize reserved memo=
ry\n");
>                 return ret;
> @@ -425,10 +424,8 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhc=
i_host *host)
>
>         host->bounce_buffer =3D dma_alloc_coherent(mmc_dev(mmc), bounce_s=
ize,
>                                                  &host->bounce_addr, GFP_=
KERNEL);
> -       if (!host->bounce_buffer) {
> -               of_reserved_mem_device_release(mmc_dev(mmc));
> +       if (!host->bounce_buffer)
>                 return -ENOMEM;
> -       }
>
>         host->bounce_buffer_size =3D bounce_size;
>
> --
> 2.53.0
>
