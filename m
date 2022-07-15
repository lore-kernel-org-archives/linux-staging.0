Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D1F4C7A
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 20:12:02 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1oCRfC-0006TK-7c; Fri, 15 Jul 2022 22:11:50 +0200
Date: Fri, 15 Jul 2022 22:11:50 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] staging: r888eu: use dynamic allocation for efuse buffer
Message-ID: <20220715201150.nnbdfc4tgj67zyic@viti.kaiser.cx>
References: <20220713075804.140986-1-martin@kaiser.cx>
 <5445d915-0c6c-b84f-158e-160e7645cbbd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5445d915-0c6c-b84f-158e-160e7645cbbd@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Pavel,

Thus wrote Pavel Skripkin (paskripkin@gmail.com):

> Hi Martin,

> Martin Kaiser <martin@kaiser.cx> says:
> > Use kmalloc to allocate the efuse buffer in ReadAdapterInfo8188EU and
> > free it on exit. This is better than using a 512 byte array on the stack.

> > It's ok to drop the __aligned(4) qualifier. kmalloc aligns to
> > ARCH_KMALLOC_MINALIGN, this is at least 8 bytes.

> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/r8188eu/hal/usb_halinit.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)

> > diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> > index 8902dda7b8d8..421fe7c40390 100644
> > --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> > +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> > @@ -926,7 +926,7 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
> >   {
> >   	struct eeprom_priv *eeprom = &Adapter->eeprompriv;
> >   	struct led_priv *ledpriv = &Adapter->ledpriv;
> > -	u8 efuse_buf[EFUSE_MAP_LEN_88E] __aligned(4);
> > +	u8 *efuse_buf;
> >   	u8 eeValue;
> >   	int res;
> > @@ -937,7 +937,10 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
> >   	eeprom->bautoload_fail_flag	= !(eeValue & EEPROM_EN);
> > -	memset(efuse_buf, 0xFF, sizeof(efuse_buf));
> > +	efuse_buf = kmalloc(EFUSE_MAP_LEN_88E, GFP_KERNEL);
> > +	if (!efuse_buf)
> > +		return;

> I think, it worth returning an error to caller. Functions right after the
> allocation do initialization, so leaving fields as-is seems to be dangerous

yes, that makes sense. We could refuse to load the driver in this case.

Larry and Greg already accepted the patch as is, I'll add error handling
in a separate patch.

Thanks,
   Martin
