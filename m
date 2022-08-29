Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EFB2CA8
	for <linux-staging@lists.linux.dev>; Mon, 29 Aug 2022 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661768343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCY96VixVLfmhbs0diqGFtuIoxZKuA9d/sCdN7ut8aQ=;
	b=FGqmt8nytrrJqyT8ZBpNNaxVRnEgp38BEISzGbkZyZ957/YQgOlD5cFZ993m7HlzGqjQ8k
	2sUC/hLWsC77WUCGOdNYQ3FNYuNwZ5qo7rPkLwdh0ZBJ6NQq1CLCFEY7vy2m2AlPnO7x6c
	QHmyN1fOR9TETCP6E3oFmhA+t1ItPCI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-IrQxhhvWOziitf5TJMT6oQ-1; Mon, 29 Aug 2022 06:19:02 -0400
X-MC-Unique: IrQxhhvWOziitf5TJMT6oQ-1
Received: by mail-ed1-f69.google.com with SMTP id y14-20020a056402440e00b0044301c7ccd9so5156452eda.19
        for <linux-staging@lists.linux.dev>; Mon, 29 Aug 2022 03:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=FCY96VixVLfmhbs0diqGFtuIoxZKuA9d/sCdN7ut8aQ=;
        b=1zvf/IEew1yOa2g+BnAeJtUxi6gMbFTIsQ079cOxIicCh2i5I37FXH8sZuxdks0Cm9
         prJSaFK6JfN+BtHUMnpI2So2FCOEZUg06SexG4UjfZF5/cFJwQWDmBMCCYSW5y+jkzgu
         ohfogj5E/d4K8i0Mql0lxJ4Lm7LbQGVM/vVWLHoQDXpRto4yeYnnFLeUkoD/NGde8OqY
         QNtNdvMh8cfACNfdy44hAneg8UtUC2elvNZoalys3VJNBHY1T5LaX0X34cdkpK8egHiW
         8XqJqhC5QplQOG0lF43xOq+k7XCmplBKY2DBbtPAvZrH/1WEhAgFTmxWA/n5zAndbcUo
         NAxA==
X-Gm-Message-State: ACgBeo2HS2m5Eb6f08S6tiTxWsdFMRGjspcvoW3sgFb16XjxedbV2HES
	xR3rtC9z8X7ulmenTo/7iJ8QtvUK2BS3JE0nRA56u/ieoH7edj8BH9wf/sRfmbJJF3GfKb/nDzo
	1ibTQVWy+O2vuQrRlrxkFbqvzQw==
X-Received: by 2002:a05:6402:3509:b0:43e:d80b:44a8 with SMTP id b9-20020a056402350900b0043ed80b44a8mr16226765edd.255.1661768341133;
        Mon, 29 Aug 2022 03:19:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR672RVhaIy0p4oobwXVbUm37hLIpasUEKl4eRjMXUDKLOqz7eskYCkRcaDa7i3HAvY4n/QCTA==
X-Received: by 2002:a05:6402:3509:b0:43e:d80b:44a8 with SMTP id b9-20020a056402350900b0043ed80b44a8mr16226744edd.255.1661768340926;
        Mon, 29 Aug 2022 03:19:00 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709061dcc00b0073dc8d0eabesm4401683ejh.15.2022.08.29.03.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 03:19:00 -0700 (PDT)
Message-ID: <8894c65a-d6b6-9c42-2085-435943e36019@redhat.com>
Date: Mon, 29 Aug 2022 12:18:59 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/13] media: atomisp_gmin_platform: Switch to use
 acpi_evaluate_dsm_typed()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
 Fabio Aiuto <fabioaiuto83@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-staging@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220822150610.45186-1-hdegoede@redhat.com>
 <CAHp75Vd2KPjKo1QXaZ4pHr4400Rw2yQFrWJuAOLge9=gbo=RqA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd2KPjKo1QXaZ4pHr4400Rw2yQFrWJuAOLge9=gbo=RqA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/22/22 23:28, Andy Shevchenko wrote:
> On Mon, Aug 22, 2022 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> The acpi_evaluate_dsm_typed() provides a way to check the type of the
>> object evaluated by _DSM call. Use it instead of open coded variant.
> 
> of an open
> 
> ...
> 
> Hmm... I thought I gave the Rb tag for patches 2-11.

Yes you did I forgot to add that, sorry. I have added it in my local tree now.

> In this version patches 12 and 13 also look good to me.

Thanks, also added in my local tree (I plan to send a v3 with more cleanups
added on top).

Regards,

Hans

