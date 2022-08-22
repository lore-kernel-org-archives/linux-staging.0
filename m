Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238B27B
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 13:00:14 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id i7so7714608qka.13
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dLe1AxuAzl03MDNm18iUJuezY7stT/e7uyev3MtZqHo=;
        b=UWepMyZ5TIfEuT8Yj+6DOSmD/6jiSIz/nRp7602pGReYQKvgZQjGGtBvFh/mFm8o9r
         3VWGTWXC1GsQwfW//BENulX4pvh5xNfpgqy33m/QTDifd6dxWtNvJMxASgu4SVwabwhW
         rZZ4dQM76xwCPFyrhlw6UrIp/8NRTY8AXYEvYAFYHfjog7/Uffo7GX5DpXCuMAB6QAfh
         5PosFnOMKaJGrHqfjxwB5aQJ0JDKNiXGpWdkIC6LJ2mRFToGmAT7Jve6igJBX+WCkEsh
         Gq/+0OFL6XikKzFSB/CzqFDop/PGvkYs2T3ecERATpAGDXYTY9IfB41QWKPeP3y6JRbU
         lDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dLe1AxuAzl03MDNm18iUJuezY7stT/e7uyev3MtZqHo=;
        b=ndP/EdhhRLgr9Cmec6Q7Bx5m/+7TBGego69OpnWxde9fFCXUFUDg5Bi+PLSUdra19T
         gJH9zS8s/NOWxdcPNaBxvgxREaDJo7G2Aiblf4GdsG8qFSrMVdJARM3gnXm2EYLR1rY8
         YRg6TbPqp046VZJ+GlhOEN52UQUCmn2NQyH3QIMeXBsVjiDfAfUbOef5vNFwbfDpfueF
         Zy8ddYv7se357r0pjhPd7pgEz5QSy1O/pnItT75WJVbGMbYLU7RyeRyWCR9hwrHshtlN
         Oe/7AyXZKQPmyqljDtYjjhMJs14/GTrdbwT/R3HhEgafYZ3E9alpMDinFP9YkXkhIQ+e
         ZQEA==
X-Gm-Message-State: ACgBeo2WozYJZ+Ub6Whtbw96pz+HreVBsyaJcmmAR7ztUKfkj6JMUU05
	nbpU31+JlM7w353spkt674aDKIjVOLh2G99rHG4=
X-Google-Smtp-Source: AA6agR6dykgyXd9KPuMJZQY9BjjMj70admBIsm3QdEntQrVU/7qkiM8C0AwxvH0BvsX8gap3jUMVqaKquQCpxJYqnzU=
X-Received: by 2002:a05:620a:2987:b0:6ba:dc04:11ae with SMTP id
 r7-20020a05620a298700b006badc0411aemr12409046qkp.748.1661173212951; Mon, 22
 Aug 2022 06:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com> <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
 <3834201e-95a3-02e7-c549-e5630fb64892@redhat.com> <CAHp75VfxR6zfBzpdnM1RKv-ewnPCMejdLgY2QTnhfZ+sFFqcMA@mail.gmail.com>
In-Reply-To: <CAHp75VfxR6zfBzpdnM1RKv-ewnPCMejdLgY2QTnhfZ+sFFqcMA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Aug 2022 15:59:36 +0300
Message-ID: <CAHp75VfX+tN20dW_ULPmvZRo9fqwhPTLiOdBOhaAxjXYrFgO=g@mail.gmail.com>
Subject: Re: [PATCH 01/13] media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 3:57 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Aug 22, 2022 at 11:02 AM Hans de Goede <hdegoede@redhat.com> wrote:

...

> You may also add
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> to all patches, but the 1st (it has already SoB)

> and commented ones,
> which I'm going to do soon.

(should be read as)
... and non-commented, that become visible after I comment on a
couple, which I'm going to do soon.

-- 
With Best Regards,
Andy Shevchenko
