Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753C62CAB
	for <linux-staging@lists.linux.dev>; Sun, 11 Jun 2023 19:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686511007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BO76KSoZdyA68Oh2Q2Smu04r7xPvaYnzigaEgXeWJLA=;
	b=f46VohjztwdApoLY+Gnzq5jfnbCwAfXQyP5LTu0hNp95e+pQnJEuJI0JfuBEkoWy5mjrHz
	XVUl10pmwBQq67Szv/dZYY8DgnAopah6LzJb3aKWtEGyz88wa022IrhPUtWH29UxQ/RtNl
	rCkR09qmRpqcH1JlHTFFHB2RZJb8tK8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-VIfZUiprONu8N2LVQDZPlA-1; Sun, 11 Jun 2023 15:16:44 -0400
X-MC-Unique: VIfZUiprONu8N2LVQDZPlA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-978876e43a7so428345766b.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Jun 2023 12:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686511004; x=1689103004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BO76KSoZdyA68Oh2Q2Smu04r7xPvaYnzigaEgXeWJLA=;
        b=YC3f1CVFv6Xi9+fJ+xHaS5oHVCmVApojdehPXFp8MiEXsfszRB0En0rrpnnliZxed/
         M5KrwYxV11HnyJrlKn1252weOz1L7SrndsWeOaOL1iF/FXG+ivvJ+sG7ljYBGMwLelDB
         vyMfJEQzh/boh5cbi0JO1YvEmQTu2AHbgz+AL7yEtKZakrPg4dYqrjFdKZL9yjsaiFNe
         qBjSUwLmvsio8aesRqxtePNHrw4rTJ7opkerxGpMueUDmb7APnr26d3xGpstywJiyvr3
         DZKig1AUz4HIe7ABpmQJSbba2sHXzzTr5hp91wpe/R/GRxcoADlK1yrlgB1MLg+PeIKG
         eixQ==
X-Gm-Message-State: AC+VfDxkdYZY97QnC+Gu7ikcbPWWDt6awFzveamaYkUL4U4AZt9YmsIK
	wJ2e1DH+CpfRv+ThxVETRHKZ9ojrImvHJQEvMPQrd7kYx9BKVgMXZrAjcG98Ms8Nx4i6F9lLDqE
	tl3/9UizN3LsLyncakPIA/WErIQ==
X-Received: by 2002:a17:907:62a0:b0:978:afbc:676e with SMTP id nd32-20020a17090762a000b00978afbc676emr9060902ejc.6.1686511003880;
        Sun, 11 Jun 2023 12:16:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6RZuyCAhzQt1oVmLBGJz+xWwXWd0/2Mqtk7/rOOo6PSZg2etX3RdQXTQkM9x8Hk7/CE9JNZw==
X-Received: by 2002:a17:907:62a0:b0:978:afbc:676e with SMTP id nd32-20020a17090762a000b00978afbc676emr9060888ejc.6.1686511003617;
        Sun, 11 Jun 2023 12:16:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a19-20020a17090682d300b009775eb0343bsm4168979ejy.79.2023.06.11.12.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jun 2023 12:16:42 -0700 (PDT)
Message-ID: <d2d2bc9b-9d75-d96b-d6fe-8a4bfa532a27@redhat.com>
Date: Sun, 11 Jun 2023 21:16:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/5] media: atomisp: Switch i2c drivers back to use
 .probe()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Haowen Bai <baihaowen@meizu.com>, linux-media@vger.kernel.org,
 Tom Rix <trix@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas
 <javierm@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, kernel@pengutronix.de,
 Jean Delvare <jdelvare@suse.de>
References: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
 <20230524151646.486847-3-u.kleine-koenig@pengutronix.de>
 <20230611110749.jujuc2j6qx2nlihy@pengutronix.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230611110749.jujuc2j6qx2nlihy@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Uwe,

On 6/11/23 13:07, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, May 24, 2023 at 05:16:43PM +0200, Uwe Kleine-König wrote:
>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
>> call-back type"), all drivers being converted to .probe_new() and then
>> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
>> back to (the new) .probe() to be able to eventually drop .probe_new() from
>> struct i2c_driver.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> the four other patches from this series are already in next, this one
> wasn't picked up yet though. There is another change for staging: media:
> atomisp in next via Mauro's media-next (branch: fixes).
> 
> Who wants/should pick up this change?

This patch is already in media-staging:

https://git.linuxtv.org/media_stage.git/log/?ofs=50
https://git.linuxtv.org/media_stage.git/commit/?id=625ac9af384481e8644e0653a4aa472aa95f0395

So this is on its way to -next already.

Regards,

Hans


