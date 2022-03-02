Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE7E2590
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 09:07:57 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y11so1356867pfa.6
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 01:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1PWpW0/h9OxoVQDD4bcapW45oUiOIoSzLo/G9Alzs/Y=;
        b=pgS/2ILaQVPmaJz+WJHQzLFwqqv+8A1VadcG0oZ7PYnR5ejErAfMdQ5WhphVNL2nfG
         lsP2YTYOxLGMh8377eApzdWoRnp55gO6JSE89klyaPmv7Q8mHMbIHjX9kMdTanImTj8t
         v77fCB3vizLHenOLuW18U8W6si/XmbW8ZiV0TGgj64tAEfpxtGSy2gIDiYXXtJYBxeyl
         HXrHCrNgFcm1iE96pQk0OtbVR97Bp+km2WP9Ek4huCSRuHUAx7cNLjmnnqmcALEJOOVm
         E+JsmRlIsZsnLzBN0FXKWwPP1HtR+Ork+Ff1J9HfjbOnjyJKtF1GSbQmQi/27xdH5BPv
         +Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1PWpW0/h9OxoVQDD4bcapW45oUiOIoSzLo/G9Alzs/Y=;
        b=YytQZ4oW+7u9zlKax9jyIu9B0P7PI0/RF1U8M5z1K1Rf/xoAHeNULj2lWXm/OE5HdY
         CPrFqHiefKVNyZe5w7DYU+14GLYNZrBZeTFhJFftthZKOOjTV8P2zbIAZxJKTRJeVWKm
         ZvM9UIknUJyfWLLlKEENsEdWOM/sEQSJdB1ODt9Vm8XZW/3glpKBs55J0gRGNU8Fj+lH
         Igr4uXGcQntjd2PfFGum4r77z1DXqj+zHp7iajDTwHw/mX3cJqIriOsM8Jczhq/hFHCD
         YuIduIUuRKyYBbz/AFleKxydbFvfDFyfCU0h1IxdvXOhLQuKeYGYwLfmWi/US6V/Zpbq
         vyzQ==
X-Gm-Message-State: AOAM532g6Qv/53/GqMyCEkGv3Ec/ougxEeqJmtr8qezl+xjOlIuCI3Tq
	a6iLG5+N9XWgg/tXU2wbzBQ=
X-Google-Smtp-Source: ABdhPJxrQCSZtHY8+DQpXNBiO/RuiHOgAmhGZKQi+kRGtC01oBdy94Jbjub5iSh501Tf4U7hUpg5RA==
X-Received: by 2002:a05:6a00:198b:b0:4f4:22f3:2fbb with SMTP id d11-20020a056a00198b00b004f422f32fbbmr10755169pfl.20.1646212077441;
        Wed, 02 Mar 2022 01:07:57 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id g7-20020a056a000b8700b004e1bed5c3bfsm20339062pfj.68.2022.03.02.01.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 01:07:56 -0800 (PST)
Date: Wed, 2 Mar 2022 22:07:51 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: remove rf69_get_flag function resolving
 enum conflict
Message-ID: <Yh8z5zWfpVKWNYpQ@mail.google.com>
References: <Yhla4a1Clpguoo2h@mail.google.com>
 <20220228063238.GA2794@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228063238.GA2794@kadam>

On Mon, Feb 28, 2022 at 09:32:38AM +0300, Dan Carpenter wrote:
> Looks good.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Thanks for reviewing my patch Dan.

> >  4 files changed, 4 insertions(+), 69 deletions(-)
> 
> You don't really need to write a long commit message for a commit which
> deletes 69 - 4 = 65 lines.  Just say "Remove pointless rf69_get_flag()
> function and call rf69_read_reg() directly.  This cleanup removes 65
> lines of code and it more obvious to read."
>

Thanks for the feedback. I swear I don't do that on purpose ... I have always
struggled to be succint tbh. It's just something I'm actively working on...

> > -						  rf69_get_flag(dev->spi,
> > -								rssi_exceeded_threshold));
> > +						  rf69_read_reg(spi, REG_IRQFLAGS1)
> > +						  & MASK_IRQFLAGS1_RSSI);
> 
> The & character should go on the first line.
> 
> 						  rf69_read_reg(spi, REG_IRQFLAGS1) &
> 						  MASK_IRQFLAGS1_RSSI);
> 
> But that can be done in a follow on patch if you want.  Or you can
> leave it as-is.
> 

Noted. this patch was already merged into the staging-testing. I will
send another one fixing it.

Best regards,

Paulo Almeida
