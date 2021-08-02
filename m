Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE28F72
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 14:49:39 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so7031990oth.7
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=otW4PBFzPFP9S9Ll8i9O95kKgdyBa3g6lebgB3vbVvk=;
        b=d6CAnGX8yOnGG/zxuBmSZOHU4DNyBI4ifgTPny+0XVmbMv+ib7OFp8CJWMyZf4AhOC
         ZLnO0IyakO4PvT4yXKtoMZJ94cmEO+Wm2H4yVJMxeYnWafGLyLJRsStJks1d2N+sGT7a
         ayOuWHALni5bXJUGAFDswJiLGq6Z/LYgiQ4O82JTQmb6muNTjAYX6R1f0L4Rictqs9m2
         AmvBdTUA2WXZQwxgjDJVZ4brlEIZyzP4EnfP1FgBe/4HOQ8k/IREeVdUGn5pcykn4q8G
         Jv6mE8WPul5vudDCn9j6DP+UVzUx5lZ2FKZ1Fj4Swsz9xEJ6sh4cnyW9qhDM5O3FFq8u
         wF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=otW4PBFzPFP9S9Ll8i9O95kKgdyBa3g6lebgB3vbVvk=;
        b=Czx0zxhRXt2COne7t4drpCRfQxpy21jWuBG9NHIhDgYRQRleg3gkjNcbLrwycU/i43
         ZHSI/Bg3X/JTVNzODgSFR5WEiLS/NUSfRW2amZymH1kJRE68oX4cXgUTJouju6W2c/4S
         Fpsznp6+FJ07ut6DEB7HZLrYV45n6m9lDXWpzMZivTBEGsrYzOKqb+Cy3PWRPX/ixKeS
         oJP+hf0fBzcdSEbiXCufnHObHlVnPnM+gMyuRsF01dRP0pj3M/0dD+7Ixxez0wKEOhrg
         TlHyqhtaoC8w4kowFlF+3hQmHZwyDAtMgyI1qmxznxGB2CrQ7fP2rmaugJDuKsCpxydW
         W+iA==
X-Gm-Message-State: AOAM530dFrUOirIvEaMz9POGBqgGtPWvVG8CeyjYNCACAE2/ZtULrRZD
	6SL+oNsd0mD6+9i+7Cw7t6tj4HyJcJ8=
X-Google-Smtp-Source: ABdhPJwkQa8mzAtjz83cHzUjPFU6MFgJDPI5BdaOOjjsKW/OqSD1pczoT3uqI231xEy9CyWBZSiqug==
X-Received: by 2002:a05:6830:19ca:: with SMTP id p10mr12194541otp.267.1627915778708;
        Mon, 02 Aug 2021 07:49:38 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id w35sm1879354ott.80.2021.08.02.07.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 07:49:38 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: kernel BUG in new r8188eu
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
References: <80042e9f-6811-38f3-010b-1c0951ba88db@lwfinger.net>
 <YQThm1A0Up1m4l1S@kroah.com>
 <c2a6746a-24e6-6888-9208-32fccebb3fec@lwfinger.net>
 <YQY/tfJJdBVg/mwf@kroah.com>
 <cef19337-5ff3-c0cd-33ef-4f9990bcd4ec@lwfinger.net>
 <YQfKohnSRWHjlht6@kroah.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <4f3e91f4-3d7b-a580-3134-757614d92491@lwfinger.net>
Date: Mon, 2 Aug 2021 09:49:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YQfKohnSRWHjlht6@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/2/21 5:36 AM, Greg Kroah-Hartman wrote:
> Ah, doh, that was my fault, sorry, that patch was incorrect (odd git id,
> don't know where that came from, it's a different id in my tree.)  Let
> me revert this commit and then will redo it correctly.
> 
> thanks for finding this.
> 
>> There are lots of these on Ebay from $2.47 up with free shipping!
> Any hints on the name for how to figure out which devices are supported
> by this driver?

I do not why my git id did not match yours.

It was no problem. After I determined that the original code was correct, it was 
an easy bisection - 6 cycles with only r8188eu needing rebuilding.

The driver supports RTL8188EU and RTL8188EUS. The name comes from the 8188E, and 
the U means a USB interface. The S indicates a new design that appears the same 
to the driver.

Larry

