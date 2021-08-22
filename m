Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201133FC1
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 13:31:35 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id y6so26241095lje.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JsMbuvBD0CchbCI3lgM2niPcU+m6IwFJ9H/VVzweq2Y=;
        b=qqC9mwg+6tew+qt42fhQ14SEJoobc+VZ/le58VUqaa7Qw1gMu+oeD54wymply9L2rm
         H25a8c1/F54keEf2e15xL42wXTinMoH/teuVA/0MUblGhJjuQIqsG3HHp4jYdJk7IONJ
         7/c9yNiy4fFH1X2gjMIGSrYBZMHyiwZbru1r1vyWkDb7C9DjG5Vo3hayUkD4vWuxaCSU
         WsGWTcr+815ZIc4mB4R+TjchnrBuUvI/plsPw5a6rEp7oEDpLSsbZUr6hTq4eCww3tT5
         WGe9on24hMKiGK2fpx6MOx6JODNvDfU622IYJ8uFq8SmB94VToYXxmAgDZV4b5An0jb2
         YVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JsMbuvBD0CchbCI3lgM2niPcU+m6IwFJ9H/VVzweq2Y=;
        b=XhjIGeQl3tCsqzjUpdzcQ9KWPgGgAhDycnCoXjpR0gwL3/XT73K3duoAai0PwXZEH1
         iDI5XXf8t6k4RiHPbEowh8kDlAFY05TkcFi0knR06w7CxOsD1WV2pvJqyWWDaLL3qq1j
         FgDdZjKTq4Qbcqp93qR9hsXmqVcbEzs/crhmzdpZFXgidZa8mnJZG9w93SLwzyxSZ6lR
         8WEvo/CSiNttDhzk4eKfx/o8id2V8iQEVMQpV7aVcHMqzh2zb7HVHf7wvMQFBcg1t8Qu
         DDQUz7w5SuWbsdOrpqXnzOhx6qZwecXHHON5lAmaX8fkOD1doOmukj2AItVkipRWmFH4
         kwtg==
X-Gm-Message-State: AOAM532kNHwDKj1GOCiiPcYTEJCMxOZzh6Q7kbU+atshK0jCO9M0mN1T
	qdsDqSJRNY5a17OJHrglBJM=
X-Google-Smtp-Source: ABdhPJykU0SLLk67B2neMVBqAhpddgV0Wea55aoiAjZl1Yff4haybs3qGnQUCwCLFnFC87DuXDXiIA==
X-Received: by 2002:a2e:a261:: with SMTP id k1mr22481980ljm.509.1629639093250;
        Sun, 22 Aug 2021 06:31:33 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id bn3sm1180121ljb.18.2021.08.22.06.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 06:31:32 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] staging: r8188eu: avoid uninit value bugs
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
References: <cover.1629479152.git.paskripkin@gmail.com>
 <435eea22-da31-1ebc-840c-ee9e42b27265@gmail.com> <YSJFhmTs74PUyo8b@kroah.com>
 <2244219.zNr1yEsLHP@localhost.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <6182ed46-d79d-7f66-c7c0-096486410b4d@gmail.com>
Date: Sun, 22 Aug 2021 16:31:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2244219.zNr1yEsLHP@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/22/21 4:21 PM, Fabio M. De Francesco wrote:
> On Sunday, August 22, 2021 2:39:34 PM CEST Greg KH wrote:
>> On Sun, Aug 22, 2021 at 03:10:56PM +0300, Pavel Skripkin wrote:
>> > On 8/22/21 1:59 PM, Fabio M. De Francesco wrote:
>> > > On Sunday, August 22, 2021 12:09:29 PM CEST Pavel Skripkin wrote:
> [...]
>> > > So, it's up to the callers to test if (!_rtw_read*()) and then act
>> > > accordingly. If they get 0 they should know how to handle the errors.
>> > 
>> > Yes, but _rtw_read*() == 0 indicates 2 states:
>> > 	1. Error on transfer side
>> > 	2. Actual register value is 0
>> 
>> That's not a good design, it should be fixed.  Note there is the new
>> usb_control_msg_recv() function which should probably be used instead
>> here, to prevent this problem from happening.
> 
> I think that no functions should return 0 for signaling FAILURE. If I'm not
> wrong, the kernel quite always prefers to return 0 on SUCCESS and <0 on
> FAILURE. Why don't you just fix this?
> 

That's what I've done in v2. All rtw_read* family will have following 
prototype in v2:

int __must_check _rtw_read8(struct adapter *adapter, u32 addr, u8 *data);


Was it your idea, or you were talking about different approach?


With regards,
Pavel Skripkin
