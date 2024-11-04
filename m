Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE68F1B394D
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721582; cv=none; b=ZAeG1/XiGPlYzkoglp7gGEqjwHuX/H3pcawknTLpPMvDjXADs0F48KUQvsQon10lBiSpjmp81VGbQeF9gnVjN9wDQL45V9vnnV+Hq2SYto/q9wE/bQ58Dgg/V5xBnYcbX7hRfTODvCyyNStBw93ozdLl3SFFE6R5zc+iQFH9k8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721582; c=relaxed/simple;
	bh=53Iu2uDYfaupaWmRwwUTmlIp4bzwVBEsCf+cd1xAkdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdGmhOP3pCczpIMP0Nh8vPpynr/gBYhdBXuzM9HVpaAlsvlTGrxe6AKR41izyybMCu2jTTf0yyI1/B3fjqqSgBCtBsQwW2ujjtk7qSBBBeHvJIe34zHR5sv990dKO9M4n2+7pt8ewf16NlWU9hzpaYlup2uVb17hSdLoEiW6jzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dzIFhCcm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dzIFhCcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730721578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNSzqvkieseTSWkYlahMzvlxfJ9ewT1DveWhCWC+ZJg=;
	b=dzIFhCcmUFKm7RYaD7nCtjC5KUiymTDRPn4n1Kf8UbvAZUN4CUxl6hn6XYNnHZoyjVVdkO
	fQP4GQ8iTMVraEiVFxpSifMq6Fg/ZBJ+BUbF/HgfNT5P+SWWVrEuYEaLN9K6c503q9+g39
	HJjG2MRjWdeOUuW1e0PC8EbCu67S8eA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-9oXPQ7ekNkiyRwa7jYeQhw-1; Mon, 04 Nov 2024 06:59:37 -0500
X-MC-Unique: 9oXPQ7ekNkiyRwa7jYeQhw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a2593e9e9so276883666b.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 03:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721576; x=1731326376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNSzqvkieseTSWkYlahMzvlxfJ9ewT1DveWhCWC+ZJg=;
        b=jnWdmih3hyBGXKTOS2A4wMZ/PGDodUXig8Eq59/CxjXHDeXCkGudGtxf9MLZ27bJ3L
         2TgxEuYNtxgltx4ymuOtqkO768VOvzXLvj+nDerr2VZo3Af4pnfRjw2qcefageZtK/E2
         YynmQ6QuzkYMv2jydY0CHxMBuRNjKZSQBik9EOzw6qmn1hmiNXVO/YWgvOFKKOI2ZeAT
         ToNM0sVXk4gCxzHHFFVqdyfF7OsOnA1fJmgmj3lBg6vQqFwBhuBcUTL9E9cNNUVJAEKS
         3SWT2P8Od8NLkj9KYixFtcDuWItohN73Cf595z1Rt7k5jMKYlDyCn983OWnxuY0n6biU
         F6Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWh5xx9IT5qQtkfCptbEvnuNZHNfcaccThHhiVzOlnDtZRztZYWea2XddaQqNWC6epEre/jYjrwa/2Y1Y0N@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc/LNrWYUETfmIkptlHuE198UDIRoHaJ5tJx7kY+k92cimZsse
	IRbl3RgO017T+uu3sBrnmj8I1kMIoZ8pZ5LJ6yWG4AS2JCNnxhXp9Sr2dCZOAVgTG7B5AY8R7AN
	GxWJFdY5isKcWQMlbn6nPSTIVE+k4z66uK7/Gq1D1QnQ5n7fBqR27o186A2P5GGc=
X-Received: by 2002:a17:907:ea8:b0:a99:44d1:5bba with SMTP id a640c23a62f3a-a9e6587e272mr1125367466b.45.1730721576283;
        Mon, 04 Nov 2024 03:59:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQ5mbJ3lBgr63eRoRsJGwy/yyg8Tcgr262LkEesoFSWX7U+7p5ZpKYkK++KbkicraQkIEghg==
X-Received: by 2002:a17:907:ea8:b0:a99:44d1:5bba with SMTP id a640c23a62f3a-a9e6587e272mr1125366066b.45.1730721575764;
        Mon, 04 Nov 2024 03:59:35 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565df949sm544808266b.121.2024.11.04.03.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:59:35 -0800 (PST)
Message-ID: <79fb6cc8-cca2-4e9e-9abf-087587a7056b@redhat.com>
Date: Mon, 4 Nov 2024 12:59:34 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: Fix spelling errors reported by codespell
To: "Everest K.C." <everestkc@everestkc.com.np>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, andy@kernel.org,
 hverkuil-cisco@xs4all.nl, kieran.bingham+renesas@ideasonboard.com,
 benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20240926222351.7116-1-everestkc@everestkc.com.np>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240926222351.7116-1-everestkc@everestkc.com.np>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-Sep-24 12:23 AM, Everest K.C. wrote:
> Fixed spelling errors as follows:
> 	unkonwn ==> unknown
> 	Stablization ==> Stabilization
> 	previouly ==> previously
> 	acknowlede ==> acknowledge
> 
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index d7e8a9871522..1e42a8ca68f5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -43,7 +43,7 @@ static const char *CARD = "ATOM ISP";	/* max size 31 */
>  
>  /*
>   * FIXME: ISP should not know beforehand all CIDs supported by sensor.
> - * Instead, it needs to propagate to sensor unkonwn CIDs.
> + * Instead, it needs to propagate to sensor unknown CIDs.
>   */
>  static struct v4l2_queryctrl ci_v4l2_controls[] = {
>  	{
> @@ -112,7 +112,7 @@ static struct v4l2_queryctrl ci_v4l2_controls[] = {
>  	{
>  		.id = V4L2_CID_ATOMISP_VIDEO_STABLIZATION,
>  		.type = V4L2_CTRL_TYPE_INTEGER,
> -		.name = "Video Stablization",
> +		.name = "Video Stabilization",
>  		.minimum = 0,
>  		.maximum = 1,
>  		.step = 1,
> @@ -678,7 +678,7 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
>  
>  	f->fmt.pix = pipe->pix;
>  
> -	/* If s_fmt was issued, just return whatever is was previouly set */
> +	/* If s_fmt was issued, just return whatever is was previously set */
>  	if (f->fmt.pix.sizeimage)
>  		return 0;
>  
> @@ -1028,7 +1028,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
>  	/*
>  	 * ISP work around, need to reset ISP to allow next stream on to work.
>  	 * Streams have already been destroyed by atomisp_css_stop().
> -	 * Disable PUNIT/ISP acknowlede/handshake - SRSE=3 and then reset.
> +	 * Disable PUNIT/ISP acknowledge/handshake - SRSE=3 and then reset.
>  	 */
>  	pci_write_config_dword(pdev, PCI_I_CONTROL,
>  			       isp->saved_regs.i_control | MRFLD_PCI_I_CONTROL_SRSE_RESET_MASK);

