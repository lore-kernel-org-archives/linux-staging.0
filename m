Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F25B266D5
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TU8VbPDq"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5362bcc7026so2459213a12.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696533913; x=1697138713; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAIuNzRqeVKL4UBHwUYQTQv/MFOTl6dEpbXD6CCqo5M=;
        b=TU8VbPDqZFiKYiKY7G60P6CYFmwKLgr4OgSPyIj5EZTaNUbeaLnLmfx6M/fsUHF7bn
         P8YUh0p0zCb5Figx1eAfkc/uDlUfvdyzBbixpY3/ATpEaAzRFwrKSW5zMaeey/NdDBkT
         G3JuvVaCTNKPcjEAjGmcO2fcoUTk7Py0GZxLW5SQACoz63H8fXbaujfZuWy+FkoIIxhk
         4IkKMEZ4jy9xdLgsJ5AQdPKZC3VGZ3NaF2dFbheFR1vikTCkQM/OrwxLJjs0ba5gN1Ow
         J5/2n/KsXIwYDtt/Oj6my21/p9f3jqD3HgM0Ds8mhLm90OtS6iNd+Lx7fvqE6ZIg1i5+
         YkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696533913; x=1697138713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAIuNzRqeVKL4UBHwUYQTQv/MFOTl6dEpbXD6CCqo5M=;
        b=A0zbSTIG9gN/3foS4qTtgxAi9vbbTEc1w6/n3QM8ZOJXXl2rA7ANPzECT3FkH+5Y5w
         Q79jNSX0jbM74bXHMeEXw7Xlyca+vAnNRbUd7qA5YR6DAvXZ5+MCyi+T5CM9830LjVlp
         iZegH5V+NtHxU4zUTTKk5cUP2YtEAd0Td2hbI64E4LH/I/+1QHjc4MfXy1L6MqfynqGb
         AKBC+lgx4K+jSnRJ2h3O80rWNrSSsZvSpGXnsv/+KIJnZUIwu9DySK0lENvvkTaEOSfN
         uvCvIJLEvuYITAq0ZDw+Yy1LSYMwbdwUkhRMKcu4f18yVj8Cf8BOueZvewwhIk74rDZ8
         oShg==
X-Gm-Message-State: AOJu0Yzy5Dugma7x7C2JNJjKlocqR4WNPdUqOmLiRQy9awLF/WF4zlQB
	HCM+KwekJubGjx/U1NKZnFulsfHrelvP2pDl1Kas9Q==
X-Google-Smtp-Source: AGHT+IE/lNkGrp8J2WkjY7FP16+AvJpLMZkj9ptYmYvBvpsK946+tDKXzby/+pwCKElpnR04kI+486BfdcMim4oAt3U=
X-Received: by 2002:a17:906:3048:b0:9ae:37d9:803e with SMTP id
 d8-20020a170906304800b009ae37d9803emr5549553ejd.8.1696533913393; Thu, 05 Oct
 2023 12:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
 <20230929-ad2s1210-mainline-v3-22-fa4364281745@baylibre.com>
 <20230930164251.5c07723c@jic23-huawei> <CAMknhBFKSqXvgOeRjGAOfURzndmxmCffdU6MUirEmfzKqwM_Kg@mail.gmail.com>
 <20231005153736.2603dbbf@jic23-huawei>
In-Reply-To: <20231005153736.2603dbbf@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 5 Oct 2023 14:25:02 -0500
Message-ID: <CAMknhBEuX9sA_eHM2xqjGkDDtq-hDMtmmYyqYbER3B42TqWRmw@mail.gmail.com>
Subject: Re: [PATCH v3 22/27] staging: iio: resolver: ad2s1210: convert LOS
 threshold to event attr
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, David Lechner <david@lechnology.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 9:37=E2=80=AFAM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Mon, 2 Oct 2023 11:09:11 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > On Sat, Sep 30, 2023 at 10:42=E2=80=AFAM Jonathan Cameron <jic23@kernel=
.org> wrote:
> > >
> > > On Fri, 29 Sep 2023 12:23:27 -0500
> > > David Lechner <dlechner@baylibre.com> wrote:
> > >
> > > > From: David Lechner <david@lechnology.com>
> > > >
> > > > From: David Lechner <dlechner@baylibre.com>
> > > >
> > > > The AD2S1210 has a programmable threshold for the loss of signal (L=
OS)
> > > > fault. This fault is triggered when either the sine or cosine input
> > > > falls below the threshold voltage.
> > > >
> > > > This patch converts the custom device LOS threshold attribute to an
> > > > event falling edge threshold attribute on a new monitor signal chan=
nel.
> > > > The monitor signal is an internal signal that combines the amplitud=
es
> > > > of the sine and cosine inputs as well as the current angle and posi=
tion
> > > > output. This signal is used to detect faults in the input signals.
> > >
> > > Hmm. Looking forwards, I'm less sure that we should be shoving all th=
ese
> > > error conditions onto one channel. Fundamentally we have
> > > sine and cosine inputs. I think we should treat those as separate cha=
nnels
> > > and include a third differential channel between them.
> >
> > At first, I did consider a differential channel as you suggested in
> > v2. However, the datasheet is quite clear that the LOS and DOS faults
> > (and only those faults) come from a signal it calls the "monitor
> > signal". This signal is defined as:
> >
> >     Monitor =3D A1 * sin(theta)  * sin(phi) + A2 * cos(theta) * cos(phi=
)
> >
> > where A1 * sin(theta) is the the sine input, A2 * cos(theta) is the
> > cosine input and phi is the position output. So mathematically
> > speaking, there is no signal that is the difference between the two
> > inputs. (See "Theory of Operation" section in the datasheet.)
>
> Hmm. That's certainly a bit more complex than I expected.
> Relying on the brief description led me astray.
>
> It's related to the differences in the measured and  as if
> theta =3D=3D phi and A1 =3D=3D A2 (ideal) then it will be A1.
>
> I can see it's relevant to DOS, but not LOS.  The description of LOS
> seems to overlap a number of different things unfortunately.
>

One thing to watch out for in the datasheet is the difference between
the fault output pins and the fault bits read over the bus. The LOS
output pin does indicate one or more of multiple faults, but we are
not currently using that. We are only looking at the fault bits which
are more granular.

>
>
> >
> > But if we want to hide these internal details and don't care about a
> > strict definition of "differential", then what is suggested below
> > seems fine.
>
> Probably best to introduce that monitor signal though we'll have
> to be a bit vague about what it is which has the side effect that
> anyone trying to understand what on earth these faults are is going
> to be confused (having read the datasheet section a couple of times
> I'm not 100% sure...)
>
> >
> > >
> > > So this one becomes a double event (you need to signal it on both
> > > cosine and sine channels).  The DOS overange is similar.
> > > The DOS mismatch is a threshold on the differential channel giving
> > >
> > > events/in_altvoltage0_thresh_falling_value
> > > events/in_altvoltage1_thresh_falling_value (these match)
> > > events/in_altvoltage0_thresh_rising_value
> > > events/in_altvoltage1_thresh_rising_value (matches previous which is =
fine)
> > > events/in_altvoltage1-altvoltage0_mag_rising_value
> > >
> > > Does that work here?  Avoids smashing different types of signals toge=
ther.
> > > We could even do the LOT as differential between two angle channels
> > > (tracking one and measured one) but meh that's getting complex.>
> > > Note this will rely on channel labels to make the above make any sens=
e at all.
> >
> > I think this could be OK - I think what matters most is having some
> > documentation that maps the faults and registers on the chip to the
> > iio names. Where would the sine/cosine clipping fault fit in though? I
> > got a bit too creative and used X_OR_Y to differentiate it (see
> > discussion in "staging: iio: resolver: ad2s1210: implement fault
> > events"). Strictly speaking, it should probably be a type: threshold,
> > direction: either event on both the sine and cosine input channels
> > (another double event) since it occurs if either of the signal exceeds
> > the power or ground rail voltage. But we already have threshold rising
> > and threshold falling on these channels with a different meaning. I
> > guess it could call it magnitude instead of a threshold?
>
> Tricky indeed.  Though I guess we only hit the clipping case after
> LOS or DOS fires or if their thresholds are set too wide (is that
> even possible?).

I suppose it _could_ be possible on the high side if the AVDD voltage
supply was selected to be less than the 4.4V max of the threshold
voltage registers.

> So it is useful to report it as we are already in
> error? Or can we combine the cases by treating it as a cap on the
> threshold controls for LOS and DOS?

I found the clipping error useful while developing this driver since
it help identify that we had a gain setting wrong on the excitation
output (on the circuit board) which in turn caused the inputs to be
overdriven. But, yes when this happened, it also always triggered at
least one or more of the LOS and DOS faults as well.

>
> Even when they aren't just there for error reporting, designers
> seem to always come up with new create signals to use for event
> detection and sometimes it's a real struggle to map them to
> something general.
>
> Jonathan
>
>
