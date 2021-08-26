Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9103B3FC0
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 05:51:22 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id fs6so1452229pjb.4
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 22:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ccQ0MGCdd2sOJEH6txbJHSp3br3UWRPN7Oxkykdkfrk=;
        b=h98ncCnoSgRO/F8RcTGwgl4lQgtwO7Z069Jg7gZwqH61LgYfFHRkVKlkk5SYejX3Qo
         wp+dBQvMBboIKtqJi98pwPqrfc0z40lBaUNd0lecBa90rVYJ+4XjuIYSPHipBNUKEW6J
         /Ns8wV2HFg8eY7ZT5jRFEk0xCu3jQqxN02ClQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ccQ0MGCdd2sOJEH6txbJHSp3br3UWRPN7Oxkykdkfrk=;
        b=jOaZIdI5ZpHSFk8QBT0bEjr1BCdLjX1vdduUuImUqZVDCeobyr0JfbmK38J456FwPr
         eTsDOUQVv3Mh5voyAfCxbA3J/PCBqkgIFxlRwOHdGQJmNrXvWuKE5KFs8VtUGknW5Z+8
         pm0m9zGMkFyxTX67jdNQelojcAi+Zbv6mR2Nu2E+iO9i1Pzy/lvJYKg6uU4wqCrWAmZl
         7YjwdNWj84KC/vSZcYaw5Myt9c4hbYRXHquuFEvlRl1Qs8kP/smm10jMErPr3+0UW7la
         DBrK4b6s182OBztyUv5bSaxjYS1+j1H2KDNveGD/hc/HV1AHasMHXzwOJG9+0+rJ75H+
         HY4Q==
X-Gm-Message-State: AOAM532+esPWlF82GtPWyu9VNmJ7OvDOojnlQDQH6tPZT2RF537QHq8f
	UjgPAFLWTudxLq5bsBwHR9WVBQ==
X-Google-Smtp-Source: ABdhPJxNdpjMBaxv04Np/J/tJKVtP0qIehTtqoqEULck0k4pYP27+H3m2/MaKclQTAZAaqJQhLiqIw==
X-Received: by 2002:a17:90a:dac2:: with SMTP id g2mr14392631pjx.45.1629957082083;
        Wed, 25 Aug 2021 22:51:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c24sm2088939pgj.11.2021.08.25.22.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 22:51:21 -0700 (PDT)
Date: Wed, 25 Aug 2021 22:51:20 -0700
From: Kees Cook <keescook@chromium.org>
To: Keith Packard <keithp@keithp.com>
Cc: linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@codeaurora.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Nilesh Javali <njavali@marvell.com>,
	Manish Rangankar <mrangankar@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Ross Schmidt <ross.schm.dev@gmail.com>,
	Marco Cesati <marcocesati@gmail.com>, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Dan Williams <dan.j.williams@intel.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/5] treewide: Replace 0-element memcpy() destinations
 with flexible arrays
Message-ID: <202108252250.C1DAEE5@keescook>
References: <20210826050458.1540622-1-keescook@chromium.org>
 <20210826050458.1540622-4-keescook@chromium.org>
 <87r1egpym5.fsf@keithp.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1egpym5.fsf@keithp.com>

On Wed, Aug 25, 2021 at 10:24:18PM -0700, Keith Packard wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > In some cases, use of the flex_array() helper is needed when a flexible
> > array is part of a union.
> 
> The code below seems to show that the helper is also needed when the
> flexible array is the only member of a struct? Or is this just an
> extension of the 'part of a union' clause?

That's correct. I have that documented in the DECLARE_FLEX_ARRAY macro
itself, but I mis-spoke in this changelog here (the uses were for "alone
in a struct"). I've adjusted the changelog now. :)

Thanks!

-Kees

> 
> > @@ -160,7 +160,7 @@ struct bmi_cmd {
> >  
> >  union bmi_resp {
> >  	struct {
> > -		u8 payload[0];
> > +		DECLARE_FLEX_ARRAY(u8, payload);
> >  	} read_mem;
> >  	struct {
> >  		__le32 result;
> 
> -- 
> -keith



-- 
Kees Cook
