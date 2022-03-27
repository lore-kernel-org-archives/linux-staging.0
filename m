Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375D07E
	for <linux-staging@lists.linux.dev>; Sun, 27 Mar 2022 18:19:44 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1nYXUK-0001Iv-T0; Sun, 27 Mar 2022 20:19:40 +0200
Date: Sun, 27 Mar 2022 20:19:40 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: David Laight <David.Laight@ACULAB.COM>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] staging: r8188eu: use ieee80211 define for version
 check
Message-ID: <20220327181940.6czchqrjhwpoauvi@viti.kaiser.cx>
References: <20220323074859.177425-1-martin@kaiser.cx>
 <20220323074859.177425-2-martin@kaiser.cx>
 <3fafd45e349a4bc3aa8db888f08a71d3@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fafd45e349a4bc3aa8db888f08a71d3@AcuMS.aculab.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote David Laight (David.Laight@ACULAB.COM):

> From: Martin Kaiser
> > Sent: 23 March 2022 07:49

> > Use the IEEE80211_FCTL_VERS define to check the version number
> > of a received frame.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >  drivers/staging/r8188eu/core/rtw_recv.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)

> > diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> > index 8800ea4825ff..524a00345501 100644
> > --- a/drivers/staging/r8188eu/core/rtw_recv.c
> > +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> > @@ -1063,7 +1063,6 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
> >  	struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
> >  	u8 *ptr = precv_frame->rx_data;
> >  	__le16 fc = *(__le16 *)ptr;

> Those two lines are somewhat horrid.
> Casts of pointers to integer types have a nasty habit of being bugs.

The fc is the Frame Control field, which is at the start of an incoming
80211 frame. The existing helper functions that parse the Frame Control
want an fc parameter like this.

I looked at the drawing in

https://einstein.informatik.uni-oldenburg.de/rechnernetze/frame.htm

for the structure that the r8188eu driver is trying to parse (the text
is in German, sorry).

> In any case 'ptr' should probably be 'frame_data'.

I'm trying to remove ptr complety and use existing helper functions for
all components.

> If the first two bytes are some kind of 16 bit id, then what follows?
> Should this be a 'struct' that defines the frame data layout??

I define an fc variable in functions that use only components of Frame
Control. If we need other fields, I use a struct ieee80211_hdr.

I've just sent a v2 of this series where I replaced fc with a struct
ieee80211_hdr in the validate_recv_frame function.

Best regards,
Martin
