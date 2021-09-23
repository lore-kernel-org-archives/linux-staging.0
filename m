Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E313FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 11:13:28 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id m3so25297771lfu.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=z0SFg5XPiL4WJby2z1leZXw+OOsnwhmSnsCcKEN4ygk=;
        b=TceJ00O86yDAQeqnnk1WFSsXG+WQofeifCY5VdqnzSTOQqXfsfx3rp1cYjGB7c+CV0
         7Niq6yY0S9iG0npsOQFU0PYswqr6MUMiZje8Z8po+9evq77oAse15QUFttiFaupZttjE
         7ev5ZBmoeVe5TJeyBzRqPb3xoLM17s39airAjz/0dG/KMz/qyJPaPqMHZNPo8DQE1QNp
         +i9ckLxp4jX656M6rBW+DPcsBT1cmiqJhCEYbNISAjGKTrwUyOqS9S8+jCw4SgvsnOSi
         Xbi2L7O9eCrnhkFmGuuG3HS26y2zmO3N5+A/3HY9I9KAprie+0Rva/rt9n4CbLNk1bOw
         Yi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z0SFg5XPiL4WJby2z1leZXw+OOsnwhmSnsCcKEN4ygk=;
        b=FW8yEBivsoAjTU7f1brsdYuKVpbFqZjycKPz0uAo67aOEkSc5BSgGkIjgVz3u05V3s
         2AQo8vraRbhFBdv7PArFEWFDnyDo1QwVtHJT8OkfrWjR9sO1EPMBmRIR/kEtWO0pX7B5
         oyHzpGx2E+ug0VuEoVhg1SoLZr3GEUijohfHnNCDzmxjPrOvVNqTnmlPS3kMo9qjr3o/
         1XWPm0/br1j3Z+1hngRB8GcbcB8idIqUN1+OM4JZEM9qsPe8uCLj2wBwUNYiXjiv05kP
         +OmMyYA0DGJE5djmKQDlTvH4119rS2ytlbPBxb+jKwS7XHKSXMgVmsRAoZWca5J8oQYO
         bOfg==
X-Gm-Message-State: AOAM532bHd4fj91NSsYDbUfkZOgpcW8zpOlduZGD/rtTv/gSVi9F6fY6
	/XsyJMYY8wGQVME97MZxoNE=
X-Google-Smtp-Source: ABdhPJygcHA8aODCwyu08fok6DpFLAp77494U9g/ZtlmPj1p5+Y305thcEH4TqTlc/GRwIYvaF65Iw==
X-Received: by 2002:a05:651c:170e:: with SMTP id be14mr4340632ljb.487.1632395606947;
        Thu, 23 Sep 2021 04:13:26 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.246.37])
        by smtp.gmail.com with ESMTPSA id v8sm338366lfe.6.2021.09.23.04.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 04:13:26 -0700 (PDT)
Message-ID: <4a556764-9a0a-b453-c2d5-16c1a8cbea61@gmail.com>
Date: Thu, 23 Sep 2021 14:13:25 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v9 16/16] staging: r8188eu: remove usb_vendor_req_mutex
Content-Language: en-US
To: Greg KH <greg@kroah.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Martin Kaiser <martin@kaiser.cx>
References: <20210921181834.29677-1-fmdefrancesco@gmail.com>
 <20210921181834.29677-17-fmdefrancesco@gmail.com>
 <dd99d40d-297e-8d27-dabe-d0e4c633d391@gmail.com>
 <4434c136-6bfc-9a25-d0ba-f989c655fa69@gmail.com>
 <dfa76ffe-2306-01b3-9746-c9aa43c03398@gmail.com> <YUxf5TD55Bf2v09v@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YUxf5TD55Bf2v09v@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/21 14:07, Greg KH wrote:
> On Thu, Sep 23, 2021 at 01:12:53PM +0300, Pavel Skripkin wrote:
>> On 9/23/21 11:47, Pavel Skripkin wrote:
>> > On 9/22/21 16:21, Pavel Skripkin wrote:
>> > > On 9/21/21 21:18, Fabio M. De Francesco wrote:
>> > > > From: Pavel Skripkin <paskripkin@gmail.com>
>> > > > 
>> > > > This mutex was used to protect shared buffer for USB requests. Since
>> > > > buffer was removed in previous patch we can remove this mutex as well.
>> > > > 
>> > > > Furthermore, because it was used to serialize the calls to the Core USB
>> > > > API, we thoroughly tested the enabling of concurrent firing of USB requests
>> > > > without the mutex and found no problems of any kind in common use cases.
>> > > > 
>> > > > Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> > > > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> > > 
>> > > Hi, Greg!
>> > > 
>> > > If all is OK with previous 15 patches, please, do not take this one, it
>> > >    causes problems with connection... :)
>> > > 
>> > > I don't understand what went wrong after v8, but anyway, this one should
>> > > not be applied for now, since it's broken
>> > > 
>> > > 
>> > > Thank you
>> > > 
>> > > 
>> > 
>> > 
>> > Just to be clear: previous 15 patches _are_ tested and do not cause any
>> > misbehavior or bugs.
>> > 
>> > I guess, the stack buffer maybe the problem here, since it's the only
>> > change on this side since v8. I didn't have a chance to take a closer
>> > look, but I will do it on weekends, I hope :)
>> > 
>> 
>> Oh, I found the problem by just looking at the code with clear mind:
>> 
>> > -free_dvobj:
>> > -	if (status != _SUCCESS && pdvobjpriv) {
>> > +	if (pdvobjpriv) {
>> >  		usb_set_intfdata(usb_intf, NULL);
>> >  		kfree(pdvobjpriv);
>> >  		pdvobjpriv = NULL;
>> 
>> This if should be deleted completely, because we don't want to fail on every
>> probe :)
>> 
>> Sorry for noise... :(
>> 
>> Greg, can you take first 15 patches, if they look good and then I will send
>> fixed version of 16? AFAIU, you are ok with taking part of the series
> 
> Please fix up and resend the whole series as our tools work best by
> taking the whole thing.
> 
> That way I "know" you tested them all :)

It is true, but there was small error on testing side from me this time.

I am testing with qemu and I forgot to copy new driver to qemu's shared 
folder (it was busy day or I was already asleep, idk). It resulted to 
testing old version of the driver. Next day I've tested new changes on 
top of this series and found the problem :)

I am sorry for kind of lying, i've already fixed it locally, so it won't 
happen again



With regards,
Pavel Skripkin
