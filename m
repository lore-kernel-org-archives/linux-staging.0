Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841952FB8
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 14:14:06 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s6so51324907edu.10
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jCJCtm9vYJmak15ODFJRZn1EfBIeulB+qvoTw8v2gPU=;
        b=A/FWT4pLZP6CT2SEt5mkBTge/L1IiQHPLJ4lcVCKbLulBhnyx8zUwTrbgioMPloz4t
         EDPcFHd+tlHV2hbXrFKztwyfPenRrqomKYlx496O1G/ZYWYPkg91Chx7A/nRZIqadhxp
         midySr7Hr/YP3rl5XGkymYpJL5ovuFfsvNlRq/bZfsZZpUG0eNEXbsck2aChCBxzb2jQ
         f7tae05HYYZlOvkgGh3h87RBbaGczFIbx6daPChN5e13QmyAT5aVasOgSl4ayPPpz3Cf
         a4ThsJSzteqkucgkUV5HcBhQwnCg+HCh1x9SbICBq+KhZteOqwCaYjPlMDJ+wrGZaHbh
         c+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jCJCtm9vYJmak15ODFJRZn1EfBIeulB+qvoTw8v2gPU=;
        b=kaTeOWTcyj9zJLo8nIty9MY+jfVzzypEJ6DRtrsdgKw2cXTXJ6U8dRriyXuyxGl+fJ
         18ASvRCFwgm2BaugA4W1NdisR63q0Cvw5eyiLktl8USF5YE6uRWETYAdeXagVmA9FRaC
         dStMeLxQ5O8UpI2vOvS3rda3XkS2GL4ok4PE0VtcnpYikO+lf8J8h+FsKRYoCpS74ULj
         CaWu9OXHU/5PkrUx12JNEtw5tedXQdz1suiIzmlyJ6xKLWw5+3BSzsgAH979ewYEEEGy
         6lE3MSNgXl2EaEHmWae7fbm24NhA6V7UkUXKNuiaMLb5p0FNKbw8vCRnvZ8KXOBe3ovE
         ztsw==
X-Gm-Message-State: AOAM530edQXq2wPpeujfzwQ/Mr7EQJOZR9Zvd7MfOKcVdE5sZQXkm7/V
	g0epdl4ZizwlTEg1wlYLLD0=
X-Google-Smtp-Source: ABdhPJzonSW7N1yhegZXrr8lGbqbqcR45c1IvG5abGOxqd5UZeIUoZXQYW+MARuJ/BDwv6dHwHJZ3w==
X-Received: by 2002:aa7:c354:: with SMTP id j20mr23408526edr.294.1623766445136;
        Tue, 15 Jun 2021 07:14:05 -0700 (PDT)
Received: from agape.jhs ([5.171.72.178])
        by smtp.gmail.com with ESMTPSA id c14sm10102498ejm.4.2021.06.15.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 07:14:04 -0700 (PDT)
Date: Tue, 15 Jun 2021 16:14:02 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] staging: rtl8723bs: remove include/autoconf.h header
 file from tree
Message-ID: <20210615141401.GA1413@agape.jhs>
References: <cover.1623756906.git.fabioaiuto83@gmail.com>
 <9317fa8fd41da4668a41775207b5e6dad33e7447.1623756906.git.fabioaiuto83@gmail.com>
 <YMip+8CWBFAI40tf@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMip+8CWBFAI40tf@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jun 15, 2021 at 03:24:11PM +0200, Greg KH wrote:
> On Tue, Jun 15, 2021 at 01:45:37PM +0200, Fabio Aiuto wrote:
> > remove include/autoconf.h header file from tree.
> > It just contains a compiler configuration check
> > which is not needed.
> 
> It also still contains the LPS_RPWM_WAIT_MS define :(
> 

Sorry Greg, I will be more careful next time,

thank you,

fabio
