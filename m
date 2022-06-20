Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DACD3D6E
	for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 20:02:13 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id h65so14217588oia.11
        for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XZYTVNN3OTIFAKlJr31QtDNYvtTZSjURUEwd4yxlavE=;
        b=IuJJXPocprRwnIMc5qD8E0ArJ9j4zrbdncIaUPN6SHFiyJROFTTfiQ4fWadbPTup+d
         lyXWq7eKwk76iJz90VgOMKvpLQ1Q7j+RygtKUZlFCS13F4apJfy5w3oKi2E0DDQZrUSl
         WLro7uhGls+p++NMILOPKPMgqoViBBF/qn5cBIZGBRMX3B6MJyK+iZYAaaPsSrN+V9Dj
         OPz1wpegOSVmr6xAGV8+VH9H+cY7zmsg5KSSPNtuqtqvNyevVQwFWmdO4E9Bf5sBRGE8
         0aZLFqQvK9xh8V/8+DXbLTehnUl3/6HSJK+oladrYWSbISfHb6tl2EWBJaPWWD1GUHhG
         D3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XZYTVNN3OTIFAKlJr31QtDNYvtTZSjURUEwd4yxlavE=;
        b=08hJxdTcGhTSf76PE+wlV6n9yRoPCh/1BXlAwpRk6AELAqDD6fN5BkFJzhzH6CnsY9
         2uYGW1wVriwmsSjJR69vGQpoClgENS5xicv1XWlrtTY3D4o3E1iWog7/vsvAfvDxXSMW
         BUNa5LOa6hczF8jTz0xQ75qpQoKXfActqs96O/r4ZBCsyXWDIP+/lfDu5gvDIrfSxu1t
         5S9XYrVszMeQjUNoFr99QTVODmGJXGi8b27fQq1DcqP85apjXJbCQNdpketLiZgtNLxX
         0hwCMDmd40A2pLehupUXu089wPtcdwLTsvYK1IdZffK++iLcuMkUDtpjeLOf3QY8qUKA
         ke0Q==
X-Gm-Message-State: AOAM530ymgHHfHitkAhalo0xDEd5fwb0FZtwa/EKekAXk3EZMnkdcaUc
	Ad4ExfZwlRVm97aIwSOxF7w=
X-Google-Smtp-Source: ABdhPJzUcP6Xsquvvp31yhoKLnPS5U+zovKalrAzvTPyCdjqjdcvxUC1lxc61U6Ui+Crb/cWMQdINg==
X-Received: by 2002:a05:6808:1999:b0:32f:2fc:aed1 with SMTP id bj25-20020a056808199900b0032f02fcaed1mr17560674oib.255.1655755332744;
        Mon, 20 Jun 2022 13:02:12 -0700 (PDT)
Received: from [192.168.1.108] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id s204-20020aca45d5000000b0032f662af5d5sm7928355oia.1.2022.06.20.13.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 13:02:11 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <3a73a59c-29a1-5f96-ad0b-476c46587fcd@lwfinger.net>
Date: Mon, 20 Jun 2022 15:02:10 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/2] get rid of useless header file
Content-Language: en-US
To: Nam Cao <namcaov@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 phil@philpotter.co.uk, paskripkin@gmail.com
References: <cover.1655745123.git.namcaov@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <cover.1655745123.git.namcaov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/20/22 12:19, Nam Cao wrote:
> The stuffs in basic_types.h are either not used, or already defined in
> the kernel. Get rid of it.
> 
> Nam Cao (2):
>    staging: r8188eu: replace N_BYTE_ALIGMENT with ALIGN
>    staging: r8188eu: remove basic_types.h
> 
>   drivers/staging/r8188eu/core/rtw_recv.c       |  2 +-
>   drivers/staging/r8188eu/core/rtw_xmit.c       |  6 +++---
>   drivers/staging/r8188eu/hal/rtl8188eu_recv.c  |  2 +-
>   drivers/staging/r8188eu/include/basic_types.h | 19 -------------------
>   .../staging/r8188eu/include/osdep_service.h   |  1 -
>   drivers/staging/r8188eu/os_dep/xmit_linux.c   |  2 +-
>   6 files changed, 6 insertions(+), 26 deletions(-)
>   delete mode 100644 drivers/staging/r8188eu/include/basic_types.h
> 

For future patch sets, please include the "staging: r8188eu:" part of the 
subject of the cover letter. It makes it easier to sort out the rest of the 
patches; however,it is not necessary to resubmit this one.

The two patchesw are fine.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry
