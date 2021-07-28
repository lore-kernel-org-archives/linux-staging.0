Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AB73484
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 21:01:26 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id z3so2935164plg.8
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v4TsexyUVtPmnWQp8z0vQybdqGDFJ+IKH3X3D8imsE4=;
        b=hg+gKirQh4CStWcllp3dCMDGaMydMxkrfDz7dI28grfxRHealC37a8xJDfYI0FVrQZ
         2tYUG05gAJbnL7ZSiMGxXN0BbgqYaSHUyURFCYtvwZV0Mx+omFId8CJj1UovnV0ee9cA
         66wsvWC92AbI6ez9cGn13eYUvZ7XhoUJQlPzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v4TsexyUVtPmnWQp8z0vQybdqGDFJ+IKH3X3D8imsE4=;
        b=I2pDijdKgspSaunfk+4+w+t9ezWR6naEsvZu4QX0WG7Iobco7IFlPK3nGtMvcymnZi
         YCyfiOSfVa/w+ZHtDAgsmS+fJbiOsiawMyCilnTvNAY/Jqd/eWid0Vg9KPt1v9qBEvsO
         +80eIvtABt/WTHbfWiQpRS6CPoa3/UTG8vlU5Fk09TtRl0VhMGIM3gGW+tx3JoyWQtmh
         h5eN/Gv3QMLtH4Us3aavhGBIoE6nqDgYRxRwjrj8Y0+F3obRO4T28gOqVpxNVV7YbYfV
         4SHZzkE3Muxr34LSGS1Ls55vF8VQvaWerZM8KJXI7vn5R+oWVlra3xCg+c2sS15bPdXy
         OIsA==
X-Gm-Message-State: AOAM532Bt5D8uHE/m0TLWNMgVZYqvoEA0Ks0T/9yAlrtWzUM2oUuD9Bp
	kTMYOPU+MwPlZTYlZ7hGCrEh6g==
X-Google-Smtp-Source: ABdhPJzkF5cilzb73BCpcxICFq3XUeRAJh6fZICuqCaVMVL6bCDUAwLUBtlkfh9/lXbLB+5T11D9+w==
X-Received: by 2002:a17:902:d717:b029:12c:1653:d611 with SMTP id w23-20020a170902d717b029012c1653d611mr1508273ply.51.1627506086388;
        Wed, 28 Jul 2021 14:01:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t3sm932392pfd.153.2021.07.28.14.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 14:01:25 -0700 (PDT)
Date: Wed, 28 Jul 2021 14:01:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 19/64] ip: Use struct_group() for memcpy() regions
Message-ID: <202107281358.8E12638@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-20-keescook@chromium.org>
 <YQDxaYrHu0PeBIuX@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQDxaYrHu0PeBIuX@kroah.com>

On Wed, Jul 28, 2021 at 07:55:53AM +0200, Greg Kroah-Hartman wrote:
> >  struct ethhdr {
> > -	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
> > -	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
> > +	union {
> > +		struct {
> > +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
> > +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
> > +		};
> > +		struct {
> > +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
> > +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
> > +		} addrs;
> 
> A union of the same fields in the same structure in the same way?
> 
> Ah, because struct_group() can not be used here?  Still feels odd to see
> in a userspace-visible header.

Yeah, there is some inconsistency here. I will clean this up for v2.

Is there a place we can put kernel-specific macros for use in UAPI
headers? (I need to figure out where things like __kernel_size_t get
defined...)

-- 
Kees Cook
