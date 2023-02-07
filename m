Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE0B17F7
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 06:13:54 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h3so4646311wrp.10
        for <linux-staging@lists.linux.dev>; Mon, 06 Feb 2023 22:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YY7Kcr6rAneK9CMNK+O4hEjjmplK1sr7DU24Zfh32bg=;
        b=UFdloNJd6gQTwPHrZRaMPwgbknatR/+iuXoJYVLS8NDSvYJ/aw/KhsvqFwDFBVy8Pk
         xztHdpQWdMKT8N87z5rsyiQdsthZSKkxmBaAmTDBjc9Tn4QB/wAHgae9qmSHBSwBJK3n
         XD7HgZv+opIXQUJ0GRl9X2/kExW1/OiUAENHQKlPoFHqDUD7cM/HLyUgcWVEE4PGjZIq
         Td34qZAhx/cs39LdMYOCmlaM4Jb/6Y1ZG63FlzQsB3t92rwYT9sLMIknKwv4WKQ17e/R
         ktK9WSnAmIOT9qNCpVBY4/b2/C9YZjcyYMrJnL/nwWzNxbmYS841rUOy3zbUleT9yyzm
         iLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YY7Kcr6rAneK9CMNK+O4hEjjmplK1sr7DU24Zfh32bg=;
        b=GkAb6TXJ/UVhRt/KdLatOWUAK7CN+pQVuQCkXz+Nmkv+URlIzP4uMR7ZkeY5oLhgwP
         +z4JoLnPL8lK+qSFUCAgreEPMNrFpFwByK189awpj247ElIFkN0POEwEZkBqOXdW+J0M
         F4wivOyw92vIZVdH7Fy/dENEWIqnTgH5xj+Ug8bZryfYJFJdo4pXPiffDJyV6QmcVaT4
         H8/gVg4vQIoq0nn7+oDArbQUTpK1zEqMt572zJP5goymRp9LK2Nv+tyOQWvwSqtYcv/H
         34qsY26aNDbK2eJPS31g4oInmpktcgFMzxAWS92JbHKDbJqKS97tIOhw3rCuhQNBkjiA
         Q8cQ==
X-Gm-Message-State: AO0yUKXSKUVKJSWQ+nDIrfOrJl/dTbKEp22sj8b3ylHAZ92nTsIOL+C0
	juWolM8c/ZAYtvNkpyELfKg=
X-Google-Smtp-Source: AK7set+pRBN4TreCHPmOYsJFumWVa1TgociKpWQMwXxNjdjVldReN8MGxox0Ea6/mtzlerbrXvC+ag==
X-Received: by 2002:adf:f586:0:b0:2bf:d52a:2f39 with SMTP id f6-20020adff586000000b002bfd52a2f39mr949180wro.5.1675750432429;
        Mon, 06 Feb 2023 22:13:52 -0800 (PST)
Received: from [192.168.1.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d4c8c000000b002bfc2d0eff0sm10484831wrs.47.2023.02.06.22.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 22:13:51 -0800 (PST)
Message-ID: <bed49e26-bebe-bcd9-e69d-45981b86bf4e@gmail.com>
Date: Tue, 7 Feb 2023 07:13:50 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/6] staging: r8188eu: remove intf_start and intf_stop
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230206201800.139195-1-martin@kaiser.cx>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230206201800.139195-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/23 21:17, Martin Kaiser wrote:
> Remove the two pointers to media-specific start and stop functions. The
> r8188eu driver supports only usb.
> 
> Update some of the functions in the start and stop paths to return
> standard error codes instead of _SUCCESS and _FAIL.
> 
> Martin Kaiser (6):
>    staging: r8188eu: pass a struct recv_buf to rtw_read_port
>    staging: r8188eu: use standard error codes in rtw_read_port
>    staging: r8188eu: use standard error codes in rtl8188eu_inirp_init
>    staging: r8188eu: remove intf_start pointer
>    staging: r8188eu: handle rtl8188eu_inirp_init errors
>    staging: r8188eu: remove intf_stop pointer
> 
>   drivers/staging/r8188eu/hal/usb_halinit.c   | 16 ++++++--------
>   drivers/staging/r8188eu/hal/usb_ops_linux.c | 20 ++++++++---------
>   drivers/staging/r8188eu/include/drv_types.h |  2 --
>   drivers/staging/r8188eu/include/hal_intf.h  |  2 +-
>   drivers/staging/r8188eu/include/rtw_io.h    |  2 +-
>   drivers/staging/r8188eu/os_dep/os_intfs.c   | 12 +++++------
>   drivers/staging/r8188eu/os_dep/usb_intf.c   | 24 +++------------------
>   7 files changed, 26 insertions(+), 52 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
