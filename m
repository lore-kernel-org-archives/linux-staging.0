Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E919173
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 16:25:03 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id u15so4176853plg.13
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UyAqbe771W+Lff6kTHtxqnAb6wyR4jVkJwEdQgLmwXM=;
        b=RCXKCYv9ln5LbhRxVsZkAgrsxHMHPqdffVncbCoP8zHTR2s05PTRSMgK+hG8fnm1xI
         VE6KocOflCQf5XUe9L88OiJ4Gd0AvGpF0XcmTinZR6J2WFjWLqXyGYbTjTqdNZrTLIee
         af/RfWFTDj7DmtJmZJTbT1bZunbQVpzZBc1ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UyAqbe771W+Lff6kTHtxqnAb6wyR4jVkJwEdQgLmwXM=;
        b=Cx+UddL53uJuN2QZRNuHhtvBoi/Q2RuUEyUy9+rl1lwzYrLIj2sYKbDDIedOVuaaBy
         jW9moZGjjOvWbhl20w+zzmqvZS5oSpgVBrSvO38lWoqGzZubh4yB2nsWSVPIbXyhlLwq
         8kg9hjoEXTvuZXVkGxUuLT/vTmLGT+dv1CcVNOzpCGhn5y5P9jRzz8GKjlY4i74YSZ/R
         orwtx8wnT4rbutKanfVQgAjGA1XZzQj/FgmQsrGRzt/t9h2gHYlK/8h0ncqvCCUo0Ou9
         MAqcYRS2By6PoPPTEbUtvph33pWa1S3tuM/c80P37kscPFSgQd9pb65T7OInNiNDVBmd
         07zw==
X-Gm-Message-State: AOAM532atc8Liy2/uohox0YiaabXUpKy6rTBKjXmfD3p6H48zghcLHk0
	5wu4HNSX8d2tLgRoWRMCA9VF9Q==
X-Google-Smtp-Source: ABdhPJyq4LOVatvfadz65o72x/gkprpZlPk/8y+Qcd235dkYfx++eKkOf6dJ+KUNEdEavgccQRbFxg==
X-Received: by 2002:a17:90a:4894:: with SMTP id b20mr16180176pjh.13.1629390302929;
        Thu, 19 Aug 2021 09:25:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id nn18sm8165841pjb.21.2021.08.19.09.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 09:25:02 -0700 (PDT)
Date: Thu, 19 Aug 2021 09:25:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 45/63] ath11k: Use memset_startat() for clearing queue
 descriptors
Message-ID: <202108190923.30FD4FC6E@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-46-keescook@chromium.org>
 <87eeapbmhi.fsf@tynnyri.adurom.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eeapbmhi.fsf@tynnyri.adurom.net>

On Thu, Aug 19, 2021 at 04:19:37PM +0300, Kalle Valo wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memset(), avoid intentionally writing across
> > neighboring fields.
> >
> > Use memset_startat() so memset() doesn't get confused about writing
> > beyond the destination member that is intended to be the starting point
> > of zeroing through the end of the struct. Additionally split up a later
> > field-spanning memset() so that memset() can reason about the size.
> >
> > Cc: Kalle Valo <kvalo@codeaurora.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: ath11k@lists.infradead.org
> > Cc: linux-wireless@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> To avoid conflicts I prefer taking this via my ath tree.

The memset helpers are introduced as part of this series, so that makes
things more difficult. Do you want me to create a branch with the
helpers that you can merge?

-Kees

-- 
Kees Cook
