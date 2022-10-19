Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D22577;
	Wed, 19 Oct 2022 09:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666170260; bh=hEVfT2JbyLs5Gr5UpL/k8FYzC2YYLPYBL7rsr8QE1os=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=nqqOY52fDhvUSk9GiQxEkfA9Oj3Qiu/TopzlkVhfNh9+GeKN7Lt1+1hxM6nSm1xGE
	 OZNKtxw7Y1+32wmcJ3/2i/vFv8WTq8qB6gbqvzNTimXmCaQ6ftm5uVaYSwsf51uCbc
	 /cEULRGCC85GCYKtB3gxBn3K9xVK4IVKOiHXEvqc=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via [213.182.55.206]
	Wed, 19 Oct 2022 11:04:20 +0200 (CEST)
X-EA-Auth: ntGaQGQ20LqP0d8FsaYBfrxaYSUSvESEasrQC7tE5rHoBo+C5kGzTortDq30IQ2mEasGIL6FWEqyBr/71xPweCOfjDC8gYQr
Date: Wed, 19 Oct 2022 14:32:59 +0530
From: Deepak R Varma <drv@mailo.com>
To: Joe Perches <joe@perches.com>
Cc: David Laight <David.Laight@aculab.com>,
	'Greg KH' <gregkh@linuxfoundation.org>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
	"Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
	"phil@philpotter.co.uk" <phil@philpotter.co.uk>,
	"paskripkin@gmail.com" <paskripkin@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kumarpraveen@linux.microsoft.com" <kumarpraveen@linux.microsoft.com>,
	"saurabh.truth@gmail.com" <saurabh.truth@gmail.com>
Subject: Re: [PATCH 2/4] staging: r8188eu: reformat long computation lines
Message-ID: <Y0+9Q6hIde3Y3tNC@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666011479.git.drv@mailo.com>
 <2dd27eff9aab5ffe31e61086c0584982794507cf.1666011479.git.drv@mailo.com>
 <Y01iLXp20G0FSJFG@kroah.com>
 <a0bef75b959f4ca6a7bbfaacd531f8ae@AcuMS.aculab.com>
 <Y06fKv7U0/GhZfSZ@debian-BULLSEYE-live-builder-AMD64>
 <e2675698427ed987dd88ed5f9996fe86e5315dbb.camel@perches.com>
 <Y0+WYIVTugrs6khA@debian-BULLSEYE-live-builder-AMD64>
 <3ce9206fc3b756e72ee4dcfbbad6cefae5fedada.camel@perches.com>
 <Y0+c1ljPcD+Qr4Gd@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0+c1ljPcD+Qr4Gd@debian-BULLSEYE-live-builder-AMD64>

On Wed, Oct 19, 2022 at 12:14:38PM +0530, Deepak R Varma wrote:
> On Tue, Oct 18, 2022 at 11:38:22PM -0700, Joe Perches wrote:
> > On Wed, 2022-10-19 at 11:47 +0530, Deepak R Varma wrote:
> > > On Tue, Oct 18, 2022 at 10:43:07PM -0700, Joe Perches wrote:
> > > > On Tue, 2022-10-18 at 18:12 +0530, Deepak R Varma wrote:
> > > > > On Tue, Oct 18, 2022 at 11:21:26AM +0000, David Laight wrote:
> > > > > > From: Greg KH
> > > > > > > Sent: 17 October 2022 15:10
> > > > > > >
> > > > > > > On Mon, Oct 17, 2022 at 06:52:50PM +0530, Deepak R Varma wrote:
> > > > > > > > Reformat long running computation instructions to improve code readability.
> > > > > > > > Address following checkpatch script complaints:
> > > > > > > > 	CHECK: line length of 171 exceeds 100 columns
> > > > > > > > 	CHECK: line length of 113 exceeds 100 columns
> > > > []
> > > > > > > > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > > > []
> > > > > > > > @@ -211,8 +211,10 @@ static int __nat25_network_hash(unsigned char *network_addr)
> > > > > > > >  	} else if (network_addr[0] == NAT25_IPX) {
> > > > > > > >  		unsigned long x;
> > > > > > > >
> > > > > > > > -		x = network_addr[1] ^ network_addr[2] ^ network_addr[3] ^ network_addr[4] ^
> > > > > > > network_addr[5] ^
> > > > > > > > -			network_addr[6] ^ network_addr[7] ^ network_addr[8] ^ network_addr[9] ^
> > > > > > > network_addr[10];
> > > > > > > > +		x = network_addr[1] ^ network_addr[2] ^ network_addr[3] ^
> > > > > > >
> > > > > > > Why not go out to [4] here and then you are one line shorter?
> > > > > >
> > > > > > and/or use a shorter variable name....
> > > > > Hi David,
> > > > > I have already re-submitted the patch set with 4 in line arrangement. Do you
> > > > > still suggest using shorter variable names?
> > > >
> > > > Assuming this code is not performance sensitive, I suggest not just
> > > > molifying checkpatch but perhaps improving the code by adding a helper
> > > > function something like:
> > > >
> > > > u8 xor_array_u8(u8 *x, size_t len)
> > > > {
> > > > 	size_t i;
> > > > 	u8 xor = x[0];
> > > >
> > > > 	for (i = 1; i < len; i++)
> > > > 		xor ^= x[i];
> > > >
> > > > 	return xor;
> > > > }
> > > >
> > > > so for instance this could be:
> > > >
> > > > 		x = xor_array_u8(&network_addr[1], 10);
> > > >
> > >
> > > Hi Joe,
> > > Great suggestion. Thank you.
> > > Is there a way to confirm that this improvement won't impact performance? Will I
> > > need any specific hardware / device to run tests?
> >
> > I suggest reading the code to see if the uses are in some fast path.
>
> Sounds good. Thank you for your guidance.

Hi Joe,
based on the code review so far, I am unable to determine if the chain of
function calls are part of any fast path. There is not enough code comments or
documentation available with this code.

Considering my Outreachy patch submission targets and timelines, I am unable to
spend much time on this research right now; unless an expert can confirm it is
okay to add the routine you outlined. Else, I will put this in on my TODO list
and revisit when I have time.

R8188EU maintainers / experts,
Can you confirm if it is sensible to implement the helper function suggested by
Joe? If yes, I will include the improvement in my current patch set and resubmit
the set for review.

Thank you,
./drv






>
> >
>
>
>


