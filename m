Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0B173
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 19:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=vGxwLQwFO2S7TTjs1yBKTvR75GNMnpeXiG3mZABQ1io=;
	t=1628883904; x=1630093504; b=t/jdB0s6VH0dlIjduxeXuxu1jqRbxS/0VRvWdf6HApMdYzx
	Xb2sCD+RAjtJjjVTOBqQaoZaVKH9indbtkHwfnaZuPcDwfJQSs5rUqwhTnYxGLOqAM76bRV6NFsxj
	v9G3CVkKjRTgCDP5oICJ2y+IpvI2Kd350P74UE7MmMjMcn4ob1Gjqs2R+0r2mZWRt5RLHQytrnL37
	NnL4Qf5MlhbVUJRt19jgc/GkA6Z0rUEclboHNPmpZTCaEQf624dOSGOGrfFI4pZwIW6Cb1UPw23al
	BwRJCo+NasQo0JBJSXH8pEwelL8oBBLfLocv0BM0lhvoomadsAFWV9H0dsEaOZ0w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mEd6u-00ANL4-Up; Fri, 13 Aug 2021 21:44:57 +0200
Message-ID: <6488ed24d2ce0ccb1987c271064e25bc72c30863.camel@sipsolutions.net>
Subject: Re: [PATCH 10/64] lib80211: Use struct_group() for memcpy() region
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Keith Packard <keithpac@amazon.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>,  linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org,  linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com
Date: Fri, 13 Aug 2021 21:44:55 +0200
In-Reply-To: <202108130846.EC339BCA@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
	 <20210727205855.411487-11-keescook@chromium.org>
	 <a9c8ae9e05cfe2679cd8a7ef0ab20b66cf38b930.camel@sipsolutions.net>
	 <202108130846.EC339BCA@keescook>
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

On Fri, 2021-08-13 at 08:49 -0700, Kees Cook wrote:
> 
> Ah! Yes, thanks for pointing this out. During earlier development I split
> the "cross-field write" changes from the "cross-field read" changes, and
> it looks like I missed moving lib80211_crypt_ccmp.c into that portion of
> the series (which I haven't posted nor finished -- it's lower priority
> than fixing the cross-field writes).

Oh, OK. I think all of this patch was cross-field read though.

Anyway, the patch itself is fine, just seems incomplete and somewhat
badly organised :)

johannes


