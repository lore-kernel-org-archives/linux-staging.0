Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461E17E;
	Mon, 25 Apr 2022 18:29:08 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id r13so31321446ejd.5;
        Mon, 25 Apr 2022 11:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cnGqac5cphPPsi4AaO7yleP8x5MKmYW3cYfiBMddgYY=;
        b=R6ssH73p6eSp/7J85Re0lJY2ynrIY41nEURYuXkx75RXn+j17ioAZ/UeNGD4Cdk/rB
         VOWVBJdMReO623a+2NkqP8SJrDLmKMdxj9aDUz+aN5HQSSU2mBV/NoD8uXIpE3N3hJ8K
         a/aZtBGnMJtyoVltYqihHwkoC4Ikv6TpZzCL3Gh6hAzuhrzAiAnmHqN/4HlyX0RNR5cy
         pXYg64B3mX2SKNm5/1SKPJCNnOgkGXk7+xNnQfPOu1JD6e6yCRfZ8IOROkhQHKPFZ5iL
         SJz/8jWbFKFwNyV/4qyHv06/UBn9hhkTDubgVgX8Hl+rMlEClYfHytzuEaPUqsXssLr0
         nijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cnGqac5cphPPsi4AaO7yleP8x5MKmYW3cYfiBMddgYY=;
        b=M/JfyhcVeslDfmW6RpM5y/wCs9TThqI97cGpFbN2vh1z3OpEw3pjXBJ3W7+nf/++Qi
         PqsryB6nRbLhUkJfTRq1bgiLxMJiH5UG7XKh+k0EQcYi2N1cGcgBJM9jwH+GZMlAcnzi
         0SqN7JPqLk+ybmP8dLCfMscZmBg2yJkKBsu6FdK8DNzNr9m0NnchpkxrhUmyYyAkOpby
         oicQ8h5W9wOioecPT+DwrrcxJAlxR6CSqw9K4jeUVa5IH01TStAFODNYkZEEApuxEtx0
         Io7q9okeoVmA0YXN5RBbivVnWVChtzmRicnB65dejWTe/U4HDXuKoGQgyOXHNAC8RJsS
         6z8Q==
X-Gm-Message-State: AOAM533AWAFn63jj42c/9QA3YVUXC0mhhZOQLhFM8l116FeHMQhq6DVL
	hiJ0jJ7j0ZcmZixv/g/XLgg=
X-Google-Smtp-Source: ABdhPJyxKYOtD1tDbGljJy2g+SFIK6ZxkIi3uWh1VZe8ukKU5XkDM9/cASplidcAlVSpbjPBnElzlw==
X-Received: by 2002:a17:907:8b13:b0:6f3:9216:b73e with SMTP id sz19-20020a1709078b1300b006f39216b73emr7129028ejc.188.1650911346630;
        Mon, 25 Apr 2022 11:29:06 -0700 (PDT)
Received: from leap.localnet (host-79-50-86-254.retail.telecomitalia.it. [79.50.86.254])
        by smtp.gmail.com with ESMTPSA id o18-20020a1709064f9200b006e7f229b332sm3832867eju.36.2022.04.25.11.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 11:29:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tsuchiya Yuto <kitakar@gmail.com>, Martiros Shakhzadyan <vrzh@vrzh.net>, Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_store()
Date: Mon, 25 Apr 2022 20:29:03 +0200
Message-ID: <2181693.iZASKD2KPV@leap>
In-Reply-To: <20220413225531.9425-1-fmdefrancesco@gmail.com>
References: <20220413225531.9425-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On gioved=C3=AC 14 aprile 2022 00:55:31 CEST Fabio M. De Francesco wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page()
> where it is feasible. The same is true for kmap_atomic().
>=20
> In file pci/hmm/hmm.c, function hmm_store() test if we are in atomic
> context and, if so, it calls kmap_atomic(), if not, it calls kmap().
>=20
> First of all, in_atomic() shouldn't be used in drivers. This macro
> cannot always detect atomic context; in particular, it cannot know
> about held spinlocks in non-preemptible kernels.
>=20
> Notwithstanding what it is said above, this code doesn't need to care
> whether or not it is executing in atomic context. It can simply use
> kmap_local_page() / kunmap_local() that can instead do the mapping /
> unmapping regardless of the context.
>=20
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible. Therefore, hmm_store()() is a function where the use
> of kmap_local_page() in place of both kmap() and kmap_atomic() is
> correctly suited.
>=20
> Convert the calls of kmap() / kunmap() and kmap_atomic() /
> kunmap_atomic() to kmap_local_page() / kunmap_local() and drop the
> unnecessary tests which test if the code is in atomic context.
>=20
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)

Hi Mauro,

I'm writing for just a gentle ping for this and two other staging/atomisp/=
=20
patches that still seem to be waiting to be applied.

In the meantime I would like to remind you that Hans de Goede has=20
successfully tested this patch and the other two on both the front and back=
=20
cams of a chuwi hi8 tablet.

Please let me know if there is anything else that is required to be done in=
=20
order to accept the three patches.

Thanks,

=46abio M. De Francesco


