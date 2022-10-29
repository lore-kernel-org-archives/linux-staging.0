Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D6E15CBB;
	Sat, 29 Oct 2022 11:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA47C433C1;
	Sat, 29 Oct 2022 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667044764;
	bh=Ap5s75s7ijrFAwTqA7tudLOZWue/4KVuAcaVQy36hgw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nM6bYNlsiYigLSzaUv73E7fYpiHLuaCLaAbWt0qY3RCkZ5kYnHHkx/VOGI2sdwZeY
	 5TpBkB4tqt4PnENvj1UKHmF/6hYZu/AoN70xwVcdWIBe0WGmUVNU5NOo5R+vApuqNQ
	 QDjbJ9GnvsXWfJmuw2KFjBugsrxT/8ziq1zXK7ulgkexb+nqm1pxybTPpp8zO6b320
	 pnuLej+/DBXnrRljKQV3TTZezWBtAg03eavfXQ6XWMvsWA8EBl69IxvGZTcSFqkQxY
	 HbJsNtXBuupjnvCY1WcvM+B3tNYhg7Wmz9jHJtSAuVlH4Y4ahu2jFQCfE/RYz6ZvCy
	 d8/WRHlhzf7/Q==
Date: Sat, 29 Oct 2022 13:11:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Cc: Deepak R Varma <drv@mailo.com>, "outreachy@lists.linux.dev"
 <outreachy@lists.linux.dev>, Lars-Peter Clausen <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: iio: frequency: ad9834: Use div64_ul
 instead of do_div
Message-ID: <20221029131119.2f000985@jic23-huawei>
In-Reply-To: <SJ0PR03MB677828AF20AAF0FC1A167C3C99329@SJ0PR03MB6778.namprd03.prod.outlook.com>
References: <Y1r/RAk83Csk2L3E@ubunlion>
	<SJ0PR03MB677828AF20AAF0FC1A167C3C99329@SJ0PR03MB6778.namprd03.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Oct 2022 10:14:48 +0000
"Sa, Nuno" <Nuno.Sa@analog.com> wrote:

> > -----Original Message-----
> > From: Deepak R Varma <drv@mailo.com>
> > Sent: Friday, October 28, 2022 12:00 AM
> > To: outreachy@lists.linux.dev; Lars-Peter Clausen <lars@metafoo.de>;
> > Hennerich, Michael <Michael.Hennerich@analog.com>; Jonathan Cameron
> > <jic23@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> > linux-iio@vger.kernel.org; linux-staging@lists.linux.dev; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH v2] staging: iio: frequency: ad9834: Use div64_ul inste=
ad of
> > do_div
> >=20
> > [External]
> >=20
> > do_div() does a 64-by-32 division. Here the divisor is an unsigned long
> > which on some platforms is 64 bit wide. So use div64_ul instead of do_d=
iv
> > to avoid a possible truncation. Issue identified using the
> > coccicheck tool.
> >=20
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > --- =20
>=20
> Clearly, I should have looked better and only reply to this one:
>=20
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

As per the email Greg linked to, please take a close look at the surround c=
ode
and include analysis of whether the value can actually be greater than 32 b=
its.
Note that in most cases that would actually mean the code was broken on 32 =
bit
platforms.
