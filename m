Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC823C70
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 16:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684427808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlWGmtvpmgPYSafTJYurg/qN6fjUp56disaAichymXM=;
	b=ByjpmM0Fg4ITEtqKhE++kDfNlMdZJODiisxvcwUTTO89nKdZsYmBCps0Jv+HTjk3Lckgfh
	NyQkxh2hl8p30MCCuQoFXLR3urpBVVYwlPVxwGIpV2PJV9QQWp8kbZnt9mxgn5cnqVsCLC
	SXk7SouXsio/pfEIPfL3Q9ILr+aBffU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-owrtTxeXPNiywe2NVujmyg-1; Thu, 18 May 2023 12:36:46 -0400
X-MC-Unique: owrtTxeXPNiywe2NVujmyg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a341ee4fcso91105566b.0
        for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 09:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684427805; x=1687019805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlWGmtvpmgPYSafTJYurg/qN6fjUp56disaAichymXM=;
        b=FNoqhvWoYm9rS7m1pIcqQ9L5UBK990bjh2cw2G/egtMFhpfQNaTvrONVpBWrsiicxI
         UrgVsqBO3h8WlL83dwgecodihgitLCjlozeqhPvmNx1pZbj2b4i/NqER9XDFYyD68ZKJ
         JtM+waqKwB7Ch40otcG7irsA79OOtmTir3yru1CSDfofWrBprXiXV8uAL55Eu6r0jYSE
         EtgFrjsXENs+SO2BfLs/D0iVFv+TE4D4My5vGvOUmekzOiEyMM2RvueBwnL5Ifxt1MRM
         EGm8L5U+WKrab3/m1z7NAT1Pn0tPyKfALLb6W13xbZpaZd5tQiFI2zWtQwHT1HOz/xjK
         KFlw==
X-Gm-Message-State: AC+VfDxzTm1kRB8P36Wip0VTNcb+e3JF0hPkG8yiuX+v22GUdkzzT1zn
	FFZeJLpuaNl2OzADBHtRH6pF+agHXj1JxNYOFVBecjD5pdL92tTlgoJHtTIJHj+upkpo6pO6GXu
	zzdQHWlFV7K/8BqR6A4yokOWXtg==
X-Received: by 2002:a17:906:6a1b:b0:96a:54e5:55d6 with SMTP id qw27-20020a1709066a1b00b0096a54e555d6mr26680033ejc.48.1684427805665;
        Thu, 18 May 2023 09:36:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6g8dxWPhvRyfHTD2kXPTAuDwcPuSWOJe4s/8IgizHEV02SPzGkJUr3qU4K+c73cgOxoYzlfg==
X-Received: by 2002:a17:906:6a1b:b0:96a:54e5:55d6 with SMTP id qw27-20020a1709066a1b00b0096a54e555d6mr26679997ejc.48.1684427805325;
        Thu, 18 May 2023 09:36:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090609a100b0094f1b8901e1sm1182493eje.68.2023.05.18.09.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 09:36:44 -0700 (PDT)
Message-ID: <25c5c255-79e8-c81e-f884-36aab79fa5d4@redhat.com>
Date: Thu, 18 May 2023 18:36:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/9] media: atomisp: Add support for v4l2-async sensor
 registration
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230518153733.195306-1-hdegoede@redhat.com>
 <CAHp75VfLyCG9AX6PhZBUMnxYCDKdnVQzOxtXO+uKgok-PREY0A@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfLyCG9AX6PhZBUMnxYCDKdnVQzOxtXO+uKgok-PREY0A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/18/23 18:19, Andy Shevchenko wrote:
> On Thu, May 18, 2023 at 6:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> I'm quite happy to present this patch series which makes it possible
>> to use v4l2-async sensor registration together with the atomisp code :)
>>
>> This has been tested with both the gc0310 and the ov2680 sensor drivers.
>>
>> For now it also is still possible to use the old atomisp_gmin_platform
>> based sensor drivers. This is mainly intended for testing while moving
>> other sensor drivers over to runtime-pm + v4l2-async.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> for non-commented ones or in case you resolve remarks my way.
> 
> Definitely this does not apply to patch 9/9 which is WIP and requires
> more review, I'm still planning to go through it (not done yet).

Ugh, my bad I forgot to change the commit message of 9/9 from
my pov other then the commit message 9/9 is ready for merging

I have tested 9/9 with both the gc0310 and ov2680 drivers with
all mixes of 0 / 1 / both sensors using async (and the others
"classic" atomisp) enumeration and that all works well.

Regards,

Hans

