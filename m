Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B17C
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 21:59:42 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6262be06e2eso3525576d6.1
        for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685397582; x=1687989582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hsuoe+SQIaTSqFX1NxZhhcfILFgCTHVwV0rqKDeLYhU=;
        b=D92r0pM882g1NfDSgJzRyk0+YeHdwxhFSG1dfPZILx43AatHb8P+RvUo/Nb0Tf8N0B
         psydOlEaXktW8MkkbmjlGa/WXGGITUtn96xvO3AO3FtMpS9uioN/nFZclFHBTwqOdR3I
         P+//OfoCT+g7b4VZEdwZnxdj7BFV//BD/Nv0p4jsYO6RnrDEZhZ67lC5FCjlCJ5oABp5
         iZLjPcZIsReY9zUp2A2SlRuqBQdCyTHfKtCNGdzthHKYXOiOt9dhKBlLyxP/VCgei6GR
         SbmOQPI2mrz+ESs4ncXJw9W4Cz9vuS1VGlLj0BDNKf5S0eTq4zPFKXYGUP+cBCt/0ktY
         BVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685397582; x=1687989582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hsuoe+SQIaTSqFX1NxZhhcfILFgCTHVwV0rqKDeLYhU=;
        b=ZhoSA/ab/sxBkyiIq7kXSYEnob17EV8FK2H/m8HA6BS44GIndHMIs1NO0Noukyb4uk
         qcH1ogYwHfCbw5mWLWQdP94ElW0OPcfb0IgotDrj8XHxCZ7z/uC+72q3TXi0BP4gLq6i
         yEyCQYoKHr1hCra5wCo8zK0CaqvBse7kc4WMOHUxm5fTr7zjbLQS7rFulVgAtTg6t0lW
         T3HkWpBH55K6iyGciy6WxAVxKHW/6Yl1UR/nsWFMpgnewkpM7ft3jBvseGlR50F2wIVc
         /tWkxzdaqVXSi3DrbSx5H2jhv8+pslJV9ZkUlrb8uCQlq7RsuVwpL0NT6ICY8MDHb+CZ
         iQkg==
X-Gm-Message-State: AC+VfDyAE93PPBKeZ8Vezgrx7CoVrAtYo/ToGPBzFEELQZEWcs86tgjL
	NMPAjDLrcomaEmVPhbQ5yaJzF/JQ2FaKZfzpgRY=
X-Google-Smtp-Source: ACHHUZ7/MU7Y/VrItToYTFpupHk2WsCc4mP2J8dKH0d9v3IY4MnOkVijFOqsOD57tA9QV7SK4hFpuqKx0nCBfiDWjKw=
X-Received: by 2002:ad4:5b8c:0:b0:626:199e:1b96 with SMTP id
 12-20020ad45b8c000000b00626199e1b96mr7529497qvp.64.1685397581895; Mon, 29 May
 2023 14:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 May 2023 00:59:05 +0300
Message-ID: <CAHp75VfDvoq8+WiO6Pwm40roeS7pNJq1ae04b3qp0C5rL6Hrmw@mail.gmail.com>
Subject: Re: [PATCH 00/21] media: atomisp: Use selection API info to determine
 sensor padding
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> Here is my next round of atomisp work.
>
> The atomisp wants some extra padding for processing in the data it receiv=
es
> from the sensor. E.g. For 1600x1200 it wants to receive 1616x1216 from
> the sensor. Currently the private sensor driver copies it uses give it
> e.g. 1616x1216 and the ISP2 code then substracts 16 before reporting
> the resolution to userspace.
>
> This patch series adds support for the v4l2 selections API and specifical=
ly
> the crop target so that atomisp can request the extra padding from standa=
rd
> v4l2 sensor drivers. This is implemented / tested with the atomisp_ov2680
> driver.
>
> Besides that there is the usual cleanups / prep work.
>
> With the padding solved, the last bit of private atomisp sensor API is
> gone now. So we can start working on getting rid of its private sensor
> driver copies.
>
> As mentioned in the updated TODO file the next step is to port
> various improvements from the atomisp_ov2680 private sensor driver
> to the generic ov2680 sensor driver (such as the selections support)
> and then switch to the generic ov2680 sensor driver.

For non-commented
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

If others will be addressed in the suggested way, feel free to add the
tag as well.

--=20
With Best Regards,
Andy Shevchenko
