Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF811869
	for <linux-staging@lists.linux.dev>; Sun, 23 Jul 2023 18:55:38 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99b9161b94aso69604966b.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Jul 2023 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690138537; x=1690743337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LgmHA9TbwRKm5WlrTCRPPSgqddYKlkGXSvlysDZKcHc=;
        b=Nawec058ivMeKyF/5+HaTYaWXtiMjw/ECiIC8QRW5dNm3P4MzJ+eXR0zUsSCSC6C1X
         lIdxN0N1V7lOB4lSu6EprZ1q3OH6VDvHD3zxb3smMNVkEEcVtG01+3hacu+rmLb1QeN1
         TBP1WwIDu4EdaNyZXv2/z/qfCN4vnvwUFLlzc7UKDWGsdW+dgKMqVNenwbs6emI4wagq
         2Mu/kldXbvPf+3YXnVvitIZK/9B22fMwD1/PgLyPEMMDWdrj1+rGdjHoEHAgT21SatsB
         /kh4BbtYoiJ0OJxjA5XTFLOhC55VUWYCwW2XDdZKZb/9V4tRDbINp37iShC9iR5kqfWb
         PoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690138537; x=1690743337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgmHA9TbwRKm5WlrTCRPPSgqddYKlkGXSvlysDZKcHc=;
        b=fZuFXLEcXPoOlImlZZ7ceQU+b+lXZcvby3C421rmMhRWZKVUWZBD9ZuoG4ZKMp9ERn
         Z7GCf8VVn9gzAucgxFo17dDy86dVVreTXo1lIfZ5ObzSyh7uAVl+aB0AuktvUz17xZZl
         aYK6vsXtWcnm6PLSy3/yeBzlLrkszxu5nMwi4oDSLHNqgSSmqORyQjySA+hyJdLvYD93
         5u1Ooyw2hW3lJRrjWeUcqd4DOqJ4i4t2e1wfXkIE50MCp76yx2y0WqZXFdHGis5R6Dgh
         Oo9MOYZD60ZfrK4kqvGUd97jK0Uu0VQQQ/qsci5Do8vUVmEB6z5PT9tZbdZlsg8/NbcR
         loDA==
X-Gm-Message-State: ABy/qLY9LrZbRGbq2IvbMA0tZyJ6C4Pn2GiBANc/LMUnZdiRooh9bxdt
	eOTcxCUyf8s+fgk3USRkMZ4=
X-Google-Smtp-Source: APBJJlF9Q7mtX/qbyq1JqHFzz3cfcw1odilg6aWAsNqqCaQxlIrlBXQkXv+L2eq1HaOtYDesgjhmLA==
X-Received: by 2002:a17:907:7890:b0:994:1fc7:a7e6 with SMTP id ku16-20020a170907789000b009941fc7a7e6mr8463961ejc.4.1690138536563;
        Sun, 23 Jul 2023 11:55:36 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id x14-20020a1709065ace00b00992e14af9b9sm5426349ejs.134.2023.07.23.11.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 11:55:36 -0700 (PDT)
Date: Sun, 23 Jul 2023 20:55:35 +0200
From: Nam Cao <namcaov@gmail.com>
To: Franziska =?iso-8859-1?Q?N=E4pelt?= <franziska.naepelt@googlemail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Emily Peri <eperi1024@gmail.com>, Guo Zihua <guozihua@huawei.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Kang Minchul <tegongkang@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
Message-ID: <ZL13p4tSQAx6cx8E@nam-dell>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
 <2023070123-unburned-worsening-0713@gregkh>
 <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
 <4b9fdaa7-bdcf-ef41-0d54-ba41520cde4c@web.de>
 <CAAUT3iPUaNRUyvqP1O97M0AmKri7Ghc06ku4TS6vcHQ=Sb4ycg@mail.gmail.com>
 <ZL11kmTYFXMwrYww@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZL11kmTYFXMwrYww@nam-dell>

On Sun, Jul 23, 2023 at 08:46:42PM +0200, Nam Cao wrote:
> On Sun, Jul 23, 2023 at 07:44:44PM +0200, Franziska Näpelt wrote:
> > Hi Markus,
> > 
> > Am So., 23. Juli 2023 um 08:19 Uhr schrieb Markus Elfring
> > <Markus.Elfring@web.de>:
> > >
> > > > Am I supposed to adjust something here?
> > >
> > > There are possibilities remaining to handle recurring communication difficulties
> > > in more constructive ways for some hints.
> > >
> > >
> > > > As far as I understood, I can ignore the comments from Markus, correct?
> > >
> > > Would the provided technical information be taken better into account
> > > if it would be presented by any other contributors?
> > 
> > That's not my point, I appreciate feedback from anybody, absolutely no question
> > on that. I'm just struggling to know what I'm supposed to do when the maintainer
> > is saying somebody's comments are not helpful.
> 
> I would wait some more. Greg is probably just too busy to take your patches at
> the moment.

Don't let that slows you down though, work on other patches in the mean time if
you would like to.
