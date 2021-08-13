Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1A72
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 18:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=rq6VfTjLJfvWeGU0hw3GUv7MRF3dGVPTx8dKGrBFFlo=;
	t=1628878790; x=1630088390; b=uBj14tUWftfowyfpo41ERQLrT0LiPWc8L0V77h4Z3QirP5X
	6YacBP9oMtO+5yY42Mk6t7CbufVEvhJuTgAfvf3ug6JfEpfu9zpIdZ9tAUtBDDbxw8v9I9YOcnftR
	2f5r2VEGiwbx+V4xpAwiT7FNcQAVhNGwXpSpPKT+rJgkfiMtH+f3cvr2MhV8pXs8eCXXict55EnEJ
	sit6YLA/K9ksHNUlSDEGBPNSqklJ5QwLQF8yUcBxrU9gshvh83Zl30Og3EsYcPEDoFn0RuinfV9wP
	0bldv5ysM6BxeoHGB8qBNCsejRNo0+w8ovPKADMLUk/HTf6VmG/wVnHDIRDG7EyA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mEbmM-00ALlG-5g; Fri, 13 Aug 2021 20:19:38 +0200
Message-ID: <465daabf002e098f0a24cf07f72a69d7e20c7440.camel@sipsolutions.net>
Subject: Re: [PATCH 39/64] mac80211: Use memset_after() to clear tx status
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  "Gustavo A. R. Silva" <gustavoars@kernel.org>, Keith
 Packard <keithpac@amazon.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, 
 linux-hardening@vger.kernel.org
Date: Fri, 13 Aug 2021 20:19:36 +0200
In-Reply-To: <202108130907.FD09C6B@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
	 <20210727205855.411487-40-keescook@chromium.org>
	 <202107310852.551B66EE32@keescook>
	 <bb01e784dddf6a297025981a2a000a4d3fdaf2ba.camel@sipsolutions.net>
	 <202108130907.FD09C6B@keescook>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Fri, 2021-08-13 at 09:08 -0700, Kees Cook wrote:
> > 
> > The common helper should also clear ack_signal, but that was broken by
> > commit e3e1a0bcb3f1 ("mac80211: reduce IEEE80211_TX_MAX_RATES"), because
> > that commit changed the order of the fields and updated carl9170 and p54
> > properly but not the common helper...
> 
> It looks like p54 actually uses the rates, which is why it does this
> manually. I can't see why carl9170 does this manually, though.

mac80211 also uses the rates later again on status reporting, it just
expects the # of attempts to be filled etc. I haven't looked at
carl9170, but I would expect it to do something there and do it
correctly, even though old it's a well-written driver and uses mac80211
rate control, so this would need to be correct for decent performance.

But I guess it could be that the helper could be used because the rates
were already handed to the firmware, and the code was just copy/pasted
from p54 (the drivers were, IIRC, developed by the same folks)

johannes

