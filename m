Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390E72C86
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 21:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635800777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TQgvJe1cepFDe4icXoTKdCQ9OFnmjUFubPLtiHuzRwE=;
	b=HYwE4HbQY59JNpyW7V/Mugwz967KcDcFbc8I7KkTIlbZtrSwotbXkGrFJ1WGtYYT3EKzRL
	j19WqM5aP/ZvUVADYyps+YVTgL/dgmrbwIzWi1mgw5xVSAljLqK4h+ppkYx7o7Ld7GwsDw
	BP3Y1Sb0V3l+gmFslFRcXXbo5teI7fk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-FQSkeFIvOeeDB-rSUf00ig-1; Mon, 01 Nov 2021 17:06:15 -0400
X-MC-Unique: FQSkeFIvOeeDB-rSUf00ig-1
Received: by mail-ed1-f72.google.com with SMTP id w12-20020aa7da4c000000b003e28acbf765so4279126eds.6
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 14:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TQgvJe1cepFDe4icXoTKdCQ9OFnmjUFubPLtiHuzRwE=;
        b=KABOb/E6+JHNlAN8OByngQ/8f3J7psnwNbcYRs8sTsu3fskHFQFZN7aE7oxC8yF3Qg
         LagGnDqV3vdWMGdxE+prb6tF4Gss5p3UOOQZKfhaXiwXM4FQkZiDAiPuO3xxxs1wJ8g7
         miYiHEN69GjbbxBsf97/R9nctn7a3efttzvclkfa8aQyNtsCngSdpbPrrM985XEFsDJR
         DrvtSfNieAQ/qnsHaf0dAWWDn7QPc+maUj4nUwMHOnY9CXdRGazA09fe9ApDsqOLA2pR
         wpVAICGy2MzoxHy2xPib/q8FoJcqDs2kRCBmTKfBQvBjTc39ULfUueR9PhnBF8UkvY9o
         nB5g==
X-Gm-Message-State: AOAM530FDmjeqR1mjSTX0JMcvrM3UAwiu+zPlWea0Sxd7vV5VsK0y7+U
	KCCYILK6CW6zvIj0pnsX+hUitb5VDA+figr6oGy+QivFtl4abSLa9NcBZ7SssS/q7yh5eMkj9/2
	KPbuI61pOBpIl1e45SHnYQ6ef8w==
X-Received: by 2002:a17:907:16ac:: with SMTP id hc44mr16796032ejc.363.1635800774145;
        Mon, 01 Nov 2021 14:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7B3F/WuXivDXcMsQVHWmnjOpyhs30E4Vl20y17n1wnE9ef345TKyurGX36aGs8GVxBRd/rA==
X-Received: by 2002:a17:907:16ac:: with SMTP id hc44mr16796004ejc.363.1635800773984;
        Mon, 01 Nov 2021 14:06:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gn16sm3917022ejc.90.2021.11.01.14.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 14:06:13 -0700 (PDT)
Message-ID: <8b81025d-a35d-da91-b059-eab1108013e8@redhat.com>
Date: Mon, 1 Nov 2021 22:06:12 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tsuchiya Yuto <kitakar@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nable <nable.maininbox@googlemail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Fabio Aiuto <fabioaiuto83@gmail.com>,
 "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
 Patrik Gfeller <patrik.gfeller@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-5-kitakar@gmail.com> <20211026092637.196447aa@sal.lan>
 <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
 <20211028123944.66c212c1@sal.lan>
 <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
 <20211101141058.36ea2c8e@sal.lan>
 <2b81ca7e-fcaa-5449-5662-4eb72e746b02@redhat.com>
 <20211101200347.2910cbc7@sal.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211101200347.2910cbc7@sal.lan>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/1/21 21:03, Mauro Carvalho Chehab wrote:
> Em Mon, 1 Nov 2021 20:06:52 +0100
> Hans de Goede <hdegoede@redhat.com> escreveu:

<snip>

>>    -Patch to not load atomisp_foo sensor drivers on !BYT && !CHT
> 
> Not sure if it is worth doing it, as there are a lot more to be
> done before being able to use a generic sensor driver.

As you may know, I'm also working on IPU3 support for $dayjob atm
actually :)

So the drivers for e.g. the ov5693 sensor conflict, by adding
a small (one line) check to atomisp_ov5693.c to not register
the driver at all when not on BYT/CHT we can avoid the conflict
on most devices for now. And when actually on BYT/CHT the user
will need to blacklist the non atomisp sensor-modules which, well
sucks, but atomisp is in staging for a reason ...

So the idea here is that with some small added ugliness to the
atomisp_foo.c sensor drivers we can make the 2 drivers co-exist
a bit more, allowing e.g. generic distro kernels to (maybe) enable
the atomisp2 stuff without regressing the IPU3 support.

###

Since we are discussing this now anyways, the atomisp_foo.c
patches would look like this:

#include <linux/platform_data/x86/soc.h>

        if (!soc_intel_is_byt() && !soc_intel_is_cht())
                return -ENODEV;

In the probe() function and change driver.name from
e.g. "ov5693" to "atom_ov5693".

Before I spend time on writing patches for this, would patches doing
this for conflicting drivers be acceptable ?

Regards,

Hans

