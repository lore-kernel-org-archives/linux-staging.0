Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB0410F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 11:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674559878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vGVsObfOI177yum6BCbDOyJ7nngV9aW6rIVh+p+1Pvo=;
	b=itG4nxiaQkke3v94YGqzZ3SjwVJYyyG9lwG3boGxfW0tQJ6Ucagsa7CkGuiiExBPLVTT/P
	DbpAO8Py2XujfyqAjiqakqfCxwokOcck50KVl0+5RgRryFirXTM4u+3xvXWXQ781PCSOSo
	w7/RsOGqiwR05/YsEBzKmeFShaRyC4A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-0VOVJLJYP7axc7DOC3FIXQ-1; Tue, 24 Jan 2023 06:31:16 -0500
X-MC-Unique: 0VOVJLJYP7axc7DOC3FIXQ-1
Received: by mail-ed1-f69.google.com with SMTP id b15-20020a056402350f00b0049e42713e2bso10410666edd.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 03:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGVsObfOI177yum6BCbDOyJ7nngV9aW6rIVh+p+1Pvo=;
        b=NXxwDMsD1o83VnuVtmApBMaCP2D/9pW2xnXogAGfMwvHmmeCHRt9tCG676z0I9dzYC
         /CML3ndVmS4HE09gPU3k3IavFajcqvTMlCHmBpfPPueIEIk+8VUPafqojsSnqrewDSos
         zyXwYreiKY2PwhnYfn5SjQksovcSa2DJIOHBNf9DHYwwLCoRFhvNFcExXf8UOPRyZTd1
         mgV1T6qA9xeRv6Cacy03W3NbCP6TCpeRNOTp6a7E6bBP4JNuesP7tgfAFXXvP3Ry3u94
         T031dm2i2/o10sb8avEjKE8C10xo9E6Bf+9AGBIKwX43xxktA4htyjLqClRG9A7/CiDL
         Qrkw==
X-Gm-Message-State: AFqh2krNa0tcbfFHRNgAOKb8Mnl4mvwgqXy2dILAAVrafMZGAF9seO9l
	cNAR+WQ4RlfNaeCErLj+HqwEnkaFcCOgKmIqddbj6QY5IyoC29NEeaQzp5JMg0F974KgdVDomQ5
	VPl+Y5gyFZ8eSsFpBmulgYUWCPg==
X-Received: by 2002:a17:906:f1d6:b0:86e:7896:80d4 with SMTP id gx22-20020a170906f1d600b0086e789680d4mr28365519ejb.49.1674559875610;
        Tue, 24 Jan 2023 03:31:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvDy52T5RX3cDKXyxpbVqtTbcuvG6OT5P/eIC2McW6lb9od5F52pT8maLr1v48f1YLYRa2fcg==
X-Received: by 2002:a17:906:f1d6:b0:86e:7896:80d4 with SMTP id gx22-20020a170906f1d600b0086e789680d4mr28365500ejb.49.1674559875447;
        Tue, 24 Jan 2023 03:31:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id et16-20020a170907295000b0085e05b4f815sm783557ejc.95.2023.01.24.03.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:31:14 -0800 (PST)
Message-ID: <1bd8ac47-03f8-245b-7708-defd150eff00@redhat.com>
Date: Tue, 24 Jan 2023 12:31:14 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 46/57] media: atomisp: ov2680: Delay power-on till
 streaming is started
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-47-hdegoede@redhat.com>
 <Y8+4SZzMpgI1yNaU@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8+4SZzMpgI1yNaU@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/24/23 11:51, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:54PM +0100, Hans de Goede wrote:
>> Move the setting of the mode to stream on, this also allows
>> delaying power-on till streaming is started.
>>
>> And drop the deprecated s_power callback since this now no long
>> is necessary.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> See below.
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/atomisp/i2c/atomisp-ov2680.c        | 101 +++++++-----------
>>  1 file changed, 41 insertions(+), 60 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> index 1dc821ca4e68..2a8c4508cc66 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c

<snip>

>> +	if (sensor->is_streaming == enable) {
>> +		dev_warn(&client->dev, "stream already %sed\n", enable ? "start" : "stopp");
> 
> stopP ?!

Yes the format string is "%sed" so "stopp" gives us "stopped".

Regards,

Hans

