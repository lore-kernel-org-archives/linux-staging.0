Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401798F7D
	for <linux-staging@lists.linux.dev>; Thu,  2 Feb 2023 21:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675373685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eW5nnN/Ib32jdUWa/RWBvIQi/iNU6+BNj/uI00opUo8=;
	b=XwJ1IuLaUNovUuKKauNCH3bGfBNMT9XFaZ87jJUrmWplhB8wrR2jY+2p3nMxp4Hh19K71L
	iHggtyexIrgBghGUIKXVSRApEP+jzCPFhcJVXsrmUn/hjeuXKiSE0enKW8zTtEmpGXbq5l
	vwktJVK+oEjDbGW13ObGpEagCTi4YPo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-41-pdVUELImMOmHj0Nhva46dQ-1; Thu, 02 Feb 2023 16:34:43 -0500
X-MC-Unique: pdVUELImMOmHj0Nhva46dQ-1
Received: by mail-ed1-f72.google.com with SMTP id c12-20020a05640227cc00b0049e2c079aabso2264821ede.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Feb 2023 13:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eW5nnN/Ib32jdUWa/RWBvIQi/iNU6+BNj/uI00opUo8=;
        b=Z4zhBp/txpu26PowyDIk/Dpu4mWpXQBAYMsDQfu33eq5wDaBNbBwVoUUyq4FnfEK+a
         k7WDntqhlCQJB7XOH4CCIEvAbuDTp7EwSP+eVU+RPwVnGQayYbuUqzpYwUnEsWw7B4nr
         mcqQifLSpClUD0jzBMTy6ENxcTDN3Wy2J9Tfp3r+HsMBws35wx4l+YDIwzEpaPlJbZ6g
         MWmJ9EeCXHYL11mnDufsL6V+Nnyo7jJS23dvHB6JPumuNwWbVYDNDY6fJ0Q75bb0l1nh
         UNANwEyEMaTev4EgdmpeDVerANZk8hGuNziQd4qN9x7R7tHZSu+5jeYSHSNcXCtar2j/
         j9LQ==
X-Gm-Message-State: AO0yUKVR9SbhsPYbZebVlLXfYxt1KCAoHFBRu6rUvUR13u3FMUsdkiff
	a3t9lFh/+IngIvgGvkYY/Rl1XvQQ3ztAFjqblJD+uIdFlyVDJoqq0GfgxWS+DWSFJL3wQ5U6gsX
	X84EO800UaqWVUJ+MO0d3cZSRtw==
X-Received: by 2002:a17:907:7211:b0:88d:ba89:184f with SMTP id dr17-20020a170907721100b0088dba89184fmr3931594ejc.32.1675373682501;
        Thu, 02 Feb 2023 13:34:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/MueIrH2ulLtKu+jzCEAXRz6gYQ9ydSfs2I9fl85KH/t4CrjinYYkdksZb8pqi5m1jIbJsvw==
X-Received: by 2002:a17:907:7211:b0:88d:ba89:184f with SMTP id dr17-20020a170907721100b0088dba89184fmr3931584ejc.32.1675373682314;
        Thu, 02 Feb 2023 13:34:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z25-20020a1709064e1900b0088550a1ce6esm324922eju.222.2023.02.02.13.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 13:34:41 -0800 (PST)
Message-ID: <2b11d9f4-f32b-7214-3181-a49a8d190f0a@redhat.com>
Date: Thu, 2 Feb 2023 22:34:41 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: atomisp: add I2C dependency
To: Arnd Bergmann <arnd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230202210312.544277-1-arnd@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230202210312.544277-1-arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 2/2/23 22:02, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without CONFIG_I2C, atomisp fails to build because of a missing
> function declaration:
> 
> drivers/staging/media/atomisp/pci/atomisp_v4l2.c: In function 'atomisp_subdev_probe':
> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:960:21: error: implicit declaration of function 'i2c_get_adapter'; did you mean 'i2c_get_adapdata'? [-Werror=implicit-function-declaration]
>   960 |                     i2c_get_adapter(subdevs->v4l2_subdev.i2c_adapter_id);
>       |                     ^~~~~~~~~~~~~~~
>       |                     i2c_get_adapdata
> 
> Ideally the driver should just move away from calling i2c_get_adapter
> as explained in a comment near the call. For now, just use a Kconfig
> dependency. Apparently configurations with I2C disabled are rare in
> practice as well as in randconfig builds because a lot of other
> drivers 'select' the subsystem.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Actually the i2c_get_adapter() call is gone in the atomisp pull-req
which I send to Mauro for 6.3, it is removed by this patch.

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=media-atomisp-6.3-1&id=4f205ce7a915ffa4ae0fb24f48714604d39baa29

So adding the I2C dependency is no longer necessary.

Regards,

Hans






> ---
>  drivers/staging/media/atomisp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
> index c9bff98e5309..8b0de0b5b4a3 100644
> --- a/drivers/staging/media/atomisp/Kconfig
> +++ b/drivers/staging/media/atomisp/Kconfig
> @@ -13,6 +13,7 @@ config VIDEO_ATOMISP
>  	tristate "Intel Atom Image Signal Processor Driver"
>  	depends on VIDEO_DEV && INTEL_ATOMISP
>  	depends on PMIC_OPREGION
> +	depends on I2C
>  	select IOSF_MBI
>  	select VIDEOBUF2_VMALLOC
>  	select VIDEO_V4L2_SUBDEV_API

