Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D3370
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 17:43:32 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v4so6394378wrp.13
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 10:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tXkP5/ncaq9Hf6Uxqgm5uOuWoKgach/mYVKL6DiOwAc=;
        b=BHC5yL4eFSAVKN4FwnOuajcK03bM0aXpjakJsIhfImnitLNKsRjqEkmgvAkMTaRYVC
         NEOJrIdZ9x5/vD9UM89UG+DISymJ/EUPelJcBdtEX84boV8BEN63GoD8BR3+s9/nqsAC
         m5pnkGI9TtPNJAmEYlH+cGc8wa28AulYQR7sYdOJZzkBuEJ20Der3siUVw0G49PNj+9t
         aLIScF5OIHqJzpn19L8HtZ2p6b+JoaVdAfZxry6QLzzCsx8iwBvOvQBey4y+1+F2jOQd
         uwWN7/1UOuoAObuFLygL5KtaxoJGtNFYm9ZarDx8d7foMCihNHbWWjSOjOCKZl9nGZNu
         BoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tXkP5/ncaq9Hf6Uxqgm5uOuWoKgach/mYVKL6DiOwAc=;
        b=Nmq1UqxELStYGfMAvlbgpK4Fh4IjMgjRdeoSZNOi5IY9EAUJ+F0rL/Fgj25t5LW70H
         OA4f61+TlHFxepER8W0SdJCHxeyEffZvEYJuEHP4ExTonPPEfTNL2pB8Cz3wU/qgVQWE
         TcXhp9k55ihYCkOdWEr3JOnDFwD0oUV1Ol1RB9ZIzPcBct4hrj/XYMz36YXgUBgYO+ZH
         jRNJi8y+ByCZjk4bgksIiFTn/qedecGT7VzO5qnhSpII2TVX/+nZ12uvXo7h1jzZ+kEY
         HKbgBQ1yxuJ9dTvP4N76iZA2+yMSdn4waKhJ9nChAkrvuzifqUkypZoIozHxpRnLmQJy
         PCsA==
X-Gm-Message-State: AOAM5301xOjkJjIe5p0yF5Xh0hOgwceBCRoOPrZ3+K2iTe/tnD/oztqb
	tjWiPtstZB8tbHAZI7fLuCo=
X-Google-Smtp-Source: ABdhPJxSWWa2NL/eXrGqR+ZiVhG684rSn5ylse9UBYJy7TxwIqsQ4qI3jIY+r1qtfUauwMTdzUxgYg==
X-Received: by 2002:adf:9043:: with SMTP id h61mr15585403wrh.216.1616780611572;
        Fri, 26 Mar 2021 10:43:31 -0700 (PDT)
Received: from agape.jhs ([151.37.215.119])
        by smtp.gmail.com with ESMTPSA id u3sm14051836wrt.82.2021.03.26.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:43:31 -0700 (PDT)
Date: Fri, 26 Mar 2021 18:43:28 +0100
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixes: 65f183001f6e (staging: rtl8723bs: remove unused
 code blocks conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*)
Message-ID: <20210326174327.GA1464@agape.jhs>
References: <YF3qSsH/3vRy7BRy@kroah.com>
 <20210326155252.6746-1-fabioaiuto83@gmail.com>
 <YF4J2JVz1tHiFsGJ@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YF4J2JVz1tHiFsGJ@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 26, 2021 at 05:20:40PM +0100, Greg KH wrote:
> On Fri, Mar 26, 2021 at 04:52:52PM +0100, Fabio Aiuto wrote:
> > fix indentation broken by patch removing conditional
> > code blocks checked by unused
> > CONFIG_INTERRUPT_BASED_TXBCN family defines
> > 
> > https://lore.kernel.org/r/9157000821fd6febf25566b8c712fad1995c7c78.1615907632.git.fabioaiuto83@gmail.com
> 
> No, please use a "Fixes:" tag that points to the git commit id that this
> commit fixes.  Look in the kernel tree for loads of examples of how to
> do this, and it's even documented in the Documentation/ process guide as
> well.
> 
> thanks,
> 
> greg k-h

is what I did, as you can see in the subject. Or I did wrong?

thank you,

fabio
