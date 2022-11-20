Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ABF2F2B
	for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 22:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668983983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoSHzQL4DUaK1Wqq7ep1f7TaKzUePlXTfhewoznSyVE=;
	b=jRRZD7WF1I5E1hrmPIM++MVuuB5s6duHNhUWrrUQUEfkIz57CyNZJEV2qWjOJi5UmbJJZZ
	k17GsIfBY1CWBX7OB+4FVg9YbhohthG1lrChfmZmJipTG2YzlTzOeltYeIkDPinLPFg/0i
	DglfipgHO4m72dqwobIC9ku012seQqI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-k-UURUWuO4SihpgGNN-ZEg-1; Sun, 20 Nov 2022 17:39:41 -0500
X-MC-Unique: k-UURUWuO4SihpgGNN-ZEg-1
Received: by mail-ed1-f71.google.com with SMTP id m7-20020a056402430700b0045daff6ee5dso5593293edc.10
        for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 14:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hoSHzQL4DUaK1Wqq7ep1f7TaKzUePlXTfhewoznSyVE=;
        b=omqhz8EcByfU5p+RVdBMOG9HRFKA4cJsIbNr/ydgoI9jrAFYD/ikE88VfYRDNlw4h6
         r9Ysw294UJQISS44jnd1NDiF/gkbgZNS39OO8BWhHG72F2aBcEMS+i9zmf0gAOSQb89R
         uRrmfeTr82mqLttSD3LdwZvZ49noz+2sJI3ky7llepHFg2SYbPYX9zYJDGmNXPhuB+0i
         gBHRiFSK4OkZeeki+XVdvVQka0qex94hkGMFYZSr3vMcgdlB2mdLkiJRgN8UY6w7EsGo
         EQ7ucVqgyWRJr3RTZdKTCPLgGO09yi41FfnLQt+wKM3IOgqnPD2wQQZkp8iLhGCZTnCM
         Oj2Q==
X-Gm-Message-State: ANoB5pneWtwvZlrQwwTC93gp++kC2MR29k4cboU3/id30QUBRrfCXr6o
	ce+AA9IGo24iFc2Vd0yVFy08tquKHb7d0jpO2zi5Z7p0Ykm3KTcrv8nfavaufxYYk2XPDSS1SSc
	mfxTy2SQYtCol2pKinInbtOPHAQ==
X-Received: by 2002:a17:906:e0d2:b0:7ad:b45c:dbe1 with SMTP id gl18-20020a170906e0d200b007adb45cdbe1mr13706305ejb.726.1668983980423;
        Sun, 20 Nov 2022 14:39:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ARpjfFDI1MJ8Veby3ldYkRuyL8mRhwTYL/RNxCCeXCcmahCflUwM/ugp4ZY0YXQ62/UzJPw==
X-Received: by 2002:a17:906:e0d2:b0:7ad:b45c:dbe1 with SMTP id gl18-20020a170906e0d200b007adb45cdbe1mr13706292ejb.726.1668983980253;
        Sun, 20 Nov 2022 14:39:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id cw24-20020a056402229800b0046730154ccbsm4479804edb.42.2022.11.20.14.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 14:39:39 -0800 (PST)
Message-ID: <79417219-537c-dead-02ef-c18bc93f83f6@redhat.com>
Date: Sun, 20 Nov 2022 23:39:38 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 00/17] media: atomisp: Convert to videobuf2
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <Y3Iy86AUKvoMz2l1@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3Iy86AUKvoMz2l1@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/14/22 13:22, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:16PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v2 of my patch series converting the staging atomisp driver to use
>> the videobuf2 framework, fixing MMAP mode not working.
>>
>> New in v2 is that the "media: atomisp: Convert to videobuf2" patch
>> now also contains moving over to using a per vb_queue lock as is
>> standard for v4l2 drivers. This removes a bunch of FIXME + checkpatch
>> warnings (due to commented out prep for this) from v1 of this patch.
>> This v2 also fixes the 1 new warning pointed out by the lkp test robot.
>>
>> For some more background info here are the still relevant bits of
>> the v1 cover-letter:
>>
>> This also contains an important fix to try_fmt handling, so that
>> the various supported output formats can actually be used by userspace
>> which calls try_fmt before doing s_fmt.
>>
>> So slowly this is starting to look more and more like a standard
>> v4l2 device (with all the complex pipeline handling hidden in the driver,
>> moving that to userspace seems to be impossible with this design since
>> multiple pipeline steps are handled by a single firmware program).
> 
> I completely in favour of the series, so
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> for non-commented patches, for the commented, where comment is a "side note".
> 
> For the rest depends on your action, if you are going to address as suggested,
> feel free to add my tag.

Thanks, I've pushed an updated version with your suggested changes and
your Reviewed-by added to my media-atomisp branch in preparation for
sending a pull-req to Mauro with these changes.

I'll also add your patch "[PATCH v1 1/1] atomisp: Make bds_factors_list be type
of struct u32_fract" there once I have had the time to review it.

Note since I send out this series I've been working on a bunch of further
cleanups / on preparation work for getting rid of the ugly PCI power-management
errors on (runtime)suspend/resume.

I will send these out as a patch series now and I've also pushed these to my
media-atomisp branch.

Regards,

Hans

