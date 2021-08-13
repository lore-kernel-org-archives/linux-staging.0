Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1D472
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 07:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=v5GvruCHAD5VdGVp7rPAa70pStcYZ0dgf5ANMBb+4wc=;
	t=1628840517; x=1630050117; b=Tq/rdP+PSHFAgUZqsAgMbUcgj2iLiLAprH21IUKQgt6tEqP
	jr6kb3vr6g0SiXgj0W95+oE/UtuyWtXeun1HQBcip0dpqxHgTKg0Hf8kJOooZPjViTxM3iCRNoxG+
	JK4Y6x6hN1SPDI6XttIqMahPaJv8444RwOJbtCXfFmnaKgwjui3jQkyp9KPDNWrxaSMQ9266MIGML
	ay+vgIu//URU9ZlyI12AbZvQY/MM39rFTzC6KGwggNlNFn3AtL32k4MpUoKUplIgdi6BWoySTZ5bD
	1dz4IATqQbpdajtV2iUFOYWfpHf3FLdCm7dvzAifwTYQuyfC8fbyHEM8ldfDGsuA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mERoz-00A937-Sm; Fri, 13 Aug 2021 09:41:42 +0200
Message-ID: <347234b097eb93a0882ad2a3a209c2b7923ff611.camel@sipsolutions.net>
Subject: Re: [PATCH 39/64] mac80211: Use memset_after() to clear tx status
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>, "David S. Miller"
 <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Keith Packard
 <keithpac@amazon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org,  linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,  linux-hardening@vger.kernel.org
Date: Fri, 13 Aug 2021 09:41:40 +0200
In-Reply-To: <202107310852.551B66EE32@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
	 <20210727205855.411487-40-keescook@chromium.org>
	 <202107310852.551B66EE32@keescook>
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

On Sat, 2021-07-31 at 08:55 -0700, Kees Cook wrote:
> 
> > @@ -278,9 +278,7 @@ static void carl9170_tx_release(struct kref *ref)
> >  	BUILD_BUG_ON(
> >  	    offsetof(struct ieee80211_tx_info, status.ack_signal) != 20);
> >  
> > 
> > -	memset(&txinfo->status.ack_signal, 0,
> > -	       sizeof(struct ieee80211_tx_info) -
> > -	       offsetof(struct ieee80211_tx_info, status.ack_signal));
> > +	memset_after(&txinfo->status, 0, rates);

FWIW, I think we should also remove the BUILD_BUG_ON() now in all the
places - that was meant to give people a hint to update if some field
ordering etc. changed, but now that it's "after rates" this is no longer
necessary.

johannes

