Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1592AB4A;
	Thu,  5 Oct 2023 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uv6KEnn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6ABC43391;
	Thu,  5 Oct 2023 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696517528;
	bh=UWSMwZTut3ulgdkrQlViyt+e9WAmg8wzX3BDkFVh4Fk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uv6KEnn88kGqvoYCqaxameFBk/0fMjMdvTUk1fXSuCnAlcj8ae8RF3vM7Ar3kzzCp
	 n6/MkMtWBfbU4ChNRsWTZjr5Xj1iw5oIGa1pK35iskZTyJ7dyz0E35k1ITwnK49Nui
	 HTZ0g8I7FCDOIyBlaD8N+j0vo0xBn0f89BZNZjYZFwr+izDD8zxOdhO87K8tH3e4YU
	 hALtCR3/253I66T56mVGqgpMxWgrBvedcjK+FE22aO/N4tlZ2ywcpzM6wltgDWwROT
	 9swgT9aojZhsZOjPnOFDWCH+FnSPE5qNbcNGA0f9yJvgXzXgJX+kDkxA0CseIm/UGa
	 ipR7MghYIfDZg==
Date: Thu, 5 Oct 2023 15:52:11 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, David Lechner <david@lechnology.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 26/27] staging: iio: resolver: ad2s1210: implement
 fault events
Message-ID: <20231005155211.102a4292@jic23-huawei>
In-Reply-To: <CAMknhBH4+cUSX_j3-Y0xuTEiZHd3Ke4Zm8FdxLZJwn5gr_d-ug@mail.gmail.com>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
	<20230929-ad2s1210-mainline-v3-26-fa4364281745@baylibre.com>
	<20230930170046.36637e9c@jic23-huawei>
	<CAMknhBH4+cUSX_j3-Y0xuTEiZHd3Ke4Zm8FdxLZJwn5gr_d-ug@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Oct 2023 11:58:17 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On Sat, Sep 30, 2023 at 11:00=E2=80=AFAM Jonathan Cameron <jic23@kernel.o=
rg> wrote:
> >
> > On Fri, 29 Sep 2023 12:23:31 -0500
> > David Lechner <dlechner@baylibre.com> wrote:
> > =20
> > > From: David Lechner <david@lechnology.com>
> > >
> > > From: David Lechner <dlechner@baylibre.com>
> > >
> > > When reading the position and velocity on the AD2S1210, there is also=
 a
> > > 3rd byte following the two data bytes that contains the fault flag bi=
ts.
> > > This patch adds support for reading this byte and generating events w=
hen
> > > faults occur.
> > >
> > > The faults are mapped to various channels and event types in order to
> > > have a unique event for each fault.
> > >
> > > Signed-off-by: David Lechner <dlechner@baylibre.com> =20
> >
> > Use of x and y modifiers is a little odd.  What was your reasoning?
> > Was it just that there was a X_OR_Y modifier?  If so, don't use that!
> > It seemed like a good idea at the time, but it's not nice to deal with
> > and requires a channel with that modifier to hang the controls off
> > + make sure userspace expects that event code. =20
>=20
>=20
> Regarding the point about "requires a channel with that modifier to
> hang the controls off...". Although that comment was about modifiers,
> does it also apply in general.
>=20
> There are several fault events that don't have any configurable
> parameters, namely _sine/cosine inputs clipping_ and _velocity exceeds
> max tracking rate_. So there won't be any attributes that contain the
> event specification for those (e.g. no `events/in_angl0_*`
> attributes). It sounds like this would be a problem as well?

It's fine to have a channel that doesn't have controls or the ability
to be read.

We do have history of doing what you have here (a couple
of accelerometers do it) but it's esoteric and rather hard for userspace
to comprehend so I'd rather not introduce it for other types of devices.

I think we should go with the most flexible option of allowing
events to trigger when they 'may be true' to incorporate this case.
Unfortunately I can't see another option that would scale to all the
random combinations of events that might occur.  There are all sorts
of extensions we could make to the event descriptions, but only at the
cost of breaking backwards compatibility and simplicity.

SWith hindsight the whole IIO_MOD_X_OR_Y_OR_Z mess was a design error :(
We can teach userspace code about that quirk for accelerations where
the one that would be hard to handle is the AND case used for
freefall detectors (you detect that the signal magnitude is near 0 for
all axes).  I can't think of another option for that one other than
the weird modifier (unlike this case)

>=20
> Should we consider a IIO_EV_INFO_LABEL so that we can have some sort
> of attribute (namely `events/<dir>_<channel spec>_label`) so that
> userspace can enumerate expected events for non-configurable events?

Probably needs something similar to channel labelling, so a separate
callback given we don't handle strings, but sure something like this
would be useful and provide 'hints' along the lines of what the
datasheet calls a particular event.  Not however for what event is sent
as such info should be apparent from the event naming.

Jonathan
