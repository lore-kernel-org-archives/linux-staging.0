Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D01C28A
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 4292C14017E;
	Mon, 23 Oct 2023 15:25:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 76D6220016;
	Mon, 23 Oct 2023 15:25:00 +0000 (UTC)
Message-ID: <15f45bbde3f4289b012db7adb8166cf0d45e4fec.camel@perches.com>
Subject: Re: [PATCH 2/5] staging: media: av7110: Fix various whitespace
 checkpatch errors
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Jonathan Bergh
	 <bergh.jonathan@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, error27@gmail.com, 
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 23 Oct 2023 08:24:58 -0700
In-Reply-To: <b301c9a1-7536-46c5-878e-7cd79e3a4742@kadam.mountain>
References: <20231020232332.55024-1-bergh.jonathan@gmail.com>
	 <20231020232332.55024-3-bergh.jonathan@gmail.com>
	 <b301c9a1-7536-46c5-878e-7cd79e3a4742@kadam.mountain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 76D6220016
X-Stat-Signature: uso4t8asunecfddpd7xeyg65ftr14cyg
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+VkWPLyvgXZZWw+/cT5gjzEt416nU2p+8=
X-HE-Tag: 1698074700-308232
X-HE-Meta: U2FsdGVkX19fOFgBMW+1i6LvtS8bVOiijCHMn6WgWz8Hz2LBWy2SGm/KH4KlWZY5Tjj9fn5jVr9T7rjtmAXNl0J+d4kYioCx7/gyh/4mJ3+vUGI6Z/3y4W/7bFnTs3LRuhJvaYLvefim2tJalYxzyUSf1mg+Qgn1lGyGQOOlOiMuXDXC17h9ZHbB5/C1Kz0vysWKzUPnbpbbzlyYQdYbaXYZ/SJsyqjQi6ZCbx0b6+NMxUTeBuKL+RBdYdGRhYNAW9a6+v6i+6Ju2Mi4Od0m7Jsc6VIW/PKE8v/yEXmtTqY3p0eVBunu7/Ty6sGwxNLQ2MoCpl1eP+JZT7UkWD9gv4rAKocc6Y6M

On Mon, 2023-10-23 at 17:26 +0300, Dan Carpenter wrote:
> On Sat, Oct 21, 2023 at 01:23:29AM +0200, Jonathan Bergh wrote:
[]
> > diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging=
/media/av7110/av7110_av.c
[]
> > @@ -241,8 +241,8 @@ int av7110_pes_play(void *dest, struct dvb_ringbuff=
er *buf, int dlen)
> >  		sync |=3D DVB_RINGBUFFER_PEEK(buf, 2) << 8;
> >  		sync |=3D DVB_RINGBUFFER_PEEK(buf, 3);
> > =20
> > -		if (((sync &~ 0x0f) =3D=3D 0x000001e0) ||
> > -		    ((sync &~ 0x1f) =3D=3D 0x000001c0) ||
> > +		if (((sync &~0x0f) =3D=3D 0x000001e0) ||
> > +		    ((sync &~0x1f) =3D=3D 0x000001c0) ||
>=20
> These should be:
>=20
> 	if (((sync & ~0x0f) =3D=3D 0x000001e0) ||
> 	    ((sync & ~0x1f) =3D=3D 0x000001c0) ||

Generally, I believe it would be better to avoid '& ~constant'
and use the positive form instead

	if ((sync & 0xfffffff0) =3D=3D 0x000001e0) ||
	    (sync & 0xffffffe0) =3D=3D 0x000001c0)


