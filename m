Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D23B1DDFA
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708353614; cv=none; b=O3+lf9uZpPwgz0iAu2ZHKM/r8I8OZSOJQWGP55BQXchtzgOR5qogbceRdATTM/KiwmuIpMV6kCblAMAZrxYAii0umei80UY4Cp8iaRD0UmdS2baj8lOKowA+uD8IQIiXehacF9a2S+tmubGgk3/Svx5XQGdGb8P0iCKTZIZ2L20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708353614; c=relaxed/simple;
	bh=c0dJsyBwcHuvLiGGgERSuLn+RoZcLttcnBEYQqdHVD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VT7qkL80hY8vTvbJ5h16ceFNuSkWVrXw0JwLV2xaVT9TQj86q7oJRGHsj4maIb5DL0leedwMw1p2D6rYnnOmt8EPj5R5/t2l11RnCXLNFj26R/SjtZRpyKar5ZbkGeystGgCh5EKLE0bL/rj9suleCY83QvA2AZ37PH5Hcxcu2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RzCXgX+4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RzCXgX+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708353611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVkatn/OQ7E91SGBo3Ophlv8x9VJieUAAbT6nXbzjT8=;
	b=RzCXgX+47lewCvbo6w/eexwQD6EIxv3NvqCP9uc0raB7Im2TFihWrM9MmrwYmS8bqJKzA5
	lQO+8s1IVhTBiJlXbzYGk0S/+gyKcZ7gt21wSSsXopNCRZM34BQEUWxRdWZ+Ne0AUZTjSo
	SxPCQlztciVb3SOW5wnOoZW4PFlqgh8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-4FNU17X6PEO3PM2-m0T8Vg-1; Mon, 19 Feb 2024 09:40:10 -0500
X-MC-Unique: 4FNU17X6PEO3PM2-m0T8Vg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-564347c68b9so846798a12.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 06:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353609; x=1708958409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVkatn/OQ7E91SGBo3Ophlv8x9VJieUAAbT6nXbzjT8=;
        b=oPSDOf8Jy/HKlyxqJws7F/BBAWpduNcjE1mGNr1ZoK64X1MKLZ3ruO0YfywXs64A+q
         XzWW6YtCogl0EcOR3WWxw8XR8iV2khg71GfMYbcU5Yhqx33O+o5YqWb8MOjWt1OUaBpm
         yqFvreGkRju3Id5vl9UXrstWAPx1ZC3NdyZX+1bo3jE6y6TwWKgELzCD87zaVbTYCrxb
         ik5F0pP7GDZv9CuGwCm1FF0Ec/Sc73eJNY/nFxw/vq1dKEDyfu/JvbWoa9ORYQETSMhs
         F8IoGS9xVcFpMKrpeIYFlYoCj14Z3WWUDQuz1GgCuM1ivRKrAfrIxeQmj8ZKRVJO2nqq
         1aAw==
X-Forwarded-Encrypted: i=1; AJvYcCURMPEuEeiteK0bGRTZceFRV4K2hkQ2Qey7Fgo48tGdcIk67Y3WydpNcn58SyqsqwJGTrphharmgo3v9+k1dzf+S9sT/GyeyQyGDS/G9A==
X-Gm-Message-State: AOJu0YxrjqZW6rBajplQBCIZnnOAjioArGg9AjPROmlVFnu/66q/I2Vz
	N64xdYIKkywk//ohdOxbAN0tM+9yJy1QqUleRnEc02zjdt5qPvJRruSw56AAIh+H5LJb0XR5U87
	0uId56qcZQ+TXMNXRog5Lv162prE/UGxcxA4t9NxofkPIB7ikxzjT01hdiC0Sg4Q=
X-Received: by 2002:a05:6402:1a50:b0:564:8adf:9a7f with SMTP id bf16-20020a0564021a5000b005648adf9a7fmr1350208edb.17.1708353609025;
        Mon, 19 Feb 2024 06:40:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFonjtZ9ZNXPUOxp1t4AJBzSusJ0qly5l3swuhtwSLD7kQlVLaL4nj3GKd6uQLrNkpG+blVkg==
X-Received: by 2002:a05:6402:1a50:b0:564:8adf:9a7f with SMTP id bf16-20020a0564021a5000b005648adf9a7fmr1350185edb.17.1708353608737;
        Mon, 19 Feb 2024 06:40:08 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q25-20020aa7da99000000b005645ee828a1sm1462993eds.94.2024.02.19.06.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 06:40:08 -0800 (PST)
Message-ID: <007655fb-d56a-4d6e-a19f-46e418f0a4e5@redhat.com>
Date: Mon, 19 Feb 2024 15:40:07 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] media: atomisp: ssh_css: Fix a null-pointer
 dereference in load_video_binaries
To: Zhipeng Lu <alexious@zju.edu.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Hsuan
 <hpa@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Brent Pappas <bpappas@pappasbrent.com>, Alan Cox <alan@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240118151303.3828292-1-alexious@zju.edu.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240118151303.3828292-1-alexious@zju.edu.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/18/24 16:13, Zhipeng Lu wrote:
> The allocation failure of mycs->yuv_scaler_binary in load_video_binaries
> is followed with a dereference of mycs->yuv_scaler_binary after the
> following call chain:
> 
> sh_css_pipe_load_binaries
>   |-> load_video_binaries (mycs->yuv_scaler_binary == NULL)
>   |
>   |-> sh_css_pipe_unload_binaries
>         |-> unload_video_binaries
> 
> In unload_video_binaries, it calls to ia_css_binary_unload with argument
> &pipe->pipe_settings.video.yuv_scaler_binary[i], which refers to the
> same memory slot as mycs->yuv_scaler_binary. Thus, a null-pointer
> dereference is triggered.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
> Changelog:
> 
> v2: change fix approach to set mycs->num_yuv_scaler = 0 in
> load_video_binaries. Change the fix tag to correct commit.

Thank you for you patch.

I have applied this patch to my media-atomip branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

and I will include this in my next media-atomisp
pull-request to Mauro.

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index f35c90809414..638f08b3f21b 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -4719,6 +4719,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
>  						  sizeof(struct ia_css_binary),
>  						  GFP_KERNEL);
>  		if (!mycs->yuv_scaler_binary) {
> +			mycs->num_yuv_scaler = 0;
>  			err = -ENOMEM;
>  			return err;
>  		}

