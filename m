Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385A168
	for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 10:43:38 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id br17so68846566lfb.6
        for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 02:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Oq4iCc0Wwww95pZLDL+Et/XTeCWCBjBihbZj50b8h3M=;
        b=b6JxSCncymDWIYKs/NDxFeWUhfO9T3aGxAmnNRbuKRFctelJmHrCxc4GgDoe3VLLb3
         H+jk0CebLDbcWRvUDksG2L8oAF0Kd50Cd4Ccjby/eqY+ih62XseR6fDqnYjZOL1KcK5z
         RZkJMoz5oyrO9S3yTNCbP+eVb++NDCh6RMaF/Gxo1gEn6vnh4IZOYV6iEqjvBd07fEC5
         u0pEF3fZWNJlluEyfQCdEp0W9j+28v7/OrxvLtFvE0/O6v/0fWneShjpSDGDZzO+S5Tv
         zEQoalJQmoyjPFcUIm99RMIPu4Ew29iK4JMB7TWEfmmJGy8H7VaroWLXy42yT2BiXqit
         HTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Oq4iCc0Wwww95pZLDL+Et/XTeCWCBjBihbZj50b8h3M=;
        b=CdSUG/nWYZHY2Ra4TsZ/xuQN7UO5+K9JQvjUTZjE2cvymwYzSIw6uokfyapXriokhY
         utZAtF3SQocXNzdjpXEkciRirhmVAurCdIo1DmegYBT/LCgcqak8z1v2BJoZVGPl06O/
         8yTtA+o+yeXK+US4BtVzBaTdG36qmzIZ0mieuP/ewxtxa9liuxmaaggZ55V59kXcqu0Q
         SWW1tZg8i5nblwiKkxGUsVDFxvIgbZ6LhrlZGtSnj+JqLqxSvZFoSl7TvcwD7Vg2mquI
         33/FvVrurKnym4v/VGXSP9tw+BJsTKz2pm+V87tjTpjBOMSMg8G4wbmUy3XIx62be/Vr
         SXSw==
X-Gm-Message-State: AOAM533GE4w+ID6GppNte4hxnatVT6Joxg956D46p0AcThHc9nLGnGU7
	/Omn6zWyJjk9STdR66dINOY=
X-Google-Smtp-Source: ABdhPJxLLjKJ5WZW73z7MJeySmPKJaTlIopLrMZq3VtSCkLPKbKCOllEW97jssTlrt8X8H4+5SYagg==
X-Received: by 2002:a05:651c:19ab:: with SMTP id bx43mr9860035ljb.112.1642502617075;
        Tue, 18 Jan 2022 02:43:37 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id q9sm1374535lfd.266.2022.01.18.02.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 02:43:36 -0800 (PST)
Message-ID: <f73de032-6461-c665-940d-9cb0c5f63869@gmail.com>
Date: Tue, 18 Jan 2022 13:43:35 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/2] media: staging: tegra-vde: Support V4L stateless
 video decoder API
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220112153952.1291-1-digetx@gmail.com>
 <20220112153952.1291-3-digetx@gmail.com>
 <e5bcc0a6d283ce3ed0cfe7d318232fb878c1b47d.camel@ndufresne.ca>
 <0ae51264-8578-0b4f-4348-7f7a239c98dc@gmail.com>
 <26cd15bc1c5dfe3acf8bb280cf7542657cb8b291.camel@ndufresne.ca>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <26cd15bc1c5dfe3acf8bb280cf7542657cb8b291.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

18.01.2022 05:43, Nicolas Dufresne пишет:
> Le mercredi 12 janvier 2022 à 22:04 +0300, Dmitry Osipenko a écrit :
>>> If so, I may suggest to drop this fallback, and propose an amendment to the
>>> spec, we can require flagging KEYFRAME/PFRAME/BFRAME on the OUTPUT buffer,
>>> this
>>> won't break any drivers/userland on other HW, and will benefit possibly
>>> other HW
>>> in the future. I can volunteer to patch GStreamer and LibreELEC ffmpeg if we
>>> agree to this. Not sure how it works for Chromium, or if it actually make
>>> sense
>>> to support here.
>>>
>>> (expecting feedback from Hans and Ezequiel here)
>>
>> Amending the spec will be great, although it's not clear how to flag
>> frame that consists of slices having different types.
> 
> As per spec, all slices of a frame must be of the same type. In short, there is
> no problem, adding new flags to the decode_params.flags is fine, and is backward
> compatible. I had a second thought that I'd probably prefer this over using the
> v4l2_buffer flags, but either way seems backward compatible.
> 
> In H264, but also other CODEC, slices are have two types of parameters, some of
> the parameters are invariant between slices, but still duplicated so you can
> decode some of the frame, even if the very first slice is lost. We tried our
> best to place all the slice invariant parameters in decode_params to keep the
> slice_params as small as we could.

Could you please give a direct reference to the spec? (chapter / page or
provide quote)

I'm vaguely recalling that x264 encoder was able to generate such frames.
