Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA951CF83
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 16:58:30 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-533e7d127d4so18346819a12.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696265908; x=1696870708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=facSmfJsGsAsq+rykZ/KF/cMYvD2lkq973HpFZImYKI=;
        b=fh8gK/XdbNl6sfXw5sStN42gm+hqc1wsWoOray8IqdihCROUpxxZnLDiopy1MuPLlI
         yvtv9DpC2xMf6LDrtfm6ORy7Nx28LQyheMYzQeTTS0HozjDlocThguEkUu+u7BKW7/B/
         RPaqNBJZFN+Ei74ZK2zeM1SEDeVHzWe1IdTmbxJfQZ5WHnI82Izs0P78e4CAWDCg+/Je
         qd9wdtc8rz2wtd7XWpTkpNMjKcrcD1N0gDcxRwUvQ4ajdgYLf7eREECLRGZLTBWArsc6
         o7AJVSrNnuaaXsKYIPNLeMQzz2+aBiEcYPcYyCsVMrLAJNhRUPFivxk6DP0t5ElQivfa
         JQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696265908; x=1696870708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=facSmfJsGsAsq+rykZ/KF/cMYvD2lkq973HpFZImYKI=;
        b=m+VkO7H94sL2odwjLgo8fc0vi9GeacUEisFYfzaGD21jAQEsgQBhSJVLxmI5JQK/sx
         9GziEfS4JjmIDO0a90lMVr90ckITXbuTAXpQMWuzA4F5VAVCHg1I/2ZHHnGQDVVPNy+P
         VmlkUuKHou4O32TK9mpVpYwXMvOYcidZvvg82nZQWOI2bDcBqhco3FoHAe4pWMVTl8MV
         6wo2Vqrkzbq0CjZIKb/FmFjLZObLaHL1AW7bKoRdGwqyHOXD9GomUf/ftjRheAM2KaJb
         OjTd1h8qm9uOhv6w/8Uda4DmcJNvi7mIenj9s69nGJlP/V0hP1Wzf3zHNAmXg++u9OtC
         Ze2A==
X-Gm-Message-State: AOJu0Yy+sWEvqLELlX9rbs5vrbdYK/I2NnXPGjC3/D/DmHbTW6Gbx6JK
	m8XGQUzTfbHnSweThjTNdWlbHicbx4Aln5U42EK82jDlX9Kf3/J+9eoHFw==
X-Google-Smtp-Source: AGHT+IH4U4UmWWwFkhVQ7XVkg+noGoXE0O3GqEQDJBMnj8iiX0hl1ZLoZEEsrGijkmhrJ48540hsp97CzdT/OLdFAOY=
X-Received: by 2002:aa7:cf92:0:b0:533:795d:8c48 with SMTP id
 z18-20020aa7cf92000000b00533795d8c48mr10931884edx.10.1696265908624; Mon, 02
 Oct 2023 09:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
 <20230929-ad2s1210-mainline-v3-26-fa4364281745@baylibre.com> <20230930170046.36637e9c@jic23-huawei>
In-Reply-To: <20230930170046.36637e9c@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 2 Oct 2023 11:58:17 -0500
Message-ID: <CAMknhBH4+cUSX_j3-Y0xuTEiZHd3Ke4Zm8FdxLZJwn5gr_d-ug@mail.gmail.com>
Subject: Re: [PATCH v3 26/27] staging: iio: resolver: ad2s1210: implement
 fault events
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

On Sat, Sep 30, 2023 at 11:00=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Fri, 29 Sep 2023 12:23:31 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > From: David Lechner <david@lechnology.com>
> >
> > From: David Lechner <dlechner@baylibre.com>
> >
> > When reading the position and velocity on the AD2S1210, there is also a
> > 3rd byte following the two data bytes that contains the fault flag bits=
.
> > This patch adds support for reading this byte and generating events whe=
n
> > faults occur.
> >
> > The faults are mapped to various channels and event types in order to
> > have a unique event for each fault.
> >
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
>
> Use of x and y modifiers is a little odd.  What was your reasoning?
> Was it just that there was a X_OR_Y modifier?  If so, don't use that!
> It seemed like a good idea at the time, but it's not nice to deal with
> and requires a channel with that modifier to hang the controls off
> + make sure userspace expects that event code.


Regarding the point about "requires a channel with that modifier to
hang the controls off...". Although that comment was about modifiers,
does it also apply in general.

There are several fault events that don't have any configurable
parameters, namely _sine/cosine inputs clipping_ and _velocity exceeds
max tracking rate_. So there won't be any attributes that contain the
event specification for those (e.g. no `events/in_angl0_*`
attributes). It sounds like this would be a problem as well?

Should we consider a IIO_EV_INFO_LABEL so that we can have some sort
of attribute (namely `events/<dir>_<channel spec>_label`) so that
userspace can enumerate expected events for non-configurable events?
