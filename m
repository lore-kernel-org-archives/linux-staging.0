Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C54177
	for <linux-staging@lists.linux.dev>; Tue, 29 Jun 2021 11:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FD8361402;
	Tue, 29 Jun 2021 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624965003;
	bh=aDuuW2GEzASRK/JOBa8fF+QifZw6Yrwn9e43amoOVeM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RDGtg3+rYXZHprE7+5lMsMKUlfwqhudy0J/dPTvseRK0Jue4MR9Wyu9y0L9E1YgRi
	 yzBItVBX6HjNNZGGA7b5iAJr+pMtR83cWot4i9ej/YZqOuK9q6N/dm5qTyVWVRadln
	 r7FdsrpFhNUSf35jZ/wZ9bn4znxPMJabr/3iWJDZyIrelNXjeVOMhhMMzbIv/tYczX
	 qlYz2m+Geabrghmn3e3kt3+pr3xkpodw4iwPsCg/75kirmd5W7piVkNI2giPhuX7j5
	 ukXoIHgEpinS+MlsYqcKENZjhTNYw51k6GglzImtEmDy6ldLtuz8dQus9jtI17yWEF
	 nTrcsr3absYbw==
Date: Tue, 29 Jun 2021 13:09:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
 mauro.chehab@huawei.com, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 2/5] regulator: hi6421v600-regulator: fix platform
 drvdata
Message-ID: <20210629130957.484f5c43@coco.lan>
In-Reply-To: <CAFRkauCzHqUfva+zTRhOyiMMb4WsKPHvYJuqpOPwy+siPMZGOQ@mail.gmail.com>
References: <cover.1624962269.git.mchehab+huawei@kernel.org>
	<eed34e8897c79a2ab13573d3da12c86569bca0f6.1624962269.git.mchehab+huawei@kernel.org>
	<CAFRkauCzHqUfva+zTRhOyiMMb4WsKPHvYJuqpOPwy+siPMZGOQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 29 Jun 2021 18:48:31 +0800
Axel Lin <axel.lin@ingics.com> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =E6=96=BC 2021=E5=B9=B4=
6=E6=9C=8829=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:31=E5=AF=AB=E9=
=81=93=EF=BC=9A
>=20
> > platform drvdata can't be used inside the regulator driver,
> > as this is already used by the MFD and SPMI drivers.
> > =20
>=20
> Could you point out which part of the code set the platform drvdata?
> My understanding is the mfd only set dev->platform_data rather than
> dev->driver_data.
> If you mean the dev_set_drvdata() call in hi6421_spmi_pmic_probe, it's the
> parent device of the regulator pdev.

It needs to be double-checked, but I guess the SPMI or the SPMI controller
driver already uses it.

See, there are 5 drivers involved, all of them using private data
and passing data to child drivers, called on the order below:

	spmi
	hisi-spmi-controller
	hi6421-spmi-pmic
	mfd drivers:
		hi6421v600-irq
		hi6421-regulator

If you're in doubt, try to apply this series, and then change the
driver again to use platform data. You'll see that it will stop
booting after initializing the first regulator.

Thanks,
Mauro
