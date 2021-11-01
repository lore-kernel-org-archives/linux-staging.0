Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4AA2C80
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 19:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635793618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bi90UX8d49/Jz6VaT/YCT1/DeafcfQd3kffKdo8pv1M=;
	b=J9hjs4Vwsu3ZmYUoKEPBJPeG07wEFayd+0gGew6FyIXyOznw8Oz9mB1fSht00ssOgiI5aM
	giyLCjHedcRh1JM9+/E2gzbDkBBP9tCkbX0fcEj5uFHuBBhwIbi1wYDeKYGuLswhXLCe3K
	FsaIBO5KnLWXzJpfsFifyL/6DuReMoY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-HXEUPO1kMKWrQQfZD6zJBw-1; Mon, 01 Nov 2021 15:06:55 -0400
X-MC-Unique: HXEUPO1kMKWrQQfZD6zJBw-1
Received: by mail-ed1-f71.google.com with SMTP id i22-20020a05640242d600b003e28aecc0afso3925312edc.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 12:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bi90UX8d49/Jz6VaT/YCT1/DeafcfQd3kffKdo8pv1M=;
        b=gP74ASdszkIgq1jIl7HyqYMjXxVujWfY4iEI0YswpTuG7KEvsQeP9XVV0S/cPYUojg
         VmowPgc6JJyqs0PfDSNQ7MR4oMYo4Itk8AZuS6T7FUkrvF9xUu0gWWKq8C1vp+I8uuuR
         faSzF0t2HGSoyul2mL3i6FZ1G9fo0BbRblsdAgxcXyGAxUWArX66FXCCU5e9HDmbEjvv
         tO8y6f1GVVDwriMZgt8n1LEy5B//2mHFMRkRJBAAIJWh15bfcwETU9JnJRvhE23OmkPk
         5zdjXcVnFnRIU/oMrCx0rRgQMpBg42GK+kOkg0a3/WWIIpdXLuUHsjJDkhbsG5aA+vAx
         Ue3A==
X-Gm-Message-State: AOAM5334zHJXcaiPylO2qf+OLA9F3EfSoPPQ7W/Ukv4RqWzCmq0TJgGE
	6wWT9nhJUtWrPKMq5K6zEP7XSf6Q6ZQV7xEoGcXqkJ/ai3U0eLi+KoJz4iRW8gAbxFOdB7LsCFm
	dBmQiOABa/Xe9yMsWz0JCB/deFw==
X-Received: by 2002:a17:906:3542:: with SMTP id s2mr39000922eja.379.1635793614382;
        Mon, 01 Nov 2021 12:06:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkFHYcCJ7BYV9Qf/ACeB8nPnE2xq5dPY32ips+nJeDfo4W1dQQJfueSCrrdWvG2tzbhez3ng==
X-Received: by 2002:a17:906:3542:: with SMTP id s2mr39000872eja.379.1635793614136;
        Mon, 01 Nov 2021 12:06:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h17sm3614189ede.38.2021.11.01.12.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 12:06:53 -0700 (PDT)
Message-ID: <2b81ca7e-fcaa-5449-5662-4eb72e746b02@redhat.com>
Date: Mon, 1 Nov 2021 20:06:52 +0100
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
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tsuchiya Yuto <kitakar@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211101141058.36ea2c8e@sal.lan>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/1/21 15:10, Mauro Carvalho Chehab wrote:

<snip>

>>> Did you test on Baytrail (ISP2400), and with the compile-time option
>>> enabled/disabled?  
>>
>> Sorry, I should have clarified on the cover later. For ISP2400, I did
>> compile test only (CONFIG_VIDEO_ATOMISP_ISP2401 enabled/disabled).
> 
> Maybe Hans could help us on that. I guess he has an Asus T100 device, 
> which is BYT based.
> 
> Hans, if you're willing to do the tests, you could either use nvt
> or v4l2grab to test it.
> 
> It seems that BYT has an additional issue, though: the ISP seems to
> require 12 non-visible lines/columns (in addition to 16 ones required
> by CHT?) for it to work.
> 
> So, you may need to tweak the resolution a bit, as otherwise the
> driver will return an -EINVAL.
> 
> See:
> 
> 	https://git.linuxtv.org/media_stage.git/commit/?id=dcbc4f570495dbd490975979471687cbe2246f99
> 
> For the workaround I had to add for CHT to properly report the
> visible resolution.

Testing BYT support definitely is on my radar. Note that BYT
also has the additional issue that the atomisp2 on BYT can be
enumerated as either a PCI dev (which may work) or an ACPI/platform
dev which is unsupported in the original atomisp2 code-drop and
seems non trivial (because of pci config space writes) to get to
work.

On the T100TA the device is actually enumerated as an ACPI/platform
device and the BIOS option to change this is hidden. In the mean
time I've gained quite a lot of experience with changing hidden
BIOS options though, so I can easily put it in PCI mode for
testing. But eventually we also need to tackle ACPI enumeration
support...

Anyways I've let me self get distracted (hobby time wise) by
looking into PMIC/charger/fuel-gauge issues on the Xiaomi Mi Pad 2.
I've made a list of 3 (small-ish) loose ends which I want to
tie up there and then I plan to start looking into atomisp2
support in my hobby time. ATM my plan is:

   -Test on T101HA to reproduce Mauro's work
   -Try to get things to work on the T116
   -Patch to not load atomisp_foo sensor drivers on !BYT && !CHT
   
And I've just added:

   -Try out BYT support 

As 4th item. Eventually I want to look into writing a proper
regulator driver for the PMICs and then try to make the atomisp2
code work with the non "atomisp_xxx" versions of the sensor drivers.

Regards,

Hans


