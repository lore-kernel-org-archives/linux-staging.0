Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646119C
	for <linux-staging@lists.linux.dev>; Sat,  1 Apr 2023 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680347347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZI5gzblLbzd4ocsRZ4H8EgESHkje2pYcL+YafNEzFs=;
	b=LGpcYQ+4oG4BKIGdMIZlT13UJSFMye96M4RMbwSJ2DoE+GPY2gXB05lO9iyXUGvapCVoxU
	BgjZeMVsq4V81ifMEl2AB1lbE3aX1hzLRCNvCWGUJUQL9JiG0UgA9uNIbovF8fWBIh+5gM
	TDed/eZapIgGC+eIBlTxHwIn7JQZ1Dc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-512nNbW2M_avrkOEAatlgg-1; Sat, 01 Apr 2023 07:09:04 -0400
X-MC-Unique: 512nNbW2M_avrkOEAatlgg-1
Received: by mail-ed1-f71.google.com with SMTP id a40-20020a509eab000000b005024c025bf4so22865683edf.14
        for <linux-staging@lists.linux.dev>; Sat, 01 Apr 2023 04:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680347343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZI5gzblLbzd4ocsRZ4H8EgESHkje2pYcL+YafNEzFs=;
        b=p8hQzlXGyZ6JMRBBbNeocy46aBSfXpJovulNjrGDsI22IemkfNivq6dC0Hvm+r0G2V
         Db1AD8I1FENYai2FrKpZzQGJzy+FRgvjJQWOkNJa4mXf+kwuDJ+I5u4Nj4Zd8FLGDy1K
         Sb65MIewRVbXTBHIwoonE/9G3AtLR3vGUlR/EE2J/xliGRykAFNu7sPzy0o2W5wrfePB
         lYKIFLgz0EMycelX9HF7L/tDGn+pgWdhtQTiFx+tWlPCMquE3zT7e0Hj7DaWd8tKZz3O
         HHMSOAixvQtAlv91wp+6oBI3foGsM85yQT2lqnTfsrW+yVPFQBP8c09ieubm76GNaHGk
         igNg==
X-Gm-Message-State: AAQBX9eV5kXUcokQypwvp6oTqzxiiSToVceLEw74+MKvtH4lypVf8noK
	vU5sZLVGlnbw0XrntA5ldfhLo6n/BdkouSNFN2qjox06OapxcXab6qR8osO/NSAPntNGtplbM0L
	ZcyxL2/Xvb4IjbxqX9SnZV2356w==
X-Received: by 2002:a17:906:3592:b0:934:8043:ebf8 with SMTP id o18-20020a170906359200b009348043ebf8mr29370628ejb.26.1680347343030;
        Sat, 01 Apr 2023 04:09:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZR2FvyyaudUU65TI76rdKXkl5MXvG8ge/EbTH03vRHElwus7fEgqHWvdMWDVfotbwYdN1w3g==
X-Received: by 2002:a17:906:3592:b0:934:8043:ebf8 with SMTP id o18-20020a170906359200b009348043ebf8mr29370610ejb.26.1680347342782;
        Sat, 01 Apr 2023 04:09:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906309300b0092be390b51asm1957572ejv.113.2023.04.01.04.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 04:09:02 -0700 (PDT)
Message-ID: <a9bf8968-fe9d-877a-bf1c-54df30c557c3@redhat.com>
Date: Sat, 1 Apr 2023 13:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/10] media: atomisp: Remove depth-mode and continuous
 mode support
To: Andy Shevchenko <andy@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <Y/Tri9ArpjxWZfoB@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y/Tri9ArpjxWZfoB@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/21/23 17:04, Andy Shevchenko wrote:
> On Tue, Feb 21, 2023 at 03:58:56PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> This is the first step of the removal of special/obscure features
>> discussed here:
>>
>> https://lore.kernel.org/linux-media/ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com/
>>
>> Plus some follow-up patches removing some dead code (some new dead
>> code as well as some pre-existing dead code).
> 
> As usual for non-commented
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thanks!

I have just pushed this series to:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Adding your Reviewed-by to 8/10 patches and addressing your remarks (except for the switch-case thing) in the other 2 patches.

Let me know if you are ok with / want me to add your Reviewed-by to the other 2 patches.

Regards,

Hans





