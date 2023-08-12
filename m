Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025541868
	for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 11:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691838132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUQODfZCQSly3skRl2EdqxgNTUVNaeM4NYBujWjSHHY=;
	b=dXvvNAtevWCkA2GzljnvSizEFjUd7PnY5R8cm2d5mQmyLzl3qIHnJtZSAnOkDcHbqcEuIp
	kmySzRXa6KFNic0i9+0TRI/w+Xh10ke4cBHK207TTkYAl750xP056CUGTSzhtRXZ6QAMWs
	zhpXDDYMW+dgrw4AjMRuhCJHvBbnZNg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-8D1s1QvMPe6dCWpSwkabiw-1; Sat, 12 Aug 2023 07:02:11 -0400
X-MC-Unique: 8D1s1QvMPe6dCWpSwkabiw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ba0f144938so29793101fa.3
        for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 04:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691838114; x=1692442914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUQODfZCQSly3skRl2EdqxgNTUVNaeM4NYBujWjSHHY=;
        b=bfNVYrjs/z1liBp5EVD00RXmgvzmpPQQduT4mPaZsEZYrj50nSy1UrI2VqxBYBfwQX
         BNLsvRJYL1jYlhhMrsrltv0nQMKuC9XLZU9yGE8vpidDmLkPGEd+SDp2+wGD3S190Sm4
         jD6eXkYVO3KIFBu8SYXVQpbsfuzOsssVEChvQku8rJ5xy+Z0KMSCbaJAlgqgqAUjtVyF
         P3BH41l9RsCmkKHONuDR/G1dzcLsdgafR4HitPVziQneZ90NQyscOl3Tbn/VhLEDMQqm
         kGwLYNA3m1Z7UYJLXDcJSYfI6ANJfaIa0xZOGu3DkNkxkk8scOqGJcZFpGKj7QAk2iZe
         W5FA==
X-Gm-Message-State: AOJu0YyCSTPnfKV8mf5JnqiJ6mJ4UgL0eO0KWpH79GIpwhkNACQCzf+K
	aDaHeGRHkAdT37BAwzxPH8lZWeWcQdtTvUMGZ/Nt6RN84rCXKvNzYHUHUENV8pXBgwDvRiUr/FE
	18DASEISAvYxGkOcT8oPLlSJ5Gg==
X-Received: by 2002:a2e:6a10:0:b0:2b6:e361:4b3c with SMTP id f16-20020a2e6a10000000b002b6e3614b3cmr3340990ljc.14.1691838114319;
        Sat, 12 Aug 2023 04:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVkmLxJ4rN4icCeOX6whnRxHTUgwxoqhAMuMSHLlrs8YdydySDT+7hEsYkmxBnP8IpH5ltPg==
X-Received: by 2002:a2e:6a10:0:b0:2b6:e361:4b3c with SMTP id f16-20020a2e6a10000000b002b6e3614b3cmr3340972ljc.14.1691838114002;
        Sat, 12 Aug 2023 04:01:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id si28-20020a170906cedc00b00988dbbd1f7esm3315334ejb.213.2023.08.12.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 04:01:53 -0700 (PDT)
Message-ID: <f332c309-795e-195b-9b77-1e2902938cec@redhat.com>
Date: Sat, 12 Aug 2023 13:01:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: atomisp: csi2-bridge: check for negative port
 values
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <8bc2ab0f-88ac-42f1-876b-147da525b1eb@moroto.mountain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8bc2ab0f-88ac-42f1-876b-147da525b1eb@moroto.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 8/5/23 08:53, Dan Carpenter wrote:
> The atomisp_csi2_get_port() function reads an integer value from the
> firmware.  We check for invalid positive values but we should also
> check for negatives.
> 
> Fixes: 8d28ec7e9145 ("media: atomisp: Add support for v4l2-async sensor registration")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 46d9f31986c9..0f0ec5d7e49d 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -626,7 +626,7 @@ static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_config *
>  			goto err_put_adev;
>  
>  		sensor->port = atomisp_csi2_get_port(adev, clock_num);
> -		if (sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
> +		if (sensor->port < 0 || sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
>  			acpi_handle_err(adev->handle, "Invalid port: %d\n", sensor->port);
>  			ret = -EINVAL;
>  			goto err_put_adev;

Thank you for the fix, this code has been refactored in -next and now it uses sensor->link rather then sensor->port with sensor now being a 'struct ipu_sensor *' and link being a 'u8' so checking for < 0 no longer is necessary.

Regards,

Hans



