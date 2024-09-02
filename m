Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162D514A092
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271850; cv=none; b=YA4uwtZUyJ8t1I6jjuo/naBPwCUabgPoEni/8OpVqL2bDwo3FwTTwTwa5yKOKu6DYgl4fJYczn+93Rsrjycd+Bfgp8guqSBne8IMyamyKr40jPTAr4MK86WaT2M7YXwIDSGsREQaFxtPW8sjmIiQexqCTsu3i48w6kM6dRFQIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271850; c=relaxed/simple;
	bh=vjEG4yTZwz2x2AHPoS0jcARdsLxSSxZ+JUhFPRRJUIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPVfq2XN8pT+cOzPGgb2TkmEvMpHL1DJVs8l8p1WE08/tNAJ2I6tJP0TdoJTssR0LxVVrCTew//lmHww6viOZbRtdLtC3mcuGkhN0DyrNYYppTtFOVCDYQPx0yOLjkWtrcmyGOwwrSBnUURVW2zba5UjlbZr7WcqyvWKcKYGASk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fe8m+bT3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fe8m+bT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725271848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H9RKF9H7s72V4OZfPOTUgjyYaIyw8mcKokBoElqIGAw=;
	b=fe8m+bT30rJT2I+27TytAmsJikIu37VrTtKkCqktbt9HF1GW9V8mg26qUxdSVbbDzEoFGG
	QGScUB3K9OwvBa5kNrs90dQfDfIbURxW4KsvRAEjTYZMvpk3S5lcybHnI81aMJDf1Jh+nr
	vvfHkjZHraMn0gR9NDz7qNC3VkdGFCM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-IsN4j9Z7M4eO3AxkT7uGKA-1; Mon, 02 Sep 2024 06:10:46 -0400
X-MC-Unique: IsN4j9Z7M4eO3AxkT7uGKA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-534398200ffso4881559e87.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Sep 2024 03:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271845; x=1725876645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9RKF9H7s72V4OZfPOTUgjyYaIyw8mcKokBoElqIGAw=;
        b=WgwWDKmpB5HfTWhtY+Q5GZQZsEFJbZ3Ize6+6UfwmRWbzOdlL1l7D+gx9TR0tLXHS8
         gh0DOWN02a1uV6c/8wxxKadXQoemvoIGz/JtfF/vyT2kRVsc7HhZEg2pJndgg1Kd5wYK
         1DWY27oidwmfHmAhdezaf4zbTUPxEnSSSKXu6TVczV2HL1peP64j755/2ny076M4Twc7
         Mw5yt62iPuJ3YQwg6w/c6SDhCZ2nkLGTzPH3R/iYuS7Nmi36Qis0ln52t5ab/AOdg4zo
         k7CD0/lbdzzC7lh1wzUPfhzeVyImS6o+rw86eGE+iWc4gWFOpLHjHkJoQOObz+KNZInA
         vn0A==
X-Forwarded-Encrypted: i=1; AJvYcCURtDqCik336SAexHGNgetMryfgeG2Z45nXVWI7D9f0rc0bdmqThwQUHy5ZXF3pAhhRwBAyguE74raMOQ0X@lists.linux.dev
X-Gm-Message-State: AOJu0YwbnqTs9e3qS9xgbK3TcDLhUhxE17rC7/8ttilsRmRP4+Y19tER
	Recfv5z8Pwtluzqtwr590GitISYPOGMrYAQCuqCj53tL5HUuFNJTFjmi/kMHHKkShTZN562qPOF
	4BiHoV5Q8cTdczA1p9uIeOL8kFQ1dQWShpUVJHNDzon8qh4G4nf0ZsZeRdiPqVXc=
X-Received: by 2002:a05:6512:b15:b0:52e:976a:b34b with SMTP id 2adb3069b0e04-53546b33aadmr8012006e87.15.1725271845225;
        Mon, 02 Sep 2024 03:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYItbefjD4lhCqtpm3GS4ZxCJzNfGCn2KlBrohSSQm0qTa4hwnKBwDrS5pTLOuniFpdKxW/Q==
X-Received: by 2002:a05:6512:b15:b0:52e:976a:b34b with SMTP id 2adb3069b0e04-53546b33aadmr8011985e87.15.1725271844799;
        Mon, 02 Sep 2024 03:10:44 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb410sm540035566b.21.2024.09.02.03.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:10:44 -0700 (PDT)
Message-ID: <389b81a7-a7be-48c0-adc0-40d313a38c5d@redhat.com>
Date: Mon, 2 Sep 2024 12:10:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: move trailing statement to next line.
To: Sakirnth Nagarasa <sakirnth@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com
References: <sakirnth@gmail.com> <20240730084220.38204-1-sakirnth@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240730084220.38204-1-sakirnth@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/30/24 10:42 AM, Sakirnth Nagarasa wrote:
> Fix checkpath error "ERROR: trailing statements should be on next line"
> in ia_css_fpn.host.c:46.
> 
> Signed-off-by: Sakirnth Nagarasa <sakirnth@gmail.com>


Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
> 
> Hello, this is my first patch to the kernel.
> ---
>  .../atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c      | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
> index 57b5e11e1..8ccfa99c6 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
> @@ -43,7 +43,8 @@ ia_css_fpn_dump(
>      const struct sh_css_isp_fpn_params *fpn,
>      unsigned int level)
>  {
> -	if (!fpn) return;
> +	if (!fpn)
> +		return;
>  	ia_css_debug_dtrace(level, "Fixed Pattern Noise Reduction:\n");
>  	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
>  			    "fpn_shift", fpn->shift);

