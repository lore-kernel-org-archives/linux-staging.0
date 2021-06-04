Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7A70
	for <linux-staging@lists.linux.dev>; Fri,  4 Jun 2021 17:26:37 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id s6so12001367edu.10
        for <linux-staging@lists.linux.dev>; Fri, 04 Jun 2021 10:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yQu4ZlSzEBr4vf2dWTW2YpYlkQS0idkpyI2C1hfoXug=;
        b=BFraaEIaKvQvAhBn08S1/i0KIziEiLFL1qJCYfHnBAaNRdGUyv3PPHBhk076NgNi0L
         HLwuqaBi3XdSp+YyjijaIqKGK2uegTOBlfU6GlE8TpiDgAIh4OzAe6SZbrki3HLf9Lv6
         fFPggfTWEL++TBHlhZyAU+6D3mcTUnAefNyEejNa71MP2JSXRrdOmPpG++0/LjfWjpqD
         rjXKsIo7nRzoRyToyrPYuW0/izoqFcAE8KMINv1iFY6ibeF9vA+1sn7fgdohxCML+Wtw
         0a/Yp/Y5gwCmw6DueEvSLbLsAvG70TGPSzREDuIPbHnACi6/DjG3pDS3023bt/HQkWQ0
         zcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yQu4ZlSzEBr4vf2dWTW2YpYlkQS0idkpyI2C1hfoXug=;
        b=TS12lvtEqZC5kbDZNP09IfsRdC/zRdDreQKwEC+zn5ORdrXQKg4xuccEPt4G2PZGrM
         aOQ+AsdqlsrpNz85ZYu7Vi1qISqxxw2Ogdlp5Ll6bM1W23zppAYqXmTr9/MZGrQv1L2s
         IX1RI/X0OWfvOi/o1gKZPmCRI5PWxstE20HSP8OrwhZP/Ed0wy+4CUmuqP49DMWVE7pr
         GMy7IWCC9wRJCN8TMjCzhkii4B9VO60p1jzq8C0e0/Hgs2NGVStXEPzMBX6eZh44IzMf
         BG7pEkUQi/acCdfVhcpm1C4uyfFtH0K7GtjnhzkkV0d22gg1F1zfw2zfK1OS/lJxig3J
         Ixow==
X-Gm-Message-State: AOAM532ZB0UnHbRZDj7XwWnLsSxjSYqNIkNT5JoWR3a3x76+2+cUT6Xu
	SWjWIBrKFb7LwRpLMu63Kkk=
X-Google-Smtp-Source: ABdhPJxqm28tqKIRf3lvRa9hVIxcJ7lg+F4G1xZlfJG40omB+OUIg1fx6AHvl/B6vp64bs+C3rSh7Q==
X-Received: by 2002:aa7:da94:: with SMTP id q20mr5905874eds.310.1622827596449;
        Fri, 04 Jun 2021 10:26:36 -0700 (PDT)
Received: from agape.jhs ([5.171.80.153])
        by smtp.gmail.com with ESMTPSA id u17sm3478663edx.16.2021.06.04.10.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:26:36 -0700 (PDT)
Date: Fri, 4 Jun 2021 19:26:33 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use list iterators and helpers
Message-ID: <20210604172632.GA1526@agape.jhs>
References: <20210428173301.149619-1-linux@roeck-us.net>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428173301.149619-1-linux@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Guenter,

On Wed, Apr 28, 2021 at 10:33:01AM -0700, Guenter Roeck wrote:
> The rtl8723bs driver manually re-implements list helper functions
> and macros in various ways. Replace with existing list helpers.

I'm testing rtl8723bs on a baytrail tablet (Lenovo Ideapad MIIX 300-10IBY)
and applying the tag staging-5.13-rc4, loading r8723bs makes the whole
system freezing while trying to connect to local AP.

Only a power off is allowed.

I found that commit b3cd518c5abd42fbc747ef55a5fdc40bf7bf01c0
(staging: rtl8723bs: Use list iterators and helpers)
introduced the bug.

I'm trying to find out what's wrong with this patch, have you any suggestions?

thank you,

fabio
