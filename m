Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB353A8
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 16:19:37 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-75773a7bd66so240306185a.1
        for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 09:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684426777; x=1687018777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZaRz77dvY95rGot7hMFCJ+qXEhqHS4MvLeBRxNQltM=;
        b=cXv7tNOBBtnVe4PxkM83gtyTa5Bl6w+S2QY5i4qpvqJlW3gyGcfEfVkUZhaKY3inRx
         uMZe2tR9CXblrVDb6ZwD8Hibl4NxK8nkpAmDKXDbYRjXH3+z5eHs2pEi/gFzE+RmLAtM
         9CKuah+4a9hBqRzgS6dgELsQOdYmYX/Vj6Dt6H66qhvz4Xw3B58lsqbtrhv3aC75etNE
         BFo8skAjLqKEjZfHPpFiQL4dC7EWtfg7N8FA0FBzlOYOCiovSrAcT6F+8d1f/iadT93c
         ovKGHIBINVwpFbFz1IB5p2C1B8T5zUJRrI35eoBgflYVzQVIytlpoYOCrxzMy/p1uFE6
         AoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426777; x=1687018777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZaRz77dvY95rGot7hMFCJ+qXEhqHS4MvLeBRxNQltM=;
        b=lWQAt/pbX7r1xSLdcZkvOlB/dNsKu1FhfU4xC9sOsblgWHmxHa/KBGnaA0Cn9ggpId
         AuMM0/msD93d0Z3mF8slC3gJmZzNiGkcCFDXC8JSZgQl2FxG+fiLJk+/WbNBEzDTQCp8
         HMRvApxBaFff35jMskeXQ6MKnLiZFhAsrU3U2lvspaqyJt0b+uzpt/xPLDxhKw3HXGG+
         nwYOx5xPCE9OOcHxOkgUnh9mRZiSixs7PPCo2KD95tnCUnJ5b7phlhLHEtx2n1grgekb
         y7AclAuml/InKuQPMdDnm+zj3qwtdxb5qinjghtp23E7k4bdmkP9ETSJCltQYkpNDwAc
         0usw==
X-Gm-Message-State: AC+VfDwi55OznmE8tjyB4hWvv8w6J3VICP5uHpaOWhoFJrIrzlBL62DC
	AWkJwcSTLTebRn5X2vwvGntb2gxwMmmMmzLT1GPCrghMnprdCw==
X-Google-Smtp-Source: ACHHUZ4AYxDRHsciZTPlwf74kFsjRiLQ3gDlvTLf73gqe8hzqmgJGmKGD4iFKyJM2Ad4e1sV4grVhNW9LH+IfRCN1oc=
X-Received: by 2002:a05:6214:d69:b0:621:2ad5:df74 with SMTP id
 9-20020a0562140d6900b006212ad5df74mr100687qvs.51.1684426776750; Thu, 18 May
 2023 09:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518153733.195306-1-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 18 May 2023 19:19:00 +0300
Message-ID: <CAHp75VfLyCG9AX6PhZBUMnxYCDKdnVQzOxtXO+uKgok-PREY0A@mail.gmail.com>
Subject: Re: [PATCH 0/9] media: atomisp: Add support for v4l2-async sensor registration
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 6:37=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> I'm quite happy to present this patch series which makes it possible
> to use v4l2-async sensor registration together with the atomisp code :)
>
> This has been tested with both the gc0310 and the ov2680 sensor drivers.
>
> For now it also is still possible to use the old atomisp_gmin_platform
> based sensor drivers. This is mainly intended for testing while moving
> other sensor drivers over to runtime-pm + v4l2-async.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for non-commented ones or in case you resolve remarks my way.

Definitely this does not apply to patch 9/9 which is WIP and requires
more review, I'm still planning to go through it (not done yet).

--=20
With Best Regards,
Andy Shevchenko
