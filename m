Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D55F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:01:48 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id o19so1101768edc.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s/KI0MJgK9QofyThEgPplyvQu0DKV1gNDZdKcA9WQyI=;
        b=J/kl1FAlhHjoQasXIFGD7dlz77iXZ2V/vmGwj+NcHuXR0qjRBbigEisn2b6x8dz60j
         j7O7OuQI1/gyBctQrWamL8kVGuip7e28UQ1uS7Tfz3awhbhTNDwvOBxIBfJJguh3zQDv
         uzaMf953kXgPABN6GcLXxBUVYIO7ePGdrMoKueAJRAdITLMZkaXQZt7Wku5fKSDJhfaC
         5ZA35tUp5GRptmuS2q5hMFAdmqBu8jOHqLXkvDmgLjDCb16EqYISEm7OuTBScJ3HXWIN
         XJ4OVMP76IKN0cutJdcLUZEIu/wl95S1XcLz9DwliKqOd2PldLGYHbmScJy2djLmYhdC
         MvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s/KI0MJgK9QofyThEgPplyvQu0DKV1gNDZdKcA9WQyI=;
        b=dqH16cYnru1TvMQz+g6K31HUBZrhe4pttJSc65+J8UjlUrDLS4gSBaRLALndYWDblR
         BMh0PuLw/zT1M/40fycttO9c26Uik8IXzPMMbVbhLdV30bVeOad2B5imcL/tnxJjQHhb
         vutn0rnsu5D3snNR6b1EgaaBfiDYfcWa/pDSTvyGHX0Y/dsm0L47vnCSj6li+m868Z6h
         YisjqUoFEssSZS8kGV5OMm5u2V/soKujgzXmczSPijr2TiTWxEeRp9zLBr3KvgDnStxB
         GucxK/dmsZEnUxDgglQD/3Ca02MjO5JAKWaNqAlwrOi3kpgfkqbhhC8q7pStnyjdRa4e
         DCXQ==
X-Gm-Message-State: AOAM533548FZ3dMUzev+B+gKe89i1I6AW6sMdA+muZHrmHuBHXwa3Qoa
	vDTwkjsbv57NGqLJoYglM84=
X-Google-Smtp-Source: ABdhPJw5CPPctarOql+rS2x1uLAr1a+Mp8+uwazHWoqo/j95L0cOZH6WvM0FAien2sFFgysAZTvJow==
X-Received: by 2002:a05:6402:5203:: with SMTP id s3mr8769668edd.79.1617267705931;
        Thu, 01 Apr 2021 02:01:45 -0700 (PDT)
Received: from agape.jhs ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id r24sm3118586edw.11.2021.04.01.02.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:01:45 -0700 (PDT)
Date: Thu, 1 Apr 2021 11:01:42 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: rtl8723bs: replace private macro with
 print_hex_dump_debug
Message-ID: <20210401090141.GA1442@agape.jhs>
References: <cover.1617183040.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617183040.git.fabioaiuto83@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 31, 2021 at 11:34:05AM +0200, Fabio Aiuto wrote:
> this patchset replaces RT_PRINT_DATA private macro for dump hex values
> with the kernel helper used for this pourpose.
> 
> Fabio Aiuto (2):
>   staging: rtl8723bs: use print_hex_dump_debug instead of private
>     RT_PRINT_DATA
>   staging: rtl8723bs: remove unused macro RT_PRINT_DATA
> 
>  drivers/staging/rtl8723bs/hal/hal_com.c       | 13 ++++-------
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 22 ++++++++++++++-----
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  3 ++-
>  drivers/staging/rtl8723bs/include/rtw_debug.h | 19 ----------------
>  4 files changed, 22 insertions(+), 35 deletions(-)
> 
> -- 
> 2.20.1
> 

Hi Greg,

please drop this, I will send you a v2 soon.

Thank you,

fabio
