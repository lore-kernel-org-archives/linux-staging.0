Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3C97A
	for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 02:23:32 +0000 (UTC)
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 429B0349A9;
	Sun, 10 Jul 2022 02:23:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id DA4D11D;
	Sun, 10 Jul 2022 02:23:21 +0000 (UTC)
Message-ID: <1827050fdadb6173118fb396ad1fead23cda809f.camel@perches.com>
Subject: Re: [PATCH] staging: qlge: Fix indentation issue under long for loop
From: Joe Perches <joe@perches.com>
To: Binyi Han <dantengknight@gmail.com>, Manish Chopra
 <manishc@marvell.com>,  GR-Linux-NIC-Dev@marvell.com, Coiby Xu
 <coiby.xu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sat, 09 Jul 2022 19:23:20 -0700
In-Reply-To: <20220710021629.GA11852@cloud-MacBookPro>
References: <20220710021629.GA11852@cloud-MacBookPro>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: j5whdcny5gq31cufr8s8931z1g8b14hp
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: DA4D11D
X-Spam-Status: No, score=1.40
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/1/dpiimQNhY7LZ/+ZAispFO3ewJM53Ds=
X-HE-Tag: 1657419801-289789

On Sat, 2022-07-09 at 19:16 -0700, Binyi Han wrote:
> Fix indentation issue to adhere to Linux kernel coding style.
> Issue found by checkpatch.
>=20
> Signed-off-by: Binyi Han <dantengknight@gmail.com>
> ---
>  drivers/staging/qlge/qlge_main.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge=
_main.c
[]
> @@ -3009,8 +3009,8 @@ static int qlge_start_rx_ring(struct qlge_adapter *=
qdev, struct rx_ring *rx_ring
> =20
>  		for (page_entries =3D 0; page_entries <
>  			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)

Probably better to change the for loop to 3 lines as well.

		for (page_entries =3D 0;
		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
		     page_entries++)

> @@ -3024,8 +3024,8 @@ static int qlge_start_rx_ring(struct qlge_adapter *=
qdev, struct rx_ring *rx_ring
> =20
>  		for (page_entries =3D 0; page_entries <
>  			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
> -				base_indirect_ptr[page_entries] =3D
> -					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
> +			base_indirect_ptr[page_entries] =3D
> +				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));

etc...

