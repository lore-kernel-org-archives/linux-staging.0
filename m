Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE2170
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 18:41:17 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id t128so4972434oig.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 11:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=glQ1wSp0cqHy7TcgHs3y8Ye4M+8JjbKl4yrfu0vDk98=;
        b=BXTRIGdErhR30/8J7aP3ER+gW3crTezczXQH/X7Et2bOcGcCiEfBDANaMhFLBmhsVl
         bWY0qkXqjL/vVOnxgkT4VKdW678ANwb2epfWegGiXmCHLK0Nh68sKNTBSyxKQFPNL4Ii
         peWSuroAs3Lm3Rwt9DzeyyojmsZ9dzcTEQWfucdYVZkH/pMJZIRUS887h+GkHP6Q5BD0
         WU8N5wfrNwbe1BX3mkkxeA2c7Xj3u9ugw/lr4A6uyZD/KlitFQE6jMz9dAS+ohCcc5uN
         t26ZOoNj9fX0XlfEEMVw3IEOIdWZYVGaSlFgLCyRga7/w+F/eVBoRzmT02ZwEyehU0ta
         kN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=glQ1wSp0cqHy7TcgHs3y8Ye4M+8JjbKl4yrfu0vDk98=;
        b=YWBi751BKXEclY975p2TGgTMTzparNGpTbD4sRInSeMR4Vv2zfTVv7RHHIT3aimJ0c
         0djZ21U5hXZcvLXM3YLndvfbwigKBAQP36AM/OxZXyKL/Yistoq5L+Q2n2/0C45rV7fW
         /D4OwnHb1exaoriADALFDtQp3r7c4zoNpdsFBzxKV2seIjUmPrcEIki7pXSaasJM9/uy
         Ut3YD6AQ3jrtNsmQKqXOtUr63vMX4rqGlI6+HlPTA6JRxNNaxKipDoW/zXCzwhYqA5Bt
         1ZhOrbBX0QwJP7uJS9fV0Zz8PV5qYBR5RIzBXUMYiB6PCE+j8OLx/qFNT1/cgdBUOw9K
         9ECQ==
X-Gm-Message-State: AOAM533RbHA0zAxIff2EZ1yXMTz1BV5wbBROMvD8leX5YtG+UL/BXdtw
	DpeAjBl+m7nSb37XmrKrsKc=
X-Google-Smtp-Source: ABdhPJyA1xfKRdihoGoCb6mMui50beIhOOs5Dxw/NdBHH4FQsYgOvkbK0L9o1hQiX2h87B7unbATwA==
X-Received: by 2002:a05:6808:905:: with SMTP id w5mr570400oih.63.1627497677098;
        Wed, 28 Jul 2021 11:41:17 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id e144sm125904oob.5.2021.07.28.11.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 11:41:16 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH v4 0/6] staging: r8188eu: add newer/better RTL8188eu
 driver
To: Greg KH <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, fabioaiuto83@gmail.com, martin@kaiser.cx
References: <20210727232219.2948-1-phil@philpotter.co.uk>
 <YQGenmf2m3Tu7FFg@kroah.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <9902deed-021c-ad37-7fc7-f4279886c683@lwfinger.net>
Date: Wed, 28 Jul 2021 13:41:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YQGenmf2m3Tu7FFg@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/28/21 1:14 PM, Greg KH wrote:
> Hm, I thought this would be in better shape than it is.
> 
> Right now we have 107 .c and .h files in drivers/staging/rtl8188eu/ that
> come to a total of 44597 lines.
> 
> So we are taking double the size here?
> 
> I'm all for putting a "better" driver in here, but this feels odd to
> me...  Is there major new functionality here that is not in the existing
> driver to justify this?
> 
> Ok, let's see how this goes, I'll give it a few weeks to see how much
> can easily be fixed up to hopefully get back to at least close the
> existing driver size...

The major new functionality is that the new one uses cfg80211, whereas the old 
one uses the WEXT calls.

It really is an improvement. It just needs a severe cleanup.

I warned you that this code was rough. It took me several weeks to get the old 
one "ready" for staging. I never devoted that effort to the new one, and you 
wanted it in a place where multiple authors could improve it.

Larry

