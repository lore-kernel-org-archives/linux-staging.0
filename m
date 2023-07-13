Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319A13ACE
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 13:54:02 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qJwlO-003u9E-2D; Thu, 13 Jul 2023 15:53:46 +0200
Received: from p57bd9f0d.dip0.t-ipconnect.de ([87.189.159.13] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qJwlN-002pvx-QH; Thu, 13 Jul 2023 15:53:45 +0200
Message-ID: <4622810f8bceb66f212fa09d34b10f0d2d71a35d.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 08/18] sh: Assign FB_MODE_IS_UNKNOWN to struct
 fb_videomode.flag
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 javierm@redhat.com
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org, 
 linux-nvidia@lists.surfsouth.com, linux-hyperv@vger.kernel.org, 
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org,  Sam Ravnborg <sam@ravnborg.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Date: Thu, 13 Jul 2023 15:53:44 +0200
In-Reply-To: <20230713130338.31086-9-tzimmermann@suse.de>
References: <20230713130338.31086-1-tzimmermann@suse.de>
	 <20230713130338.31086-9-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.159.13
X-ZEDAT-Hint: PO

On Thu, 2023-07-13 at 14:58 +0200, Thomas Zimmermann wrote:
> Assign FB_MODE_IS_UNKNOWN to sh7763fb_videomode.flag instead of
> FBINFO_FLAG_DEFAULT. Both are 0, so the stored value does not change.
>=20
> FBINFO_FLAG_DEFAULT is a flag for a framebuffer in struct fb_info.
> Flags for videomodes are prefixed with FB_MODE_.
>=20
> v2:
> 	* assign FB_MODE_IS_UNKNOWN (Adrian)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> ---
>  arch/sh/boards/mach-sh7763rdp/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/sh/boards/mach-sh7763rdp/setup.c b/arch/sh/boards/mach-=
sh7763rdp/setup.c
> index 97e715e4e9b3..e25193001ea0 100644
> --- a/arch/sh/boards/mach-sh7763rdp/setup.c
> +++ b/arch/sh/boards/mach-sh7763rdp/setup.c
> @@ -119,7 +119,7 @@ static struct fb_videomode sh7763fb_videomode =3D {
>  	.vsync_len =3D 1,
>  	.sync =3D 0,
>  	.vmode =3D FB_VMODE_NONINTERLACED,
> -	.flag =3D FBINFO_FLAG_DEFAULT,
> +	.flag =3D FB_MODE_IS_UNKNOWN,
>  };
> =20
>  static struct sh7760fb_platdata sh7763fb_def_pdata =3D {

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
