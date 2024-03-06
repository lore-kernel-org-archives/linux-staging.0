Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63D130ADD
	for <linux-staging@lists.linux.dev>; Wed,  6 Mar 2024 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735173; cv=none; b=agq82+/n5+29IZoydF3mSm+SgHQlbs/F7BTMGtpTPe2AFYWeWUra3eSX1UT1HQzqNraA8vjUiniFColcVQjFXMuzS52zHf4Zlx5e2I02yTcYCbGGjW0EFTxK7I1NIZ8pqTuw6vRyVVr07Hzof9y9Jrwfn2uVrJW7Se+svvATV0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735173; c=relaxed/simple;
	bh=KrW/CZ/APueN64R2bxzAAsZpXWtmKM6iihQbhPlVSsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbS9v3o9UDb5IYw1fSiCOgJbLDFJPVodEMBhKlpr/Ta1Jrt1BQte6QMyHvQ5eNbIBGii+jFETF+cMZaIggN0or2DYJ+K4PEI3yILh73Yf+Z3e94zptjQBtCBGTX1S5ywyMcALDCHGjLpTq7jAesldyckb7ytOTA51ilwRbUitpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CjVvN+Pw; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CjVvN+Pw"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d2505352e6so93504881fa.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Mar 2024 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735169; x=1710339969; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ILaJ1ndBrtJxnoedpR0nNpThqGu/CpGbTx1REHQje5Q=;
        b=CjVvN+PwZcech26Itaaji+Mp5OGKPgryWei1yPVdrFtDKWTO64/QkvBrcnQtV+Pxjr
         RAFwFlta42XJmN+diZkgy0GAL+TxLdAxr9QCSIdGGf0q4ecMTPo6XfHVx1v/62+E+G+I
         YJTJicPQbBCR8rDiiDy6I6eBk70HxmzJKyQXh/8mquh9Y0TBe+kwJJrUq4l+eLDDOgZW
         21gfQp0MI2r3whQIenOfS2uA622QhBNmo9XHXQIUGwDScLid4zyngQcLdb3/B1KlSPlD
         URohkery+ivv2NcFMDN6VCpyqzX3bB+3Kn9x4C9RN1zdPR7FK1gZdm35CMdnRugAixC3
         YV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735169; x=1710339969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILaJ1ndBrtJxnoedpR0nNpThqGu/CpGbTx1REHQje5Q=;
        b=g6Wn/FB/78Ot5c33AtuHr0I3NGW2ScbyCpmazRqd7I/XHp36zFX/NbTWT6eHkbY1EO
         H+/Nmaefq3utoCzAFF3i+QP5jy0Lv7ZFbYreBM7CtrY7JTsjbDDv0uBKdOd/sTD3kLW0
         gdLBT/BkeV1UoTklS7QFB6TFk7iTef9d878cZcN61ffZ5nDQg0sGBuQ6A0JVmYW16h3k
         masw+gN/oxMnGGIIkEt8znzE/YnB5Ix0KP21/JcwxMgt4apjTZJJF/AtSdzPsZqMH7ki
         cDFFzFI3b6XHkD+MtRbdqDUp1B/H2NDM+8J1+kmvXUieC+BrCtIZiM91g+w9NjI3mVfm
         mohg==
X-Forwarded-Encrypted: i=1; AJvYcCXPuWYgRAouhgKQzhSuRr5RHFyn9bR0vHGDpfCFme+tpRpR8WcVqzwgzeajaj+angH3Obi2uuL6Yzo4nHrwYexvjrddpnQxciHYDFm2pw==
X-Gm-Message-State: AOJu0Yze1K4IlBVcUVO+RBkZCk4vqW9JYdXJmo+zIvWyK4o5XZNJM82P
	JV6dio4buV6v3u/Nq0M8SFocWd9Lnf+lI9p3LyRyz2rBwEM3mzRsOgEbljyO2IbOoaiXKJSPkA0
	V
X-Google-Smtp-Source: AGHT+IFaN3MqR0SWCUrtnsqaYb6hwQk83zKUsyA3y/yhWoXR93flI0IncrRaIiKLVUV6LlSrQuFR0Q==
X-Received: by 2002:ac2:52ac:0:b0:512:98d1:d5e1 with SMTP id r12-20020ac252ac000000b0051298d1d5e1mr3022225lfm.21.1709735169200;
        Wed, 06 Mar 2024 06:26:09 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id m11-20020a05600c4f4b00b00413011933e6sm391818wmq.39.2024.03.06.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 06:26:08 -0800 (PST)
Date: Wed, 6 Mar 2024 17:26:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 5/7] staging: media: starfive: Add ISP raw video device
Message-ID: <c474bd8f-6c23-4536-a915-efbc197a223e@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-6-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306093334.9321-6-changhuang.liang@starfivetech.com>

I wasn't able to get this patch to apply.  I tried applying the patch
mentioned in the cover letter first but it didn't help...  It's not
your fault, but it made reviewing the rest hard so I might have made
some mistakes.

On Wed, Mar 06, 2024 at 01:33:32AM -0800, Changhuang Liang wrote:
> Add raw video device to capture raw data from ISP.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-camss.c  | 19 ++++++
>  .../media/starfive/camss/stf-capture.c        | 58 ++++++++++++++++++-
>  .../staging/media/starfive/camss/stf-video.h  |  1 +
>  3 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
> index 81fc39f20615..90ac8b67c76e 100644
> --- a/drivers/staging/media/starfive/camss/stf-camss.c
> +++ b/drivers/staging/media/starfive/camss/stf-camss.c
> @@ -126,6 +126,7 @@ static int stfcamss_of_parse_ports(struct stfcamss *stfcamss)
>  static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  {
>  	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
> +	struct stf_capture *cap_raw = &stfcamss->captures[STF_CAPTURE_RAW];
>  	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
>  	int ret;
>  
> @@ -150,8 +151,18 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  
>  	cap_yuv->video.source_subdev = &isp_dev->subdev;
>  
> +	ret = media_create_pad_link(&isp_dev->subdev.entity, STF_ISP_PAD_SRC_RAW,
> +				    &cap_raw->video.vdev.entity, 0, 0);
> +	if (ret)
> +		goto err_rm_links0;
> +
> +	cap_raw->video.source_subdev = &isp_dev->subdev;
> +
>  	return ret;
>  
> +err_rm_links0:
> +	media_entity_remove_links(&isp_dev->subdev.entity);

I don't think this line is correct.  I think we only need to
remove &cap_yuv->video.vdev.entity.

> +	media_entity_remove_links(&cap_yuv->video.vdev.entity);
>  err_cap_unregister:
>  	stf_capture_unregister(stfcamss);
>  err_isp_unregister:
> @@ -162,6 +173,14 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  
>  static void stfcamss_unregister_devs(struct stfcamss *stfcamss)
>  {
> +	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
> +	struct stf_capture *cap_raw = &stfcamss->captures[STF_CAPTURE_RAW];
> +	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
> +
> +	media_entity_remove_links(&isp_dev->subdev.entity);

I think this line should be deleted.

> +	media_entity_remove_links(&cap_raw->video.vdev.entity);
> +	media_entity_remove_links(&cap_yuv->video.vdev.entity);

I think this "&cap_yuv" should be submitted by itself as a bugfix patch.

> +
>  	stf_isp_unregister(&stfcamss->isp_dev);
>  	stf_capture_unregister(stfcamss);
>  }

regards,
dan carpenter

