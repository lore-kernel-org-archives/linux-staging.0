Received: from relay3.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9379BA2D
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 04:24:26 +0000 (UTC)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 4FF7520BAB;
	Sat,  9 Jul 2022 04:07:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 103611A;
	Sat,  9 Jul 2022 04:07:44 +0000 (UTC)
Message-ID: <2c1717b23896bc95a9ba9de79c9dbf112aa35460.camel@perches.com>
Subject: Re: [PATCH 1/2] staging: vt6655: Use loop in
 vt6655_mac_write_bssid_addr
From: Joe Perches <joe@perches.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Hortmann
	 <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
  linux-kernel@vger.kernel.org
Date: Fri, 08 Jul 2022 21:07:43 -0700
In-Reply-To: <YsgjOPUDDtD48tMO@kroah.com>
References: <cover.1657134099.git.philipp.g.hortmann@gmail.com>
	 <b3b93ae7ce41562565e9007eb4580b9c47a2881f.1657134099.git.philipp.g.hortmann@gmail.com>
	 <YsgjOPUDDtD48tMO@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 103611A
X-Spam-Status: No, score=0.65
X-Stat-Signature: wenfhm9tjf4dikq1umz4o1so58g5p685
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/lD4hqYXWTqy60ADw9GyoRDemBIZFqbuQ=
X-HE-Tag: 1657339664-43791

On Fri, 2022-07-08 at 14:29 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 06, 2022 at 09:19:01PM +0200, Philipp Hortmann wrote:
> > Use loop in vt6655_mac_write_bssid_addr to avoid multiple
> > similar statements.
[]
> > diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6=
655/device_main.c
[]
> > @@ -192,12 +192,8 @@ device_set_options(struct vnt_private *priv)
> >  static void vt6655_mac_write_bssid_addr(void __iomem *iobase, const u8=
 *mac_addr)
[]
> > +	for (int i =3D 0; i < 6; i++)
>=20
> Taking advantage of the new compiler level I see, nice :)

Not sure this is altogether a great idea as it may
make backporting a bit difficult, but it's already
in the kernel in a few places.


