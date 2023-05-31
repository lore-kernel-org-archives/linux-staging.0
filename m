Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E613AE1
	for <linux-staging@lists.linux.dev>; Wed, 31 May 2023 11:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685531509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+7km1XPttamFQ1dhwIIrt7M9PSs+swUo6x6uptB/ScQ=;
	b=DXnigUNwoxE/FWKo0fnbwlvKHWZ0EjPTpsYLKCdWDKtOF4O+/9rVDnOu9M409Ar7k6DWgr
	Gh0OOxvt6Ec//QECnACyrtNCRaxx0UNSJtdWBRRB63Tk2QDV53KXeefJCK6SjKHxdgEcPH
	JKG5ehx+bXtkIzTwVQ/FVHvrJHRAtG4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-CTpuC3jSMv-Zj9P3mVs05w-1; Wed, 31 May 2023 07:11:47 -0400
X-MC-Unique: CTpuC3jSMv-Zj9P3mVs05w-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-513ede5a2afso5423597a12.1
        for <linux-staging@lists.linux.dev>; Wed, 31 May 2023 04:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531506; x=1688123506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7km1XPttamFQ1dhwIIrt7M9PSs+swUo6x6uptB/ScQ=;
        b=W3NxLVFjKqvuQUAsgCazxKsbZjV0uoBboS8jSHlJ06gH9i8I20ygqK++DtEbV1/OdF
         YgW6z2cAxy3b8QzoION4H4fWpiyRSGqwwXJE9Y8SuUg5vlpMFMGUicyrnKy8UgCnJzh0
         lCkeEvpOC6zkOQhQ1xSc+EfikfRFetTvXF6pgaRPrtFfw4IgS2P2IXNpkIFdPPFjf/mW
         QuglcVqw3vix9jaYs7LLt/KZuSimKQnq9raU8aE6AQHJzv/fmKS3U90rHTKjETBVEcBC
         HXVGIZE+lDJubjWus3vDNvqdCMt6lCwXDfDlcyWoWgedtaoB/R/fJGrcVFlijbBr/+jh
         Z+MA==
X-Gm-Message-State: AC+VfDwZ3ZhOfWmh3HFBw/ypK9OYlhCeE4gEHS/AqL9JfQ4QIXbuxdDZ
	0C27aklI00RvzHa9UwkER39AUQlDpYkRYvc6qbWs/jdiH9tSX+VSXMYKPEE6xViEnZ/0LBJaaI4
	JRJC2n17DVCEK/48pjK/XYRU1kQ==
X-Received: by 2002:aa7:cb4c:0:b0:510:ddad:fae6 with SMTP id w12-20020aa7cb4c000000b00510ddadfae6mr3346022edt.3.1685531506841;
        Wed, 31 May 2023 04:11:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XLmzlQYT/Pf/u6U2ahhMUisVA7ArRVu/IJ3fqlOeSMiUowBUcXcyc6UyoLoj1V+6SMFcNXA==
X-Received: by 2002:aa7:cb4c:0:b0:510:ddad:fae6 with SMTP id w12-20020aa7cb4c000000b00510ddadfae6mr3346006edt.3.1685531506534;
        Wed, 31 May 2023 04:11:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402004e00b0050c0b9d31a7sm5628060edu.22.2023.05.31.04.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 04:11:45 -0700 (PDT)
Message-ID: <c1be981f-3664-0064-d21c-cd7ff2fa9bcd@redhat.com>
Date: Wed, 31 May 2023 13:11:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/21] media: atomisp: ov2680: Add init_cfg pad-op
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230529103741.11904-1-hdegoede@redhat.com>
 <20230529103741.11904-6-hdegoede@redhat.com>
 <CAHp75VeTdAd98hAKGMo+Skqh0KnbCd=NXQHiB7L8jCkmue1zpA@mail.gmail.com>
 <CAHp75VecdMCp=pqfxFfZ2h81ugGcDjJgQeV8X7fnJ39Bfr2hgg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VecdMCp=pqfxFfZ2h81ugGcDjJgQeV8X7fnJ39Bfr2hgg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/30/23 13:51, Andy Shevchenko wrote:
> On Mon, May 29, 2023 at 9:13 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>> +static int ov2680_init_cfg(struct v4l2_subdev *sd,
>>> +                          struct v4l2_subdev_state *sd_state)
>>> +{
>>> +       struct v4l2_subdev_format fmt = {
>>> +               .which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
>>> +               : V4L2_SUBDEV_FORMAT_ACTIVE,
>>> +               .format = {
>>> +                       .width = 800,
>>> +                       .height = 600,
>>
>>> +               }
>>
>> I would keep a trailing comma here.
>>
>>> +       };
>>> +
>>> +       return ov2680_set_fmt(sd, sd_state, &fmt);
>>> +}
> 
> This is not addressed in your branch.

Oops, sorry I've fixed this in my branch now and I've also changed
6/21 to make __ov2680_get_pad_crop() look like this:

static struct v4l2_rect *
__ov2680_get_pad_crop(struct ov2680_dev *sensor, struct v4l2_subdev_state *state,
                      unsigned int pad, enum v4l2_subdev_format_whence which)
{
        if (which == V4L2_SUBDEV_FORMAT_TRY)
                return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);

        return &sensor->mode.crop;
}


Regards,

Hans


