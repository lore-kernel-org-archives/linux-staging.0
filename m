Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089C3D68
	for <linux-staging@lists.linux.dev>; Mon, 27 Jun 2022 19:46:31 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1o5ugf-0002f5-S9; Mon, 27 Jun 2022 21:46:21 +0200
Date: Mon, 27 Jun 2022 21:46:21 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: drop return value from
 receive_disconnect
Message-ID: <20220627194621.44hziv4cmt3zfrt4@viti.kaiser.cx>
References: <20220626180734.287137-1-martin@kaiser.cx>
 <YrlzLEf1atin6gBd@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrlzLEf1atin6gBd@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Greg and all,

Thus wrote Greg Kroah-Hartman (gregkh@linuxfoundation.org):

> >  	/* check A3 */
> >  	if (!(!memcmp(MacAddr, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)))
> > -		return _SUCCESS;
> > +		return;

> Shouldn't this check return an error instead of success?  If not, what
> exactly is this checking this for?

my understanding is that receive_disconnect is called when an access
point is no longer usable. This could be a deauth or disassoc message or
a beacon with incorrect info (so we assume the access point isn't
working any more).

The if statement checks if the notification is about the access point to
which we're connected. If not, we don't have to process the notification.
I guess this is not necessarily an error.

Thanks & Best regards,

   Martin
