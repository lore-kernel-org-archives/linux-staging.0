Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF833FD0
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 22:45:34 +0000 (UTC)
Date: Tue, 14 Sep 2021 22:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail; t=1631659526;
	bh=NgZMqBOxNObodZSjMDIHyt0PNPZZdXFN2N/CqmntTFM=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=nhf3S8liJkAq1T/BDhESL1FtcJzciSfJQV4L+im0hX0emr+legpSumjsxDFPfdCeS
	 w23Xuvq67qt++gt/7Av0d7Uuq7DY4UzWFn6eyGu/3ILjZtAep9Rt6jZBW3PZydmurv
	 ATfPA86ccj00/ZcuEK5gS+lhq55BPqK7UynZ77QOVjadz/8pF27rS53nub9tfDtpcp
	 Pov9QugSCgbjWU7OfyIRv+tYqkrEaYIWL4sppESlGsc/9Q0tZE/rc8eF5/MhqCIi4V
	 R3ZFwAFFQojvX15I9DT4WMa2FU8x0wN3AnF1SNdEU2Tgit3tbi4vPiIoQT7amXy0CJ
	 9phZSSpiTrOIw==
To: Dan Carpenter <dan.carpenter@oracle.com>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: Re: [PATCH] staging: rtl8723bs: define wowlan_stub only when CONFIG_PM is enabled
Message-ID: <20210914224509.g2fbttqmrjhevftu@h510>
In-Reply-To: <20210914085214.GA2088@kadam>
References: <20210913140937.1490133-1-hello@bryanbrattlof.com> <YT97lJVU8cx3wxwN@kroah.com> <20210913234247.ptqjjbilrtkzc4id@h510> <20210914085214.GA2088@kadam>
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

On this day, September 14, 2021, thus sayeth Dan Carpenter:
> On Mon, Sep 13, 2021 at 11:42:55PM +0000, Bryan Brattlof wrote:
> > I'll be back with a v2 that rips all of this out.
>
> Or use the __maybe_unused annotation:
>
> static __maybe_unused const struct wiphy_wowlan_support wowlan_stub =3D {
>

Thanks for the suggestion Dan; I like this much better. :)

I've been poking around with my config today and noticed I can still
produce this warning with CONFIG_PM enabled, which means something else
is going on that I don't fully understand yet.

I may hold off on sending v2 until I make sure I understand what's going
on and double check that I didn't bork my config.

Thanks from jumping in
~Bryan

