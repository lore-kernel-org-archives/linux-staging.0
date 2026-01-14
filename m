Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C9537B3EC
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388258; cv=none; b=Ca+cWByRvczwm9tuOvBYqAAbXwiyfAVVQP7WBUTikxSWeDaGRjCaxmPIPKvW99NwQ03dXcolOIq90oqsZqASrxK1HfXbf6+NwPKU7KkWbs7jTy5yL0Q+R5Q0xl67Y57tAcncLS/kojySTkgWtn7mJuqXTFcBMYaStArPqCExlFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388258; c=relaxed/simple;
	bh=I5Plk1FMUGESgoF5wkge8tbwfBYSAOLMmmhOz8PV7u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go0H0OJXEndexoWIy7ZTHDUbjk6gwx+jIYYOvGw5IESUjkuCsa3bRx3qnw64aGJREVKwOkaPksTS8R6grQhOMeXBWkT96S3jLowKXX6Q7UekhNbwsDDTqNEQMv4p8G+AaFeiFjKnG7wFHIToEZZXZJTc//WaNjK6OAwYy9cLsEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TpotpIae; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TpotpIae"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60DJtH4e005181;
	Wed, 14 Jan 2026 10:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=z7b4jg+8oepQynL150zs8SyXqCt1dI
	zVJYr4OVcRK8M=; b=TpotpIaeQkJmnNi6mDE4z4bRWj+weIdvjbw2VUxc2eRQm5
	+5dgYeXgmaIs+QbrX8WLMQFO5BEqftFGp2NiTJw0w3SaYuB7E+nXuqcu4b7p6/Ow
	fb/9kJtYlbAsSOkVN67oAe3VUIWvc4JY1ag9ShY+oKCxPcjEQLV/YCgZiDwNjY8U
	9OTOkpcFf2DHnVJfFNnoO8MRv1BgGkkkakiF3vFDs80N2jt96rZ/0Rmh0g8OhjHp
	HO/NPFbgkxYHWN5Th/zoi5pgyhjW5RCMTCOHv0HMHVUcfER1y+Ho9JsoeCZwf5Yv
	e6EeUCKMtIgE76jUpM3n0XA6h8Waw8YcLXSuIJ3Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkedt0j94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 10:53:30 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60EArTn5010451;
	Wed, 14 Jan 2026 10:53:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkedt0j93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 10:53:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60E7XdRZ029743;
	Wed, 14 Jan 2026 10:53:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3ajsd1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 10:53:28 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60EArRVV28115612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 10:53:27 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5795220043;
	Wed, 14 Jan 2026 10:53:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18EDC20040;
	Wed, 14 Jan 2026 10:53:25 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.39.18.1])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 14 Jan 2026 10:53:24 +0000 (GMT)
Date: Wed, 14 Jan 2026 16:23:22 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: Diksha Kumari <dikshakdevgan@gmail.com>
Cc: gregkh@linuxfoundation.org, johannes.berg@intel.com,
        straube.linux@gmail.com, knavaneeth786@gmail.com,
        dan.carpenter@linaro.org, quic_rdevanat@quicinc.com,
        arend.vanspriel@broadcom.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH] rtl8723bs: fix memory leak on failure path
Message-ID: <aWd1NdzG6flAz-dq@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260113091712.7071-1-dikshakdevgan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113091712.7071-1-dikshakdevgan@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4OSBTYWx0ZWRfX7CD8mY6p7C8H
 SPF6Nb++eOf1fEBiV7Wzopl7vgMesG82KxCL/nMx3JUDX7xk0M2D9jQmPWNCroOJn+Luuw5WgRK
 b7OU+oZ7CvnQ6QooxiumKBEdA/4wpTqCVSBUNW2CpwNLGu8nTgJCIW26ZcxrPdxXnapI6nRdRIi
 Cd48n2KHBVv6NhpWaKF6feisR17uPui9fJHJ0jUMnObeVbJQArXBEoYMPHYr4vy+4cGXDdK1hCE
 1VZ1bptINmzD3TdnUpm/7RFi/XzdLnlntVQgn1P2ORJaVbvbtx7y3OilrqKIebo6bueeXYSlzAA
 q13n3cfSMolUwo3OwHJ6WcEeYXSsw8Yy8nXlf8GzLUvbaHrrcx8Fjqf4UXkghIzUem7rfTCqFnQ
 aPo4d2+Io4O/2GKbFVHMKBO6eZ1UP06EN4uBEb4Vj0HZasN4msg2yXJFenGtawslU8w/rDt24yc
 QaCipnqqADVqsc6ULIA==
X-Proofpoint-GUID: GgFF4cC3AMuGZac9aAQDD3CrYoXl7F7t
X-Authority-Analysis: v=2.4 cv=WLJyn3sR c=1 sm=1 tr=0 ts=696775aa cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=9Raln35GI-EShSfvYkUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: EXazcgTyw9-siW56yeSm_IiiH44smdj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601140089

On Tue, Jan 13, 2026 at 02:47:12PM +0530, Diksha Kumari wrote:
> cfg80211_inform_bss_frame() may return NULL on failure. In that case,
> the allocated buffer 'buf' is not freed and the function returns early,
> leading to potential memory leak.
> Fix this by ensuring that 'buf' is freed on both success and failure paths.
> 
> Signed-off-by: Diksha Kumari <dikshakdevgan@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 60edeae1cffe..476ab055e53e 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -315,9 +315,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
>  					len, notify_signal, GFP_ATOMIC);
>  
>  	if (unlikely(!bss))
> -		goto exit;
> +		goto free_buf;
>  
>  	cfg80211_put_bss(wiphy, bss);
> +free_buf:
>  	kfree(buf);
>  
>  exit:
> -- 
> 2.34.1
> 
LGTM

Reviewed-by: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
