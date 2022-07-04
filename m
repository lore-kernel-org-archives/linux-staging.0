Received: from relay5.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3FF15D2
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 19:05:44 +0000 (UTC)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 4DFE460511;
	Mon,  4 Jul 2022 19:05:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 16C822002A;
	Mon,  4 Jul 2022 19:05:33 +0000 (UTC)
Message-ID: <757323ceeb72b2d80acfae9ae4f384c27d731bbe.camel@perches.com>
Subject: Re: [PATCH 1/6] staging: vt6655: Rename pbyEtherAddr to mac_addr
From: Joe Perches <joe@perches.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Forest Bond
 <forest@alittletooquiet.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 04 Jul 2022 12:05:33 -0700
In-Reply-To: <fcc66446a04c1ecb3c2b66cdd47e932c231b1b9d.1656835310.git.philipp.g.hortmann@gmail.com>
References: <cover.1656835310.git.philipp.g.hortmann@gmail.com>
	 <fcc66446a04c1ecb3c2b66cdd47e932c231b1b9d.1656835310.git.philipp.g.hortmann@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 16C822002A
X-Spam-Status: No, score=1.39
X-Stat-Signature: 3boejniya1uhjmngqa3he4fw6y8gbd94
X-Rspamd-Server: rspamout06
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18zAhJLb0W9bs/hqwmb/aR/H/Tx+6NjtOg=
X-HE-Tag: 1656961533-813176

On Mon, 2022-07-04 at 20:20 +0200, Philipp Hortmann wrote:
> Fix name of a variable in two macros that use CamelCase which is not
> accepted by checkpatch.pl

These might be nicer as functions with for loops

> diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h

maybe something like:

static inline void MACvWriteBSSIDAddress(void __iomem *iobase, u8 *addr)
{
	int i;

	for (i =3D 0; i < ETH_ALEN; i++)
		iowrite8(*addr++, iobase + MAC_REG_BSSID0 + i);
}

static inline void MACvReadEtherAddress(void __iomem *iobase, u8 *addr)
{
	int i;

	iowrite8(1, iobase + MAC_REG_PAGE1SEL);
	for (i =3D 0; i < ETH_ALEN; i++)
		*addr++ =3D ioread8(iobase + MAC_REG_PAR0 + i);
	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
}

