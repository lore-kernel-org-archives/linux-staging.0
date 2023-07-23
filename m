Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B481869
	for <linux-staging@lists.linux.dev>; Sun, 23 Jul 2023 18:46:45 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51e619bcbf9so4740381a12.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Jul 2023 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690138004; x=1690742804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fmZXbaN5NquAae8745spKCBaffvzV/zRnEjEc5Quq4I=;
        b=ru3B0RWd9hf/RgSdTzmL/iBPaw2Obf0AUk5qaiS6zfKFDK9FAZOY7SvoBlHXPta9uQ
         WCaW/oHt3CEmuOo87WpF1TAphnz3UPixeiIqE/Pm+KVW6Uo8tBPePecTV44SlQ5m6SFH
         YqNwUrYoL0S0FYAc63rqSkUtsh/jSaKqcMvWbg6i6QzH81C/sa/legVmIBmGNjQD5o1l
         q7RhN9OL8HUvyDE1um4KsaHAbqZe9PA422b+k9n2mQW3nU7GGLoHl5urMMqf/b/4/Mpr
         jtyKrs1Y12Jhm841HlWVM81P1EAoGvmWpslOz2mY+Riy3gtnbEzG13GNGInZcjEdI92t
         LVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690138004; x=1690742804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmZXbaN5NquAae8745spKCBaffvzV/zRnEjEc5Quq4I=;
        b=a7UPy8ajVVQZqyVEW16tfEMnGIUIkL4iY/73Ad9+QBfSqnOHOIQcQq7lrvNsNLvO/j
         AhS+eNui13ErROn/ffFTM6pu5QCfJ3CKaDbqNbtDaKvfN7sIlSJGyZzq/bzfz67qIz2d
         TDlIISquvm0WJZdXvXrMoo9k1A5VJy9bK4KkbogvzBUbvBmPD3NIHBHK0VEK1dZtLw0/
         P2TwtSfCRn+vyC7xfjkIsbTlkrnvIkoq5fgFXNmzI4bLg8HYKiTw1jdpNA5qloG9jsQ+
         +bHkTw/CoX2/wJCAvqrnOvwMlIPvKdi2uCrPXF81kNs4h1mtbu0gGfb5uMGDxn4sGVnj
         N6nQ==
X-Gm-Message-State: ABy/qLYzJtGON+L8yzeSPqjA/h5lmnqTn/ypk1zWIC5YjxCjk0vO0IwC
	m2n8NW12jgrShz8G/KQVOHk=
X-Google-Smtp-Source: APBJJlEAYtVO+sg5IJ3Myr6j3kWgDWPtart2U88b2r5eDIocLJICoc2+iDvefAKE35/qlXWg591e3w==
X-Received: by 2002:aa7:d411:0:b0:522:21eb:fee5 with SMTP id z17-20020aa7d411000000b0052221ebfee5mr2225181edq.40.1690138004031;
        Sun, 23 Jul 2023 11:46:44 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id u24-20020a05640207d800b0051a53d7b160sm5134415edy.80.2023.07.23.11.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 11:46:43 -0700 (PDT)
Date: Sun, 23 Jul 2023 20:46:42 +0200
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
Message-ID: <ZL11kmTYFXMwrYww@nam-dell>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
 <2023070123-unburned-worsening-0713@gregkh>
 <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
 <4b9fdaa7-bdcf-ef41-0d54-ba41520cde4c@web.de>
 <CAAUT3iPUaNRUyvqP1O97M0AmKri7Ghc06ku4TS6vcHQ=Sb4ycg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAUT3iPUaNRUyvqP1O97M0AmKri7Ghc06ku4TS6vcHQ=Sb4ycg@mail.gmail.com>

On Sun, Jul 23, 2023 at 07:44:44PM +0200, Franziska Näpelt wrote:
> Hi Markus,
> 
> Am So., 23. Juli 2023 um 08:19 Uhr schrieb Markus Elfring
> <Markus.Elfring@web.de>:
> >
> > > Am I supposed to adjust something here?
> >
> > There are possibilities remaining to handle recurring communication difficulties
> > in more constructive ways for some hints.
> >
> >
> > > As far as I understood, I can ignore the comments from Markus, correct?
> >
> > Would the provided technical information be taken better into account
> > if it would be presented by any other contributors?
> 
> That's not my point, I appreciate feedback from anybody, absolutely no question
> on that. I'm just struggling to know what I'm supposed to do when the maintainer
> is saying somebody's comments are not helpful.

I would wait some more. Greg is probably just too busy to take your patches at
the moment.

Best regards,
Nam

> In another thread I was told I should mainly follow the maintainers comments in
> case of different opinions.
> 
> Franziska
