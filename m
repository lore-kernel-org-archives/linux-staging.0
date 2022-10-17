Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00BE2568;
	Mon, 17 Oct 2022 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666017758; bh=Wba2l4Kwed3G/6vyWzT3y3nHVxraG2sEVvdQ86jT6rY=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=mbMel+jkBx+IkCbcpro63iOXUrg9YjL3NqhFFlOkpjN6zSdb6wqjGCuhQd2oGfI6u
	 tRRzPy0tWGbC7t4h7zdo2L3/1gg4VZjpjzSxAdE1+Zjc9+LOzKRhaAhT43aauOfjku
	 tsy0uCa60ilisCoMMIjjCYAQ+3dQ410FROEjIGF0=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Mon, 17 Oct 2022 16:42:38 +0200 (CEST)
X-EA-Auth: 59HAc1ReCgkEZhVAZP/yoTSANglxHpuna6Dpwz5K78DAYgEI0BFoRJ58jtSe2S9zMcJZzx2xum0Nl3Tbxy0SofnHetXzLqpT
Date: Mon, 17 Oct 2022 19:43:05 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: Re: [PATCH 3/4] staging: r8188eu: remove {} for single statement
 blocks
Message-ID: <Y01i8U3g+7udq+Mg@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666011479.git.drv@mailo.com>
 <478d652b9f467d47685c1af72a876f34dd92710f.1666011479.git.drv@mailo.com>
 <alpine.DEB.2.22.394.2210171556290.16433@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210171556290.16433@hadrien>

On Mon, Oct 17, 2022 at 03:57:16PM +0200, Julia Lawall wrote:
>
>
> On Mon, 17 Oct 2022, Deepak R Varma wrote:
>
> > As per the Linux kernel coding-style guidelines, there is no need to
> > use {} for single statement blocks. Address following checkpatch script
> > complaint:
> > 	WARNING: braces {} are not necessary for single statement blocks
>
> It's nice to say something like "Problem identified using checkpatch".
> But putting the verbatim checkpatch message that says what you just said
> doesn't seem necessary.

Understood. That sounds better. Thank you Julia. Will include your feedback in
the next revision.

./drv

>
> julia
>
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_br_ext.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > index 427da7e8ba4c..290affe50d0b 100644
> > --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > @@ -655,9 +655,8 @@ void *scdb_findEntry(struct adapter *priv, unsigned char *ip_addr)
> >  	hash = __nat25_network_hash(network_addr);
> >  	db = priv->nethash[hash];
> >  	while (db) {
> > -		if (!memcmp(db->networkAddr, network_addr, MAX_NETWORK_ADDR_LEN)) {
> > +		if (!memcmp(db->networkAddr, network_addr, MAX_NETWORK_ADDR_LEN))
> >  			return (void *)db;
> > -		}
> >
> >  		db = db->next_hash;
> >  	}
> > --
> > 2.30.2
> >
> >
> >
> >
> >


