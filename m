Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C0CBA2F
	for <linux-staging@lists.linux.dev>; Thu,  1 Jun 2023 16:05:30 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6261cb1208eso13340496d6.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Jun 2023 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685635530; x=1688227530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LusgW7kRLas1PCqAL/j4Ugd2jlhleJjtTI8FOrNEWo4=;
        b=o7OVNDCyxCG0LZr5motkiiKFmhEN6a5DLpPeZTWvZhpMHv5U1DZGD4R1eENNJ2ZCEi
         sSWtac0w1g402wxRaFWvCYTYAs5zVj35OVFIArAlhpLQXGJpTJxx4DqdT/VwTeDChzj8
         00kEj3qG2qn2zSoCRLKDJaDZyNNIqjPqd9Un2gXd9NucBBdRjASUzXmFIN91EYF43yHE
         TvqlBLma1pAVm3i5XHcd1MFGhb1Jr8EjVLO0cxgoaidEZlK8DLJWqBVeHlDE4Gqp9gJ5
         0EDAxhxPtmRlE1aZ7xz8GYdI5h6eZcV2HU7nVWDCfMcaYFe/Uw5c2Yxs6d4idz/F/NTX
         T7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685635530; x=1688227530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LusgW7kRLas1PCqAL/j4Ugd2jlhleJjtTI8FOrNEWo4=;
        b=Bc75wla3OVjeDsk5F2DQI6mzjs7P+CHyBSWyXJ1OumbkeVNJ5Fvy2vKkvy6bft7C5o
         Ew0h6frcBssDeGn09zf1NpUQ0QNGgb74kNqm6K0JtOdtyC0gpUgtLi+EEVzi3cLr70xI
         u6P7oEmnZwzLA51mhNthSJSLDOks9kaxx1ja3yIy6ZsPJ0pBj3xLYniv9B4vBfkss9nC
         qWL2iI/Gx5svzydKgXXnMkFrF4fsuELIjaCU3k+h6jTA38tkP1/iCSZIn2Oj4useqJ0m
         H2Odao0d4ElHqIMlOAqHY5IO/yS/69lw9vOFSO7YWRdQDbMf2q/G+uE/CGasvs0buODK
         d2fQ==
X-Gm-Message-State: AC+VfDxSeyKBAf76qCdWwwqMayJ/n+qq/4QE7LTlNqwkar60ne5C0Axk
	pDBJrfFjeefS8RcdwdCLW9PZCOU7CUr+g3joS3fxTZdakgKpog==
X-Google-Smtp-Source: ACHHUZ7VAX2Wc7kYACLhqmb+hfWGE24VYBEGVucB04TT6s8Hz9Xi6qZonInXoiaIxjLRNf9H9NdVgUzP9tu33S28oK8=
X-Received: by 2002:ad4:5de1:0:b0:619:27af:bc58 with SMTP id
 jn1-20020ad45de1000000b0061927afbc58mr2105608qvb.18.1685635529762; Thu, 01
 Jun 2023 09:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230601145858.59652-1-hdegoede@redhat.com>
In-Reply-To: <20230601145858.59652-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Jun 2023 19:04:53 +0300
Message-ID: <CAHp75VfFB6CJ9aRtYd--kON8RwC9YmUrc3+Lbyzkj8RmA_g1KQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: atomisp: Selection API support bugfixes
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 5:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi All,
>
> Here is a set of bugfixes for the recently added Selection API support.

All three LGTM
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Regards,
>
> Hans
>
>
> Hans de Goede (3):
>   media: atomisp: Take minimum padding requirement on BYT/ISP2400 into
>     account
>   media: atomisp: Make atomisp_enum_framesizes_crop() check resolution
>     fits with padding
>   media: atomisp: Fix binning check in atomisp_set_crop()
>
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 42 ++++++++++++++++---
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |  4 ++
>  .../media/atomisp/pci/atomisp_common.h        |  4 ++
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 18 +++++---
>  4 files changed, 58 insertions(+), 10 deletions(-)
>
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
