Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC47C
	for <linux-staging@lists.linux.dev>; Wed, 21 Sep 2022 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663750360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lG8SDjdnZak/MUXsRfgXClx575p+L/35YYB5sP6fkEQ=;
	b=VkGSWZn6vm636jZM22vquSxI0th25iDcj6kHieCncJj7cZbgO4rUade6k9fn3xZ5QzvLiV
	0wq/TlrizTTLOMMEUuz6URpALsM4iQWqs+GvqFa9mz0eMQn0sUEBPKIoT66mMRjdhVqPTg
	8pAULZ1qsMNlLdaZWHWwGe+BQM0Jdg8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-C7K2bLWmMeyoSzCRjSILhQ-1; Wed, 21 Sep 2022 04:52:39 -0400
X-MC-Unique: C7K2bLWmMeyoSzCRjSILhQ-1
Received: by mail-ed1-f71.google.com with SMTP id c6-20020a05640227c600b004521382116dso3909542ede.22
        for <linux-staging@lists.linux.dev>; Wed, 21 Sep 2022 01:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lG8SDjdnZak/MUXsRfgXClx575p+L/35YYB5sP6fkEQ=;
        b=zlb5z2UQ6AfvOh5/n2ayYwCHhoFLEL481EBbxtjKTB/qOMrTExU7CgckNGrQUcza2U
         IwB+X+6SYSWVn+bGMnBOPn+nLP9hPSCrT/S7DlCkSdKCsnj6JsMSB8hiyKBN7uVPiD4d
         s+GpEzrV+9Dcxj98tKuiU1H6nlmBciNHD6DGjrITBMFKqbVgTx30kwaRDJvLKHVI7Vyt
         6khdd2KdxTg9u0pyGvZeLtDY0Kfu0WpL59lH1iwJ5cEI+gNCXt6IRD9su6gZJwernY8d
         nuF2EPUr84lXlGhlD2nCOe+KVEJzE/iW+x5owwFjwvK1leGfv6QDhcIkpW9sQYDWjwWX
         xLVg==
X-Gm-Message-State: ACrzQf13Cn4KYwGS31kn6uycTs75XORInnm9hokPjA6VtynE3tWgCqOP
	wEMAEPB2bdAruiGG72QWO1RwB/AJYnKL5ptVeC/XATgXLBj/aCfNKo2j1scRvkByJ1GpbXqVUNb
	1/dauN2ovyWgAYGmppyF12URKEQ==
X-Received: by 2002:aa7:c04d:0:b0:454:2f81:b966 with SMTP id k13-20020aa7c04d000000b004542f81b966mr11447512edo.269.1663750358324;
        Wed, 21 Sep 2022 01:52:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5aNy+Putz9fNOLuY2DP/Z5N8/Z2a5BH/Irm20XJPoXRL1gzT4S7udkWhKdVRtlcBL6FCc2RA==
X-Received: by 2002:aa7:c04d:0:b0:454:2f81:b966 with SMTP id k13-20020aa7c04d000000b004542f81b966mr11447502edo.269.1663750358155;
        Wed, 21 Sep 2022 01:52:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id n26-20020aa7c45a000000b00452ff2c203asm1383600edr.92.2022.09.21.01.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 01:52:37 -0700 (PDT)
Message-ID: <c52e1abb-0796-b88a-4a94-fa14c09ffcfe@redhat.com>
Date: Wed, 21 Sep 2022 10:52:32 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 01/17] media: atomisp: Use a normal mutex for the main
 lock
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-2-hdegoede@redhat.com>
 <Yx8T/uEKvVDoCvsT@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yx8T/uEKvVDoCvsT@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/12/22 13:11, Andy Shevchenko wrote:
> On Sun, Sep 11, 2022 at 07:16:37PM +0200, Hans de Goede wrote:
>> There is no reason for atomisp to use a rt_mutex instead of a normal
>> mutex, so switch over to a normal mutex.
>>
>> All the changes in this patch are just s/rt_mutex/mutex/.
>>
>> This is a preparation patch for switching the ioctl locking over
>> to using the video_dev.lock member so that the v4l2-core takes
>> care of the locking.
> 
> So the idea behind rt_mutex here is to inherit the priority on the task.

Right.

> I'm wondering what could be possible the bottle neck this is trying to
> solve.

I don't think there is any specific reasoning behind the code using
this. The atomisp code is quite questionable in lots of cases and
I have a feeling this was just a case of "oh this sounds like
it is faster, lets use this" .

> If there is no other V4L2 driver that does the same, any specific
> run flow of AtomISP v2 code that may suffer of this?

See above.

Regards,

Hans


