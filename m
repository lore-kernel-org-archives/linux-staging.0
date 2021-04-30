Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E1E2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 15:08:24 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id bf4so3288413edb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mu0mYNOEV277bg0pTpOqMEzxYQPlgVYLrj4Fpbo0+Eo=;
        b=OSQgSLNVKb92/jcqxVrqvKp6nr43WRw7jGm8vkbdIiLo0d5yvhctFCfb45FW4M15S6
         RL9w4tSdEufazZuYoaGhWF6uOBuv2VUiWrLR/bvTfnoYSiMV6AG1Wq0cR0lluaepBicq
         BCEYSb4cTfONm2tY6m/11YxvtZln74IPQHeu+wre6YoL/5/Ds1AQwa7P0gGY68NO8kOx
         ayRkWRfHsnIYFJO9TJNi+qo27kQiqJxxxlbwKpEfxJnQd2y3YAHcVOZdMB5SCXwUsYLj
         P8LabYkDZ2CLcLH2mfOIlDTUnhjNez1AZNCptWsKnG8tbzRuIUjrVqFonc9lLz5EIXTX
         chew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mu0mYNOEV277bg0pTpOqMEzxYQPlgVYLrj4Fpbo0+Eo=;
        b=LCw4By2NEN9puuiVzSrH/oak2ITzZv36awOVU0NEj6ZRd3exV1Gd8Kpbl0ooaLk1xp
         dcZn2pEWL9sS/4A5CPGANEcTSsjdmCS60m9W0xpACkQdHbo3jHGoZnee9GxBfO3tRAog
         QQwZ/bMtKh03SHYZyNCwJc0wc9+GCDvmN1cJ0UREx+wTZiJ+kGj1Xn+D/f9flfMzxvjH
         1miepzkiwlgsCTr7AzZWZRO3o+nCuVlZ43YvBdudMSKHEYLTJkjCqEmh6iWmOgrMFihe
         ET2oFcyDD59Nv3cjqYj8ygbvBEYbbKdCAVY6K/y8+PbERprmmHD0U76ueUadkWVTFKdi
         lK/Q==
X-Gm-Message-State: AOAM533W77LNTa3q7SJ74awO2DDO/9aDL8VuBUI/ohrOdpvyK3DIDAfM
	J5c4gxlTiyD7S8ZFwvKnohI=
X-Google-Smtp-Source: ABdhPJyDUWhDuw0gu3nc7UjxMS5wiA2bqgX0qEl+zsc60tfJL3ITdmyzzJ5WAVomA0wiSPDQ6qYJcg==
X-Received: by 2002:a05:6402:1c0b:: with SMTP id ck11mr6562801edb.264.1619795303279;
        Fri, 30 Apr 2021 08:08:23 -0700 (PDT)
Received: from agape.jhs ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id r25sm1460727edv.78.2021.04.30.08.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:08:22 -0700 (PDT)
Date: Fri, 30 Apr 2021 17:08:20 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/43] staging: rlt8723bs: remove if-else blocks left
 empty by ODM_RT_TRACE deletion
Message-ID: <20210430150819.GB1387@agape.jhs>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
 <646608de41fb1ef915834a33453b0a99907d46b0.1619768150.git.fabioaiuto83@gmail.com>
 <20210430143100.jfdaitqlqaclmajp@bryanbrattlof.com>
 <20210430144959.GA1387@agape.jhs>
 <20210430150232.23extupxlsweecrg@bryanbrattlof.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430150232.23extupxlsweecrg@bryanbrattlof.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 30, 2021 at 03:02:38PM +0000, Bryan Brattlof wrote:
> On Fri, Apr 30, 2021 at 04:50:00PM +0200, Fabio Aiuto wrote:
> >On Fri, Apr 30, 2021 at 02:31:08PM +0000, Bryan Brattlof wrote:
> >> On Fri, Apr 30, 2021 at 09:43:20AM +0200, Fabio Aiuto wrote:
> >> >remove if-else blocks left empty by ODM_RT_TRACE deletion.
> >> >remove unused variables to suppress compiler warnings.
> >> >
> >> >Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> >> >
> >>
> >> Hi Fabio!
> >>
> >> I just wanted to point out a spelling mistake in the title 'rlt8723bs'
> >> in the off chance you submit a v2.
> >>
> >> Way to go switching this over to netdev btw.
> >
> >what do you mean exactly?
> >
> 
> I was just praising you for all the work you are putting into this
> driver. :)

thank you Bryan, I'm not to praise for my english :-D

> 
> >
> >> --
> >> ~Bryan
> >>
> >
> >Hi Brian,
> >
> >thank you! Ouch I've just sent a v2 for other issues...
> >no problem I will send a v3, sorry all for spamming.
> >
> 
> Don't worry about me. I would wait until Greg and others have feedback
> on your v2 before sending a v3 with this minor nitpick.
> 
> --
> ~Bryan
> 

too late, v3 submitted:(. But I understand what you say and agreed.
So let's wait a little more next time.

thank you,

fabio. 
