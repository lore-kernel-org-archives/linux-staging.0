Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D72173
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 21:08:40 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id o17-20020a4a64110000b0290263e1ba7ff9so679197ooc.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q28rl9kNUsAPWQWzzwWvjDv6rjv25WQeL3NBF08E448=;
        b=ioJMxrYAkzbjtt24YQYQGYTEF9s0rNZsuAGluyGyubekl6bLSynz2WwwtEZbZhaF6T
         dgq0yowAhFXDQjSrQ8Rdxu2YYceUSdUkN6Uobg6zge5/DLzWrrgQ5+QUCitfUcFRU5F0
         rs62QunBXcLUKvG19l1LyxiBE8cDX8iK+0ZX0lUlyU0T7J0OWi6RtuEXcG0grbvwv9yR
         c9yfezc+hK29MvSyaMSx1UXBdXbsvmMZigb4m2+e4IzQ3KpZ61GndQO9/NEXATt3ePgA
         hZ8ugNgaSAdVbwRTJ0mrZhHInZWI8cLWlmf3vAwxGbkYFPmyJlqug5KVmJ11EghFB1hh
         fWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q28rl9kNUsAPWQWzzwWvjDv6rjv25WQeL3NBF08E448=;
        b=YtNu8BgS/R/EXvvsrZOa9iUwav1BhMmTXBq1q9v7qOXtpGkicWUxuSudCM6b5O6ghC
         QF2dc+eaX22CCyaKxNt1UnqWBQGbkmrexC3vJE8Yx+KploS+hP1VqOC9XKTEdOoxjoH0
         I/Z37YjL/OlnD6btLO6+rXwm0LDisO8EhOcTukuYbml7YdJCHhL1Ydw/z/nBjZxFZmuo
         IDBwVPnGxuGVhWO1Q1AbKMciP5lozjFnmWPl6N9BiGkvOAnjXzE8SrSJCkvihb8nu+h3
         bpXbjnTu59Wfouz3MJpCpfP3w7t+6qJIBdh2ALDL4MoJABTYgqWqm0MO9xIgiSeyU69g
         Z3rA==
X-Gm-Message-State: AOAM532B8eJetp46SxFy159385OrDHLrxxYdEK2UE0F3kmky/kKmxg+2
	SpRTVRo9NYsvA1QJF/rZw3U=
X-Google-Smtp-Source: ABdhPJySKOMKjcpCFtSaX0UmA10jAADI/z83tQWzVQbpzR44aqsQqMSIA4d5/M6LI+QaSCrZchH73w==
X-Received: by 2002:a4a:241a:: with SMTP id m26mr3880957oof.76.1627074520107;
        Fri, 23 Jul 2021 14:08:40 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id x38sm3443379ott.42.2021.07.23.14.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 14:08:39 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH 0/7] staging: rtl8188eu: replace driver with better
 version
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, fabioaiuto83@gmail.com
References: <20210723004214.912295-1-phil@philpotter.co.uk>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <42086ca2-69b2-b2d4-893f-82418df2ec7a@lwfinger.net>
Date: Fri, 23 Jul 2021 16:08:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210723004214.912295-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/22/21 7:42 PM, Phillip Potter wrote:
> I had to break this patchset up a bit to get around the file size limits
> on the mailing list, and also I removed the hostapd stuff which is
> userspace related and therefore not required.

Phillip,

I'm sorry that I have mislead you, but the v5.2.2.4 branch appears to be broken. 
I have not been able to get that one to work.

The master branch, which is v4.1.4_6773.20130222, is working quite well. It 
suffers from the problem that when it is scanning, the USB receive buffer is 
ignored, but that is a problem with most of the Realtek USB drivers. As a 
result, the ping time to my router will sometimes get to 2 sec, rather than the 
usual 1-2 ms.That is something that I will try to fix. My suspicion is that 
scanning should be left to the network manager.

This version also behaves nicely with NetworkManager.

None of the source files in this branch have trailing white space.

Sorry for the confusion.

Larry

