Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44B6193435
	for <linux-staging@lists.linux.dev>; Mon, 18 Nov 2024 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731929316; cv=none; b=epH5kxd+o7Fw3cUbbQQHMdFW6lHQxhN7ThS4L4+8AzCrNtUO+SzG9/7nuJRS2CA1IXF4dvgz1jcjgdaTik81Vtn9I74YZ0jVmSZ/JNW5vKf3u5P9Ly7Wl4BHQlV+o+XcibplIFiCLp1mg5o/M2w16nYg3HntP4liJRoTf455/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731929316; c=relaxed/simple;
	bh=eflO5BqcAdiHnObc19vuFxv1kFN4bcVh6FEadC6e/J0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mRBdesiOEFQbWURVtzbYTKZky87LL5wV7BJqOAQkPC+zrSc2oM8WvG+Wnnr7ltgK1cnwHU4UapQ0MJe6D5HiILuXl9GHuYE7gGXTLHpvCTiWvSQBnHrYsB7EPVwpvbzJ3W8hKxIbAr4hhrH71A8Yv/XVjizYMxgqskwYbEIVdvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2379z8z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2379z8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731929315; x=1763465315;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=eflO5BqcAdiHnObc19vuFxv1kFN4bcVh6FEadC6e/J0=;
  b=Q2379z8z+lpbV1UYbD827UBD4Dcw6RfZUJ2P3hfawkwIiKn5EhLUZafe
   WsjEoPidgmujf99XwbGPuj4ow6Lt/WqUJXekx5C00KLbLYGOgwbDFX0DJ
   RclcWjONsmSpmig8EIQp066CBE3YnMzvJzGULZLplZPZ6Gc/UeE5s6Rwj
   5X6FvXbbITJaDGYU+3FgkUujvV4sFc9QxZrHAmRoCKpy/KlzurbA+jzxn
   xHcUHMzXh+IMOkP3wF+UJ0MaGB4UKWElG/yPwaGBKYGCXKz5fqoPX6w4A
   X/pay2k8AuD1OEwIYFUDA1XTnwdgoctLBI+zgbPiH05KYfp2LWSkjWRR/
   w==;
X-CSE-ConnectionGUID: XaVsLx9gT3uSJXK7j99c2Q==
X-CSE-MsgGUID: yhgiel5mRUK+tAIJftEePQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42396200"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42396200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 03:28:31 -0800
X-CSE-ConnectionGUID: rRdUd/MrRkyoZEJD1Sac1Q==
X-CSE-MsgGUID: apTDPmdSTQ+3Y3NYJwg9xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89329614"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.149]) ([10.245.246.149])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 03:28:08 -0800
Message-ID: <62c1e9e941cec75cf8771761fb9981879fefcce5.camel@linux.intel.com>
Subject: Re: [PATCH 08/22] drm/xe: Convert timeout to secs_to_jiffies()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,  Nicolas Palix
 <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ofir
 Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jack
 Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Xiubo
 Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,  Josh Poimboeuf
 <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org,  linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,  ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org,  linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org,  oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
Date: Mon, 18 Nov 2024 12:27:53 +0100
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-8-19aadc34941b@linux.microsoft.com>
References: 
	<20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
	 <20241115-converge-secs-to-jiffies-v1-8-19aadc34941b@linux.microsoft.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2024-11-15 at 21:22 +0000, Easwar Hariharan wrote:
> Changes made with the following Coccinelle rules:
>=20
> @@ constant C; @@
>=20
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
>=20
> @@ constant C; @@
>=20
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
>=20
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

<
> ---
> =C2=A0drivers/gpu/drm/xe/xe_device.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index
> a1987b554a8d2aa42b29301f2853edddfda7fda5..bb3338ef4191e76128611eeb953
> 1c9d2089db85a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -502,7 +502,7 @@ static int wait_for_lmem_ready(struct xe_device
> *xe)
> =C2=A0	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
> =C2=A0
> =C2=A0	start =3D jiffies;
> -	timeout =3D start + msecs_to_jiffies(60 * 1000); /* 60 sec! */
> +	timeout =3D start + secs_to_jiffies(60); /* 60 sec! */
> =C2=A0
> =C2=A0	do {
> =C2=A0		if (signal_pending(current))
>=20

