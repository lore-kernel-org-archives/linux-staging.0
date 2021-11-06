Received: from smtprelay.hostedemail.com (smtprelay0109.hostedemail.com [216.40.44.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F65B2C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 19:06:45 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave05.hostedemail.com (Postfix) with ESMTP id F05A718253E1A
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 19:06:38 +0000 (UTC)
Received: from omf17.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay03.hostedemail.com (Postfix) with ESMTP id 83741837F24F;
	Sat,  6 Nov 2021 19:06:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id 588A727DD11;
	Sat,  6 Nov 2021 19:06:31 +0000 (UTC)
Message-ID: <dfa9d7734dfc64263b30f29b4d23aab7d0683089.camel@perches.com>
Subject: Re: [PATCH v3] staging: vt6655: fix camelcase byData in card.c
From: Joe Perches <joe@perches.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
 Lucas Henneman <lucas.henneman@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sat, 06 Nov 2021 12:06:30 -0700
In-Reply-To: <20211106184822.24242-1-tomm.merciai@gmail.com>
References: <20211106184822.24242-1-tomm.merciai@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.54
X-Stat-Signature: ofjfs3x471n54wadq1j5wjebzjk5zntk
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 588A727DD11
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19wa3WnbWtclsmB1B3+H0/jXjdUlQ7T7zg=
X-HE-Tag: 1636225591-979161

On Sat, 2021-11-06 at 19:48 +0100, Tommaso Merciai wrote:
> Replace camelcase variable "byData" into linux kernel coding style
> equivalent variable "data" in card.c.
> "by" prefix in hungarian notation stands for byte or unsigned char
[]
> diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
[]
> @@ -194,15 +194,15 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
>  			priv->abyBBVGA[0] = 0x20;
>  			priv->abyBBVGA[2] = 0x10;
>  			priv->abyBBVGA[3] = 0x10;
> -			bb_read_embedded(priv, 0xE7, &byData);
> -			if (byData == 0x1C)
> +			bb_read_embedded(priv, 0xE7, &data);

It might be nice to figure out what these register values are
and use #defines instead of hard coded values like 0xE7

> +			if (data == 0x1C)
>  				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);

etc...

