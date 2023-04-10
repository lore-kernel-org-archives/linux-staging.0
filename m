Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E58D28FC
	for <linux-staging@lists.linux.dev>; Mon, 10 Apr 2023 09:39:56 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id gb12so3757301qtb.6
        for <linux-staging@lists.linux.dev>; Mon, 10 Apr 2023 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681119595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I6hXg7RWCwulMV0yHvWMgd43aePZg6bbcgwgcjMizk=;
        b=WgPTe4BZo/hCISDLBprIVQ8b/PDKqWkcYUjUUSIswUbyPNQ8ieiQ1hcI55FiahVyr2
         +5UH3Lf+xngimCbbm//VUIVJxeE/TdhVv2eIUfGapWrSayJmo/oz1ObXCgXpEsaTgOFc
         Wuh7G2ipdNTL4+JjYdLlSchgop3uNWtN/LN+9vo1jETgSKcYiL+0fZ9LcetWwCBxgJnL
         ATPb+Rd7UnS3w+Lu11t42vbRi9+dA03lzMBaPYrWB8skMMl5BnB4Y97Tl+iuhtt6AGxy
         rCTqU7eHFc7Tr/eSjVIQiA1SdA87hf1fx2MxVbaeOQu1PPgp7xVmEAS0FACJc9z5lSuH
         zqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681119595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6I6hXg7RWCwulMV0yHvWMgd43aePZg6bbcgwgcjMizk=;
        b=JBj5EhB0pHqzFmcp4NAieJLmHon3ZK8+4+Nr9zakMiaXXvTtE4mMnddGiIMp3uDORS
         Dz3RsJh8zDUVeN19UG10JR6CDIKDWR3qyyEtR7/ALJ7Cr46LTwGuIAjkWWPDG80XulHP
         C7JOEYSBH6f+sEveCzUGpHouFGN4i2SM1Uqg4dT5ZsgsjdTw09PA06a4irNXnumiI7TZ
         7zMIECAaEhfVLUVniQq70eAshr7IhdZyk6urVjp9IouF4lEQDkzcdeBERQV7z01E4HaE
         JbePjUtzFTwWXWG7Oj8gx381g3jNXuTdMaO9c0b849vWmWSq3gYyVrR0sbzYcq87KxhS
         d1HQ==
X-Gm-Message-State: AAQBX9clr+rRupRjhGHBr7foq0MCB1GoGSweqcBf2PEmMfjF7Tv8in4M
	nww2YoSsJbiyfu7RuuQfLGY1SaB/Hq4k/SUXHtk=
X-Google-Smtp-Source: AKy350YctdRl3MORz6dRiJYAJzeuWY+WjYBvQ0nv5cKhv8ZDzQiRymyUIGdkPOBQjqHdDa3T2QYBAegNny5nkFKTBG4=
X-Received: by 2002:a05:622a:152:b0:3de:d15a:847f with SMTP id
 v18-20020a05622a015200b003ded15a847fmr3753837qtw.0.1681119595000; Mon, 10 Apr
 2023 02:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <CAHp75Vd8kcr0YCU7_oCSc8YqW5ZarP4RpQLexGV10A-auZi=Fg@mail.gmail.com>
 <ada1cc14-3607-a48b-cdea-7d72ba4db3d1@redhat.com>
In-Reply-To: <ada1cc14-3607-a48b-cdea-7d72ba4db3d1@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Apr 2023 12:39:19 +0300
Message-ID: <CAHp75VfHsh9-ZUagxRCRfRs1+QF1eJjWggy5PLgLj1sWproksA@mail.gmail.com>
Subject: Re: [PATCH 00/28] media: atomisp: Further sensor rework + exotic
 features removal
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 9, 2023 at 4:09=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 4/2/23 21:13, Andy Shevchenko wrote:

...

> Thank you for all the reviews. I've pushed a new version
> addressing all your comments and adding your Reviewd-by to:

Reviewed-by?

> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=3D=
media-atomisp

This is what answers my question in the reply to patch 28 I think.
I'll refer to this branch for AtomISP latest code.


> I'll send out a pull-req to Mauro for this, wrapping up
> the atomisp changes for this cycle.

ACK.

--=20
With Best Regards,
Andy Shevchenko
