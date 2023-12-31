Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5CA322B
	for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NMpcWZdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EuKW/WiYTJxSI9VLFVMNPYnkyJG0fGJhGRmQq6BzIUI=;
	b=NMpcWZdqIN05g3gmtr6KD8jz5fzD3TD7h3JS0MA6iDGjMxJdg3ZSfx9B4+htZpXnKcCajJ
	EKsndKZyDcw1kggrEDwRsudQDxqqBav+E6ynHtfzw4NYCE6JhRcZlDIW1L7gFaMlmMg6I5
	Io3lYsm0Xa2ONu+xzlDSyAH5mgb1KOo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-e3LKAZDnMaKTrb3Ra2SB3A-1; Sun, 31 Dec 2023 04:44:22 -0500
X-MC-Unique: e3LKAZDnMaKTrb3Ra2SB3A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a27ab879162so107831466b.1
        for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 01:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015861; x=1704620661;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuKW/WiYTJxSI9VLFVMNPYnkyJG0fGJhGRmQq6BzIUI=;
        b=xDnPGuNunVb2Pn0nbCsyhtVOfle9Js4KH7aPy8WuupqU6jba7pe3F+yFL9YG/Y9cZg
         SVVCve/06r7UEDPmljUDszK0kBG6UQXo7Cro/F65PRW4S82b0yPDvgcQLveHX+lG++DB
         rI/H7J8NUCoZLatLUAYRjhXn7oiu7Sj3ZfcEKMbm3+JT0m31bBdwD8m0WZaXfOhyZKNK
         s2HIxaR3vhDQsIf4FUC7HjSjHk4bPz4s7w5z1CrObqFrcg9AS/njHmuqFsEoIoE3ASfl
         3jtjLex51N3eF8HKJA8u9N7WIGm4fPuEfEWSHIO0sP2CiQl7yBmk/vBY0PqMLWam46EW
         O/+Q==
X-Gm-Message-State: AOJu0YxwPBCVFPCZnlglAkG33FIH7+HGVa8Zaz934REdcO6kmanPqKAD
	qTkOmb+lLY87/PxUvdsuIbhA52ih2H2xdOBj2rSZ4Oka/GXWIxPx1s5qVVXrWSVSqoRKVe5tQtX
	FQH0T7MItoJtRJ3kQOV5NukjAnXRllNEuag==
X-Received: by 2002:a17:907:3ac2:b0:a23:5893:1ac8 with SMTP id fi2-20020a1709073ac200b00a2358931ac8mr12276783ejc.27.1704015861771;
        Sun, 31 Dec 2023 01:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/zizKMwsqQrr7Yg28UomwhUJDmAq2ZJO9CDn6qhcdAiFIo1fEqPPVWqvKf+f4ihpRARn9xA==
X-Received: by 2002:a17:907:3ac2:b0:a23:5893:1ac8 with SMTP id fi2-20020a1709073ac200b00a2358931ac8mr12276778ejc.27.1704015861469;
        Sun, 31 Dec 2023 01:44:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906715100b00a26966683e3sm10072345ejj.144.2023.12.31.01.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:44:21 -0800 (PST)
Message-ID: <91b0ae65-eefc-44f7-a801-fbe3ee6073a5@redhat.com>
Date: Sun, 31 Dec 2023 10:44:20 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/base/circbuf/interface: Fix
 spelling mistake in ia_css_circbuf.h
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223061647.78669-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223061647.78669-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 07:16, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in ia_css_circbuf.h as below:
> 
> '''
> ./base/circbuf/interface/ia_css_circbuf.h:76: poistion ==> position
> '''
> This patch fixes this spelling mistake.
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  .../media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
> index 0579deac5535..e9846951f4ed 100644
> --- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
> +++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
> @@ -73,7 +73,7 @@ uint32_t ia_css_circbuf_pop(
>  
>  /**
>   * @brief Extract a value out of the circular buffer.
> - * Get a value at an arbitrary poistion in the circular
> + * Get a value at an arbitrary position in the circular
>   * buffer. The user should call "ia_css_circbuf_is_empty()"
>   * to avoid accessing to an empty buffer.
>   *

