Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F115A6;
	Thu, 20 Oct 2022 04:46:27 +0000 (UTC)
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 224901A036F;
	Thu, 20 Oct 2022 04:40:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 64F6E1A;
	Thu, 20 Oct 2022 04:40:18 +0000 (UTC)
Message-ID: <c3c211c1c99cd19f86fb801576c55b2ae2216c6f.camel@perches.com>
Subject: Re: [PATCH] staging: rts5208: Replace instances of udelay by
 usleep_range
From: Joe Perches <joe@perches.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Date: Wed, 19 Oct 2022 21:40:31 -0700
In-Reply-To: <Y06yiBaluz6X0C4G@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
References: 
	<Y06yiBaluz6X0C4G@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.10
X-Stat-Signature: usmgqx4pixopy5egm85zxz4z9qnn1kia
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 64F6E1A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18nOiWvhA8sshLgAaiSMN3kHKN/Czo5MVc=
X-HE-Tag: 1666240818-841376

On Tue, 2022-10-18 at 14:04 +0000, Tanjuate Brunostar wrote:
> Replace the use of udelay by usleep_range as suggested by checkpatch:
>=20
> CHECK: usleep_range is preferred over udelay; see Documentation/timers/ti=
mers-howto.rst
> +               udelay(30);
[]
> diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
[]
> @@ -3235,7 +3235,7 @@ static int ms_write_multiple_pages(struct rtsx_chip=
 *chip, u16 old_blk,
>  			return STATUS_FAIL;
>  		}
> =20
> -		udelay(30);
> +		usleep_range(30, 30);

This isn't useful.  Please read the Documentation/timers.

