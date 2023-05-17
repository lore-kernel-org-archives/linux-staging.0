Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C898A111AD
	for <linux-staging@lists.linux.dev>; Wed, 17 May 2023 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684353743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zLZnJaLN0n+wdG5gMmca7s8DNaXLda/zUpeeDF5C+Zc=;
	b=HEHjguY1WUBoiKnoq/de9Hnole/HcZLOdviqRvDkN63An9pOxmw8G9KqYYSGpe5b0MjK8M
	6oDqnS+8210oDUztSJwR8s3LrsBNt+lkp/fIcbzxLqg+KVxGRyKQW5SGyO+RtpTxVwyKSK
	FzyyV6xKCvmyFLvq8sO8WcaRfuCNPjk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576--Pc18Dx0MPaAl2FL8_Yp5A-1; Wed, 17 May 2023 16:02:22 -0400
X-MC-Unique: -Pc18Dx0MPaAl2FL8_Yp5A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a34e35f57so132110366b.3
        for <linux-staging@lists.linux.dev>; Wed, 17 May 2023 13:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684353741; x=1686945741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLZnJaLN0n+wdG5gMmca7s8DNaXLda/zUpeeDF5C+Zc=;
        b=luODu2sY9SmmDQ96A+EQklKh8bUeJ5zX5cdph8/zLBZjJS0g700BlXi9XipN9WC/nq
         E5FB47qME3i5rXDkF0FmIxNYYkko5UVa2u2NRlvBzsZ0l/HGs/GG2GPKFLkeu5NZklXG
         +WpQtEc5N93bt1tw+oDp3up7s7hmCLk1jFFqAvMt6ffdZh+esUXBtDkPMG0icOFyZek3
         ZWTXgDCFtd+xVFgSuri18Yho3stWBY19jWh45rjQ1Kv1Z3FTf/0gelwOj37CI5CETaOv
         c5v8vpd+BgFCZRaIlsgAOrgi8HcXKtEYLTKMc/XXiz9N212k+MHPQcF4CV0i4wckv/An
         20zg==
X-Gm-Message-State: AC+VfDw2+aO4cz6Y6evEiNgWBpK/1MOZOVRzAWNb5n+85Maq0h2oBCgi
	aXdiJmqPd+RAqSzLnIKYwdOfp9/nuyN9FuliwqOZjyxkX4jLreEPIVHbPDH9Ck4tREQMPjlfZtU
	v3XvtgmV3pdrr2Sld70i2CvCbKQ==
X-Received: by 2002:a17:907:3f0a:b0:967:e015:f536 with SMTP id hq10-20020a1709073f0a00b00967e015f536mr33885893ejc.75.1684353740937;
        Wed, 17 May 2023 13:02:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hCEdV9EGFSF3Lsf4LSwyqA1NutHTL7g1WGrs4JzW3xdVjq5qShbntTNnCiPit7Cmy++w9AA==
X-Received: by 2002:a17:907:3f0a:b0:967:e015:f536 with SMTP id hq10-20020a1709073f0a00b00967e015f536mr33885872ejc.75.1684353740670;
        Wed, 17 May 2023 13:02:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a10-20020a170906368a00b0096b275e19cbsm5007419ejc.115.2023.05.17.13.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 13:02:20 -0700 (PDT)
Message-ID: <2c4c8ba1-f5ca-a4bc-d4c8-1fe45b1654b6@redhat.com>
Date: Wed, 17 May 2023 22:02:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/30] media: atomisp: Register only 1 /dev/video# node +
 cleanups
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230513123159.33234-1-hdegoede@redhat.com>
 <CAHp75Ve413+r6jE=h-n0tibU5xy5iAMfbB3H8MPpgjRD3bj-eA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve413+r6jE=h-n0tibU5xy5iAMfbB3H8MPpgjRD3bj-eA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/13/23 22:59, Andy Shevchenko wrote:
> On Sat, May 13, 2023 at 3:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is an atomisp patch-series to continue the simplification /
>> exotic feature removal of atomisp. Specifically this series
>> makes atomisp register only 1 /dev/video# node.
>>
>> The other patches are some preparation + follow-up work for
>> this change, as well as a whole bunch of folow-up clean-ups.
>>
>> The cleanups focus on removing the various count / users functions
>> which atomisp used before when there were multiple nodes. This
>> is preparation work for eventually allowing opening the same
>> node multipe-times, as is normal for standard v4l2 /dev/video#
>> nodes.
> 
> As usual
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> for non-commented and otherwise depending on your answers. I.o.w. feel
> free to add if you are going to address as I suggested.

Thank you for all the reviews.

I've pushed a new version of the patches addressing all your
comments and adding your Reviewed-by to:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Regards,

Hans


