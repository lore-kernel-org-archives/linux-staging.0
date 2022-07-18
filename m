Received: from relay3.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307BA46
	for <linux-staging@lists.linux.dev>; Mon, 18 Jul 2022 06:24:13 +0000 (UTC)
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 8879B20A35;
	Mon, 18 Jul 2022 06:07:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 2947F2000D;
	Mon, 18 Jul 2022 06:07:36 +0000 (UTC)
Message-ID: <c040cd03d04fb861b85b4f56cd04b473bb778ebd.camel@perches.com>
Subject: Re: [PATCH 1/7] staging: vt6655: Rename dwData to reg_value in four
 macros
From: Joe Perches <joe@perches.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Forest Bond
 <forest@alittletooquiet.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sun, 17 Jul 2022 23:07:35 -0700
In-Reply-To: <b54577316eebdbb54e478fc51473eeba9d7eacae.1658094708.git.philipp.g.hortmann@gmail.com>
References: <cover.1658094708.git.philipp.g.hortmann@gmail.com>
	 <b54577316eebdbb54e478fc51473eeba9d7eacae.1658094708.git.philipp.g.hortmann@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: 1nzdm7u5mdnptkhpsa7c5w3ybkr1w7sw
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 2947F2000D
X-Spam-Status: No, score=1.40
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18IL2DdOvR2UNADo9wPLSQRJQPWvAn0vFY=
X-HE-Tag: 1658124456-435354

On Mon, 2022-07-18 at 00:20 +0200, Philipp Hortmann wrote:
> Fix name of a variable in four macros that use CamelCase which is not
> accepted by checkpatch.pl
[]=20
> diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
[]
> @@ -539,9 +539,9 @@
> =20
>  #define MACvReceive0(iobase)						\
>  do {									\
> -	unsigned long dwData;						\
> -	dwData =3D ioread32(iobase + MAC_REG_RXDMACTL0);			\
> -	if (dwData & DMACTL_RUN)					\
> +	unsigned long reg_value;					\
> +	reg_value =3D ioread32(iobase + MAC_REG_RXDMACTL0);		\
> +	if (reg_value & DMACTL_RUN)					\
>  		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL0);	\
>  	else								\
>  		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL0);	\
> @@ -549,9 +549,9 @@ do {									\
> =20
>  #define MACvReceive1(iobase)						\
>  do {									\
> -	unsigned long dwData;						\
> -	dwData =3D ioread32(iobase + MAC_REG_RXDMACTL1);			\
> -	if (dwData & DMACTL_RUN)					\
> +	unsigned long reg_value;					\
> +	reg_value =3D ioread32(iobase + MAC_REG_RXDMACTL1);		\
> +	if (reg_value & DMACTL_RUN)					\
>  		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL1);	\
>  	else								\
>  		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL1);	\
> @@ -559,9 +559,9 @@ do {									\
> =20
>  #define MACvTransmit0(iobase)						\
>  do {									\
> -	unsignedc long dwData;						\
> -	dwData =3D ioread32(iobase + MAC_REG_TXDMACTL0);			\
> -	if (dwData & DMACTL_RUN)					\
> +	unsigned long reg_value;					\
> +	reg_value =3D ioread32(iobase + MAC_REG_TXDMACTL0);		\
> +	if (reg_value & DMACTL_RUN)					\
>  		iowrite32(DMACTL_WAKE, iobase + MAC_REG_TXDMACTL0);	\
>  	else								\
>  		iowrite32(DMACTL_RUN, iobase + MAC_REG_TXDMACTL0);	\
> @@ -569,9 +569,9 @@ do {									\
> =20
>  #define MACvTransmitAC0(iobase)					\
>  do {									\
> -	unsigned long dwData;						\
> -	dwData =3D ioread32(iobase + MAC_REG_AC0DMACTL);			\
> -	if (dwData & DMACTL_RUN)					\
> +	unsigned long reg_value;					\
> +	reg_value =3D ioread32(iobase + MAC_REG_AC0DMACTL);		\
> +	if (reg_value & DMACTL_RUN)					\
>  		iowrite32(DMACTL_WAKE, iobase + MAC_REG_AC0DMACTL);	\
>  	else								\
>  		iowrite32(DMACTL_RUN, iobase + MAC_REG_AC0DMACTL);	\

Please remember that checkpatch is a stupid little scripted tool
and the actual goal is to have readable code.

Look a bit beyond the code and see if and how you could make the
code better.

All of these macros have the same form and logic.

Perhaps it'd be better to use another indirect macro and define
all of these with that new macro.

Something like:

#define mac_v(iobase, reg)						\
do {									\
	void __iomem *addr =3D (iobase) + (reg);				\
	iowrite32(ioread32(addr) & DMACTL_RUN ? DMACTL_WAKE : DMACTL_RUN,\
		  addr);						\
} while (0)

#define MACvReceive0(iobase)	mac_v(iobase, MAC_REG_RXDMACTL0)
#define MACvReceive1(iobase)	mac_v(iobase, MAC_REG_RXDMACTL1)
#define MACvTransmit0(iobase)	mac_v(iobase, MAC_REG_TXDMACTL0)
#define MACvTransmitAC0(iobase)	mac_v(iobase, MAC_REG_AC0DMACTL)

