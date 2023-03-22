Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B4D259C
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 12:39:56 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id d14so5487039ion.9
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1679488795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsXIYR1MPYOgLhgbK7yRoUKgF3p75hv84JR40qJjkL8=;
        b=St9TR1J8Ta0zC3p+s7hBN1vhvdI1VQ6ESMoIXwhlYPYOse7neLnQHcowzvaP3rJGiR
         F0AiZaLghrvT/GnDUv+Ck1f39sBWf79WQgtwsCyV8p8TUM8ZoNYhGj3CTvkVoHjUg2B9
         j1VnJsTTauzuxOBRbc7Px7GUIpOxcDIZy3ZF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679488795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsXIYR1MPYOgLhgbK7yRoUKgF3p75hv84JR40qJjkL8=;
        b=4RtsVKrk2pYmYaqbW58iKbIUZcwD0BsS3BlWZ8bN+pnzktu9l8BuRIZqYXYZaMZ8uG
         ZqfEOKEtDjAC52K1VROHONArW2PMktzdNgsEHHt/3D6tMtjqCF9A1H2OmrDDp1w//4oB
         04KZEMKZ2sXIU8nXJT+ZX0NNeOo+eW7wVyNVyFxAKeolI51Y9y8Pil5fHMD1OTFJREJt
         XzxHoYntM1+OA+XrWaMSwxYHi42cnl7mcgAtUUS2HMZCW5/Q7aTSo+la7xgqxdfZj3n0
         EXVKsFsN/aNVGFykDrwKKyh/nzA/wK2asUUsDbt/Nqu/MQw+r7PsTP1i7G0XMy/EM6nS
         G9pA==
X-Gm-Message-State: AO0yUKWtGlbcfUtRoSsrxVZjAoIEQZxZl0qKyWH61KjxODCo8SQLd5xm
	VpIbuA2QIVnwfqs+Wq2/vmuRbQ==
X-Google-Smtp-Source: AK7set8N+UE/kMHzN6AgpMFOxmDiirXuWiUOOXCMBaWrIsMOL8tS1r5FYkFwyoIiwZOe2WNFF71VMQ==
X-Received: by 2002:a6b:4406:0:b0:758:b4eb:cec9 with SMTP id r6-20020a6b4406000000b00758b4ebcec9mr773044ioa.2.1679488795164;
        Wed, 22 Mar 2023 05:39:55 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id c22-20020a5ea916000000b0074c80aa17f0sm4470973iod.0.2023.03.22.05.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 05:39:54 -0700 (PDT)
Message-ID: <b1427fb9-1ec1-a5b7-8f1d-9751d4d13b77@ieee.org>
Date: Wed, 22 Mar 2023 07:39:53 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] staging: greybus: use inline function for macros
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>,
 gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230321183456.10385-1-eng.mennamahmoud.mm@gmail.com>
 <2e869677-2693-6419-ea25-f0cc2efcf3dd@ieee.org>
 <alpine.DEB.2.22.394.2303212140480.2919@hadrien>
 <5efa6e6d-8573-31de-639a-d15b2e9deca0@ieee.org>
 <alpine.DEB.2.22.394.2303212218500.2919@hadrien>
 <48674d8f-9753-780c-f37c-f83ea2855ae6@ieee.org>
 <eabacc6f-c7fb-ff33-26d1-271537fb4760@inria.fr>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <eabacc6f-c7fb-ff33-26d1-271537fb4760@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/23 5:00 AM, Julia Lawall wrote:
> 
> Both seem to access the memory directly.  Maybe the example is too simple,
> and the compiler is more likely to optimize aggressively?

Yes I think so.  This is a little unrelated but the
"inline" keyword isn't very useful because the compiler
(at least when optimizing) already takes liberties of
inlining code that it "knows" will be better done that
way.  Same thing here.  This function is so trivial
that it's almost certainly going to be inlined.

So the benefit of a little helper function like this over
a macro is that its types are specified explicitly, and
there is no chance of macro arguments be duplicated or
improperly used in the right hand side.  If it's not
inlined it also would normally generate stuff on the stack.

The benefit of the macro is you can do things with the
arguments because they're pass-by-name.  But you can't
expect there to be any efficiency benefit.

					-Alex
