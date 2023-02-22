Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5A1FB5
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 08:02:22 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id h16so27064097edz.10
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 00:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkBz8xtUcsBFti4NW0wUs7te3xGjoS+Aw/KAsmCJ7/U=;
        b=MtyB+AwDLBdx3hrWfMn72VuqABmErzodmuE1i59W7Hi0sCCtatLSn2V72gLtfFWuFZ
         Ck5bK8u5m3j5hVQb2vYZuoQnMwjQjDe+wkFGGGd2g5xq9tzFN1PgFQ1LohiPQNAOCtA3
         RGe03Y9ZkxGsnvcHBbKKA2s1MuvllsWVAWOB2XmcFjR+uJ3YKs/hOJhbFj3hvY7xMhPh
         tE6IIcOVl1jpvw3mVRBXc35nVN/N3PHS8ijqgnH8JHO2TrcBY0eKddLAEaOQJxNuR109
         JNFIvJLFfr+qenqBUShCSHs58EE0rWrkVN2ZlfS+WzxwoT+AhKeAY8xWDLtxps/6pQIc
         g/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkBz8xtUcsBFti4NW0wUs7te3xGjoS+Aw/KAsmCJ7/U=;
        b=Xuz7Mh+fezUkSt7CBFEOCcXmyE/7Tl8SAWZ8Vn+u0A8b+QS4+Mf9T+6a9Ql6CAzpyc
         M2H7T1V92m2nNoChYSPQFU+5X0SfvZmkSOkftkdE/InHdSGWT6EwhJwLXtc8r6Kz+VzA
         fE/67XT8gfZ9LAz82mUiWu5EEJ64YeYm/9Nr3DDVCU7rnMQB3ya5DqadeioqlRz+TTMC
         bhzUJ92YHPDGw5+3qUKDVav9Lh0khZwQTHFrZBbJ6Z219JAtDEgYI/psCA4xF7iGjeEb
         GR8iW2U2EKsTZ0aiT9BTkJ59AbYdwmhnpRNyMR1borpoQmVUf2iHNavE9bBthsmcqudz
         J+9g==
X-Gm-Message-State: AO0yUKXKsyh2iZ14MZkbfxMYzf52oMDls+7DLoAt6h9KQfiuqe0f+UgR
	kSR8QrpLliMeicy4hhiddggPojtP8zvJwaa7/mw=
X-Google-Smtp-Source: AK7set+OD7llSTDXwShjal7nbjqlkhW7eI4nbra80LETlZs6z3mfM3l2ArA/FXd6lVClZCtzfeiiDMO4Tr8r58qn+Z4=
X-Received: by 2002:a17:906:5e5a:b0:877:747c:9745 with SMTP id
 b26-20020a1709065e5a00b00877747c9745mr7240950eju.8.1677052940625; Wed, 22 Feb
 2023 00:02:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com> <20230221183211.21964-8-clamor95@gmail.com>
 <Y/VFMl5Darm7YEK1@sirena.org.uk>
In-Reply-To: <Y/VFMl5Darm7YEK1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 10:02:09 +0200
Message-ID: <CAPVz0n072v3XVt-Ogcx1QwBfEfOG4O7e8Ge9f3rpWOqU=44Qkw@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] ARM: tegra: transformers: update bindings of
 sound graph
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

=D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:27 Mark Brown <=
broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:08PM +0200, Svyatoslav Ryhel wrote:
> > - fix headset detection in common device tree;
>
> At least this should probably be split out as a separate change
> so it can be backported as a fix.

It should not be backported anywhere.

> > - diverge control and detect elements for mic;
> > - use GPIO mic detection on wm8903 devices;
