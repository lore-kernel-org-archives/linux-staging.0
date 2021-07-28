Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E57C3484
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 21:54:54 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so6115492pji.5
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 14:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PvxV9gHhGKtdfFaQjqk5AbqIjKjaiVpsJxDp652BEFc=;
        b=Ssr+bNcEOuYZGZ5oJIQs+A8B9fkhzqh1u9Z8zaxKcBCDP8OfGFfuirkmGy3mGu8Ayo
         +m6YNKKevzCabTQ+jtWD1tnOrFvanE0IWzW2gN3TxMVXflAELgequkGXNFZv2cLW3+7o
         82FR2yiZxn/K2X43TKjkwH3LlwMhtC/vXsFZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PvxV9gHhGKtdfFaQjqk5AbqIjKjaiVpsJxDp652BEFc=;
        b=BwvTa15AO5T4hqGayTUyFas/ThAhJRur0WSGOLk9cqrBnqLX8IAHLK+ey4Oox9qPrA
         Dm6SfwBZie/YRCOqqVh+nP9JSGC0kPUTkQlRMt6Lw+ay5keYrBgWRmefszrdRlA2XpG2
         RuNYGmxPqd3Sm9zwX7WlUN5HESC4CiBjs5JSTDhUNTGRYCFzZ2RwC5GpG1RzA5J+JnxQ
         mwjXABWGC9o7kpJayrud3qlcmsXvNHrFm9QMpq94ymN4Z34boMiFit1Gn+W3QZz9wejO
         R2uSse4ysVI84D7Rj9337jPWOcuXkkb2+5UQlVyym7j88tD6XkEE5r8loD0GTwT5rPZx
         GLlA==
X-Gm-Message-State: AOAM532YjDOzhL6s2y8XhgJ2NdK5vDRAs5h4G3ELTfl8Flh8TJ4JQcsz
	4jX1IYWVHayuzvrGoqgNfCvSvw==
X-Google-Smtp-Source: ABdhPJxUo4g9VfX8u6iU89489n+cH/MsR7SE+SmAE0dzWHUhk6Ft3KaP/7y+/BJ2KWH/1p+QrGqCsA==
X-Received: by 2002:a17:90a:1109:: with SMTP id d9mr1816360pja.183.1627509293927;
        Wed, 28 Jul 2021 14:54:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n22sm1014921pff.57.2021.07.28.14.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 14:54:53 -0700 (PDT)
Date: Wed, 28 Jul 2021 14:54:52 -0700
From: Kees Cook <keescook@chromium.org>
To: dsterba@suse.cz, Dan Carpenter <dan.carpenter@oracle.com>,
	linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 02/64] mac80211: Use flex-array for radiotap header bitmap
Message-ID: <202107281454.F96505E15@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-3-keescook@chromium.org>
 <20210728073556.GP1931@kadam>
 <20210728092323.GW5047@twin.jikos.cz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728092323.GW5047@twin.jikos.cz>

On Wed, Jul 28, 2021 at 11:23:23AM +0200, David Sterba wrote:
> On Wed, Jul 28, 2021 at 10:35:56AM +0300, Dan Carpenter wrote:
> > @@ -372,7 +372,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
> >  			ieee80211_calculate_rx_timestamp(local, status,
> >  							 mpdulen, 0),
> >  			pos);
> > -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_TSFT);
> > +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_TSFT);
> 
> A drive-by comment, not related to the patchset, but rather the
> ieee80211 driver itself.
> 
> Shift expressions with (1 << NUMBER) can be subtly broken once the
> NUMBER is 31 and the value gets silently cast to a 64bit type. It will
> become 0xfffffffff80000000.
> 
> I've checked the IEEE80211_RADIOTAP_* defintions if this is even remotely
> possible and yes, IEEE80211_RADIOTAP_EXT == 31. Fortunatelly it seems to
> be used with used with a 32bit types (eg. _bitmap_shifter) so there are
> no surprises.
> 
> The recommended practice is to always use unsigned types for shifts, so
> "1U << ..." at least.

Ah, good catch! I think just using BIT() is the right replacement here,
yes? I suppose that should be a separate patch.

-- 
Kees Cook
