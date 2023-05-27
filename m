Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5586A3D67
	for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685179535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cds2zgNPVibCpSpcP82QV6iT0Y4ztpGd1kVAxqS+ta8=;
	b=ATZom4wGouWzA70dc7wimIEQQmO6c3iEfBtVT2pbRKAOXam8+h1vTl9lHE27c/KHRWyeDn
	0wg0YKXvPu9VReJMVdO9XMmjJhX/RWhlvi2cWlkW9fG2b2bUYrpndMKQ1y2ityg27YF0jT
	eDJrRemmepB+pV2hNwodjbdq1ti5ZX4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-UB9IKi_lPBOMruu9boCOdA-1; Sat, 27 May 2023 05:25:31 -0400
X-MC-Unique: UB9IKi_lPBOMruu9boCOdA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-513e0246f5fso1592885a12.0
        for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 02:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685179530; x=1687771530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cds2zgNPVibCpSpcP82QV6iT0Y4ztpGd1kVAxqS+ta8=;
        b=isbCTOMa30hWtlAaLJPGvnH3VNTK5nJWeVPxYnWOP5YyXPhT2h/s674arLYmda8mMx
         LBxmvt7K6qN6xJ7ECDqllk1ZzOYpIpbvZptLWqpSvvO1T7Ee25eRifvD5prBA1Lwrocl
         Z5w2lzhwIIBz/RGYq9aHgYxvLPXZZl5DhbeXmYqfAq7whyX63ErBBoDN8OMXtcZ0W5HX
         sctGfwS7joLNM3+cSrqgf8c6vFEr3CI/RTbU0ma7AvrFFREp6XnckxR4yuuUbMCWlLJX
         D7UlCjsxOEG+e8XfvKgCcnOyreIzcHKh0FRQI0HOsyZO7nUSSG/pulP3KcDbGFiTnOyl
         U1UA==
X-Gm-Message-State: AC+VfDy356n/Q/tNhXy4sTCE7rCALwMX4S5+bYSbC8QxgTUd+zhogVx4
	bw12CVvlQ8c475elqENOUBF/05E22uFBFu+uTX6Gibn1DWWmpngar59FHidAYY8BfM1AxrbOvLx
	oZgEr1mWMnAiPxLyzmMo9zEXpBg==
X-Received: by 2002:a17:907:7292:b0:96f:a39c:86d4 with SMTP id dt18-20020a170907729200b0096fa39c86d4mr4787500ejc.7.1685179530823;
        Sat, 27 May 2023 02:25:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BWlQf9ydifHDkDptToS0HudBXRgmLYY+lnIvNlMbRXj2I89ywEFvLdY3NLrrWYR81ugbYdg==
X-Received: by 2002:a17:907:7292:b0:96f:a39c:86d4 with SMTP id dt18-20020a170907729200b0096fa39c86d4mr4787487ejc.7.1685179530552;
        Sat, 27 May 2023 02:25:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bl17-20020a170906c25100b0094e4eabb402sm3185629ejb.128.2023.05.27.02.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 02:25:29 -0700 (PDT)
Message-ID: <c53ec167-9211-9d27-db06-f4b2db5f258d@redhat.com>
Date: Sat, 27 May 2023 11:25:29 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: atomisp: Add support for v4l2-async sensor
 registration
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, Dan Scally <djrscally@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230525190100.130010-1-hdegoede@redhat.com>
 <20230525190100.130010-2-hdegoede@redhat.com>
 <CAHp75Vd1ijQM7b8Z2ip3TXJyuhQJfAqk0MNBVW-Q-ooi_-dBHw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd1ijQM7b8Z2ip3TXJyuhQJfAqk0MNBVW-Q-ooi_-dBHw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/26/23 22:30, Andy Shevchenko wrote:
> On Thu, May 25, 2023 at 10:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add support for using v4l2-async sensor registration.
>>
>> This has been tested with both the gc0310 and the ov2680 sensor drivers.
>>
>> Drivers must add the ACPI HIDs they match on to the supported_sensors[]
>> array in the same commit as that they are converted to
>> v4l2_async_register_subdev_sensor().
>>
>> Sensor drivers also must check they have a fwnode graph endpoint and return
>> -EPROBE_DEFER from probe() if there is no endpoint yet. This guarantees
>> that the GPIO mappingss are in place before the driver tries to get GPIOs.
> 
> mappings
> 
>> For now it also is still possible to use the old atomisp_gmin_platform
>> based sensor drivers. This is mainly intended for testing while moving
>> other sensor drivers over to runtime-pm + v4l2-async.
> 
> ...
> 
>> +struct acpi_device;
>>  struct atomisp_device;
>> -struct v4l2_device;
>>  struct atomisp_sub_device;
>> +struct v4l2_device;
> 
> I would group atomisp* separately
> 
> struct acpi_device;
> struct v4l2_device;
> 
> struct atomisp_device;
> struct atomisp_sub_device;
> 
> ...
> 
>> +struct atomisp_csi2_bridge {
>> +       char csi2_node_name[14];
>> +       struct software_node csi2_node;
> 
> Wondering if swapping these two saves some code (due to potential use
> of container_of() for the node member).
> 
>> +       u32 data_lanes[CSI2_MAX_LANES];
>> +       unsigned int n_sensors;
>> +       struct atomisp_csi2_sensor sensors[ATOMISP_CAMERA_NR_PORTS];
>> +};
> 
> ...
> 
>> +static char *gmin_cfg_get_dsm(struct acpi_device *adev, const char *key)
>> +{
>> +       union acpi_object *obj, *key_el, *val_el;
>> +       char *val = NULL;
>> +       int i;
>> +
>> +       obj = acpi_evaluate_dsm_typed(adev->handle, &atomisp_dsm_guid, 0, 0,
>> +                                     NULL, ACPI_TYPE_PACKAGE);
>> +       if (!obj)
>> +               return NULL;
>> +
>> +       for (i = 0; i < obj->package.count - 1; i += 2) {
>> +               key_el = &obj->package.elements[i + 0];
>> +               val_el = &obj->package.elements[i + 1];
>> +
>> +               if (key_el->type != ACPI_TYPE_STRING || val_el->type != ACPI_TYPE_STRING)
>> +                       break;
>> +
>> +               if (!strcmp(key_el->string.pointer, key)) {
>> +                       val = kstrdup(val_el->string.pointer, GFP_KERNEL);
> 
>> +                       dev_info(&adev->dev, "Using DSM entry %s=%s\n", key, val);
> 
> Do we really want to have "(null)" to be printed in case of the
> kstrdup() failure?
> Also this code may become a honeypot for all possible static analyzers
> and even if we don't care about NULL it may become noisy activity.

Ok, I'll change this to:

			val = kstrdup(val_el->string.pointer, GFP_KERNEL);
			if (!val)
				break;

> Besides that since we have a handle, wouldn't it be better to use
> acpi_handle_info() here?

Yes since we are purely dealing with ACPI / fwnode stuff here using
that would make more sense. I'll switch to that.

I also agree with all your other remarks and I'll fix them all up
(and test things again) before merging.

Andy, may I add your Reviewed-by to this patch too after fixing
up all your remarks ?

Regards,

Hans



