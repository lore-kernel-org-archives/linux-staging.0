Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21587C;
	Sat, 22 Oct 2022 07:26:22 +0000 (UTC)
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 35B161603C3;
	Sat, 22 Oct 2022 07:18:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id CEFB420029;
	Sat, 22 Oct 2022 07:18:23 +0000 (UTC)
Message-ID: <cae0a94e73b1e44a7d8c750a406aa77d1942a06a.camel@perches.com>
Subject: Re: [PATCH v3 1/6] staging: vt6655: fix lines ending in a '('
From: Joe Perches <joe@perches.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, 
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Date: Sat, 22 Oct 2022 00:18:34 -0700
In-Reply-To: <20221022070612.13009-2-tanjubrunostar0@gmail.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
	 <20221022070612.13009-2-tanjubrunostar0@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: CEFB420029
X-Spam-Status: No, score=-0.88
X-Stat-Signature: hking6ccz1af9g4dp75gah5faz6rb571
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/Qk4Udegm35BK3jmzSWYorLoNMBhIVhOA=
X-HE-Tag: 1666423103-706658

On Sat, 2022-10-22 at 07:06 +0000, Tanjuate Brunostar wrote:
> fix serveral checkpatch errors related to lines ending with a '(' by
> refactoring the code lines
[]
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.=
c
[]
> @@ -141,13 +141,11 @@ static __le16 vnt_time_stamp_off(struct vnt_private=
 *priv, u16 rate)
>   */
>  static
>  unsigned int
> -s_uGetTxRsvTime(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	unsigned int cbFrameLength,
> -	unsigned short wRate,
> -	bool bNeedAck
> -)
> +s_uGetTxRsvTime(struct vnt_private *pDevice,

If you end up doing more work here, ou might consider removing the
Hungarian style notations

Maybe something like:

s_uGetTxRsvTime	-> get_tx_rsv_time

> +		unsigned char byPktType,

byPktType	-> pkt_type

etc...

Perhaps patches by unique rename.

