Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E0E29CA
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 12:33:08 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id x11so62796600lfa.2
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 04:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6OXgethaEVSuGUoIJLKI5iFIA2Ipk0lRmZ63qBolC2U=;
        b=bjzIM842rRwvViFamRup3z3aJEBDNp7tCRmFuDoDFiae+gjUp/49PjKa6CKTbB7yYv
         7Z1SNIrNyT0oiEKpdGzIWY9S4DYtb6f2jcALkn5pfIduq0u9DAcszAiVaHtLj2TcWVtY
         9/hRDuojtmeYIAYlGpFABxXn1+j9bxJX282Z+TmzV4lz3kDfX4Q0L6j0wGVZYAGlrnp8
         LFnDKoCNuDDGK98uR5kJOB+1zUWNaGTXbJ66kpocACrDYHIROvr/KU9gC1JM0TL0q/oC
         v7kAsj6beUP8QzdL4Vk83pv4lkG9tD3VcWiYQKFZHJ/FdCSK4HPIIvVman6zEztEb5vs
         TtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6OXgethaEVSuGUoIJLKI5iFIA2Ipk0lRmZ63qBolC2U=;
        b=VorytOlQlp/Ytgk1p+cbu2ijDE/nYL4vbA7bfsup/7KuYmlrhFGlA8eeRFNplkqkMY
         Y3XMk/lwThj0/BWXDWK+uyNswk0fTDKr2/+rlq0yf+CPzfrMQnnxZQ1l1FeVGzpslS7Y
         Aipo10PBFj/4LumYlG1v1BMtUFtX8BaUcL1NP8NlYEcuj1zgqH2kChWDrdrrkDgriihE
         ffxAk7shHzj2y6GxdYE1Ms2yuzCoB9ocV7x/D5vIXni11N9FNMebmF4+6dCkM2748MmN
         2o+etIbc4Yj7YwBto9Fo2F2p7zu9LQJ32baNCs8OxRnGRgChyKRHYdE2WOAax5t6+BZ2
         fP5Q==
X-Gm-Message-State: AOAM533emMapUDXo8Jo+z9NYG6mhWo9t7yFq9gaXPaO6aM4ZCAUOalnB
	J9p/XynJlC8l/gmUHMJjykY=
X-Google-Smtp-Source: ABdhPJwNnXi9wLqx15NOubuOprn7fwXwbrmrm5p4w3yPdbLl0N6yVTJHJzunjw70CL9Fl5B0tHa8IQ==
X-Received: by 2002:a05:6512:3d12:: with SMTP id d18mr20260673lfv.213.1643200386593;
        Wed, 26 Jan 2022 04:33:06 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-126.dynamic.spd-mgts.ru. [109.252.138.126])
        by smtp.googlemail.com with ESMTPSA id y11sm74999ljj.69.2022.01.26.04.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 04:33:05 -0800 (PST)
Message-ID: <ceedff4c-3233-23c7-41f0-183fa8d75c9a@gmail.com>
Date: Wed, 26 Jan 2022 15:33:03 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] media: docs: dev-stateless-decoder: Document frame
 type flags
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 kernel <kernel@collabora.com>
References: <20220116185556.10657-1-digetx@gmail.com>
 <20220116185556.10657-4-digetx@gmail.com>
 <8be37d34b7090e3d3adca5b0d298c4b1b5639fa1.camel@ndufresne.ca>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <8be37d34b7090e3d3adca5b0d298c4b1b5639fa1.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

25.01.2022 23:37, Nicolas Dufresne пишет:
> Le dimanche 16 janvier 2022 à 21:55 +0300, Dmitry Osipenko a écrit :
>> Document that frame type flags must be set for the coded buffer.
>> Decoders, like NVIDIA Tegra h264 decoder for example, won't work
>> properly without these flags.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../userspace-api/media/v4l/dev-stateless-decoder.rst          | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
>> index 4a26646eeec5..845f4481d34f 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
>> @@ -271,6 +271,9 @@ A typical frame would thus be decoded using the following sequence:
>>            we are not sure that the current decode request is the last one needed
>>            to produce a fully decoded frame, then
>>            ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` must also be set.
>> +          ``V4L2_BUF_FLAG_KEYFRAME``, ``V4L2_BUF_FLAG_PFRAME`` and
>> +          ``V4L2_BUF_FLAG_BFRAME`` must be set if relevant to the coded
>> +          format.
> 
> I think I would rather keep this in the CODEC specific APIs (BFrame being an
> MPEG specific concept). If I knew about this before we made the API final, I
> would have added the slice_type bitstream parameter in the
> v4l2_h264_decode_params structure. But as the types are rather limited, I would
> preserve our "reservered" space and make that part of the
> V4L2_H264_DECODE_PARAM_FLAGS_{} instead. Do you also need that for HEVC ? (do
> you have HEVC on that generation of tegra ?)

That generation of Tegra doesn't support HEVC. I'll try to move frame
type to v4l2_h264_decode_params, thank you.
