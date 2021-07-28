Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F4070
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 05:52:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6233F60F91;
	Wed, 28 Jul 2021 05:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627451534;
	bh=nUOThSwtZ87Jw+CXwl+FwlWvYkHPkssRucboLcrmd90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIJyCaqr1xfetzHAZanMNRQYhPz2W7BVjUbvZ/cg0giNbNRbWYSfkr7AwWFywJ0T1
	 FPB4wjxunN/l1gFycsM1PXt+P8alzvfFDCE+mDoOQ5F/lLCJFjnF702h+O9qgMgRfo
	 bcuZJkkCSMXuNuDrW+PLFHrtVDTjjQzHP3kojxD8=
Date: Wed, 28 Jul 2021 07:52:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 10/64] lib80211: Use struct_group() for memcpy() region
Message-ID: <YQDwiz1SdrzFKOWw@kroah.com>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-11-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727205855.411487-11-keescook@chromium.org>

On Tue, Jul 27, 2021 at 01:58:01PM -0700, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Use struct_group() around members addr1, addr2, and addr3 in struct
> ieee80211_hdr so they can be referenced together. This will allow memcpy()
> and sizeof() to more easily reason about sizes, improve readability,
> and avoid future warnings about writing beyond the end of addr1.
> 
> "pahole" shows no size nor member offset changes to struct ieee80211_hdr.
> "objdump -d" shows no meaningful object code changes (i.e. only source
> line number induced differences and optimizations).
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 5 +++--
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 5 +++--
>  include/linux/ieee80211.h                     | 8 +++++---
>  net/wireless/lib80211_crypt_ccmp.c            | 3 ++-
>  4 files changed, 13 insertions(+), 8 deletions(-)

For the staging portion:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
