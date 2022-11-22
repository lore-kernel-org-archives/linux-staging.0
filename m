Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1AB746C
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+NFpLSd8ScOHEVd4DHTztoyZ+UkB3J/9rUIzBb7GyY0=;
	t=1669131573; x=1670341173; b=gD/oHIvcPlmiPYSo1UMmy1V2KDbKuqz93yKdoqZCNAgbJqd
	0K89rqxtaOdmwJLvd8tPlC5/CACb22ivocUHOU+wD7NmTq7NkMDoDyj5dLQ30StBCnAOC0mTkmw5p
	hqZOfJiaG9oDICfh4/TnZY+5C7wqCW0wh5GZTdvrK8jgpSQmdlGlWEKgIx6ooJOHv8aHjxWN7sejU
	UFkuXjbU7kaOGvpIxoEyWzUEdcJyG6FoW9V1YDOg9C4YU6IzcayGVtLwHzKeB/V6ezRlU/dnFCKhH
	WozrqGxejbN2Mld0QSraUOMWdrAik3p2K53rfVmYJSw3TsHdHEvWwH4jnsXYgW6Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oxUlH-006Ngc-2Z;
	Tue, 22 Nov 2022 16:00:35 +0100
Message-ID: <021efb6c9295402cf05406bb319c441c0b0229b3.camel@sipsolutions.net>
Subject: Re: Build regressions/improvements in v6.1-rc6
From: Johannes Berg <johannes@sipsolutions.net>
To: Alex Deucher <alexdeucher@gmail.com>, Geert Uytterhoeven
	 <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-um@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Tue, 22 Nov 2022 16:00:34 +0100
In-Reply-To: <CADnq5_PvouSKugXxJXqkVeZf+kbP8+hhUKFgVALSO=MOW3jzvA@mail.gmail.com>
References: 
	<CAHk-=wjKJyzfJmOzBdEOqCFRc8Fh-rdGM4tvMXfW0WXbbHwV0w@mail.gmail.com>
	 <20221122105054.4062213-1-geert@linux-m68k.org>
	 <alpine.DEB.2.22.394.2211221154280.284524@ramsan.of.borg>
	 <CADnq5_PvouSKugXxJXqkVeZf+kbP8+hhUKFgVALSO=MOW3jzvA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2022-11-22 at 08:55 -0500, Alex Deucher wrote:
> >=20
> >    + /kisskb/src/arch/um/include/asm/processor-generic.h: error: called=
 object is not a function or function pointer:  =3D> 94:18
> >    + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: e=
rror: control reaches end of non-void function [-Werror=3Dreturn-type]:  =
=3D> 1934:1
> >=20
> > um-x86_64/um-all{mod,yes}config (in kfd_cpumask_to_apic_id())
>=20
> Presumably cpu_data is not defined on um-x86_64?  Does it even make
> sense to build drivers on um-x86_64?

Drivers in general yes ;-)

This driver, probably not.

But the issue is that a lot of drivers "depends on X86_64" or such,
where only "X86" is the arch symbol. You could add "X86 && X86_64" to
really build on x86 64-bit only.

I didn't check this driver, but this has mostly popped up since UM got
PCI support some time ago (which I added.)

johannes


