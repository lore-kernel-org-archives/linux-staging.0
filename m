Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C972C82
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 13:04:51 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id x23so9667070lfc.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 05:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gnqs583Y3BfrRG808xRqv/vPmRDdR+9lKZ1Lg2jQfbI=;
        b=BsaZ4GwHyazWq9JVPuDeG1vlH2x1tBbDiP475fIiL2IdIrJRDyXLfC+W8VEZgSYlAb
         Vp9etEz/6tJ+DOc+vzVEQeMboHuHVGBZiYFbSnGsRAGCdEMdV4JzYS1vXhsjZOBZNhzS
         b7tiENehrDtN465pMUWL4f0PDVmdtIKkKH27NEiEmmAQZsTfhnNhlix6PN/4mxkunLPy
         0gxSYF0ETZtjJMeIhxqNvYGMUzycTXbkKKoSRJMHNmoGwCkvYrtHnysfgNnvskR68yqq
         FlFpxvgRp5YNjRkqLMkclBX79z/nwhX+A0LQNzUMRjrqxv1rjqz1Q/i4SQRy4yivJ/oZ
         7d5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gnqs583Y3BfrRG808xRqv/vPmRDdR+9lKZ1Lg2jQfbI=;
        b=HQlgjmt5JkjaxlK6UHc6fvs/MyqZubPtgwSBYMHrA4dVd9oaVTdWSCV9qpBHTFgtk8
         TEOAruPazgcwqdiBd5mzoQ1a88XzW+hJlNzYwps8CZ9x8fnKVcfyzM4oSh/aPvg4iphF
         XGrOnOoqvhnYkubLa3gpUqPUC7bwM/Cq1leyENfLKYMzOy7iDqPyzK96i7jATNo/fRzd
         En3q0th3HSbJpzNCYHzX574qIFO28WTPBNhSUO64Ueh102v07oIzU/ZQw7erXY6kyfrv
         pv+zFDdUXgvoD6QW8AK7p+ImOHcxpDOqRfpH7HGv3CqPjLvJdS4Br8YHWuS9XdEGIcMU
         AaBg==
X-Gm-Message-State: AOAM533nqzTwkovOSBoXI2TUmFd4/7933gXjDcF/wf71hMGoNO0a142W
	itOifkapKavtv3ugEgAAfY2agnj9mGs=
X-Google-Smtp-Source: ABdhPJzvIP3mbjCdT8pZEuhEz/3lHXJySNRPwqv2bHS10OOs2JPOZZGxLqBJw/HAN/JN6I3YiC0v+g==
X-Received: by 2002:a05:6512:3ca0:: with SMTP id h32mr5383923lfv.244.1643115890029;
        Tue, 25 Jan 2022 05:04:50 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id f20sm1202719ljk.73.2022.01.25.05.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 05:04:49 -0800 (PST)
Message-ID: <fa0a2717-aca7-a323-2e57-93a9f7b8c371@gmail.com>
Date: Tue, 25 Jan 2022 16:04:48 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/10] staging: r8188eu: remove smaller sets of DBG_88E
 calls from os_dep dir
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org,
 Larry.Finger@lwfinger.net, straube.linux@gmail.com, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220124224415.831-1-phil@philpotter.co.uk>
 <20220124224415.831-6-phil@philpotter.co.uk>
 <67ddc4d7-e19f-7c9d-a4b7-4eb555830ea1@gmail.com>
 <20220125125942.GS1978@kadam>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220125125942.GS1978@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 1/25/22 15:59, Dan Carpenter wrote:
> On Tue, Jan 25, 2022 at 03:48:32PM +0300, Pavel Skripkin wrote:
>> Hi Phillip,
>> 
>> On 1/25/22 01:44, Phillip Potter wrote:
>> > Remove all DBG_88E calls from the os_dep directory, other than those in
>> > os_dep/ioctl_linux.c, as this contains almost 200 on its own so will be
>> > done in a separate patch for ease of review. These calls do not conform
>> > to kernel coding standards and are superfluous. Also restructure where
>> > appropriate to remove no longer needed code left behind by removal of
>> > these calls. This will allow the eventual removal of the DBG_88E macro
>> > itself.
>> > 
>> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
>> > ---
>> 
>> [code snip]
>> 
>> > -	/* 2012-07-11 Move here to prevent the 8723AS-VAU BT auto
>> > -	 * suspend influence */
>> > -	if (usb_autopm_get_interface(pusb_intf) < 0)
>> > -			DBG_88E("can't get autopm:\n");
>> > -
>> 
>> Didn't you make a function change here? I didn't test and also didn't find
>> any mentions of tests in cover letter.
> 
> It is obviously a bug.  Please avoid ask rhetorical questions or someone
> will answer them.
> 

It isn't so obvious for me. Might be Phillip knows something about 
8723AS-VAU BT (whatever it is) issue.

I prefer not to say "it's an error", when I am not 100% sure :)


With regards,
Pavel Skripkin
