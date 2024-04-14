Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCA4224CC
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713092778; cv=none; b=J3kuJ8Cx89LDrJ80hrWC7Httvzznmk/fNFb0xJdIwIXJ8x8K/pCXBozkVYEOKcOgCwBm6bBbgpD1S7k7neVk+cODX4GoEf9fjRcHrOS7vq+/M0w8EtnWcS2ko0Qc+nnmcPSwwgddJpKzHy0DSbUwywoa/9q/bSq94vtcGx9Q/YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713092778; c=relaxed/simple;
	bh=hXGLj+vTPVmmKw87ZZeHrmUjgGTQ3G3f5pkSVjaUNOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkyQC4PuZ/3gqHIkegQWJrOblincl26Vbtl4BefT6U2Z9I5poofbduQ2UM8GI16ncySMIwDASFSjIqXjE4pX40ku77gy5cnepppXtrV+tcwvG5i1om9Zfyj57N4kzt34RHK8/tYUZw93LKGWTm0Fy5OxI8/LhCsVav5FsDv/Ggw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=e8MaMBbM; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="e8MaMBbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713092770; x=1713697570; i=wahrenst@gmx.net;
	bh=c6alHlGKkCDCoQnmDV9VRpDeMx6XQ61bRIJ49gPe6Co=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=e8MaMBbMFQnONjjTlN5BsSEs0mur68nfbNHilWgnuA6KdsV44TUF49TQtELjp0kQ
	 8w61G33IFQC4CUnQn5vVThPDACT0MS6MkP5X+n2oqg1nBUwB/qG1+qnPaSIlICDT3
	 P3j8LUwHeuY3E19/QbnuAMbUxpAof+iJ9jte8gPvKST7Cs5NltlAZjhzfhjEZw7Mf
	 3+75SnKy3abdUmw6kKc2SdAyDeSv58t6rhcRfDOQivR0FbpnYax/bann53umlwEiL
	 n9rQ0hlLzFi52q/io8AR4QoHLTzYLK/POZam8y4hwOzpZFkM0BRqu6xUU624u2IbA
	 RYqmj67mU14C6MJH7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mBa-1suLlN4Bn2-0134Yc; Sun, 14
 Apr 2024 13:06:10 +0200
Message-ID: <3069d155-6169-460d-bf21-5355a3485e47@gmx.net>
Date: Sun, 14 Apr 2024 13:06:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] staging: vc04_services: vchiq_mmal: Rename
 service_callback()
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-10-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-10-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ms1l1h4/9tyun18QiV/E/GgbjQ8R41oSiWffCReipQ4UdLNdRQS
 6NC9oStcqrdM7W9ZHAeTsrG6pM/CovLmyM2E/isRV6Gj/hS3yGRZGf1DssqCvfMZeJ9QakE
 99BNzNW2G0aifPL/1Vh6kcGQAYppM2rbAwsWEwRDAyW31O4Ym1CDU6wFMfyvqszXO394WzI
 ZzduzoCkcUnyFDaWsdGEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ywc6j1n5jnk=;XHuxECPEgv15KJW0CO+DkNIgkXq
 Pxfyb5vvDXuRVn5orkkJVndQ3BEAnSpEdf+bVpL/xgBePm+P36BcG431o+p3dAnhp/9AB0edw
 QOVVejD6xxY9vPDSF9GgR4mwxLbdj5UX/v0eJA5IQbxQOqgZXfMmNdsfXwoD+xc/7T93UPj06
 oYkp6BoUN7xcDsnmMsnFGqRhHE29KhDxCm6d2Zynp4uAKDohg1iRSMCsFcY4yFlC76qpaS+fl
 vvoXBbOaaXzQB8KQ8sAl3Nw8MC7oBw1jyKGy9/Z0Kihj6GdJARLACGdVSPTErubEM2L7jxCb0
 vTSz7rgHClFZNIAJfCltFO9j03QGscYXyJGt+4PP4klSLZg97rj1TRUQy8Yzq/zC18wiItrUw
 DNIl25Z85UpNyPrTDWQJJ/b3tKgl5J9caUg+eyC882dy0pCKRbjLLVdGi4B2OSRn8bpdFvKRw
 rflu8g4aCyz6Ve8bEBFoSFEV2SCeuVK+0DIfZDsb4L3SOMNj0aUBqExds0i+SMwWhp+WFNYys
 jgSApOpsjNPnF14PvkhG/3w/VV+dNHPxIVYdmm1FveyVJspIFiYpZEcUT/jLgaLpuGyH31y0I
 GXGllYUZs2u1OEAQ9vmc0YWqZFYYa8/Is599ZrEpTzk36+uRwhzpsPTfstI4DTWPzs/SGxJCj
 1ARrfTZiCChOCW4yfNvmt/x+HefX6MfQ1iCxAdEoB2iQfu1iN2ctiOBaShPTo+nNbyrom9oKA
 2Wf0UtqGE580PwVCMWMcIjMqTHZo7DMg+gHCksPgRaeNx5E8BA6MvIECK25TwLncBgcIgE1IE
 XYJnwsSPjDp032uOsM1GtBSgCw68bm7STSD67kIpYljmc=

Am 12.04.24 um 09:57 schrieb Umang Jain:
> Rename the service_callback static function to mmal_service_callback()
> since the function signature conflicts with:
>
> extern int
> service_callback(struct vchiq_instance *vchiq_instance, enum vchiq_reaso=
n reason,
>                   struct vchiq_header *header, unsigned int handle, void=
 *bulk_userdata);
>
> in vc04_services/interface/vchiq_arm/vchiq_arm.h
>
> In a subsequent patch, we will include vchiq_arm.h header to
> mmal-vchiq.c, which will then complain of this conflict. Hence,
> this patch is meant to handle the conflict beforehand.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>
Thanks for addressing the conflict which was introduced by c405028f471d
("staging: vchiq: Move certain declarations to vchiq_arm.h")

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
