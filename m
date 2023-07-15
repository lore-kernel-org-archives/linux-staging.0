Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6870115CD
	for <linux-staging@lists.linux.dev>; Sat, 15 Jul 2023 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689415702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDYMyausyBRVukaFcfLlmDiXe2Aa3T9aabszsv5mhl8=;
	b=FRjvoV9V+xKxR7U3uHmiCcO78zNdo4iIXmo8GwsLcApyOIdr6QTQvPfjv3MVO+GmX1zB6E
	vHI28/bZfDWR+nnliis3O+7iMEKphP1Up/rzgOg8FfgcDSAWHyJZr/Pr1rdWPtEhWUVdSm
	bGI5OcnRVgeT2EaAGy6H4gdNaVHwcP4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-AqKn-5GmNt6A1CnoQrUouw-1; Sat, 15 Jul 2023 06:08:20 -0400
X-MC-Unique: AqKn-5GmNt6A1CnoQrUouw-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2b6ad88815eso25578731fa.3
        for <linux-staging@lists.linux.dev>; Sat, 15 Jul 2023 03:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689415699; x=1692007699;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDYMyausyBRVukaFcfLlmDiXe2Aa3T9aabszsv5mhl8=;
        b=EsLm4CAoUXM0vSv+LuUezbLpe50KESpIv8f4M7JBKqoQaNwGmMcxxzlR3k3eF3waJF
         Kn8JVaAh7llDU47tI2a4Vp+D98da1hUfGRvmWW2ECyx1Cc2i8UnU9U8JJsZ0YdNLDkER
         LnFM52G5JHgcv8b/ZdKlQiR1bkzT08+SR7IZNwzOvVlDJytgl2Zoe1/thtXcdLHOY3rE
         djy0E8ImE2hF0tzlJ4/c3C+eb+Q9rxQc36DnIK7tNceHJEZXpxAXscSUp0D3GT1IZyKw
         WBlY723ROy9mUVuUXz0qmiS9zJuBZGkDomXxKDemQGeB525CjtT9BUsUw1R2XMCAnBNF
         f3KQ==
X-Gm-Message-State: ABy/qLa8P1jloXiCjOOZyAmvqsdHO0dYUPw3mS85H6BhPvSs0DNwTGk4
	m7JCpLqjVKL8WwWnkr/URnzyb/FBL3BCY/9NX/+7ZEbMJG5wAwmZ5Tiya/gx+/YJ28Vo8xJMj1A
	W8j+mOLdZOUPqeOS5ilwbSb2Rhg==
X-Received: by 2002:a05:6512:3a89:b0:4fb:89e2:fc27 with SMTP id q9-20020a0565123a8900b004fb89e2fc27mr6783683lfu.54.1689415699385;
        Sat, 15 Jul 2023 03:08:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHmfFqbm32VY6oSbf7Qb4Ms1HIONcW/t++tSXC1I4v+3L7FKWClmLykXdiZ6tFd65N+4kU/3g==
X-Received: by 2002:a05:6512:3a89:b0:4fb:89e2:fc27 with SMTP id q9-20020a0565123a8900b004fb89e2fc27mr6783677lfu.54.1689415699042;
        Sat, 15 Jul 2023 03:08:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id by26-20020a0564021b1a00b0050488d1d376sm6971311edb.0.2023.07.15.03.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 03:08:18 -0700 (PDT)
Message-ID: <0389f874-b52d-d947-44fc-3f43f48b79bd@redhat.com>
Date: Sat, 15 Jul 2023 12:08:17 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/11] #if defined(ISP2401) removal to make driver generic
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230713100231.308923-1-hpa@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/13/23 12:02, Kate Hsuan wrote:
> This patch set is to remove #if defined(ISP2401) to make the driver
> generic. We focused on removing the #if defined(ISP2401) in isys and
> necessary files related to it.
> 
> The changes include:
> 1. Removed #if defined(ISP2401) in isys and related directories.
> 2. Removed the debug codes for dumping status.
> 3. Made two individual enum to define the MIPI format for both types of
>    atomisp.
> 4. The input system code should include both input system (ISP2400 and
>    ISP2401) headers since a generic driver should cover all types
>    of devcices.
> 5. The initialization codes of the input system was modified to initiate
>    atomisp input system in a generic manner.
> 
> 
> Kate Hsuan (11):
>   media: atomisp: ia_css_debug: Removed debug codes for dumping status
>   media: atomisp: Make two individual enum to define the MIPI format
>   media: atomisp: Included both input system headers
>   media: atomisp: css_2401_system: Remove #ifdef ISP2401 to make the
>     driver generic
>   media: atomisp: isys: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: hive_isp_css_common: Removed #if defined(ISP2401) to
>     make driver generic
>   media: atomisp: pipeline: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: ifmtr: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: Compile the object codes for a generic driver
>   media: atomisp: rx: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: isys_init: Initiate atomisp in a generic manner

Thanks, I've merged this into my media-atomisp branch now:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Please base any further patches on top of this branch.

Regards,

Hans


