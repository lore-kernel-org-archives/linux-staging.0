Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E224921072
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685456279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcru5zK9DZpPWewtOT+0FyHAo9jOchTkFs+5fjO227k=;
	b=VMyjEIA3QH2nGheLDHK5ipVxWdEOW0YLyA6jtQ0LVFidqqd67h2l/H/y9ZjkomnoBO41I2
	3TzfiEMb5ry68uVENmmovZO12XALOmUXP1/nKWW962vbfZn2Qo4vgs8rsn8ugbiuAAOciN
	FL+FWjOVaLIUyiNVzohYz27wU6lcnMQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-TD6ryTd-NDSbXpyZFmACLA-1; Tue, 30 May 2023 10:17:56 -0400
X-MC-Unique: TD6ryTd-NDSbXpyZFmACLA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-513ede5a2afso4665495a12.1
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 07:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685456275; x=1688048275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcru5zK9DZpPWewtOT+0FyHAo9jOchTkFs+5fjO227k=;
        b=YkpXdPspQm4agKn3s4cHNRHSbC5h9OvO2yaNxW6qBRjFus6nLRBsz1Je5fFBZ/Zgu6
         FQgf77hzNR7sY3GkgDIL+hj8lQ65A31CAE1EA7awKU0Po5esMsk1q0A7Ma7Ik8yVs4mI
         tSMfLDCtWdf4sU4Ncv3cE/q/7be7zcLLkjxyv6BMOVB/45apDzCAVFjL7jAoaAX5DQl7
         rJBOJacnfoG8ZtLZH4WXQprigev2QFaZtzQbAw65c0KMh6yTwPsHTMqKwUIQpeWjutYy
         bKH2CeaSG5hG4f56EV/UCvkxpeE31NmcsyCFtX0VpW72DBESvVk85crMeuN4C1cRB7RQ
         k9Aw==
X-Gm-Message-State: AC+VfDyuVVHNc0/2CHoa0IS1DC1MwrK/+JG7DSIPJXVmyxqQJEOQM+K1
	BdeYSv4i7ZN9rKjC5q5IG9NtrxOprpHzBbmStL5+I/l88SKgOTb0T2zXWTlp1I1VTTP8P8L7BW6
	jRQElQSj1GgBzOgTLgr8NgE1knA==
X-Received: by 2002:a17:907:9450:b0:96f:e7cf:5015 with SMTP id dl16-20020a170907945000b0096fe7cf5015mr2859455ejc.17.1685456275647;
        Tue, 30 May 2023 07:17:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6kZSGKE5y6FJxLn7YNKBkaZtS4twB3o8TyHV574nI4cJZRpgbuGXIwoyfBXQzSj0clfQjWdw==
X-Received: by 2002:a17:907:9450:b0:96f:e7cf:5015 with SMTP id dl16-20020a170907945000b0096fe7cf5015mr2859438ejc.17.1685456275388;
        Tue, 30 May 2023 07:17:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id uz16-20020a170907119000b00965a56f82absm7447437ejb.212.2023.05.30.07.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 07:17:54 -0700 (PDT)
Message-ID: <dc21c20b-987b-57d4-0155-06cb1e663468@redhat.com>
Date: Tue, 30 May 2023 16:17:53 +0200
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
 <b8059e0a-8a95-ce5e-ccd5-786ac9ee6abc@redhat.com>
 <CAHp75VdwCV0PMWqiTunnc3wrvYs7Q=-yGDb++CobhsgwS0EoRw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdwCV0PMWqiTunnc3wrvYs7Q=-yGDb++CobhsgwS0EoRw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/30/23 13:28, Andy Shevchenko wrote:
> On Tue, May 30, 2023 at 1:36 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 5/29/23 22:31, Andy Shevchenko wrote:
>>> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +       switch (which) {
>>>> +       case V4L2_SUBDEV_FORMAT_TRY:
>>>> +               return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
>>>> +       case V4L2_SUBDEV_FORMAT_ACTIVE:
>>>> +               return &sensor->mode.crop;
>>>> +       }
>>>> +
>>>> +       return NULL;
>>>
>>> I would move this to default: case.
>>
>> That may cause the reader of the code to think that there are other cases,
>> which there are not. All possible values of enum v4l2_subdev_format_whence
>> are already handled, otherwise the compiler would also complain.
> 
> Why do we care about that?
> What is the common practice in the v4l2 subsystem?
>> The "return NULL" is there to shut up other compiler warnings.
> 
> Can you elaborate (I mean if the default will be present)?

As a human when I'm reading code if there is a default:
present in a switch-case then I expect that to be something which
may actually happen (which is not the case here).

This is important here because if the default can happen then
the function can return NULL and then callers need to check for
NULL (which they currently do not do).

Looking at other v4l2 drivers I think it would be best to
rewrite the function as:

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

