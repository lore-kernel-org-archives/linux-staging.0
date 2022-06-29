Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C61B7A
	for <linux-staging@lists.linux.dev>; Wed, 29 Jun 2022 19:04:12 +0000 (UTC)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 826E060C93;
	Wed, 29 Jun 2022 18:09:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 5999F40;
	Wed, 29 Jun 2022 18:09:01 +0000 (UTC)
Message-ID: <2f2d8b6ddb4418bbe351d6c19d08e9241de20087.camel@perches.com>
Subject: Re: [PATCH 1/7] Staging: rtl8192e: Added blank lines before/after
 struct
From: Joe Perches <joe@perches.com>
To: Felix Schlepper <f3sch.git@outlook.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wjsota@gmail.com
Date: Wed, 29 Jun 2022 11:09:00 -0700
In-Reply-To: <AM9P190MB129916C683B7D8B241EF85D0A5BB9@AM9P190MB1299.EURP190.PROD.OUTLOOK.COM>
References: <cover.1656402464.git.f3sch.git@outlook.com>
	 <f23e5ad2839c238665956f0d552cacd9944b724d.1656402464.git.f3sch.git@outlook.com>
	 <f110442f5cceb0161f32c2b942ef7be6f5c5a63c.camel@perches.com>
	 <AM9P190MB129916C683B7D8B241EF85D0A5BB9@AM9P190MB1299.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=-3.72
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 5999F40
X-Stat-Signature: cxpy4bhehp97he7ibrn6fwndwm5kmkk4
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+PFQLq9iP8uUoYJGt7spzt5iZz7rrAPH0=
X-HE-Tag: 1656526141-482888

On Wed, 2022-06-29 at 14:11 +0200, Felix Schlepper wrote:
> On 28.06.2022 10:58, Joe Perches wrote:
> > On Tue, 2022-06-28 at 10:30 +0200, Felix Schlepper wrote:
> > > This addresses an issue raised by checkpatch.pl:
> > >=20
> > >      $ ./scripts/checkpatch.pl --terse -f drivers/staging/rtl8192e/rt=
llib_wx.c
> > >      CHECK: Please use a blank line after function/struct/union/enum
> > >      declarations
> > >=20
> > > The additional blank line above the struct/before the headers is
> > > just cleaner.
> > []
> > > diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/r=
tl8192e/rtllib_wx.c
> > []
> > > @@ -17,10 +17,12 @@
> > >  #include <linux/module.h>
> > >  #include <linux/etherdevice.h>
> > >  #include "rtllib.h"
> > > +
> > >  struct modes_unit {
> > >  	char *mode_string;
> > >  	int mode_size;
> > >  };
> > > +
> > >  static struct modes_unit rtllib_modes[] =3D {
> > >  	{"a", 1},
> > >  	{"b", 1},
> >=20
> > Please always look deeper at the code and do not simply take
> > any checkpatch suggestion as the "best" fix.
> >=20
> > Using this struct style with an embedded length is error prone
> > and would likely be better as a simple char * array.
> >=20
> > Also, the existing sprintf use of mode_string and mode_size is
> > nonsensical.  There is nothing to format in any of the mode_size.
> > so the use of mode_size as an argument is silly.
> First of all, thank you for your suggestions.
> I did realize that there is nothing to format, but I did not dare to
> make that change in case a format could be added.
> However, looking at it now. This has not been touched in over 10 years.
> So it is probably safe to change that.
> >=20
> > Perhaps something like this would be better:
> > ---
> >  drivers/staging/rtl8192e/rtllib_wx.c | 21 +++++----------------
> >  1 file changed, 5 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl=
8192e/rtllib_wx.c
> > index cf9a240924f20..90dcce152d80c 100644
> > --- a/drivers/staging/rtl8192e/rtllib_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> > @@ -17,17 +17,9 @@
> >  #include <linux/module.h>
> >  #include <linux/etherdevice.h>
> >  #include "rtllib.h"
> > -struct modes_unit {
> > -	char *mode_string;
> > -	int mode_size;
> > -};
> > -static struct modes_unit rtllib_modes[] =3D {
> > -	{"a", 1},
> > -	{"b", 1},
> > -	{"g", 1},
> > -	{"?", 1},
> > -	{"N-24G", 5},
> > -	{"N-5G", 4},
> > +
> > +static const char *rtllib_modes[] =3D {
> > +	"a", "b", "g", "?", "N-24G", "N-5G",
> >  };
> > =20
> >  #define MAX_CUSTOM_LEN 64
> > @@ -72,11 +64,8 @@ static inline char *rtl819x_translate_scan(struct rt=
llib_device *ieee,
> >  	/* Add the protocol name */
> >  	iwe.cmd =3D SIOCGIWNAME;
> >  	for (i =3D 0; i < ARRAY_SIZE(rtllib_modes); i++) {
> > -		if (network->mode&(1<<i)) {
> > -			sprintf(pname, rtllib_modes[i].mode_string,
> > -				rtllib_modes[i].mode_size);
> > -			pname +=3D rtllib_modes[i].mode_size;
> > -		}
> > +		if (network->mode & BIT(i))
> > +			pname =3D stpcpy(pname, rtllib_modes[i]);
> >  	}
> >  	*pname =3D '\0';
> Would this not be also redundant since stpcpy already returns a pointer t=
o the new
> NUL-terminating character?
> >  	snprintf(iwe.u.name, IFNAMSIZ, "IEEE802.11%s", proto_name);

Only if proto_name is initialized.  Is it?

Also I believe stpcpy is not a standard linux call, so maybe
this needs to be strcpy or strncpy then strlen.

