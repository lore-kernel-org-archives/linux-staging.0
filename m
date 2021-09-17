Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A803FC5
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 15:06:30 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id b15so15783481lfe.7
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=69GiEXKdxt+heGKGrbL9Gx4hEjgC+QbxrWSsOk2igRI=;
        b=NQYj7NnZDoDKkzXPvTD+hAVBr9Dkyab+NW985IjEd6ASiEXrJCd3ZHOVOGeO1tMg7i
         Ac/gNUpxC9X3+nTaa+FIY3AYYL6kvIF3y2YtdQOMO4haPe9jd5U6pG/LWhuNuiVf2ZKd
         PQhktx8xNYT+19D4vSVO8w/OFDUb3ki5CXa7cZKvXF0EvU8HjwGu/fEMKRGUD0EbQqqd
         002PnxwosU4JZYsTgaL+xtVIgpZGYB4C353WdU73LPD0Bh1Xj2QSNm0EImELfqs/c2cu
         fnj0VMX30d3M9Y3doLAUdLHdKcgoL0Sm4KntKdGn8nmPgSU2Ch527yrXEhrB9vhqzOpe
         fABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=69GiEXKdxt+heGKGrbL9Gx4hEjgC+QbxrWSsOk2igRI=;
        b=L3DHlxoNeBDtLgD68XUrGc4/IrxBQ/Tbs6ZS2j7IPBFzB8InlAarVt9avsoj9Mt81d
         f5nqjux9QGf6rpxw3swzYt6e/hn3bpwVkWn91vDBZsgDe7M6O+Az3StGRg1hqXVvU5Rt
         ledtCLDzJdyHwHatWG1ivz8TVlPPK0l0c5u23xWFkygql1OGzPyMUJr+C5IAkCdaxpnU
         yuHniFyeaANYMrFUDRB2los2Fg7r14k4DwCV6yzuETfUqvych8r/eqvm1W1Zm1/xAX4V
         jgWYJJnMCXNpOtzAbqTxQkaYJg8p8r4yhZhyyVyTVwPIPm8FDNO0I4ISF7smp/7/Alch
         kppA==
X-Gm-Message-State: AOAM532p/1ruVJUNxtY38E+GF0ky37nEANRagfHPLZQZtw9B9XW1dx4s
	cds9ebfx0RFPvobMPNFYTQA=
X-Google-Smtp-Source: ABdhPJz/TwYXrI1XJ2iaymgE0fildrBim7Lw6rJyEaWfVPSUeZ0fZO5TuStQyGxVQZG24EfK5iepmw==
X-Received: by 2002:a05:6512:10c8:: with SMTP id k8mr8591405lfg.326.1631891168976;
        Fri, 17 Sep 2021 08:06:08 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.49])
        by smtp.gmail.com with ESMTPSA id e24sm548860lfs.212.2021.09.17.08.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 08:06:08 -0700 (PDT)
Message-ID: <e993abd4-1cd2-b2ef-cae3-e97c12e46ae4@gmail.com>
Date: Fri, 17 Sep 2021 18:06:06 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v7 19/19] staging: r8188eu: remove shared buffer for usb
 requests
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 David Laight <david.Laight@aculab.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
References: <20210917071837.10926-1-fmdefrancesco@gmail.com>
 <20210917071837.10926-20-fmdefrancesco@gmail.com>
 <YUSsa+3NjQVGD9gb@kroah.com> <ef2a89f5-f68c-e7e2-9338-78e70dc41701@gmail.com>
In-Reply-To: <ef2a89f5-f68c-e7e2-9338-78e70dc41701@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/21 18:03, Pavel Skripkin wrote:
> On 9/17/21 17:55, Greg Kroah-Hartman wrote:
>> On Fri, Sep 17, 2021 at 09:18:37AM +0200, Fabio M. De Francesco wrote:
>>> From: Pavel Skripkin <paskripkin@gmail.com>
>>> 
>>> This driver used shared buffer for usb requests. It led to using
>>> mutexes, i.e no usb requests can be done in parallel.
>>> 
>>> USB requests can be fired in parallel since USB Core allows it. In
>>> order to allow them, remove usb_vendor_req_buf from dvobj_priv (since
>>> USB I/O is the only user of it) and remove also usb_vendor_req_mutex
>>> (since there is nothing to protect).
>> 
>> Ah, you are removing this buffer, nice!
>> 
>> But, just because the USB core allows multiple messages to be sent to a
>> device at the same time, does NOT mean that the device itself can handle
>> that sort of a thing.
>> 
>> Keeping that lock might be a good idea, until you can prove otherwise.
>> You never know, maybe there's never any contention at all for it because
>> these accesses are all done in a serial fashion and the lock
>> grab/release is instant.  But if that is not the case, you might really
>> get a device confused here by throwing multiple control messages at it
>> in ways that it is not set up to handle at all.
>> 
>> So please do not drop the lock.
>> 
>> More comments below.
>> 
> 
> We have tested this change. I've tested it in qemu with TP-Link
> TL-WN722N v2 / v3 [Realtek RTL8188EUS], and Fabio has tested it on his
> host for like a whole evening.
> 
> I agree, that our testing does not cover all possible cases and I can't
> say it was "good stress testing", so, I think, we need some comments
> from maintainers.
> 
> @Larry, @Phillip, does this change looks reasonable for this chip?
> 
			 ^^^^^^^^^^^

I mean mutex removal, sorry for confusion :)



With regards,
Pavel Skripkin
