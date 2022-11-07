Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB493D527
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 15:22:37 +0000 (UTC)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 8E6F2A0F08;
	Mon,  7 Nov 2022 15:22:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 17D7D25;
	Mon,  7 Nov 2022 15:22:05 +0000 (UTC)
Message-ID: <41a43f3865f3c86c6c2d1fbf3d82c42b685c7041.camel@perches.com>
Subject: Re: [PATCH] staging: iio: meter: use min() for comparison and
 assignment
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <error27@gmail.com>, Deepak R Varma <drv@mailo.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org
Date: Mon, 07 Nov 2022 07:22:24 -0800
In-Reply-To: <Y2kDTxE38epBN368@kadam>
References: <Y2iFGA3A1w+XMlYU@qemulion> <Y2kDTxE38epBN368@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: ky5cyx8rpp6n63dr7r7rfoo9ffsryz5t
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 17D7D25
X-Spam-Status: No, score=-3.73
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18cwuHY1nYUIb4QN9Tjc8AMikZIUD/bCaY=
X-HE-Tag: 1667834525-888536

On Mon, 2022-11-07 at 16:08 +0300, Dan Carpenter wrote:
> On Mon, Nov 07, 2022 at 09:40:00AM +0530, Deepak R Varma wrote:
> > Simplify code by using recommended min helper macro for logical
> > evaluation and value assignment. This issue is identified by
> > coccicheck using the minmax.cocci file.
> >=20
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/iio/meter/ade7854-i2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/iio/meter/ade7854-i2c.c b/drivers/staging/=
iio/meter/ade7854-i2c.c
> > index a9a06e8dda51..a6ce7b24cc8f 100644
> > --- a/drivers/staging/iio/meter/ade7854-i2c.c
> > +++ b/drivers/staging/iio/meter/ade7854-i2c.ck
> > @@ -61,7 +61,7 @@ static int ade7854_i2c_write_reg(struct device *dev,
> >  unlock:
> >  	mutex_unlock(&st->buf_lock);
> >=20
> > -	return ret < 0 ? ret : 0;
> > +	return min(ret, 0);
>=20
> The original code is better.
>=20
> If it's a failure return the error code.  If it's not return zero.
>=20
> You can only compare apples to apples.  min() makes sense if you're
> talking about two lengths.  But here if ret is negative that's an error
> code.  If it's positive that's the number of bytes.  If the error
> code is less than the number of bytes then return that?  What???  It
> makes no sense.
>=20
> In terms of run time, this patch is fine but in terms of reading the
> code using min() makes it less readable.

It's not a runtime question, either should compile to the same object
code.  It's definitely a readabiity and standardization issue.

In this case, IMO it'd be better to use the much more common

	if (ret < 0)
		return ret;

	return 0;

