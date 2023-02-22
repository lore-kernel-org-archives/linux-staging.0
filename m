Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127801FB5
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 08:14:14 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id ee7so11900503edb.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 00:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj/6AyELfHI0tKgaBGNk0fyFVeR5csP7/YL61ZGE4Xk=;
        b=eyrVUqnER8VYc2JyypJRTTLZWi2RuVoKQT8Xm298bWSpuBvRedvo6MZEcHXbdwUJdD
         FP94ARAJ4ey3XJTfTaXLkh8GTSxTzplteXVI6Xt8JmkeEtqo/8BLFl77N/WA7QX5P5wF
         FmXN6+J0VeqrYXjgwL7DsIf1jXDwluv2alBbRanVpC7TDD4KHhlPy0WZCGtl2BXNrMmY
         DIyqE7xqBqsjACJfjzzmMRXX5Zl/ID+U+olV3MwR91v+7TMOFTcq8V791ZEzfPTmn0QC
         f8kKfXcHcdwlkUoVe4sjjYh6b5HZ9xbCbn/aGfpiZv8cz1eKOD1lPfl2q4lYfmix7q+I
         G5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xj/6AyELfHI0tKgaBGNk0fyFVeR5csP7/YL61ZGE4Xk=;
        b=gDZDgnGN5lu8eHpWcVSCMN1qKdKw441zq0IEcYGuy4ONDXPn7dwOVqFCH/8cVVYxEl
         Cv7EGbkrojX/mmfkI2f+0q315tsD+hONxDB17fkuouaaoNIsX9Tq/u749X3AYo505neb
         z0qUDvtwkFIj8GDeHI0M5zEd9rhRiFjYlKOBSkqZr1NcOw9oJ+wixPls5BiKutoYoLCy
         o5Fze5e2ehk4nCwpVk8/zCDWfbcWTYfzMMGwJvIC2G+KFYl9rIs3AwTkF8PJ9WT9U6ZW
         ovy8aoKvjaXqXyRpP2POvB1wpSPxZU57dAtoxZ1RqdVp7u9fw+sadDKof6LDygujUfmG
         eI+w==
X-Gm-Message-State: AO0yUKUL0cZg1rIcsHlb2qxoeWWniyh04FjPpObrx/vTOf/fcQPePBhJ
	1BOfP3pUFRyabwDwE+A9tO1k8yzsCtcA8V1Bqy0=
X-Google-Smtp-Source: AK7set+vh8ZSYnSuxrULngtfrZiKENvscmdFhJ7qS/OrAXSltDPmE4QBQ5fNy+vQLDfu9owooRq4qarjYjxuDzJnk08=
X-Received: by 2002:a50:9fa8:0:b0:4ac:b8aa:3ffc with SMTP id
 c37-20020a509fa8000000b004acb8aa3ffcmr3264891edf.4.1677053653220; Wed, 22 Feb
 2023 00:14:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com> <20230221183211.21964-10-clamor95@gmail.com>
 <Y/VIpVwFu5gUUcsz@sirena.org.uk>
In-Reply-To: <Y/VIpVwFu5gUUcsz@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 10:14:02 +0200
Message-ID: <CAPVz0n34MMs-AeHfuxpC3dL=0MKSqrSn3zgrCHbjozR183CWnA@mail.gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE DSP
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>, 
	Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:41 Mark Brown <=
broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> > FM34NE is digital sound processing chip used for active
> > noise suppression mainly on ASUS Transformers.
>
> This looks like it should be fairly straightforward to support
> within ASoC without too much work, and since it's in the audio
> path it should probably be referenced from the sound card it'll
> end up having an ABI impact on the card.  Take a look at wm9090

wm9090 is a sound codec, like rt5631 or wm8903 while fm34 is NOT a
sound codec. It is sound processing device which must be active only
when DMIC is used. In all other cases it has to be bypassed. At the same ti=
me,
it has to be set up because else there will be no sound on the actual devic=
e.
In the current state the driver sets up DSP and sets in constant bypass mod=
e.

> for a moderately complex example of an analogue only device
> (which this appears to be in terms of system integration).
