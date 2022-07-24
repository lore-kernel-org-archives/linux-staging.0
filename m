Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7398533FA
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 21:33:22 +0000 (UTC)
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id C1EC480160;
	Sun, 24 Jul 2022 20:54:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 69AE06000D;
	Sun, 24 Jul 2022 20:54:00 +0000 (UTC)
Message-ID: <434188828f98c78d17cef4f62461b75f7197a67f.camel@perches.com>
Subject: Re: [PATCH] staging: r8188eu: make dump_chip_info() static
From: Joe Perches <joe@perches.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Michael Straube
	 <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sun, 24 Jul 2022 13:53:59 -0700
In-Reply-To: <bd498222-004a-9ac4-8c3c-4419f9ca9916@gmail.com>
References: <20220724182520.7794-1-straube.linux@gmail.com>
	 <bd498222-004a-9ac4-8c3c-4419f9ca9916@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 69AE06000D
X-Spam-Status: No, score=1.38
X-Stat-Signature: gzqoigbsw5mptkm5hqxrdux5ga4xycsk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18t/iqLMk8sM8i6cTxQKgHO0HPHK0FVGbo=
X-HE-Tag: 1658696040-396189

On Sun, 2022-07-24 at 20:39 +0200, Philipp Hortmann wrote:
> On 7/24/22 20:25, Michael Straube wrote:
> > The function dump_chip_info() is only used in rtl8188e_hal_init.c.
> > Make it static to reduce the driver object file size by 281 bytes.
> >=20
> > before:
> >    text    data     bss     dec     hex filename
> > 530606   43897    7072  581575   8dfc7 drivers/staging/r8188eu/r8188eu.=
o
> >=20
> > after:
> >    text    data     bss     dec     hex filename
> > 530405   43817    7072  581294   8deae drivers/staging/r8188eu/r8188eu.=
o
[]
> > diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/=
staging/r8188eu/hal/rtl8188e_hal_init.c
[]
> > @@ -526,6 +526,45 @@ void rtl8188e_ReadEFuse(struct adapter *Adapter, u=
16 _size_byte, u8 *pbuf)
> >   	Hal_EfuseReadEFuse88E(Adapter, 0, _size_byte, pbuf);
> >   }
> >  =20
> > +static void dump_chip_info(struct HAL_VERSION chip_vers)
> > +{
> > +	uint cnt =3D 0;
> > +	char buf[128];
> > +
> > +	cnt +=3D sprintf((buf + cnt), "Chip Version Info: CHIP_8188E_");
> > +	cnt +=3D sprintf((buf + cnt), "%s_", IS_NORMAL_CHIP(chip_vers) ?
> > +		       "Normal_Chip" : "Test_Chip");
> > +	cnt +=3D sprintf((buf + cnt), "%s_", IS_CHIP_VENDOR_TSMC(chip_vers) ?
> > +		       "TSMC" : "UMC");
> > +
> > +	switch (chip_vers.CUTVersion) {
> > +	case A_CUT_VERSION:
> > +		cnt +=3D sprintf((buf + cnt), "A_CUT_");
> > +		break;
> > +	case B_CUT_VERSION:
> > +		cnt +=3D sprintf((buf + cnt), "B_CUT_");
> > +		break;
> > +	case C_CUT_VERSION:
> > +		cnt +=3D sprintf((buf + cnt), "C_CUT_");
> > +		break;
> > +	case D_CUT_VERSION:
> > +		cnt +=3D sprintf((buf + cnt), "D_CUT_");
> > +		break;
> > +	case E_CUT_VERSION:
> > +		cnt +=3D sprintf((buf + cnt), "E_CUT_");
> > +		break;
> > +	default:
> > +		cnt +=3D sprintf((buf + cnt), "UNKNOWN_CUT(%d)_", chip_vers.CUTVersi=
on);
> > +		break;
> > +	}
> > +
> > +	cnt +=3D sprintf((buf + cnt), "1T1R_");
> > +
> > +	cnt +=3D sprintf((buf + cnt), "RomVer(%d)\n", 0);
> > +
> > +	pr_info("%s", buf);
> > +}

Probably better and likely smaller without the temporary buffer
and the possibility of overrun.

Something like:

{
	char cut[25];
	char *v =3D NULL;

	switch (chip_vers.CUTVersion) {
	case A_CUT_VERSION:
		v =3D "A_CUT";
		break;
	case B_CUT_VERSION:
		v =3D "B_CUT";
		break;
	case C_CUT_VERSION:
		v =3D "C_CUT";
		break;
	case D_CUT_VERSION:
		v =3D "D_CUT";
		break;
	case E_CUT_VERSION:
		v =3D "E_CUT";
		break;
	default:
		snprintf(cut, sizeof(cut), "UNKNOWN_CUT(%d)", chip_vers.CUTVersion);
		v =3D cut;
		break;
	}
=09
	pr_info("Chip Version Info: CHIP_8188E_%s__Chip_%s_%s_1T1R_RomVer(%d)\n",
		IS_NORMAL_CHIP(chip_vers) ? "Normal" : "Test",
		IS_CHIP_VENDOR_TSMC(chip_vers) ? "TSMC" : "UMC",
		v, 0);
}

