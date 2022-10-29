Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF423C0;
	Sat, 29 Oct 2022 11:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4B5C433D6;
	Sat, 29 Oct 2022 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667044786;
	bh=U7Y0LfekRUqevIEdJzCxwKVxVXiVTJMwJyYoSfKxd6Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hIS7oSEfkBImSJSVDYOn5IMiAPOR04y0RK1YH9CEzK80IKmCWXJezMCYr8AHWCypS
	 e+F2r8b6gT3Zmp7cMQbPdDgCEGWR2CqzzKC6QWpuvxBMk7hx7sgotqOgYSXBcd1AbJ
	 mJZpTmnwBXD6yt07sRPxWmtGjJwVGccfs9HP59/EkOH8nMh/46+y05lswgh+vwvcTK
	 Mrhs3u4Q1MMWaRrTWKUESYO7VUUFHPWLODfL8/8qIQ+fS1OC6ukhKW9RJzV2ulYxoE
	 aa6DWUDyN9hpTEv5yo0NeUzhnYv7+LE96t4VVPbC4hqHTC7tXYI2XvJvoj47wBf4/y
	 aq80/834kXEfA==
Date: Sat, 29 Oct 2022 13:11:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Cc: Deepak R Varma <drv@mailo.com>, "outreachy@lists.linux.dev"
 <outreachy@lists.linux.dev>, Lars-Peter Clausen <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: iio: frequency: ad9832: Use div64_ul instead
 of do_div
Message-ID: <20221029131139.016c89ce@jic23-huawei>
In-Reply-To: <SJ0PR03MB6778033906F79121A66C32DD99329@SJ0PR03MB6778.namprd03.prod.outlook.com>
References: <Y1r+EHqpVz/HYrIm@ubunlion>
	<SJ0PR03MB6778033906F79121A66C32DD99329@SJ0PR03MB6778.namprd03.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Oct 2022 10:11:56 +0000
"Sa, Nuno" <Nuno.Sa@analog.com> wrote:

> > -----Original Message-----
> > From: Deepak R Varma <drv@mailo.com>
> > Sent: Thursday, October 27, 2022 11:54 PM
> > To: outreachy@lists.linux.dev; Lars-Peter Clausen <lars@metafoo.de>;
> > Hennerich, Michael <Michael.Hennerich@analog.com>; Jonathan Cameron
> > <jic23@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> > linux-iio@vger.kernel.org; linux-staging@lists.linux.dev; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH] staging: iio: frequency: ad9832: Use div64_ul instead =
of
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
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

As per the email Greg linked to, please take a close look at the surround c=
ode
and include analysis of whether the value can actually be greater than 32 b=
its.
Note that in most cases that would actually mean the code was broken on 32 =
bit
platforms.
