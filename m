Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E5168
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 09:05:47 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id f3so1410067plg.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NwlqG+rGO9KvfhCSwLDgRYsI8h6dWdnqYqbHJGPEme0=;
        b=R5Ryqi+3ufOXj4PruwnTvqtfAJxKzmWANSkCph9vX3JAIUwLfa/ogsf0XiAzmuAaIb
         VPDfjaA6JoKlT4Kx+R9SxDMV4d2OeUToJNM29cVAvSSW7Gq1sgBqjsTAvV4VPEc/f7nR
         v/9FoiPkSVtpFKIvuRP2dgdjigBNevI1IirKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NwlqG+rGO9KvfhCSwLDgRYsI8h6dWdnqYqbHJGPEme0=;
        b=cxV/i0oKiye8o2ynhpTOyCrSusvtzecxSb2aGjTfOfWMPf7YO7DLLm8UJ2Him9uzOZ
         yjjU2Oq0w/gbsgkCb4mCiMXmRaG985dsiXcax+wrb1jls1CYtZUKXZbw0p4oJR6tfluZ
         LYrrjrr0TfvhsMXIFvy54b3wWl7MpJIBfr8/p/YQ96rEWp9cCYqwLpbLJCGjWQmFp61c
         j/wRCM2w2DSCtLLdfUz+t1hf+NcjMgbBudVKd1+AIQLl077S9lMth8SMvrwGhd/KjyWV
         rR9R/ErGJ9LPsSodHEwhRXBlyuc7EnuGhPWdrSXMfL/5bR8zIgTUfF/yBC0lSOAZA/V4
         1hHg==
X-Gm-Message-State: AOAM5337FIk7kpkEwFj8KevJFWJI2R5phH51E1H1Be0PprupaY/0s+Fe
	/fiUfcdaLBJq+2AOJLRsxM9QCA==
X-Google-Smtp-Source: ABdhPJy5VoNYR8gwCuIaLE1kUReGMfgEfhj9n5qCxc6K8dzpoM8CUxBKq9FzEjdxDuCc9RNmRV3rMg==
X-Received: by 2002:a17:90a:6c97:: with SMTP id y23mr8162537pjj.117.1629277547417;
        Wed, 18 Aug 2021 02:05:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y19sm5468368pfe.71.2021.08.18.02.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 02:05:46 -0700 (PDT)
Date: Wed, 18 Aug 2021 02:05:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 44/63] mac80211: Use memset_after() to clear tx status
Message-ID: <202108180203.592E3F01@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-45-keescook@chromium.org>
 <11db2cdc5316b51f3fa2f34e813a458e455c763d.camel@sipsolutions.net>
 <8b48dac4c40127366e91855306d24e07eb0b81d9.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b48dac4c40127366e91855306d24e07eb0b81d9.camel@sipsolutions.net>

On Wed, Aug 18, 2021 at 10:06:51AM +0200, Johannes Berg wrote:
> On Wed, 2021-08-18 at 09:08 +0200, Johannes Berg wrote:
> > On Tue, 2021-08-17 at 23:05 -0700, Kees Cook wrote:
> > > 
> > > @@ -275,12 +275,11 @@ static void carl9170_tx_release(struct kref *ref)
> > >  	if (WARN_ON_ONCE(!ar))
> > >  		return;
> > >  
> > > 
> > > 
> > > 
> > > -	BUILD_BUG_ON(
> > > -	    offsetof(struct ieee80211_tx_info, status.ack_signal) != 20);
> > > -
> > > -	memset(&txinfo->status.ack_signal, 0,
> > > -	       sizeof(struct ieee80211_tx_info) -
> > > -	       offsetof(struct ieee80211_tx_info, status.ack_signal));
> > > +	/*
> > > +	 * Should this call ieee80211_tx_info_clear_status() instead of clearing
> > > +	 * manually? txinfo->status.rates do not seem to be used here.
> > > +	 */
> > 
> > Since you insist, I went digging :)
> > 
> > It should not, carl9170_tx_fill_rateinfo() has filled the rate
> > information before we get to this point.

Ah-ha! Thanks for checking. I'll update the comment to explain the
rationale here.

> Otherwise, looks fine, FWIW.

Thanks!

> Are you going to apply all of these together somewhere? I (we) can't,
> since memset_after() doesn't exist yet.

Right, given the dependencies, I am expecting to just carry the whole
series, since the vast majority of it has no binary changes, etc. I'm
hoping to get it into -next soon, but we're uncomfortably close to the
merge window. :P

-- 
Kees Cook
