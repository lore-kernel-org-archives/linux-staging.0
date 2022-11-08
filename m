Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D563C8BE7
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667921791; bh=u8mE0RgfI7DF59MjU6HsCI5ArTqJuAPJ2NL8flSA2Os=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=bGsqNaQMT2/NWStg8QCkAH+CkdEN0kBZAXlAC1Gu3mg9WmQhtHabUbCifsjGYKNgm
	 kfXLKfUBAbVJAcBas+mlZH45ap0Ipq8SxLfbAgCPeEC5abyvZMbxqmiy2vEpIv0rMr
	 Kpo/U134via1+UGBNu/8H9EGh6j2UlbmtPQ8beu0=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Tue,  8 Nov 2022 16:36:31 +0100 (CET)
X-EA-Auth: PydSInO7T9JIGOf/URLb9LCRSKwC2QrlsACITB8ckZx4hr3VWORvrMJPY5XBWexlZ1jwRUVBgTsvIzJmSGxjyMElojwG1MVG
Date: Tue, 8 Nov 2022 21:06:24 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: meter: use min() for comparison and
 assignment
Message-ID: <Y2p3eIQjdyBWs1xD@ubunlion>
References: <Y2iFGA3A1w+XMlYU@qemulion>
 <Y2px0THYSMaU4gyZ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2px0THYSMaU4gyZ@kroah.com>

On Tue, Nov 08, 2022 at 04:12:17PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 07, 2022 at 09:40:00AM +0530, Deepak R Varma wrote:
> > Simplify code by using recommended min helper macro for logical
> > evaluation and value assignment. This issue is identified by
> > coccicheck using the minmax.cocci file.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/iio/meter/ade7854-i2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/iio/meter/ade7854-i2c.c b/drivers/staging/iio/meter/ade7854-i2c.c
> > index a9a06e8dda51..a6ce7b24cc8f 100644
> > --- a/drivers/staging/iio/meter/ade7854-i2c.c
> > +++ b/drivers/staging/iio/meter/ade7854-i2c.c
> > @@ -61,7 +61,7 @@ static int ade7854_i2c_write_reg(struct device *dev,
> >  unlock:
> >  	mutex_unlock(&st->buf_lock);
> >
> > -	return ret < 0 ? ret : 0;
> > +	return min(ret, 0);
>
> As others have said, this isn't ok, and I hate ? : usage, so if you
> want, spell that out please.

Hello Greg,
Just want to make sure I am getting it right:
Are you suggesting me to resubmit the patch with revised patch description?

Should I consider using the "if" based evaluation rather than using min() macro?

Thank you,
./drv

>
> thanks,
>
> greg k-h
>


