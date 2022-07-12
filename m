Received: from relay4.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8A1440D
	for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 14:15:06 +0000 (UTC)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 8EFD83349B;
	Tue, 12 Jul 2022 14:14:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 0F8743D;
	Tue, 12 Jul 2022 14:14:55 +0000 (UTC)
Message-ID: <1d6fd2b271dfa0514ccb914c032e362bc4f669fa.camel@perches.com>
Subject: Re: [PATCH v3] staging: qlge: Fix indentation issue under long for
 loop
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Binyi Han
	 <dantengknight@gmail.com>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Coiby
 Xu <coiby.xu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 netdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Date: Tue, 12 Jul 2022 07:14:55 -0700
In-Reply-To: <20220712134610.GO2338@kadam>
References: <20220710210418.GA148412@cloud-MacBookPro>
	 <20220712134610.GO2338@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=1.30
X-Stat-Signature: xgmszzrqg6ctunmgjqypab8cmkczqtxe
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 0F8743D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/Igx7O1NfTBE3jWpvwAE+8H153v3blsy4=
X-HE-Tag: 1657635295-347823

On Tue, 2022-07-12 at 16:46 +0300, Dan Carpenter wrote:
> On Sun, Jul 10, 2022 at 02:04:18PM -0700, Binyi Han wrote:
> > Fix indentation issue to adhere to Linux kernel coding style,
> > Issue found by checkpatch. Change the long for loop into 3 lines. And
> > optimize by avoiding the multiplication.
>=20
> There is no possible way this optimization helps benchmarks.  Better to
> focus on readability.

I think removing the multiply _improves_ readability.

> > diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/ql=
ge_main.c
[]
> > @@ -3007,10 +3007,12 @@ static int qlge_start_rx_ring(struct qlge_adapt=
er *qdev, struct rx_ring *rx_ring
> >  		tmp =3D (u64)rx_ring->lbq.base_dma;
> >  		base_indirect_ptr =3D rx_ring->lbq.base_indirect;
> > =20
> > -		for (page_entries =3D 0; page_entries <
> > -			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
> > -				base_indirect_ptr[page_entries] =3D
> > -					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
> > +		for (page_entries =3D 0;
> > +		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
> > +		     page_entries++) {
> > +			base_indirect_ptr[page_entries] =3D cpu_to_le64(tmp);
> > +			tmp +=3D DB_PAGE_SIZE;
>=20
> I've previously said that using "int i;" is clearer here.  You would
> kind of expect "page_entries" to be the number of entries, so it's kind
> of misleading.  In other words, it's not just harmless wordiness and
> needless exposition, it's actively bad.

Likely true.

> I would probably just put it on one line:
>=20
> 		for (i =3D 0; i MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); i++)
> 			base_indirect_ptr[i] =3D cpu_to_le64(tmp + (i * DB_PAGE_SIZE));
>=20
> But if you want to break it up you could do:
>=20
> 		for (i =3D 0; i MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); i++)
> 			base_indirect_ptr[i] =3D cpu_to_le64(tmp +
> 							   (i * DB_PAGE_SIZE));
>=20
> "tmp" is kind of a bad name.  Also "base_indirect_ptr" would be better
> as "base_indirect".

tmp is a poor name here.  Maybe dma would be better.

MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN) is also a poorly named macro
where all the existing uses are QLGE_BQ_LEN.

And there's base_indirect_ptr and base_indirect_dma in the struct
so just base_indirect might not be the best.

		tmp =3D (u64)rx_ring->lbq.base_dma;
		base_indirect_ptr =3D rx_ring->lbq.base_indirect;

And clarity is good.
Though here, clarity to value for effort though is dubious.

btw: this code got moved to staging 3 years ago.

Maybe it's getting closer to removal time.

