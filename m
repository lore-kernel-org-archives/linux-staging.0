Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835206D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:38:50 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id i18so15012797wrm.5
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PgfSSgWWGnJrITlLJ0K+KPTYMGpFHqdgXbRVjqTXauE=;
        b=kDhTBq1m4FakBwFLKFIwVcGHcH0AqtLggFGnTPKPAgyLWmSb6Qkhj/u4hh/cHK4oei
         tO7ZoP41t6AF+dyQ0kZlul8ZxKo6xDtBewUP+2hZL0QvA7gHAkPCkcQ6pXZOiceANA79
         AMt/CAmZ7Qco8RQ+rkFCbumUWVrkKvthomWnDLc8vpYw+JA0hmiR1tenlsVzVEx/nw5Z
         WTpJ+tJzX/r0xR5tTPHo16hvjB8nNaCGpEIo+RPtp6ssTgEiiCgC6S+mzuHQ4HeNi9sL
         AXSfnpw6bBkovdH1gTpdv1cIAEpNDZzl8tMKYuK2rZ6v1TELt0p1w3DzFOvaLPSgCC/A
         6SSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PgfSSgWWGnJrITlLJ0K+KPTYMGpFHqdgXbRVjqTXauE=;
        b=CH0jmmHIBK57xcmkRX1uIcbYZAPJkpb9KyWNHVTUdOh6r0FYXpdytKzFoMRvy1x/6D
         9B5usE++UTFlRVk01CSp6wry98JeVG51GLKZZpO6N0zmy12SCfuIT7E6NNRcLZpE/Tk5
         RCv+kFYKVt0Mj0+Luuz55gO1Xmk8u4+LxdtLo7Ee83A12z20ShIjYhBTbKNr66HjtWvv
         jv/4LtNYm6ebGedafgX9EFHxodBlkfuk3TB6UJolzLPo+YUogsjYjNejlGqefY2eTjXw
         GOG/TJM/RiAdacf9/sCXpr1nPHnsgH7dl/UPrCMWgT/1VlJ2tJ3Az11TgFvrA/Tw5m5m
         zPYg==
X-Gm-Message-State: AOAM53290gF4iVGOqKMcB01d4q8blWSaBhJuAiR2N+N/ZyC3wjQBIfZ0
	rU5padCNylZfH2QxzXLHtv4=
X-Google-Smtp-Source: ABdhPJy34RCn31VLSLxNkvRukDu5fZtzbNJcl+BYjRDAeKer83hnHvTVrU+Z0ars+LB2pgKbk9RBcQ==
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr5166844wrs.395.1617809929055;
        Wed, 07 Apr 2021 08:38:49 -0700 (PDT)
Received: from agape.jhs ([5.171.72.217])
        by smtp.gmail.com with ESMTPSA id y4sm9642472wmc.2.2021.04.07.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:38:48 -0700 (PDT)
Date: Wed, 7 Apr 2021 17:38:46 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/19] drivers: rtl8723bs: rewrite comparison to null
Message-ID: <20210407153845.GB1590@agape.jhs>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
 <0c6d53c851d1b07eb0183108e0bad7b4f273f04b.1617802415.git.fabioaiuto83@gmail.com>
 <YG3MOCQHu3o/qHTg@kroah.com>
 <20210407152533.GA1590@agape.jhs>
 <YG3QGq0T/cO2kdFN@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG3QGq0T/cO2kdFN@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 07, 2021 at 05:30:34PM +0200, Greg KH wrote:
> On Wed, Apr 07, 2021 at 05:25:34PM +0200, Fabio Aiuto wrote:
> > On Wed, Apr 07, 2021 at 05:14:00PM +0200, Greg KH wrote:
> > > On Wed, Apr 07, 2021 at 03:49:31PM +0200, Fabio Aiuto wrote:
> > > > fix following post-commit hook checkpatch warnings:
> > > > 
> > > > CHECK: Comparison to NULL could be written "!psta"
> > > > 97: FILE: drivers/staging/rtl8723bs/core/rtw_ap.c:2115:
> > > > +		if (psta == NULL)
> > > > 
> > > > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > > > ---
> > > >  drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > Nit, your subject line has "drivers:" not "staging:" here.  Be a bit
> > > more careful next time please.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > sorry, you can drop them off the staging-testing branch and I will resend you all if you want,
> 
> Nah, it's not worth it, I'll keep them for now :)

:-D
