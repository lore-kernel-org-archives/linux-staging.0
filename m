Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2323A4
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 09:21:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b24so9661388edu.10
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wt+VIlBR4vfAR9VsDl1LN/6dIaP3ecpaOK7dqrqDVsA=;
        b=frXtCBX84ZOpbI+yX9gdu3zuxc3Q8B7Axk36QmI6gBXsfdfxfwU/42ulIK+DMpsftw
         he06S7C6b42aezaxfJ/P+ShxvvWeR/6+MeiE1c7hgu9I852zcH3yNX9h3RBE8NswTA8p
         Rf+0Q2iV6aCqA8RIzWMYnKvp2VH+Bno6TQozqHsZs04dSQfAjargHu0L4H7SYEe+Sw8k
         ZUwzFKcYPabbjitCvv3DObgRYRXQB0oIsFr3p2IPyoo5sK96kImyWbobxA+D2T+RTOlb
         GvhcsKvhR5PVRkFCEODN+9oaD7mos+688dPMnWD2Q4P6gIYyeZavA/vBT8pPZkeIX43z
         DL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wt+VIlBR4vfAR9VsDl1LN/6dIaP3ecpaOK7dqrqDVsA=;
        b=IEvkDKoNz8zFreM0KzWcPlyQ+qyqGMhuj5y04LZXOFQHzQwO0S97+5OuY6hQgYAu4r
         WP1CONFjcysO8JcMb+hZCN44UxNzG12VJhO5A5RC0OHujJsc+xB4M2nfYByvQVe1G1fg
         UMOcv22Z5xmAKiYVbIlIIbmRyXJ3YjDvkWSSVOXa/KZYhAVNeRfCnYHIPknqmAWHVyPt
         WphFkFm7/uXYEGUnXqaI/lhRTYnQilAXcud+5dIGcwU8EHlZQod6gG6OXxa4Q10Ud3Ez
         NHjx/aFJZJqdqIyGHM/O45Z2VpVQ1q2IFMO0ANwlKTjXWHl4fbnALERW3VJFDu2a6m/J
         r16A==
X-Gm-Message-State: AOAM531SOfDJDasKxI8Ld2BQfKjXL7R+eWNdDeK9Tf71PKHgd2SF4hT4
	2sL8ZVlqpFL9qWNcfqbFoO0=
X-Google-Smtp-Source: ABdhPJz6xCx0r0yJZR9kIoAYflbzcSCWB675ihSQU6o2CsLcCZvTqv49GM/q9Nbauv8U2/taBKazVQ==
X-Received: by 2002:a05:6402:484:b0:415:d931:cb2f with SMTP id k4-20020a056402048400b00415d931cb2fmr3798196edv.287.1650619285745;
        Fri, 22 Apr 2022 02:21:25 -0700 (PDT)
Received: from leap.localnet (host-79-50-86-254.retail.telecomitalia.it. [79.50.86.254])
        by smtp.gmail.com with ESMTPSA id l17-20020a056402231100b0041d98ed7ad8sm663743eda.46.2022.04.22.02.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 02:21:24 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho <mchehab@kernel.org>
Cc: Vihas Makwana <makvihas@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>, Hans De Goede <hdegoede@redhat.com>, ira.weiny@intel.com
Subject: Re: [PATCH v2 0/7] drop some unnecessary wrappers
Date: Fri, 22 Apr 2022 11:21:21 +0200
Message-ID: <2181149.iZASKD2KPV@leap>
In-Reply-To: <YmJGzwA0kD+lFtfN@kroah.com>
References: <20220411102136.14937-1-makvihas@gmail.com> <CAH1kMwT0gyQNB1-j62-2ntJD9Lobsmr8-5h6n6-SJ44wykMyHQ@mail.gmail.com> <YmJGzwA0kD+lFtfN@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On venerd=C3=AC 22 aprile 2022 08:10:23 CEST Greg Kroah-Hartman wrote:
> On Fri, Apr 22, 2022 at 12:26:21AM +0530, Vihas Makwana wrote:
> > Did this patch series get lost?
>=20
> What series?  (hint, do not top post).
>=20
> My queue of staging patches was empty as of a few days ago (it's filled
> up since then), so if they were not applied, please resend.

Are you also talking about re-sending patches for media/atomisp? I=20
submitted three patches for that driver between April 8-12. They have=20
already been reviewed and tested by Ira Weiny and Hans de Goede.

However, if I remember correctly, they should take a different path and it=
=20
should be up to Mauro C. Chehab to apply them. Do you want them to be sent=
=20
again?

Thanks,

=46abio M. De Francesco



