Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEB1363
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:33:56 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1ng2E4-0002Nz-GJ; Sun, 17 Apr 2022 12:33:52 +0200
Date: Sun, 17 Apr 2022 12:33:52 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: r8188eu: merge _mgt_dispatcher into
 mgt_dispatcher
Message-ID: <20220417103352.jqkqpi2auxir2g6g@viti.kaiser.cx>
References: <20220413200742.276806-1-martin@kaiser.cx>
 <20220413200742.276806-3-martin@kaiser.cx>
 <b028d269-4dd8-7165-6220-d42c1e0e588c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b028d269-4dd8-7165-6220-d42c1e0e588c@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Pavel,

Thus wrote Pavel Skripkin (paskripkin@gmail.com):

> On 4/13/22 23:07, Martin Kaiser wrote:
> > All that the _mgt_dispatcher function does is to call a function from
> > a function pointer. It's not worth having a separate function for this.

> > Merge _mgt_dispatcher into mgt_dispatcher.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---

> [code snip]

> > +
> > +	if (ptable->func) {
> > +	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
> > +		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
> > +		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
> > +			return;
> > +		ptable->func(padapter, precv_frame);
> > +	}
> >   }

> Looks like each `mlme_sta_tbl` element has `func` member initialized. I
> think, we can remove this check.

I've just sent a series to refactor mgt_dispatcher.

All mlme_sta_tbl entries have a function pointer, but some of the point
to a dummy function DoReserved. I guess we should use NULL and keep the
check instead of calling a function that does nothing.

Best regards,
Martin
