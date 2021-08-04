Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC570
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 13:47:22 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id g5-20020a9d6b050000b02904f21e977c3eso1668531otp.5
        for <linux-staging@lists.linux.dev>; Wed, 04 Aug 2021 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+AoFXgsKTP3ruB8NfNUz2FtlRkR+ZhDok1NEQZlDiiA=;
        b=RT/1HuaVluljWGOZGTF1ZYEw5QbLs+weqdbJrRWNabvzA9da8wWUZ4iIYOQhz4hwaW
         M11z0HsoUiMCmh8FRm/C/nd8JhZKSPNm7opsrWKSOez5saNiCO39/ujbxXhSaSTdUVQr
         lv6lAbG4EPz7swc1Hgd8Gvgoi1mXCQL6bntcmlWKpWXUo1i9MSg0K/FDqNau7Y4olnPj
         Y94ear22tULX+Ty4AjSiBjAV8gYfY8VDnIbHE0fQv0mWWwP5bVDCY3Dcd8yXYiVQDAaW
         +pCdZua0z3uD9957A4LB8WQGIrJmfEn4YtQvE3h+XxADlulJQmKS4hBxFn85/gpk6Z+1
         Abfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+AoFXgsKTP3ruB8NfNUz2FtlRkR+ZhDok1NEQZlDiiA=;
        b=GvcjaUWDy3Mt6OFtbga/0o7Po+WU57dLu//0/egkADdb7jf05o1dGVBtlI1r/jy5si
         Bt9Dkty2GYZpMOYyaI4fWMBUEEp3JnuKdRUaTLZ81wvT/V8f/YMWFE1WZVZYAXxuTb9t
         eymef+k+eHJe31nymXgl4AlNR0lBpyGeOPepNBQguxPGU7K7NeqDf91favubHvdMbJ6Y
         BaWQoSVVNjekKsPUbEY/8o+sNNVgyg46aMUSxTW5fPrM5oqTK8ikGgkMHczyYzz+Qc10
         YnfgbP5IZKA71aBa/eBSJsaq+7OWt0MEzOPFR94162fuWluHR5N06rd1Boej4zxXG8M/
         /CMg==
X-Gm-Message-State: AOAM530u3+dDu2NUgKPrlEs34hgWXT6kXHWVb9f8UONYxJvmkXHUj2Gi
	4vQ9Xd/2GJY/ncioj411Erk=
X-Google-Smtp-Source: ABdhPJzzTI1WmHb/8kQMI+idfHOuCXtawVTq+2pv3ONB0t0RWqCtiNEaBZqjwP9k9RkHJy3ymHtNtA==
X-Received: by 2002:a9d:5c14:: with SMTP id o20mr789862otk.36.1628084841782;
        Wed, 04 Aug 2021 06:47:21 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id t27sm447990oij.34.2021.08.04.06.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 06:47:21 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH 1/6] staging: r8188eu: Remove wrappers for kalloc() and
 kzalloc()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210802151546.31797-1-Larry.Finger@lwfinger.net>
 <20210802151546.31797-2-Larry.Finger@lwfinger.net>
 <20210804131550.GL1931@kadam>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <3fd8841a-ff5a-154a-666c-66e9a773dfac@lwfinger.net>
Date: Wed, 4 Aug 2021 08:47:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210804131550.GL1931@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/4/21 8:15 AM, Dan Carpenter wrote:
> On Mon, Aug 02, 2021 at 10:15:41AM -0500, Larry Finger wrote:
>> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c.rej b/drivers/staging/r8188eu/core/rtw_br_ext.c.rej
>> new file mode 100644
>> index 000000000000..18113389acce
>> --- /dev/null
>> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c.rej
>        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> ;)  Something went wrong.

I submitted v2 with this problem fixed. Sorry for the confusion.

Larry


