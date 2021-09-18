Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF083FC3
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 14:26:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so12113111wmq.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AX0s/bkQXmMh8cMES5eXhcrKmGGepgxzOpmbwlBIgA4=;
        b=C2xK68kYNJDDuMiCcsKn/Vb+zBsh9yp04P+54jfH/N5Fm0zhX42062irQ1dwM2aUzL
         YAoKW+HSGMAz91T8UVxjR/fXPyIy/syZAiS+cKmyCZkH7s8M/T95L+J82FI8HeoOlLfy
         zAeVy1zKZJ2YQWEp6WvQrdF2hbxJYx0VPWl6S8aiH0Vd7/FK2Ckou2+lnYL26fxuVcuG
         vNeZonNNfFiFXyFXDjjYYOvRd5BvLjahIKOLpmUOQRjKEY//gp7LymJ0rbq0sfEOWXUm
         ag10q8OUm22IUtidmQ6y9wiGpEeKMNSDT625aXm+E/ruecmLFix1qoP1k1+j6HNwnZ6Y
         vyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AX0s/bkQXmMh8cMES5eXhcrKmGGepgxzOpmbwlBIgA4=;
        b=LZcKHmOtXakMVO/dU/NyLIZribO8jnA4UzjpDknpIM2y5VpD5uzdcUQvTYwjXf+oVe
         WlvRCRq2JdeWbFNoePAcz2TM7iMp7WnWLRBmujoqEhZRFb+axSywiAtDG03jCExTdHcW
         chMZnEIdSqkd1Uoe58Zcf/PvnRtfDdiX/5px50sYa26QjPdjqoIoHFgw2mqtiBLI6uSn
         qlcjs3mJdoIBRWggYhCD7KMB+Br/Cvd/8qYFrQAtX1jRAOKz9g+cGT2LP0EkUgKE7D5/
         FYN/fFMHvcVAAMl0KgHa50rHHZ2hSMwjjWfld6nNjLl89R6TjsRk5rtcKGKPByU+67ZN
         sGhA==
X-Gm-Message-State: AOAM533euHiZC7tFo42mXvvNYhVhyzoImR7+YHo5FB/3o36T6dhhLwVU
	dZ+hhTwWrhgYkLZSQar/vWI=
X-Google-Smtp-Source: ABdhPJzevXkIzuS5HuddUwoN+Xew+xLXVnGz0ROBbFqbMZ5cCnx6B/nLkNcS3v/Tu5PA5WR5Wy/YpA==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr15288403wmj.184.1631975197034;
        Sat, 18 Sep 2021 07:26:37 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::cde? ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id u8sm14778348wmq.45.2021.09.18.07.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 07:26:36 -0700 (PDT)
Message-ID: <71fb25dd-b695-47ac-2bfc-7e7cb2baf6c5@gmail.com>
Date: Sat, 18 Sep 2021 16:26:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] staging: r8188eu: do not write past the end of an array
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210918134024.23837-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210918134024.23837-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/21 15:40, Martin Kaiser wrote:
> Commit f7b687d6b67e ("staging: r8188eu: remove NumTotalRFPath from struct
> hal_data_8188e") removed a for loop around a block of code that is executed
> only once when i == 0. However, without the for loop, i will never be set
> to 0 before the code block is executed. i remains at 2, which is the final
> value after the previous loop. This results in a write past the end of the
> powerlevel and MCSBase arrays.
> 
> [   28.480809] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: rtl8188e_PHY_RF6052SetOFDMTxPower+0x124/0x128 [r8188eu]
> [   28.493752] ---[ end Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: rtl8188e_PHY_RF6052SetOFDMTxPower+0x124/0x128 [r8188eu] ]---
> 
> Fix this by replacing i with 0 in the code block that used to be the body of
> the loop. While at it, remove the powerlevel array that was just holding a
> temporary value.
> 

Oh, I missed that.
Many thanks for fixing this, Martin. Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
