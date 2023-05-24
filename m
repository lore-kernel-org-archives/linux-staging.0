Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B669E79F9
	for <linux-staging@lists.linux.dev>; Wed, 24 May 2023 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684917902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IPjNnsilisJpU1pieN0XK+ygIXwy0O0sWum8P6BGIYA=;
	b=SFeDNPUkajRSLmnHEm3SmlTbbWyGOcFTGjlZD76ZZV7p5bVYxE6TyY4aDtaI6sYoCD6fkS
	vDPkfaoko9X+3NXb6fBDTNL77vQnLo7zxNL6X1YWdRfTABy7WfYNJkTS4pdhT3h1kmQe7x
	e2IDaASf4QzvFGWofetVl2YiepkW7Tc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-gBFNT3E7M5KghCFehQjJ-w-1; Wed, 24 May 2023 04:45:01 -0400
X-MC-Unique: gBFNT3E7M5KghCFehQjJ-w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9715654ab36so62088366b.0
        for <linux-staging@lists.linux.dev>; Wed, 24 May 2023 01:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684917900; x=1687509900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPjNnsilisJpU1pieN0XK+ygIXwy0O0sWum8P6BGIYA=;
        b=N1c7YbmxCuroUZbfTpbsiJuSDw5hYOdlfelcYBxxXdUVRckqGLFs6bbXC23YfrgzGd
         A4aqho/0ru7aMGPI9ezPJEYQDvgNU1p4gbOsLiwN7gqCjtUnOXanLmkeQX76bR+wT73g
         tKSJam5KpmJaUDFfoKiIaFuXTOpyMFXQFFSuIoDILzVDXLf4VTny6S8bFGIPTTEUPOCR
         c8P2zeOeT7mOq+zR4SGipN9zfJ1lrN4vMHqj7zpufA6W0jwBfiWfwUfhV25rBq7FcnMO
         v8FARrpgRFmSdzG9Io1C6nJslALFMIXTm+R2HcPpW2+ElJIsxwaoUmtKEvpyDqHcIQFw
         /H6g==
X-Gm-Message-State: AC+VfDzSR09VdKfwa7lTH1rJU4W8OXDtcrsPoq1uUDDUSVCdGa7PEufI
	Ut7HNH2XV9JQkznUIzrnCInmsEFxDELasVpnRItDTk7bs+8TAhg6GrRnhZbF4dROURdRCEnCwcF
	xlFOfwcIj46m+XsWbgpbPDMwFQQ==
X-Received: by 2002:a17:907:268e:b0:969:f677:11b9 with SMTP id bn14-20020a170907268e00b00969f67711b9mr16410191ejc.54.1684917900425;
        Wed, 24 May 2023 01:45:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4pfcMobEA+3q24rkthAiEr346uOcv7B+ftBoawjPmSRKFqwnlDDi2urafqqQrZpSgY4J+Hww==
X-Received: by 2002:a17:907:268e:b0:969:f677:11b9 with SMTP id bn14-20020a170907268e00b00969f67711b9mr16410152ejc.54.1684917900013;
        Wed, 24 May 2023 01:45:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f25-20020a05640214d900b0050dab547fc6sm4871400edx.74.2023.05.24.01.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 01:44:59 -0700 (PDT)
Message-ID: <2bdacc5a-8d8a-159a-780b-5038325ce62f@redhat.com>
Date: Wed, 24 May 2023 10:44:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] staging: Switch i2c drivers back to use .probe()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, Jon Nettleton <jon.nettleton@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Jean Delvare <jdelvare@suse.de>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Haowen Bai <baihaowen@meizu.com>,
 Jens Frederich <jfrederich@gmail.com>, linux-staging@lists.linux.dev,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kalle Valo <kvalo@kernel.org>, Menna Mahmoud
 <eng.mennamahmoud.mm@gmail.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de,
 Wolfram Sang <wsa@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>
References: <20230523200036.465180-1-u.kleine-koenig@pengutronix.de>
 <b9954a28-1ab2-468d-beb5-2fa2e0f2c069@redhat.com>
 <20230524060104.wljjqi2ep2ag2245@pengutronix.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230524060104.wljjqi2ep2ag2245@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/24/23 08:01, Uwe Kleine-König wrote:
> Hello Hans,
> 
> On Tue, May 23, 2023 at 10:40:43PM +0200, Hans de Goede wrote:
>> On 5/23/23 22:00, Uwe Kleine-König wrote:
>>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
>>> call-back type"), all drivers being converted to .probe_new() and then
>>> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
>>> back to (the new) .probe() to be able to eventually drop .probe_new() from
>>> struct i2c_driver.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>> ---
>>> Hello,
>>>
>>> this patch was generated using coccinelle.
>>>
>>> I chose to convert all drivers below drivers/staging in a single
>>> patch, but if you prefer I can split by driver.
>>
>> I'm currently doing a lot of cleanup work on the atomisp code
>> including the sensor drivers. Specifically I'm working on
>> removing drivers which are duplicate with the standard v4l2
>> sensor drivers under drivers/media/i2c . So this patch is
>> likely to cause conflicts.
>>
>> I have my own branch for my atomisp work from which I send
>> pull-reqs directly to Mauro Chehab:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
>>
>> As such I think for the atomisp drivers it would be best if I directly
>> apply the atomisp bits of this patch (no need for a resend) to my
>> media-atomisp branch, is that ok with you ?
> 
> For me that would be fine, it's mostly Greg who has to cope. As Jonathan
> also suggested to split, I suggest I do this. Then everyone can pickup
> the usual bits without too much conflicts.

That makes sense. I'll wait for your split up version then and
then I'll merge the atomisp bits of that version.

Regards,

Hans


