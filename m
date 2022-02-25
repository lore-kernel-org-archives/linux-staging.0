Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5579628FB
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 19:58:03 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id u20so11201726lff.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 11:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cAcXT0JlYVeeRaWrb0GIE0XjHyI4xXDoEv72/weIX30=;
        b=LH+IMXBEpsz75K8Oz0kWwz6C9NxUKaqDAg6XsphPoRmwkOmiX9Qr8n+GvOZiLNLdW1
         C5swddkKcacUYlgaDanpKOHq4x47GxVhn1kFmjnf1AnBRQutXga06dDFQm6BskN9lI14
         5SMxe+bN4ppyQbNcjAidPMIfNm0ooCFU0Pvs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cAcXT0JlYVeeRaWrb0GIE0XjHyI4xXDoEv72/weIX30=;
        b=B2kc+pC3VOkplbcU5qRb3bJle2df8Pxjm3b1XKX2MTdpWHOPBMGuWbsR8cnBRRnzMR
         POfG9Dp/5mESQMwsLtPCcCJnQV+EilFZSkWxN8E7nGEU0x/XFYiZmPHTKy86b4HpVtkV
         740wTjHxDXbcL6kJOJxA+6aVYFfQqFCGx+LECMSPNJBEfJf+iqJ7zUKAx8nCIjTHwvFi
         mramI/OjGEf1RtRTfhTflznWeqLo7LgVzgGSu9Pjq5hPIwbRkATDiHgp+pAA/j+lRKSh
         ynNpeBofA7y4PoYVlLQ179abKU1F/cbAqPjivkCKzj9H7vIIJ2GI2NhF4fHPRZZU0MXD
         oFBQ==
X-Gm-Message-State: AOAM530nwmcgV2Bp1MvIT02gv45kn23rfgZzbML7C5EJr44H3o0ZJ95D
	pBkVWEg1eduptcNJBGldlYwsIq6FDaMvYsH5
X-Google-Smtp-Source: ABdhPJyuLT0TVBTYGFBTcfP53vdOfWNDjpgzSy0XJFusVKQHv48qDkNsumre0g3VggayhXLxycawfg==
X-Received: by 2002:a05:6512:23a8:b0:438:ebcc:e742 with SMTP id c40-20020a05651223a800b00438ebcce742mr5861347lfv.505.1645819080914;
        Fri, 25 Feb 2022 11:58:00 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id m15-20020a056512014f00b00443cd5b013fsm279552lfo.244.2022.02.25.11.57.59
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 11:58:00 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id v22so8842313ljh.7
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 11:57:59 -0800 (PST)
X-Received: by 2002:a2e:aa1f:0:b0:244:c2ea:7f20 with SMTP id
 bf31-20020a2eaa1f000000b00244c2ea7f20mr6253961ljb.164.1645819079606; Fri, 25
 Feb 2022 11:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YhjYPIRvDnV7XAzV@kroah.com>
In-Reply-To: <YhjYPIRvDnV7XAzV@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Feb 2022 11:57:43 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjLvye-_qj-J=dVWhFf7S8noL6d-szRtFYq_hoOk6J1Eg@mail.gmail.com>
Message-ID: <CAHk-=wjLvye-_qj-J=dVWhFf7S8noL6d-szRtFYq_hoOk6J1Eg@mail.gmail.com>
Subject: Re: [GIT PULL] Staging driver fix for 5.17-rc6
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 25, 2022 at 5:23 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> It resolves a reported problem in the fbtft fb_st7789v.c driver that
> could cause the display to be flipped in cold weather.

LOL. WTF?

I just had to read the commit message for that odd thing.

             Linus
