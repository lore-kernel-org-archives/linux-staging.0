Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D0122AC
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 20:27:55 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1os8ie-0004af-G3; Mon, 07 Nov 2022 21:27:44 +0100
Date: Mon, 7 Nov 2022 21:27:44 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: r8188eu: use a qos_hdr in
 validate_recv_data_frame
Message-ID: <20221107202744.cn6t5apcny7jfetp@viti.kaiser.cx>
References: <20221106170455.743058-1-martin@kaiser.cx>
 <20221106170455.743058-2-martin@kaiser.cx>
 <Y2j//dFRONly9kU8@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2j//dFRONly9kU8@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Dan Carpenter (error27@gmail.com):

> On Sun, Nov 06, 2022 at 06:04:53PM +0100, Martin Kaiser wrote:
> > Define a struct ieee80211_qos_hdr in the validate_recv_data_frame
> > function. Use this struct to replace some numeric offsets and make the
> > code easier to understand.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >  drivers/staging/r8188eu/core/rtw_recv.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)

> > diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> > index cb0f35d7ab98..245b931c483d 100644
> > --- a/drivers/staging/r8188eu/core/rtw_recv.c
> > +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> > @@ -1032,7 +1032,6 @@ static int validate_recv_data_frame(struct adapter *adapter,
> >  				    struct recv_frame *precv_frame)
> >  {
> >  	struct sta_info *psta = NULL;
> > -	u8 *ptr = precv_frame->rx_data;
> >  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
> >  	struct rx_pkt_attrib	*pattrib = &precv_frame->attrib;
> >  	struct security_priv	*psecuritypriv = &adapter->securitypriv;
> > @@ -1071,10 +1070,12 @@ static int validate_recv_data_frame(struct adapter *adapter,
> >  	pattrib->ack_policy = 0;
> >  	/* parsing QC field */
> >  	if (pattrib->qos) {
> > +		struct ieee80211_qos_hdr *qos_hdr = (struct ieee80211_qos_hdr *)hdr;
> > +
> >  		pattrib->priority = ieee80211_get_tid(hdr);
> > -		pattrib->ack_policy = GetAckpolicy((ptr + 24));
> > -		pattrib->amsdu = GetAMsdu((ptr + 24));
> > -		pattrib->hdrlen = 26;
>                                ^^^

> > +		pattrib->ack_policy = GetAckpolicy(&qos_hdr->qos_ctrl);
> > +		pattrib->amsdu = GetAMsdu(&qos_hdr->qos_ctrl);
> > +		pattrib->hdrlen += sizeof(*qos_hdr);
>                                ^^^^
> Why did this change from "=" to "+="?

Thanks a lot for spotting this, Dan!

I tried a couple of versions, some of which used +=. For the one I
submitted, this is wrong, of course.

All of pattrib is initialised to 0 in update_recvframe_attrib_88e and
pattrib->hdrlen is not updated until the assignment above. That's why
the += still works and testing didn't show the problem.

v2 is on the way...

Thanks again,

   Martin
