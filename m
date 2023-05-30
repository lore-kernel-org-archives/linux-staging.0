Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E5F4A0C
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685443010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2C272nEx9s9eB+T4qDCUTRMED0MJS1yr52s8S2qnGlw=;
	b=DgE4tz/ICbdu1PrPgsInIhI2h0kyGiOZ5P+vdktsTsxKIEEDWOiYwTdgn+bBLWDoOadfb1
	2FdfTJ0Le5Yv4qrsI40rpBTmL2Lb/v+o596FX9uix7TqfLA44yshuqeVgg3VslL3DjTCGM
	sCt6x1NLdq6WYHjDcTYg80ePC7PlwvI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-GTzcNSQoN4OOv3dXsOg7lg-1; Tue, 30 May 2023 06:36:47 -0400
X-MC-Unique: GTzcNSQoN4OOv3dXsOg7lg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-973c42bfc38so381056366b.0
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 03:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443006; x=1688035006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2C272nEx9s9eB+T4qDCUTRMED0MJS1yr52s8S2qnGlw=;
        b=GhbqrMXquokZWr/IkGutA4TC1NHPLgrNpMpB9ytBb/8XcRGSetw+G2oRzyTxBHdV0o
         WZeVsKrO5BsT1xbfB2C4RRtwdFFxJl09+oIPIS6qrM73KSu7EEoueRQzHaueGm6A/x2n
         oa8IfXA+g8F4ZMWMMx/tXLCBJc2NC6zv7p6zw3BezWKyQEPl7+CkK0cfWqVOE5RSHgZG
         m3CzBecWjWNavcND/Rb31W0Mj0CLatipswr45AJJhOFdoiNsP3tbbgKqTeCU4wpiQjtm
         i6LGKP0xfqaAnnv9PJ82LXB1YJSnyaYFl+qOrZoSrpwp/bHLLaJ4LRSLckeV7ChpjkyO
         T+wg==
X-Gm-Message-State: AC+VfDxJBpYCas/5spEW1SPDJKUkcxv90hPgddKDyZHSTEKA3De8t2zU
	kzmRUxY4m7MxIh2GcqRZ0OHoJ+RptJxI42/ug9VSs5fr3F83TU5aJpiR7qD4fBexyuGRUEu9hrT
	U5sCVuXHDosCavZiAsqEON7G3YA==
X-Received: by 2002:a17:907:9718:b0:96a:90bb:a2d3 with SMTP id jg24-20020a170907971800b0096a90bba2d3mr1733536ejc.71.1685443006510;
        Tue, 30 May 2023 03:36:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7JVVeVFsK96/1s1szL11Kj5OycsPWwb9NQRpwztATo9n2vEZwn2AqIjlw8ZTzQBS+MTmJc6g==
X-Received: by 2002:a17:907:9718:b0:96a:90bb:a2d3 with SMTP id jg24-20020a170907971800b0096a90bba2d3mr1733516ejc.71.1685443006197;
        Tue, 30 May 2023 03:36:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u21-20020a170906b11500b0096f738bc2f7sm7216670ejy.60.2023.05.30.03.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:36:45 -0700 (PDT)
Message-ID: <b8059e0a-8a95-ce5e-ccd5-786ac9ee6abc@redhat.com>
Date: Tue, 30 May 2023 12:36:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/21] media: atomisp: ov2680: Implement selection support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230529103741.11904-1-hdegoede@redhat.com>
 <20230529103741.11904-7-hdegoede@redhat.com>
 <CAHp75Vd0n8HHv2nguQFHvoRuqjwAAj=YdmgMGckg+1q-NLptFw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd0n8HHv2nguQFHvoRuqjwAAj=YdmgMGckg+1q-NLptFw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/29/23 22:31, Andy Shevchenko wrote:
> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Implement selection support. Modelled after ov5693 selection support,
>> but allow setting sizes smaller then crop-size through set_fmt since
> 
> than
> 
>> that was already allowed.
> 
> ...
> 
>> +static struct v4l2_rect *
>> +__ov2680_get_pad_crop(struct ov2680_dev *sensor, struct v4l2_subdev_state *state,
>> +                     unsigned int pad, enum v4l2_subdev_format_whence which)
>> +{
>> +       switch (which) {
>> +       case V4L2_SUBDEV_FORMAT_TRY:
>> +               return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
>> +       case V4L2_SUBDEV_FORMAT_ACTIVE:
>> +               return &sensor->mode.crop;
>> +       }
>> +
>> +       return NULL;
> 
> I would move this to default: case.

That may cause the reader of the code to think that there are other cases,
which there are not. All possible values of enum v4l2_subdev_format_whence
are already handled, otherwise the compiler would also complain.

The "return NULL" is there to shut up other compiler warnings.

I'll add a /* never reached */ to it to make this clear.

Regards,

Hans


