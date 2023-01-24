Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D210F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 11:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674559346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQb1UOEiZ4MRlQ72YjMoJvN8ZRmgMFziRKH1pMkYfkY=;
	b=emDnukKnsD8cRYAtqnZTIX9WYkqW2hIDv+/uVAhq0OHqEMkXY4xrnYDeWqSuP4NKNd8Qj5
	lLNMX4G1qaXye9GbR5r/6gqSUw4KsZFkGBf7zEAQkkm66gWIlFyy9Huq/0hN2qWcDf5Hso
	CGU87l0KHKbv/E/IQ0rQXGRAixdmD8w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-_kzz8wzfPMCZhCW08Mv-fQ-1; Tue, 24 Jan 2023 06:22:25 -0500
X-MC-Unique: _kzz8wzfPMCZhCW08Mv-fQ-1
Received: by mail-ej1-f69.google.com with SMTP id nd38-20020a17090762a600b00871ff52c6b5so9575177ejc.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 03:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQb1UOEiZ4MRlQ72YjMoJvN8ZRmgMFziRKH1pMkYfkY=;
        b=B/dObbvhff6/GeOJlJK/FzW3Ymhanb+YmkLZN3OmGtGF0PXW6VsMh1KZI8OTLsyh6x
         WpSNfBxzsIQ3l7LprTAU2A9/GPvmApmguNxLjIItrIcFmbNnpHgguuC/eMWAWl0JI8Pw
         w5YqX09bctFoZMKOfoMNxbMD33iiiC7NZ/02ecSk2xcWcwGK7gJouvTMXHYxBCLl/HSv
         o7HTuVbWvA4oaMkBeiMPuGwVoLavZTuIUAxEVMu/ihWM7rJacZjfZp9rN/bEg4hG2B+7
         un5QbeX6xmEjaWfh3FndNUhViG21vNUpYoCd/afqWJllsinz8fbFwsMwh5UVuMTgEFyh
         feUQ==
X-Gm-Message-State: AFqh2koDLxReVydl8dzfvPjBKOZKR7FfHiqFjA2PiSMhHO7s1+Rxk6nt
	0VCcbmMuB0OW7qLaJqaV39eOMg7eFCCr/w755hXwooKsI6/gmYGpKWEb6BeePPJ25ZjB1FLMHOs
	OagR6b3wnGsq8s3TtJjJDsvjYCQ==
X-Received: by 2002:a17:906:244b:b0:7be:fb2c:c112 with SMTP id a11-20020a170906244b00b007befb2cc112mr27094995ejb.66.1674559344614;
        Tue, 24 Jan 2023 03:22:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsoUVw/w39DIAN1tWEZm9oHb8DFKE8Z1im+02H0I5RZnyKt8uFEviRmBh1SCDT+yJEem0pPUw==
X-Received: by 2002:a17:906:244b:b0:7be:fb2c:c112 with SMTP id a11-20020a170906244b00b007befb2cc112mr27094982ejb.66.1674559344469;
        Tue, 24 Jan 2023 03:22:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h11-20020a1709062dcb00b007c14ae38a80sm747524eji.122.2023.01.24.03.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:22:24 -0800 (PST)
Message-ID: <93f3a065-44e5-4d8f-d55a-699dc8a3c0bd@redhat.com>
Date: Tue, 24 Jan 2023 12:22:23 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 29/57] media: atomisp: ov2680: Use the new
 ovxxxx_16bit_addr_reg_helpers.h
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-30-hdegoede@redhat.com>
 <Y87ORy9ELdZSiMRf@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y87ORy9ELdZSiMRf@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/23/23 19:13, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:37PM +0100, Hans de Goede wrote:
>> Use the new ovxxxx_16bit_addr_reg_helpers.h instead of duplicating
>> the ovxxxx sensor I2C register access helpers found in many different
>> sensor drivers.
> 
> ...
> 
>> -	ret = ov2680_write_reg(client, 1,
>> -			       OV2680_GROUP_ACCESS, 0x00);
>> +	ret = ovxxxx_write_reg8(client, OV2680_GROUP_ACCESS, 0x00);
>>  	if (ret) {
>>  		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
>>  			__func__, OV2680_GROUP_ACCESS);
> 
> Wouldn't this be a dup message without any additional value?
> 
> Same to many other places.

Ack, these errors are all removed in further refactoring.

Regards,

Hans


