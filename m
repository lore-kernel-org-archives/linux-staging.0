Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF41D50E;
	Fri, 28 Oct 2022 18:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666982118; x=1698518118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e6tXyHXcx1wINDytML2ECkyfhcbu00FuKqs+1j13wTc=;
  b=ZoyJ+vZRYXdd9SFGDAWmaH2MsAIIQyBXUwkb9MgFGp0MOZjOxqreoGI5
   /2gpE5zsr4XagvahwZsa2Ww2jrYUPIx77kkPDnY/y3AGzcEp4PDSnWDXV
   uvJC1G/pMjM7DX+U8Ii+707YCqMAXkca496frGiSu4EcF5Af+1OQAE2TK
   aS6f6U0w1ZOO0YD3MqMF0j+eV4IiWzaCk9nAqA2EsFOn158b+sSXjp1Jf
   AlCCmdezJQHpOxO38WnfxVOH3m5NHJ+OGKVMVwx2MUwXbrcMssF9l1gzC
   L8fZF0Ww5hY2fp0tOuJS0D/9K2B5v5SDwiPlEWxhIQKr1R5MJYoyAUKi9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="288278368"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="288278368"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 11:35:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="758174577"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="758174577"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.175.207])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 11:35:17 -0700
Date: Fri, 28 Oct 2022 11:35:15 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: UMWARI JOVIAL <umwarijovial@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] WARNING: Possible repeated word: 'very'
Message-ID: <Y1wg4y6k1fe/TF0d@aschofie-mobl2>
References: <20221028051420.GA30073@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028051420.GA30073@rdm>

On Fri, Oct 28, 2022 at 08:14:20AM +0300, UMWARI JOVIAL wrote:
> i used checkpatch.pl script to identify the above
> Repetition of the same word in one sentence same line
> 
> Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>

This is my (not yet automated) response:

You are sending patches to the Outreachy list, in a way
that makes me suspect you have overlooked the Outreachy
Project Contribution Information.

Please review:
https://www.outreachy.org/outreachy-december-2022-internship-round/communities/linux-kernel/  (only accepted applicants can see this link)

https://lore.kernel.org/outreachy/Y0D+dzbjRtuc0KT4@aschofie-mobl2/

Alison

> ---
>  drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
> index 090345bad223..30a0276b8b58 100644
> --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> @@ -766,7 +766,7 @@ void r8712_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
>   * If we turn on USE_RXTHREAD, then, no need for critical section.
>   * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
>   *
> - * Must be very very cautious...
> + * Must be very cautious...
>   *
>   */
>  struct xmit_frame *r8712_alloc_xmitframe(struct xmit_priv *pxmitpriv)
> -- 
> 2.25.1
> 
> 
