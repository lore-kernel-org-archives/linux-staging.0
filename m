Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043E7B
	for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 15:29:15 +0000 (UTC)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 87FE8606D4;
	Sun, 10 Jul 2022 15:29:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 38F5B1C;
	Sun, 10 Jul 2022 15:28:59 +0000 (UTC)
Message-ID: <d278cf5d38235db92efa236cb1940a67e0e9a005.camel@perches.com>
Subject: Re: [PATCH v2] staging: qlge: Fix indentation issue under long for
 loop
From: Joe Perches <joe@perches.com>
To: Binyi Han <dantengknight@gmail.com>, Manish Chopra
 <manishc@marvell.com>,  GR-Linux-NIC-Dev@marvell.com, Coiby Xu
 <coiby.xu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sun, 10 Jul 2022 08:28:57 -0700
In-Reply-To: <20220710083657.GA3311@cloud-MacBookPro>
References: <20220710083657.GA3311@cloud-MacBookPro>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=1.43
X-Stat-Signature: ya9aox4dxt6jmokpwi3u4ibpj6fdjwfz
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 38F5B1C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18MMIH/rAUYJLoy7RFAI1JS5jG+C9I8+Fg=
X-HE-Tag: 1657466939-484765

On Sun, 2022-07-10 at 01:36 -0700, Binyi Han wrote:
> Fix indentation issue to adhere to Linux kernel coding style,
> Issue found by checkpatch. And change the long for loop into 3 lines.
>=20
> Signed-off-by: Binyi Han <dantengknight@gmail.com>
> ---
> v2:
> 	- Change the long for loop into 3 lines.
>=20
>  drivers/staging/qlge/qlge_main.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge=
_main.c
> index 1a378330d775..6e771d0e412b 100644
> --- a/drivers/staging/qlge/qlge_main.c
> +++ b/drivers/staging/qlge/qlge_main.c
> @@ -3007,10 +3007,11 @@ static int qlge_start_rx_ring(struct qlge_adapter=
 *qdev, struct rx_ring *rx_ring
>  		tmp =3D (u64)rx_ring->lbq.base_dma;
>  		base_indirect_ptr =3D rx_ring->lbq.base_indirect;
> =20
> -		for (page_entries =3D 0; page_entries <
> -			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
> -				base_indirect_ptr[page_entries] =3D
> -					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
> +		for (page_entries =3D 0;
> +			page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
> +			page_entries++)
> +			base_indirect_ptr[page_entries] =3D
> +				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));

Better to align page_entries to the open parenthesis.

And another optimization would be to simply add DB_PAGE_SIZE to tmp
in the loop and avoid the multiply.

		for (page_entries =3D 0;
		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
		     page_entries++) {
			base_indirect_ptr[page_entries] =3D cpu_to_le64(tmp);
			tmp +=3D DB_PAGE_SIZE;
		}

> @@ -3022,10 +3023,11 @@ static int qlge_start_rx_ring(struct qlge_adapter=
 *qdev, struct rx_ring *rx_ring
>  		tmp =3D (u64)rx_ring->sbq.base_dma;
>  		base_indirect_ptr =3D rx_ring->sbq.base_indirect;
> =20
> -		for (page_entries =3D 0; page_entries <
> -			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
> -				base_indirect_ptr[page_entries] =3D
> -					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
> +		for (page_entries =3D 0;
> +			page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
> +			page_entries++)
> +			base_indirect_ptr[page_entries] =3D
> +				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));

here too

