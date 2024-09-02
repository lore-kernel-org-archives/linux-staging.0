Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CFB13F43B
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725272938; cv=none; b=d/zZfylwQPX8gEH0yYZCTHJG3aPs5GIvibxrXOIzpAkpn8ULWYpfrTHKNipSG/GrFWe7+4KRJMukEnSCmLqtl4EO+FS+N8zvj4hzeRFuikPTClhnI30GJedXLa6qlO1vC/inz6VR2k+ipgfMyNN7TBhoeMV5gDwwaqxwgRIXGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725272938; c=relaxed/simple;
	bh=/8liyZOyhiUCHo0/9Un5b6c6v2jpsWwfKep752zm9bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJr0n5j7l6fe5K+wwOq5Nl849ZB+jMfk9QGG6+psMABKlqUm5ZPCVpquLYSqqtvJ17gQ61J4xMAB4Ur5h77z54hnMLflwD2Sr2Ly7yj6zMTzSkQvFmeT4LAL/t8b2fB0qvopCwC3SqQdEADqUvIgZ6W0D7xkUPtO/ArZahhVS6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OIVtwlaW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OIVtwlaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725272935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0v+So8N3yAwR3Sc59OWxXeMnjDpGsxHEW6n1U4TTFYE=;
	b=OIVtwlaWaqmYSRKD/5Qz7dBAdA/tPjqE+GGlw+0ZvQelWV5cOsR1pxluIfyQL5R7AkhkXn
	WjvGkOqTLInPU39S65f3ELwrSI4ACa3K6Qfx5rimDRbUdCHdU6HAvLyTv1HzoSK+nwMaj4
	fF68wMwYI61sVyLU1ExQh2S5yM7eqVE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-b830J1wHMh6uPk0jDpRvWA-1; Mon, 02 Sep 2024 06:28:54 -0400
X-MC-Unique: b830J1wHMh6uPk0jDpRvWA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5343808962cso4541482e87.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Sep 2024 03:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272933; x=1725877733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0v+So8N3yAwR3Sc59OWxXeMnjDpGsxHEW6n1U4TTFYE=;
        b=Kne1DI7eN8nlcfwuqo2TJormZbu0fGT1Wq6Sfb5h8YqdSQxknehQs2kVR793E3QCBa
         yLiniuqclveXWftDxXGbkcr42UMPAx7dqthIUdDoVAgLd3llf+Io+MF/bZ8Dm0AwKPYD
         Y6NJy8ebuBNQbwB5VfknzyBwaUGZAfH1uu2g1VT5miSJ+qVavgMwUC6V/zMzEgCPbdBT
         0l3hQKTfoSnZWF52SWsF5op5VZc+T2zGnxlFFytm75BQ1kx2PGwOdWd7yQQPEM6t2LtJ
         8730KMKUfL7tuqRM6rR2t99vwGdRAsmFcrApnOoi3bXQzIFyPNKXyBondNo2jJKfMZiB
         2BoA==
X-Forwarded-Encrypted: i=1; AJvYcCVSpOAPHTYAnrex+u8fCSD0yCM4RqRlkCGGd9WlKYr6RzBRHtXwlOMOn5szHXovcuMECNHRFRUjsJTWu/qf@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5/lOBe1NqwY7j+68UrOm7qJIvckjfrHdbxF86eLg11qsx9s44
	3spKqPg7exPoiAHbW6mzk2OXH9/V0ikLIfxGh2vCz2zJBVAnHYfvwNCUcOyui2xbMdQAGD9IZ6D
	9OwxneaMfps5URbC+O7a7JRPyZDUN5niUFG8raMuO7Z18i/bavbKbRfdcz953FG8=
X-Received: by 2002:a05:6512:398e:b0:52f:154:661b with SMTP id 2adb3069b0e04-53546b19204mr6560951e87.11.1725272932372;
        Mon, 02 Sep 2024 03:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM+TllGK/OcRlnNlcZG086nEzuubW8ZJgkUZoTbwN7tdW2VA3pCptX1PAAr2+HF1Rstw72WQ==
X-Received: by 2002:a05:6512:398e:b0:52f:154:661b with SMTP id 2adb3069b0e04-53546b19204mr6560925e87.11.1725272931780;
        Mon, 02 Sep 2024 03:28:51 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feacbfsm539931866b.27.2024.09.02.03.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:28:51 -0700 (PDT)
Message-ID: <a43eb3d1-bdfc-40f6-b4f5-4de44f18fc0e@redhat.com>
Date: Mon, 2 Sep 2024 12:28:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 1/2] media: atomisp: use clamp() in
 ia_css_eed1_8_encode()
To: Li Zetao <lizetao1@huawei.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 topofeverest8848@gmail.com, hverkuil-cisco@xs4all.nl,
 andriy.shevchenko@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240830011752.603433-1-lizetao1@huawei.com>
 <20240830011752.603433-2-lizetao1@huawei.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240830011752.603433-2-lizetao1@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/30/24 3:17 AM, Li Zetao wrote:
> When it needs to get a value within a certain interval, using clamp()
> makes the code easier to understand than min(max()).
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Thank you for your 2 patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  .../media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> index e4fc90f88e24..55d102b479ac 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> @@ -276,7 +276,7 @@ ia_css_eed1_8_encode(
>  	for (i = 0; i < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); i++) {
>  		min_exp = max(min_exp, from->dew_enhance_seg_exp[i]);
>  	}
> -	to->e_dew_enh_asr = 13 - min(max(min_exp, 0), 13);
> +	to->e_dew_enh_asr = 13 - clamp(min_exp, 0, 13);
>  
>  	to->dedgew_max = from->dedgew_max;
>  }

