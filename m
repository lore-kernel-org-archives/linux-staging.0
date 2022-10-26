Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85215EBF;
	Wed, 26 Oct 2022 02:46:30 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id z97so39311435ede.8;
        Tue, 25 Oct 2022 19:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otMyQVNwUCr9/v61glePdAqeCORbvdU0f4529W/48AQ=;
        b=Dj5la0z0+e0s/6NUxF2ZggIrlKZvsle3DarCv/Ko9HieUAMeysJ3fKNNgKQ3ii3FiG
         13VWx8B+sO9r3LRCwuh/mC/h5Kn2UKJVMd/FjSHgOiR5IMHTVIjTn5GKV5sYkTqsrY2d
         9Ttz4DyhjRshNjJ8vy1w0q/wN+Mt3j9NWerWZMFBvKET0hI88C1jD0Ts153Gtdb+VQWD
         ZPtGa2mvTczh2LIAwxL3V9PuUW6XpTNL1Xe8zy48AAuz3WLVwWpPsWyeXO4aS2mFP4CV
         vt+0uUDcdvJ8odINcvHf9WYH5kMjNw1bKOoWXdD3c2lbrNFMnUoomxIUqLFyQbzL9Wzi
         5alA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otMyQVNwUCr9/v61glePdAqeCORbvdU0f4529W/48AQ=;
        b=xn/AkYSP/fSBD7mzgJbQ/SbAJVVvmNg42Nfza4yJxlG+242JFmIREmBnaIZTl2AyW4
         t2Ru38jwtWi7/RQf1K3o3mnbHb1tpS7+yAmWQMd3YmxNsdn0xgNawmfvLnBqiFWh98W4
         5fS/barP0o7B6HpeQsC1rs0Yt84eqru89E+wtsPjzhrVJKKrAGc63MmbsmVIhLhiZXeC
         1lPtgGViPz4JgEmFgedv0x5dLuWefKMJGrinzbFSaKJiaBovy/mRotzTuB0Y6gWw9mhS
         /d24bRW71WYzj8A2Cqxwa7jbWGB2GPp3OcsgY460aSEgsufXmHOW04Cc9vmw0PzshSnu
         zc6A==
X-Gm-Message-State: ACrzQf2bmlAajjAv2VYksRQsehKrEsMtIZGyJRRq5uIa4iq1necgia+v
	uSrWhdU2mdTLh0lPLLOz2hA=
X-Google-Smtp-Source: AMsMyM7eC/+I2EXIQZWpl79J0alK4TL4Cf0xyvZdhVfunBLyQM7C/HSlxuWDjMVZQyYcsgS7YD9KdA==
X-Received: by 2002:aa7:cb09:0:b0:461:e6b6:4bad with SMTP id s9-20020aa7cb09000000b00461e6b64badmr10126319edt.27.1666752388625;
        Tue, 25 Oct 2022 19:46:28 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b844:c952:3daa:e0a:40ba? (p200300c78f2ab844c9523daa0e0a40ba.dip0.t-ipconnect.de. [2003:c7:8f2a:b844:c952:3daa:e0a:40ba])
        by smtp.gmail.com with ESMTPSA id h20-20020a1709070b1400b0078d85934cf8sm2221536ejl.111.2022.10.25.19.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 19:46:28 -0700 (PDT)
Message-ID: <6b13762a-704e-b97c-2eeb-d4533ac9e998@gmail.com>
Date: Wed, 26 Oct 2022 04:46:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/17] staging: vt6655: changed variable names: wFB_Opt0
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
 <62f69eddc9641ac9eb045edf8a9453bf36a02b36.1666740522.git.tanjubrunostar0@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <62f69eddc9641ac9eb045edf8a9453bf36a02b36.1666740522.git.tanjubrunostar0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/22 01:36, Tanjuate Brunostar wrote:
> -static const unsigned short wFB_Opt0[2][5] = {
> +static const unsigned short w_fb_opt_0[2][5] = {
>   	{RATE_12M, RATE_18M, RATE_24M, RATE_36M, RATE_48M}, /* fallback_rate0 */
>   	{RATE_12M, RATE_12M, RATE_18M, RATE_24M, RATE_36M}, /* fallback_rate1 */
>   };

In this driver the variables often start with a "w" for "word", "p" for 
"pointer", "b" for "bool", "by" for "byte" and even "pv" for "pointer 
void"...
If possible I would omit those prefixes for the type as they sometimes 
make the variable names even longer and you need to consider how to 
break lines.

Bye Philipp
