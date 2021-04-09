Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9870
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 17:36:30 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id x27so3058609qvd.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iaFkKzWMamTzdA9WJNo3nuUtl8TLuaeVqvjAOEZQMfY=;
        b=idsyB02cFc5uHVLFZz/dNjbR3BcMiU/iIUqaPb7PstrPwbVW+QI77u9DF8T0syEnpf
         2V/sl/8UYJHTTXMRYvr39I7Z57DefYfLSeVcOUI6qAXT8gEfuiyVAIGvLZ5MGX+oJCvo
         a5NVRRM1OJWfDltXbCzN53Es2d7mvlSMKfYWaIx9A/Os0VqxcChfMBpZ4y2pgsXfOduF
         hEEwLEfh2hElGoXmsAFBdyteM5/rMuTXs8FMzS8ZphTHu9mhKNQWKZjwGM/RlPuHY28t
         FpSXE/e1PSULso1Z1TxZzfxdpZhcmpaEsh0DgN/gZNLrBqEY/Mi4GGHiMxUyTfoiZHVo
         5jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iaFkKzWMamTzdA9WJNo3nuUtl8TLuaeVqvjAOEZQMfY=;
        b=Gnj50FLr7HDKD2HfOIxKtTlUYcFArgqUHpENewQ5KOvI2acBMVjS42I4kn6lep7ho+
         yA1JK5+FROUFI6dxMCnm3KJI9HifFMGXaVcKRSndEPmoqcBHW6o+q1srlsdEYVSwz9lW
         MbQsxK2Wg5kcKQnJ5gXE7rVbb/9XA6HBHAsCJCOn8GPya8Z1s4dXriTKxKmtOvansFQk
         5ArBJYHwy+Jlo3Q/xyhfQj0z0dKRiQjhpDmdzKiKsBhnBb7IpH5pYDclUb8LplmKjuQ2
         QbiCfrA3rzZ7gSQYrPastkqoLmhxmVYnD2AfQ6llIGMPP2unIKSIVGjT3+yhn9TOt/Hv
         Yv3w==
X-Gm-Message-State: AOAM530SQLTNyDAak2F0yOqNP5NUrw4ZEFGW1lPlWERH87x9G+yrjS5a
	bNn2pzZENWpadmPb6c2bCls=
X-Google-Smtp-Source: ABdhPJwR4sJ9wsj0+ipygYICMcMViHTwd5+mt6N3j49V1XJ0VCxQKwKPOaPGU93iRa8qsw/WXkHyHQ==
X-Received: by 2002:a05:6214:1081:: with SMTP id o1mr14885607qvr.11.1617989789596;
        Fri, 09 Apr 2021 10:36:29 -0700 (PDT)
Received: from [192.168.100.7] ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id n15sm2092540qkk.109.2021.04.09.10.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:36:29 -0700 (PDT)
Message-ID: <34466470c14123542af3b8e0ced80425ea3afec8.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
	Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date: Fri, 09 Apr 2021 14:36:25 -0300
In-Reply-To: <88e48e7bb5679b913e3f223d29b566ce8c18e9c3.camel@collabora.com>
References: <20210409135404.GA26172@focaruja>
	 <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
	 <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
	 <88e48e7bb5679b913e3f223d29b566ce8c18e9c3.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em sex, 2021-04-09 às 14:15 -0300, Ezequiel Garcia escreveu:
> On Fri, 2021-04-09 at 14:00 -0300, ascordeiro wrote:
> > Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> > > Hi Aline,
> > 
> > Hi Ezequiel,
> > > 
> > > On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro wrote:
> > > > Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
> > > > and #define HANTRO_PP_RED_WRITE_S in lower case, according with
> > > > code style.
> > > > 
> > > 
> > > Where is this written in the Coding Style?
> > 
> > I found this in section 12, about Macros, Enums and RTL in both
> > references:
> > https://www.kernel.org/doc/html/latest/process/coding-style.html
> > https://elixir.bootlin.com/linux/latest/source/Documentation/process/coding-style.rst
> 
> It seems this
> 
> """
> CAPITALIZED macro names are appreciated but macros resembling
> functions may be named in lower case.
> """
> 
> It's just a suggestion, not a big deal. In general, if checkpatch.pl
> is not complaining, it's not worth the trouble.
> 
> So let's skip this fix.
Okay! I'm going to check different problems with the checkpatch.pl
> 
> Thanks a lot!
> Ezequiel
> 
Thank you!
Aline

