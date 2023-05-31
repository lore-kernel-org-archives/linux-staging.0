Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7380171D5
	for <linux-staging@lists.linux.dev>; Wed, 31 May 2023 15:46:57 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1655228a12.2
        for <linux-staging@lists.linux.dev>; Wed, 31 May 2023 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685548017; x=1688140017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KKEHFoxOsCgLmI1DdeQCEy3HhPJ+1U7vLLVsHpPTjis=;
        b=hiUzdZ1tyrEXaC0nct0J68xAxXlmIwvH5bCBbGQvn5IY1FnWsWmKlh6V7cr064tkWt
         LYWh6Hp3LWnvKArJDVWEjPmyRKuNKYrE/ReZUviOEmAISXC0azSDFccB3QmaHB23pVkf
         fqGGQUz7Ngh+MycaZTrDbomcarlrOHK7xklYtLg4+lO+UYgNFfCu9a3umi3gObWB5K5H
         ijPceWtn9q9eKLbYndY6PVf0qRv7JO7wtfNxkl1dKAqXPAQutf554FgeS9nE3JQd/hyJ
         XFeDxL+XLCm02Vq9mBhxJrCmHuRSWH65GF72tJCsVVVabMUd/iLx/wPut+wNM15nWk5k
         kmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685548017; x=1688140017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKEHFoxOsCgLmI1DdeQCEy3HhPJ+1U7vLLVsHpPTjis=;
        b=AeX1WrEhOxPKCB+wk+UwhUj0kHykMFyYINijlpYpEAJ6lnX2zn5qT2i3Rx7bhQd+9B
         xQmPKb+z0QAlb4/DR+wZetexOcZ2/6i1KoZ1aR8bW5ERYTuPfRwciDkL7dUz62MLf6r4
         qQM+VmRDWk+LvJ9MeY1RW/ma1TeLt57t3tnKC8I9nEepujokOVHPhoO3RTTW0/YakDo4
         iGiuTT2/SivMu0fkAGbef4c4YS+tlGTkouHzu2lK9UwTTX/wD7gSlmkHGxzuhDWxdqWV
         p7Sibk3LGbdAyxsC0i5daunnZCyi3l1uiI85nFRFsEVA6FcgXXpX8m1c+480iNbxm5lI
         IGVw==
X-Gm-Message-State: AC+VfDyuu0CviCgffF4WyBpYOYzrmkLWQcZnZEWMfdpIllSvusaDnQgE
	ZKQx7LMXdBGtUo+ppZTrojE=
X-Google-Smtp-Source: ACHHUZ6BSeCNJ75UsylpGcAlcsVksIZ2BPf+XfdUXmpI4qAqOnYjZITeupnVmD5pT9Qxo7I1/HYXyQ==
X-Received: by 2002:a05:6a20:8e1f:b0:10b:e88f:597c with SMTP id y31-20020a056a208e1f00b0010be88f597cmr5099836pzj.44.1685548017222;
        Wed, 31 May 2023 08:46:57 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id o9-20020a63e349000000b0051afa49e07asm1455725pgj.50.2023.05.31.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 08:46:56 -0700 (PDT)
Date: Wed, 31 May 2023 21:16:53 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8192e: Rename variable SetWirelessMode
Message-ID: <20230531154653.GB87044@yogi-Zephyrus>
References: <cover.1685284727.git.yogi.kernel@gmail.com>
 <5a1ee0e9ef53ebe6085c14dba08c438862ec992e.1685284727.git.yogi.kernel@gmail.com>
 <2023052837-half-pretended-e024@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023052837-half-pretended-e024@gregkh>

On Sun, May 28, 2023 at 05:01:45PM +0100, Greg Kroah-Hartman wrote:
> On Sun, May 28, 2023 at 08:21:33PM +0530, Yogesh Hegde wrote:
> > Rename variable SetWirelessMode to set_wireless_mode to avoid
> > CamelCase which is not accepted by checkpatch.
> > 
> > Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
> > ---
> >  drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  2 +-
> >  drivers/staging/rtl8192e/rtllib.h            |  2 +-
> >  drivers/staging/rtl8192e/rtllib_softmac.c    | 12 ++++++------
> >  3 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> > index 17b70dde7eeb..699c4accf2db 100644
> > --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> > +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> > @@ -716,7 +716,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
> >  	priv->rtllib->check_nic_enough_desc	= _rtl92e_check_nic_enough_desc;
> >  	priv->rtllib->handle_assoc_response	= _rtl92e_handle_assoc_response;
> >  	priv->rtllib->handle_beacon		= _rtl92e_handle_beacon;
> > -	priv->rtllib->SetWirelessMode		= rtl92e_set_wireless_mode;
> > +	priv->rtllib->set_wireless_mode		= rtl92e_set_wireless_mode;
> 
> As this is only set in one place, why is it needed at all?  Why not just
> call the real function instead?
You are right. I don't understand why the code was originally written this way.

> Same for the other patches in this series, why not turn this into a set
> of cleanup patches removing the unnecessary indirection and removing the
> CamelCase variables entirely?
Yes you are right. I will work on transforming this series into a set of 
cleanup patches to eliminate the unnecessary indirection and remove the 
CamelCase variables entirely.

Thanks for your feedback. 

Regards 
Yogesh

