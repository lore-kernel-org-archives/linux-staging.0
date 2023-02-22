Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750981FB5
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 07:53:41 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id i34so1504837eda.7
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 23:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s85ej20o57EVIAZFbWgvrgnN0SkPXWj9xUiifHsTHZg=;
        b=AFb76RWl0qx095lTG9TFJYrGSOSHsEId33Ft2ZTbU4DUX7kfqyIOv+8xnezBuHPYa1
         yCDyIMnOZridhY9SjLWjr1yuNZYnjaiDKIytq7JCdL+N8e506wpoMBmPQ+Nx2YMRsLCu
         RRtl75WuqhpLkXGr0F0kndHrxQhk2RMlFm7xAokmbPGAm3S9VcVvTGXs8s0X7W6B3quc
         iBAczBLHfa2OGqN+whJaqLMPDVyvjY+Rz82MsXi7wcio17ZKeVdqIP/uP8fX/9ulnnZo
         UmNtML76sovEkZBCTsHM6GkdL1/9B01pBEx4vUno8bi3hdeCaOdoTyfq6hkTa34gmft4
         03oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s85ej20o57EVIAZFbWgvrgnN0SkPXWj9xUiifHsTHZg=;
        b=ESh/fQ3qt2a4B4pJx3FEKR8/nxkHRxEWrRRb8YPVzNJHnGIDftgz2fHmhkryVO6O9W
         pTqT3IviSyZ+1Hgl9j/+OIfbBqqlS+z1iPrH/T30QnNuvXvw+WBbnjr51M+g+rkiEaiY
         2nGbRbsQeve0ZsCi7iSoCNv+2hBT8aLZR4e0lN0kMjqQyMqA5dDqAlukKK57AXPntEyp
         5WAXbsBGY869Ndd+YsuuFsYFI6Ca6lCPi+8keXUsoKzpX5vB/rZNTYRbJxT/ZPsFqhpu
         GFSdu8aZhP24I+CCL8HwldQRsj3wqCaRYfo9qjwFtDuIWe2DpEtOc2egsyY17Wyk1KwF
         SvaQ==
X-Gm-Message-State: AO0yUKW/eE5S/1gQ7xakx+jHR1x0+rMngub79ptfQCAPvFL/4ulPdum+
	FSVv1Q0KxzShWxo8zFex7YdI8RAYo8n4r0pwJiM=
X-Google-Smtp-Source: AK7set+0c5IFVbo5S3RjC5aOGFuL8Zs9WlbR6blsKJepl2XbT7Oc5hgv5WTV0x4z8gzWNJGZhNesPqm9d1b5s6s1HSQ=
X-Received: by 2002:a17:907:6025:b0:877:7480:c568 with SMTP id
 fs37-20020a170907602500b008777480c568mr6954732ejc.8.1677052419551; Tue, 21
 Feb 2023 23:53:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com> <20230221183211.21964-3-clamor95@gmail.com>
 <Y/VA3HK/jGVPbrqb@sirena.org.uk>
In-Reply-To: <Y/VA3HK/jGVPbrqb@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 09:53:28 +0200
Message-ID: <CAPVz0n2cHvKfez6=ydR8HQfAfM_bipmAzav76Gxmp6pF4wLuhw@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] sound: soc: jack: allow multiple interrupt per gpio
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

=D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:08 Mark Brown <=
broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:03PM +0200, Svyatoslav Ryhel wrote:
> > This feature is required for coupled hp-mic quirk used
> > by some Nvidia Tegra 3 based devices work properly.
>
> Please submit this separately, there's no meaningful dependency
> on the rest of the series.

RT5631 by machine driver commit contains a coupled hp-mic quirk which
requires this commit to work properly. In v2 RT5631 machine driver bringup
and coupled hp-mic quirk may be split into separate commits.

> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
