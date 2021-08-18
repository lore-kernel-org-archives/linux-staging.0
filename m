Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8272FAF
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=6OzbSXXafKMA7YgF8k8Tjy+aXQW8YBJ4OWUwbnu8sQw=;
	t=1629274019; x=1630483619; b=AOh1uhwq6MSG6W9mTERzEjCKXCAmXsZJ2P7298IyrMMXZgz
	6HatAxdAdTIScjeQjWhkDZ/PBkJ9L/3O5QfvV4W6Jd16rnf4yjfUl5m9YnWaoKrgReRClOARkYDvH
	0x4TdZ00FuprzVzKYt5pBo0V5icbIma0nPGkndmQD8pATd9nt0hioe1DEaqkfLyNbtKRYeEl5KLXc
	Yxam0qj7TokrqJSCoE4L73OE0XEyqRtGaTIpxaNmfDsPbboxE8cvbanDYbW57fUHR5XPhN0GsIZTT
	YrQaw2+b/XQ8Ttivr9yRlNAAxebnu6Ot/Y6Jq8dFp2yWHVg/ggPBLW24PJo/B/tA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mGGb6-00CcdG-FE; Wed, 18 Aug 2021 10:06:52 +0200
Message-ID: <8b48dac4c40127366e91855306d24e07eb0b81d9.camel@sipsolutions.net>
Subject: Re: [PATCH v2 44/63] mac80211: Use memset_after() to clear tx status
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Andrew Morton <akpm@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 clang-built-linux@googlegroups.com, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>,  linux-hardening@vger.kernel.org
Date: Wed, 18 Aug 2021 10:06:51 +0200
In-Reply-To: <11db2cdc5316b51f3fa2f34e813a458e455c763d.camel@sipsolutions.net>
References: <20210818060533.3569517-1-keescook@chromium.org>
	 <20210818060533.3569517-45-keescook@chromium.org>
	 <11db2cdc5316b51f3fa2f34e813a458e455c763d.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned

On Wed, 2021-08-18 at 09:08 +0200, Johannes Berg wrote:
> On Tue, 2021-08-17 at 23:05 -0700, Kees Cook wrote:
> > 
> > @@ -275,12 +275,11 @@ static void carl9170_tx_release(struct kref *ref)
> >  	if (WARN_ON_ONCE(!ar))
> >  		return;
> >  
> > 
> > 
> > 
> > -	BUILD_BUG_ON(
> > -	    offsetof(struct ieee80211_tx_info, status.ack_signal) != 20);
> > -
> > -	memset(&txinfo->status.ack_signal, 0,
> > -	       sizeof(struct ieee80211_tx_info) -
> > -	       offsetof(struct ieee80211_tx_info, status.ack_signal));
> > +	/*
> > +	 * Should this call ieee80211_tx_info_clear_status() instead of clearing
> > +	 * manually? txinfo->status.rates do not seem to be used here.
> > +	 */
> 
> Since you insist, I went digging :)
> 
> It should not, carl9170_tx_fill_rateinfo() has filled the rate
> information before we get to this point.

Otherwise, looks fine, FWIW.

Are you going to apply all of these together somewhere? I (we) can't,
since memset_after() doesn't exist yet.

johannes

