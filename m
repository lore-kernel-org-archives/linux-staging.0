Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2342C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634543327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WaOwUkzvUfDBDDt6WE1kP1FIHYFffA0AKAkBoFnY0UQ=;
	b=HzQ9ar6UWKmmtznQLwOEeYaFqb0ykSLw/fVYGqWPwW9DJsmtnDl2G1OQKT9Rz4P9n8E+cn
	CZrrfO43gxx1+iJ0/3aPLj72as3Mrwjs0n6OnYxv7UR2YehsYwFGuenwoOPL2NkuITTJdf
	uy81ZxMe6RoQak4hTHT80vcFGNaw3NQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-T8X3ghmVNYibD_kHi0Aa8g-1; Mon, 18 Oct 2021 03:48:44 -0400
X-MC-Unique: T8X3ghmVNYibD_kHi0Aa8g-1
Received: by mail-ed1-f70.google.com with SMTP id c30-20020a50f61e000000b003daf3955d5aso13565556edn.4
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 00:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WaOwUkzvUfDBDDt6WE1kP1FIHYFffA0AKAkBoFnY0UQ=;
        b=EyxjUKpA7HzUDC5QdwDTioXCdWw8bAuIUH2jbvQ7m01qjRKj2gWMYRugN+DKEGrZR9
         i/2bgldPcyjtexqyKiqZWDaOA2PBf6Jq2h3DgzvVmtc8QHkwV0IDa08ilALO5h08YneO
         0nWOskvTcnzPZY1R6lAituraWzFEcb2JSfH5Sy+YwKIEnCATMekvXoN2OWtIxzuBYmMI
         sPvs5WkKK9SopOGB41u6wkPqCzToDohdBa53w95Adh7YeVmJC2uf7RBghvY0HALqSj75
         jbIkQ/iAbxzp7nNisMfkWy6EyzM4XGDVoDjucmyZuShQ5jSjHJ9LaH8IW5wqTq8b9uFh
         LnIw==
X-Gm-Message-State: AOAM533TdB0ALeNN0oBhrObLILYBuLHslnio7BMIH8Kpu9ONUmdGnJPK
	H70308Kh6R+ltqhO6i3tNqUTtQUtT7y+JGpCnGCkWITrKN930RAssDSNKXzPffhDhKVpVMfloBk
	RxzFwRUi26DB+RxO9Co4lC2PksA==
X-Received: by 2002:a05:6402:b15:: with SMTP id bm21mr41922171edb.380.1634543322713;
        Mon, 18 Oct 2021 00:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyKwcnqh+/fwP6JwadbpQWBXm1JRQdQv8BAuZbgM0HXwdav80fx44w6a4nrNrwpHcigfVA6A==
X-Received: by 2002:a05:6402:b15:: with SMTP id bm21mr41922135edb.380.1634543322427;
        Mon, 18 Oct 2021 00:48:42 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id z19sm8310692ejp.97.2021.10.18.00.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 00:48:42 -0700 (PDT)
Message-ID: <bc7f699d-d77d-83ad-ce5b-6082f30881c1@redhat.com>
Date: Mon, 18 Oct 2021 09:48:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: Patrik Gfeller <patrik.gfeller@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, Alan <alan@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nable <nable.maininbox@googlemail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Fabio Aiuto <fabioaiuto83@gmail.com>,
 "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

<Added some more people to the Cc who are also definitely interested in this>

Hi Tsuchiya,

On 10/17/21 18:19, Tsuchiya Yuto wrote:
> Hi all,
> 
> This patch series contains fixes for atomisp to work (again). Tested on
> Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
> v5.15-rc5. Both are Cherry Trail (ISP2401) devices.
> 
> I'm still not used to Linux patch sending flow. Sorry in advance
> if there is some weirdness :-) but I did my best.

You actually did pretty good AFAICT.

Also thank you so much for working on this. Finally getting working
atomisp2 support is awesome!

I actually have been working on and off on this myself
(even did a bit of work on it this weekend). My plan was to:

1. Find android (5.1) x86 kernel sources which I can build from
source and get a working Android (on a device with Android pre-installed)
with a kernel build from source -> Done

2. Get a regular Linux distro to boot with the kernel from 1. -> Done
   (normal Linux v4l2 utils do not give a picture, might be the need
    to set preview mode)

3. Add ioctl debugging to the kernel from 1. capture a trace to see what
Android userspace is doing -> Done .  See here for an example log:

https://fedorapeople.org/~jwrdegoede/atomisp-logs-t116/

4. Write a userspace utility mimicking Android userspace, I started on
this this weekend

5. Once I've 4. working the plan was a bit vague, the idea was to see if
I could use that to quickly get the mainline staging version to work; or
alternatively forward port the working Android kernel sources to
mainline from scratch.

But it looks like 4 and 5 will no longer be necessary, which is awesome,
thank you so much!

I'll try to look into this series in more detail; and try to get thing
working on one of my own devices when I can make some time for this.









> 
> I'll send another series that contains RFC patches later named ("bug
> reports for atomisp to make it work"). To try to capture images, applying
> those RFC patches are also needed.
> 
> The following 1st-7th patches are fixes for the upstreamed atomisp:
> 
>     media: atomisp: pci: add missing media_device_cleanup() in
>       atomisp_unregister_entities()
>     media: atomisp: pci: fix punit_ddr_dvfs_enable() argument for
>       mrfld_power up case
>     media: atomisp: pci: fix inverted logic in buffers_needed()
>     media: atomisp: pci: do not use err var when checking port validity
>       for ISP2400
>     media: atomisp: pci: fix inverted error check for
>       ia_css_mipi_is_source_port_valid()
>     media: atomisp: pci: use IA_CSS_ERROR() for error messages in
>       sh_css_mipi.c
>     media: atomisp: pci: fix ifdefs in sh_css.c
> 
> The following 8th-13th patches partially reverts driver version back
> to irci_stable_candrpv_0415_20150521_0458:
> 
>     media: atomisp: pci: make fw ver
>       irci_stable_candrpv_0415_20150521_0458 work - 1/5
>     media: atomisp: pci: make fw ver
>       irci_stable_candrpv_0415_20150521_0458 work - 2/5
>     media: atomisp: pci: make fw ver
>       irci_stable_candrpv_0415_20150521_0458 work - 3/5
>     media: atomisp: pci: make fw ver
>       irci_stable_candrpv_0415_20150521_0458 work - 4/5
>     media: atomisp: pci: make fw ver
>       irci_stable_candrpv_0415_20150521_0458 work - 5/5
>     media: atomisp: pci: release_version is now
>       irci_stable_candrpv_0415_20150521_0458
> 
> One of the issues on the upstreamed atomisp is, the driver is a result
> of the following two different versions of driver merged by tools using
> `ifdef ISP2401`:
> 
>     - ISP2400: irci_stable_candrpv_0415_20150521_0458
>     - ISP2401: irci_master_20150911_0724
> 
> and we don't have such firmware made for irci_master_20150911_0724.

Right this is something which I also noticed (but I did not do anything with /
about yet)

> I confirmed that the driver version irci_stable_candrpv_0415_20150521_0458
> works well on the intel-aero version atomisp for ISP2401, too.

"irci_stable_candrpv_0415_20150521_0458" is also the version of the atomisp
firmware shipped in CHT tablets which come with Android pre-installed. So
I agree that this is the version which we should go for.


> Here is
> my port, if someone is interested [2]:
> 
> So, eventually, such ISP version tests caused by just the driver version
> difference can be removed (not just being unified but removed).

Ack.

> 
> That said, it may take longer time until we remove such tests. So, for
> now I thought it may be better to focus on just making atomisp work by
> partially reverting the incompatible things for the firmware version
> irci_stable_candrpv_0415_20150521_0458.

Ack.

<snip>

>   ## about (a lot of) ISP2401 ifdef tests
> 
> When porting intel-aero version atomisp to mainline, I thought almost
> all the `ifdef ISP2401` things are the result of two different driver
> version merged by tools.
> 
> To confirm that, I tried removing ifdefs for the initial commit of
> upstreamed atomisp [1]. And I can successfully take a picture there on
> surface3.
> 
> Currently, I can remove ifdefs up to commit bd674b5a413c ("media: atomisp:
> cleanup ifdefs from ia_css_debug.c") [2] which is before 641c2292bf19 ("media:
> atomisp: get rid of version-dependent globals"). Up to there, I stopped
> and realized it may take some time to remove ifdefs for current atomisp.
> So, instead of removing ifdefs, I partially reverted incompatible parts
> in this series for now.
> 
> The ifdefs for the real hardware difference is like the following which
> were removed or integrated into `ifdef ISP2401` on commit 641c2292bf19
> ("media: atomisp: get rid of version-dependent globals") and bd674b5a413c
> ("media: atomisp: cleanup ifdefs from ia_css_debug.c"):
> 
>   - HAS_NO_INPUT_FORMATTER
>   - USE_INPUT_SYSTEM_VERSION_2
>   - USE_INPUT_SYSTEM_VERSION_2401
>   ...
> 
> I need to elaborate on this ifdef thing later (and I'll do later), but
> for now, let's focus on make it just work...

Just focusing on making it work sounds good to me. I also have quite a few
Bay Trail devices, so I would love to also see the 2400 version working.

But one step at a time lets focus on CHT / the 2401 for now.

> For devices which use intel_pmic_bytcrc driver, you need to add i2c
> address. I sent RFC patch earlier named ("ACPI / PMIC: Add i2c address
> to intel_pmic_bytcrc driver").

I'll reply to that patch in its own thread (it needs some work,
but we should be able to get something ready for upstream easily).

> Also, sensor drivers are not upstream. Take a look at my working tree
> if someone is interested [1].
> 
> I made world-facing camera (OV8835) work, which the driver is from the
> old Android kernel tree. Unfortunately, the user-facing camera (AR0330)
> is not working yet; the output is completely black. I'm not sure why,
> maybe the sensor power issue (atomisp_gmin_platform) or sensor driver
> issue, which the driver is from non-atomisp driver.
> 
> [1] https://github.com/kitakar5525/linux-kernel/commits/mainline+upst_atomisp
> 
>   ## for mipad2 (and whiskey cove pmic based devices)
> 
> For devices which equip whiskey cove PMIC, you need to add non-upstream
> regulator driver [1].
> 
> [1] work done by jekhor, which seems to be from intel-aero or old
>     Android kernel
>     https://github.com/jekhor/yogabook-linux-kernel/commit/11c05b365fb2eeb4fced5aa66b362c511be32a34
>     ("intel_soc_pmic_chtwc: Add regulator driver and definition for VPROG1B")

Interesting I recently bought a 2nd hand mipad2 myself too. I still need
to put Linux on there. I'm definitely motivated to do that now :)

Regards,

Hans

