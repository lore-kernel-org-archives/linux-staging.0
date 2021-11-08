Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3942C80
	for <linux-staging@lists.linux.dev>; Mon,  8 Nov 2021 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636358157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjpewFlfxhPfsY3uvMEpI7BolXPB22WmcqOM3sGRb1w=;
	b=ELgKe9jInuJAqVo9oPvWRZCKpiwNslFZwlR5Y+LZNLNEfMSdJ/UeauCbcpKwKIIyJA95wV
	p1/sIgSpdJgLXisPZkBlNGYlJeEwM/MJFkz/qWUL7EFKM+izrR2DKWYjW57veMK4nvQ1Jq
	js7B5L+QXTGZjJGogOv3/rTilXXtmvA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-QFQy4XVcPbiQAoevr6St3w-1; Mon, 08 Nov 2021 02:55:55 -0500
X-MC-Unique: QFQy4XVcPbiQAoevr6St3w-1
Received: by mail-ed1-f69.google.com with SMTP id r25-20020a05640216d900b003dca3501ab4so14064477edx.15
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 23:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CjpewFlfxhPfsY3uvMEpI7BolXPB22WmcqOM3sGRb1w=;
        b=X3fErb9rxhq+bmG7FR+5hIQ6jpX1sdm4ysaR6SleeW0PevSCalPOG5DFyGzO+FAxl6
         g3AnPzQ6fLhCJ9+VlZQ47vspgdz3/muFsp7tldKOJ2YKLKRA+AbuGy1zjpCFnJrfflp4
         GFkd0434O3P2T5zBgZ9vbeO5GI6MroB1SbZ/2TBD07XJ0yH00lqezfLiw9V1lfkL9kOb
         y43/7D5Hwbdpqt/Ykjii6X4upXn9QgMNU1clByD5kmL/Zg9WGkdvCTCkXlPzTT7Qzbn1
         L/zx7dYW1SiXEjMl5B2S6mw5VOoBedFSWUK1/t8oNCR1CiJPwg9yjR6WISbBZIwExDN+
         dWlQ==
X-Gm-Message-State: AOAM5305Pa7ZDfJbD3XuHrBAcwFs4Wl9D8uvnRxjSA1ChnhyObE0mXjK
	mLeuP2TRkrS1XO/Z/zJhc+uGDx/bTD2Cq33pfWEVbUVBfvk78xKl2KvNN/xTGlRdknjCKKmUaWR
	1cTTTzQiCet9poorUeGUTmuHYhA==
X-Received: by 2002:a17:907:6da9:: with SMTP id sb41mr30754535ejc.88.1636358154648;
        Sun, 07 Nov 2021 23:55:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw07Utz2+I6LgSgkz3f7YRMu1Fy89yya607LTo9J5X09NjbL2mSx4wKxUMQmQeic1WilVbgoQ==
X-Received: by 2002:a17:907:6da9:: with SMTP id sb41mr30754510ejc.88.1636358154464;
        Sun, 07 Nov 2021 23:55:54 -0800 (PST)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id hb36sm5217499ejc.73.2021.11.07.23.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 23:55:54 -0800 (PST)
Message-ID: <869d0e2c-b04a-ef35-cfe5-b372c646fce9@redhat.com>
Date: Mon, 8 Nov 2021 08:55:53 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to
 stop working on Microsoft Surface 3
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tsuchiya Yuto <kitakar@gmail.com>,
 Patrik Gfeller <patrik.gfeller@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Kaixu Xia <kaixuxia@tencent.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211017162337.44860-1-kitakar@gmail.com>
 <20211017162337.44860-6-kitakar@gmail.com>
 <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
 <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
 <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
 <20211108074101.033af4c5@sal.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211108074101.033af4c5@sal.lan>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On 11/8/21 08:41, Mauro Carvalho Chehab wrote:
> Em Mon, 8 Nov 2021 00:39:38 +0100
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>> Hi,
>>
>> On 10/21/21 11:52, Tsuchiya Yuto wrote:
>>> Thank you for your comment :-)
>>>
>>> First, I need to correct what I said in the previous mail. I later found
>>> that loading only "atomisp" (as well as its dependency,
>>> atomisp_gmin_platform) does not cause this issue.
>>>
>>> What causes this issue is rather, loading sensor drivers (as well as its
>>> dependency, atomisp_gmin_platform).
>>>
>>> These sensor drivers for surface3 are both not upstream, but I made them
>>> as similar as possible to the upstreamed ones. So, I guess this issue
>>> can still be reproducible on some other devices.  
>>
>> I've run some test on my own surface3 and the problem is the writing
>> of 0x62 (which becomes just 0x02) to the 0x57 register of the PMIC,
>> writing 0x00 to that after loading the sensor driver makes things work
>> again.
>>
>> I have not had time to investigate this further.
>>
>> I used media-staging + your sensor drivers from:
>> https://github.com/kitakar5525/surface3-atomisp-cameras.git
>>
>> Which was enough to figure this out, but I've not actually gotten
>> either of the cameras working :|  I get:
>>
>> [user@fedora nvt]$ ./atomisp-test.sh 
>> p0: OPEN video device `/dev/video2'
> 
> After the patch that moved the output preview to be the first one,
> you should probably use /dev/video0 here:

Thanks for the hint, but I've not rebased my tree to those latest couple
of patches yet, the same tree does work on the T101HA with /dev/video2 :)

I think this may be a module load ordering issue, I believe that the
sensor drivers need to be loaded before the atomisp driver itself
and on the T101HA we are hitting this "sweet spot", where as on
the surface I was loading the not yet merged sensor drivers manually,
causing them to be loaded later.

I still need to verify this theory, Tsuchiya can you perhaps confirm 
that the modules must be loaded in this order?

Regards,

Hans

