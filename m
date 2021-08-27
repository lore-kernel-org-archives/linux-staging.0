Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116CF3FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 16:22:26 +0000 (UTC)
Date: Fri, 27 Aug 2021 16:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail; t=1630081344;
	bh=I4JX7t4MHHBtFAolgl6hOrm9rgSrfGIzNZYXK4merpg=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=pJ79Bz155xZwlP/udsUIhz10XooeNt7fNvqWMvnrs9ajYpqApUCIsnMgl5fXhEbdW
	 +y6uXKV+Eeguet9DiNt6re6fobRc3P6KRHru1vIW3e/iJaI1qUXJ19BAekkL7fn0CD
	 bZ/VdB2OXUESdto1XEw5BczaL44wQWqgVEoHDPn3ZFmGxiBGjp63bsVbdhZDUE1QPJ
	 NXzKjnfKonSQspYjhHnmR9fCSBwthotl4lG8hVVolWWD217YMc14mxlrlqLRJd8B46
	 R5YO0CP/KQxRIYC+dE7V4RglUjmiolRW3V7jeGSRfAflvyP4gwB8QUPrsNSvTsMV9i
	 nhYJd+pAakz5w==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: Re: [PATCH 0/5] staging: rtl8723bs: remove unused functions
Message-ID: <20210827162204.vh4xbgniet5w5mmo@h510>
In-Reply-To: <cover.1630080164.git.hello@bryanbrattlof.com>
References: <cover.1630080164.git.hello@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Sorry for the noise Greg,

On this day, August 27, 2021 thus sayeth Bryan Brattlof:
> Changes in v3:
>  - Fix issue causing some emails to drop their In-Reply-To: header.
>
>  (For the curious: NullMailer & my email provider where conspiring)
>

This turns out to be untrue :(

I've been testing my git-send-email setup on some friends without issue.
Somewhere between me and the mailing list In-Reply-To: headers are being
dropped.

I'll be back, but you can safely drop any patches from me today :(

Again sorry for the noise

~Bryan

