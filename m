Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425371D68E
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 16:09:24 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-533d6a8d6b6so19486324a12.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696262962; x=1696867762; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvcS4k60SiYin2IuqPChFBTYjG7PvZn5VhPIg+Hqi40=;
        b=V3VapBcV2bo+w/aLNMwMb3nJVql3KD+aas7Zms62jfXTgfuCqlRY7S5OaS+vul32SB
         3b0AIvVw3+ywntfxzxltmQSWaf70rJzXDP0mSSayuHuprZIBJjWvTl05V+Ob+qWmnGVl
         Jsb6g5U6UAaB0c20jj6F+9eDo+RYuV3INWV0vbpiNUiHzwPtDrVYIYiSKU75xEuQbJhu
         oFS+sp+aJQ3jzG14lDf8H8pKt10NsfyXOAI964Eq169kPeJh9MSoMqAAYClcVi9wp0CJ
         gjYg44s/EndTAsdlSEBHEQ5zX8lgzP926v8YVV/NiiFm/+W6yWnFkAy2PntjS3ONFhqj
         Zrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696262962; x=1696867762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvcS4k60SiYin2IuqPChFBTYjG7PvZn5VhPIg+Hqi40=;
        b=B+5eORxbU6waNQ59Bt/qW5sfn9Z1qvu6LvTnq2zHCTT5AJ4uzqQJ7IAuv8lR59bRCD
         qZYakeROKm+YhJNnuOL8E+v0+vPy4HsoeP2KWw9nmyYJLooeAoqyYBEQ1Vc7OxQaJSo8
         nDLikUG3ApZLfJccCRhTQoX6Y4pyGFAQmSgEQ8al64OpLiYidyx19vnVY5TIctJRpyp7
         4KxA4TsmKe/fUaPtTJG0YmmYqY6ga5e2vEeHSKXYX2uhmhDtcN2TEG5xgZ+OS2SSWT9v
         ZkhYY7YbZIkX6epd84bcqAl77BygxBxdaYGTd/FMDPJQG3HZRecCaRTpQBC3wxOYi7Ta
         gN7Q==
X-Gm-Message-State: AOJu0YwAQkkOfMTErSDNP7emcZYX54WuSzcSdFH3DmlexdkuchqFNVdv
	hYv95MdVnhW13ORdCvYQJ9Q+73j2V3+iwF9OQPyYEA==
X-Google-Smtp-Source: AGHT+IGyK+JVMEa1oJv7JXbe9a1iudhE0A9YYgOaQ6viM6YWtllJ+ds+jBI2VPpJJm6BYqbzrjaOUBXtWKX9kd051Ig=
X-Received: by 2002:aa7:c1d9:0:b0:530:a0a9:ee36 with SMTP id
 d25-20020aa7c1d9000000b00530a0a9ee36mr10463704edp.38.1696262962483; Mon, 02
 Oct 2023 09:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
 <20230929-ad2s1210-mainline-v3-22-fa4364281745@baylibre.com> <20230930164251.5c07723c@jic23-huawei>
In-Reply-To: <20230930164251.5c07723c@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 2 Oct 2023 11:09:11 -0500
Message-ID: <CAMknhBFKSqXvgOeRjGAOfURzndmxmCffdU6MUirEmfzKqwM_Kg@mail.gmail.com>
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

On Sat, Sep 30, 2023 at 10:42=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Fri, 29 Sep 2023 12:23:27 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > From: David Lechner <david@lechnology.com>
> >
> > From: David Lechner <dlechner@baylibre.com>
> >
> > The AD2S1210 has a programmable threshold for the loss of signal (LOS)
> > fault. This fault is triggered when either the sine or cosine input
> > falls below the threshold voltage.
> >
> > This patch converts the custom device LOS threshold attribute to an
> > event falling edge threshold attribute on a new monitor signal channel.
> > The monitor signal is an internal signal that combines the amplitudes
> > of the sine and cosine inputs as well as the current angle and position
> > output. This signal is used to detect faults in the input signals.
>
> Hmm. Looking forwards, I'm less sure that we should be shoving all these
> error conditions onto one channel. Fundamentally we have
> sine and cosine inputs. I think we should treat those as separate channel=
s
> and include a third differential channel between them.

At first, I did consider a differential channel as you suggested in
v2. However, the datasheet is quite clear that the LOS and DOS faults
(and only those faults) come from a signal it calls the "monitor
signal". This signal is defined as:

    Monitor =3D A1 * sin(theta)  * sin(phi) + A2 * cos(theta) * cos(phi)

where A1 * sin(theta) is the the sine input, A2 * cos(theta) is the
cosine input and phi is the position output. So mathematically
speaking, there is no signal that is the difference between the two
inputs. (See "Theory of Operation" section in the datasheet.)

But if we want to hide these internal details and don't care about a
strict definition of "differential", then what is suggested below
seems fine.

>
> So this one becomes a double event (you need to signal it on both
> cosine and sine channels).  The DOS overange is similar.
> The DOS mismatch is a threshold on the differential channel giving
>
> events/in_altvoltage0_thresh_falling_value
> events/in_altvoltage1_thresh_falling_value (these match)
> events/in_altvoltage0_thresh_rising_value
> events/in_altvoltage1_thresh_rising_value (matches previous which is fine=
)
> events/in_altvoltage1-altvoltage0_mag_rising_value
>
> Does that work here?  Avoids smashing different types of signals together=
.
> We could even do the LOT as differential between two angle channels
> (tracking one and measured one) but meh that's getting complex.>
> Note this will rely on channel labels to make the above make any sense at=
 all.

I think this could be OK - I think what matters most is having some
documentation that maps the faults and registers on the chip to the
iio names. Where would the sine/cosine clipping fault fit in though? I
got a bit too creative and used X_OR_Y to differentiate it (see
discussion in "staging: iio: resolver: ad2s1210: implement fault
events"). Strictly speaking, it should probably be a type: threshold,
direction: either event on both the sine and cosine input channels
(another double event) since it occurs if either of the signal exceeds
the power or ground rail voltage. But we already have threshold rising
and threshold falling on these channels with a different meaning. I
guess it could call it magnitude instead of a threshold?
