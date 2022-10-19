Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7A823A7;
	Wed, 19 Oct 2022 06:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666160304; bh=YbLPat8J0sv9JZGjSblbFVJ+rO4BjaubVhSl47kEYgk=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=ZEKzQtQijlP0oqAXCjJ4PPzc1BfNripd13Q65ScDUb7d/bf7uwI20X4I1tuCKyASI
	 B4bPrCM9mjEk8ift2nLI185LoJuPYAKyx95uPBiKGtXyI2V6+Ou2dmnCxRPd4QgBuS
	 ApJJ9xdRuUQvj5g4xGu2rGbxGRlR/JD14VyBfTXg=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Wed, 19 Oct 2022 08:18:24 +0200 (CEST)
X-EA-Auth: Wnt76GkYE7oBjEfWKFffasmEQoQXsxWb+aPQJaAnykgGblPqMt8dR2Frqz6dB9sUZWD/OFkR90CbXqk0KqTfncnpigrgbUE9
Date: Wed, 19 Oct 2022 11:47:04 +0530
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
Message-ID: <Y0+WYIVTugrs6khA@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666011479.git.drv@mailo.com>
 <2dd27eff9aab5ffe31e61086c0584982794507cf.1666011479.git.drv@mailo.com>
 <Y01iLXp20G0FSJFG@kroah.com>
 <a0bef75b959f4ca6a7bbfaacd531f8ae@AcuMS.aculab.com>
 <Y06fKv7U0/GhZfSZ@debian-BULLSEYE-live-builder-AMD64>
 <e2675698427ed987dd88ed5f9996fe86e5315dbb.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2675698427ed987dd88ed5f9996fe86e5315dbb.camel@perches.com>

On Tue, Oct 18, 2022 at 10:43:07PM -0700, Joe Perches wrote:
> On Tue, 2022-10-18 at 18:12 +0530, Deepak R Varma wrote:
> > On Tue, Oct 18, 2022 at 11:21:26AM +0000, David Laight wrote:
> > > From: Greg KH
> > > > Sent: 17 October 2022 15:10
> > > >
> > > > On Mon, Oct 17, 2022 at 06:52:50PM +0530, Deepak R Varma wrote:
> > > > > Reformat long running computation instructions to improve code readability.
> > > > > Address following checkpatch script complaints:
> > > > > 	CHECK: line length of 171 exceeds 100 columns
> > > > > 	CHECK: line length of 113 exceeds 100 columns
> []
> > > > > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> []
> > > > > @@ -211,8 +211,10 @@ static int __nat25_network_hash(unsigned char *network_addr)
> > > > >  	} else if (network_addr[0] == NAT25_IPX) {
> > > > >  		unsigned long x;
> > > > >
> > > > > -		x = network_addr[1] ^ network_addr[2] ^ network_addr[3] ^ network_addr[4] ^
> > > > network_addr[5] ^
> > > > > -			network_addr[6] ^ network_addr[7] ^ network_addr[8] ^ network_addr[9] ^
> > > > network_addr[10];
> > > > > +		x = network_addr[1] ^ network_addr[2] ^ network_addr[3] ^
> > > >
> > > > Why not go out to [4] here and then you are one line shorter?
> > >
> > > and/or use a shorter variable name....
> > Hi David,
> > I have already re-submitted the patch set with 4 in line arrangement. Do you
> > still suggest using shorter variable names?
>
> Assuming this code is not performance sensitive, I suggest not just
> molifying checkpatch but perhaps improving the code by adding a helper
> function something like:
>
> u8 xor_array_u8(u8 *x, size_t len)
> {
> 	size_t i;
> 	u8 xor = x[0];
>
> 	for (i = 1; i < len; i++)
> 		xor ^= x[i];
>
> 	return xor;
> }
>
> so for instance this could be:
>
> 		x = xor_array_u8(&network_addr[1], 10);
>

Hi Joe,
Great suggestion. Thank you.
Is there a way to confirm that this improvement won't impact performance? Will I
need any specific hardware / device to run tests?

./drv






