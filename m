Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A82D13C820
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271829; cv=none; b=bE/Wmi6NtwUh2CFJi4YNEOhXfq3QseJ5C4PggTJRtGAZHykpItG5jH0BDBaXhzWlbpAD3UoHv/M6dmbkde7Kro+cMeKB4813S0XbQLlATjUf6PeEiXFJYzDFPOUDIy08a1NJT8Sae5rCUl2EPJGX2SKZKgmhwfYS/YnpyMPd+YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271829; c=relaxed/simple;
	bh=CJfBp+zz9O8U9TodfKkkb1LMYA7hqNM0ZKFm/w+kJw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kn2ORlz5Fco0wAh9kwNAvySrl3D6ZVOaaherBKl8gzeTntNqKYvSeVVgB/+BTHY92jnxrFVogK3ihLYA9mb5c7uY+p16hRDVq0oRE6u8hw20XKIgKbwdVdpVfgrsE4s5dpb4hb9PWexp1uHwD8PZ8xNOJ/3exDo54iQeQwZCr7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DuNOvwJM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DuNOvwJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725271826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbcesK30dFCAjKEHF6Iech8QUJGNsrD1K+Bsbth5WGA=;
	b=DuNOvwJMx9q50nUhZnvGa7Kx6OpXsRmcv8hKW2BQOHZgM5Y+LoMOJkxYp+emDHGNc+0bTn
	IkmaYUVTcabeaRZloBrBCoASOjACfsRfy4yQyx5MCZtHCwAIDfgjz5khQHzNDDp1/pvm1g
	Mrg/DQdHXPsiED58asrRu8CwJofjTYo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-NTGXUtB_OM2F-7N_Clr8Mw-1; Mon, 02 Sep 2024 06:10:25 -0400
X-MC-Unique: NTGXUtB_OM2F-7N_Clr8Mw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-53351fe4bb8so3948913e87.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Sep 2024 03:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271823; x=1725876623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbcesK30dFCAjKEHF6Iech8QUJGNsrD1K+Bsbth5WGA=;
        b=LYg+ipia8bMURzsqj7Pw9x496R7/kg2UReyS9Np3CtM6YpFUsodOB2ZzFDOFkNL0t1
         NtoaXv/8ATMmEVp9X0V9/j5fkXv9AMqrF6lTUDWWWeVTuLgTZe3i5RCeCyUM7eW86F94
         bnFfyyxY0uV+LxZTDK2Pz/pUaqmp33EwvBqZteI/MvswbRJNAU7r3MsFTM3RUqdNer++
         jWH0o7Lr0vgD6D40JVu9YkaGAydS8Xzmx13GsZSoCDNE0rFP2LcbMG4a2pwB7WCB79qH
         WrwWEqJ4tvBx1MLT7ehacEWWKER8kOc/sRj3Eumk3wHlCyjNwLzYJVX8wDMO9o6ZCxSI
         TwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS70Di6J1neUVCpSKhmryQnhY7goat4eAeUQ47YqnAmA06jIcLBnP+dboyRXyd0JSaVt3ll5mdCsTrOS7B@lists.linux.dev
X-Gm-Message-State: AOJu0YzYBuJ0oYMQjfxImZL3bw62nkLsCw2Uh5taLKdKClgnFGHybeK3
	Tqg2eQHxjl5snd5rYnD+JPoi10vFBvCNPR86xnsxGvU4lYSN7RxJ7dlZPLw1y5d3IWa45gQZDO2
	d9OJWELDqDE7SJMIH59wkw8lST5Cam4zDRufj3SsD6dkCvhmOg5EVmOahc+hNYh70tnPcH9LOHw
	==
X-Received: by 2002:a05:6512:1088:b0:533:482f:afbe with SMTP id 2adb3069b0e04-53546b23dfemr6932466e87.24.1725271823247;
        Mon, 02 Sep 2024 03:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKM4RT19+f2nGX8fLMo4BLPojDh8vT2rKLAiyfS6RWsdsrTL0I9CqEd31GLPnQavcUL93/SQ==
X-Received: by 2002:a05:6512:1088:b0:533:482f:afbe with SMTP id 2adb3069b0e04-53546b23dfemr6932433e87.24.1725271822625;
        Mon, 02 Sep 2024 03:10:22 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196a86sm537216166b.127.2024.09.02.03.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:10:22 -0700 (PDT)
Message-ID: <d6724490-1f43-4bbd-a80f-575aa31af47f@redhat.com>
Date: Mon, 2 Sep 2024 12:10:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: Fix trailing statement in
 ia_css_de.host.c
To: Kathara Sasikumar <katharasasikumar007@gmail.com>
Cc: ~lkcamp/patches@lists.sr.ht, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, helen.koike@collabora.com
References: <20240730082725.2524-1-katharasasikumar007@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240730082725.2524-1-katharasasikumar007@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/30/24 10:27 AM, Kathara Sasikumar wrote:
> Fix checkpatch diagostic of Error : Trailing statements should be on the
> next line
> 
> Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
> Hi,  
> 
> This is my first patch for the kernel. 
> Big thanks to Helen Koike for the guidance 
> at her Debconf24 workshop.
> 
> Thank you,
> Kathara
>  .../media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
> index 25e3f0822..e66faeda3 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c
> @@ -47,7 +47,8 @@ ia_css_de_dump(
>      const struct sh_css_isp_de_params *de,
>      unsigned int level)
>  {
> -	if (!de) return;
> +	if (!de)
> +		return;
>  	ia_css_debug_dtrace(level, "Demosaic:\n");
>  	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
>  			    "de_pixelnoise", de->pixelnoise);

