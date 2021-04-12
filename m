Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C52472
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 17:29:24 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id h7so10551259qtx.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yZERBifSmi4SCI1KUema3RU8NgjctejDx9aUtqw4gYc=;
        b=ZsMLMbY/5LeKJ24JnODzYecHvpel/efJj5r99xrz9pbYuq4xD0PeTgcXOWtGby5hHb
         UpOe1q2HIHFEUjuRyjz8F/UaAIunpAGMCL7hzEJAO4P3IT9g3dc8yYvOgoBof02Jr09k
         6ME2i1jtqUUKtJ1CQoX/Y56ePkZTYYd+2HoRYUdDVR7xHkYMfxEJSml/iioHV1VsFL+P
         fs3dqbOpmBfZHt9iWV9BKTDj6ksVRPRIU+t+U27jQk/sr5Wpp+5iLiXsmO8se0q7eMAP
         RYq7iM+v7LiIzJ/5R/zG1U9tyIrkM7OftqYlT2DQbptQT2d68TrZ/qKte7M+x8K+/9BA
         zA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yZERBifSmi4SCI1KUema3RU8NgjctejDx9aUtqw4gYc=;
        b=iOfDfw+ShT0P4poductT/700n9DL4679g92dPRs7lLZo/iGEai3zuAkkp5JUaMb2BK
         4Y1qe1hTgssIlmuYBDebVFwQdJAJahsCR9yKDB5LvIK8jyoclXsueAAw7hoscwR9gth+
         k9sBDrcPPpxLmGGijgxytiSDdofGPDTwjEAQIsa8g/ien/UpUpPeFwt5OrZck0QEftnx
         hRSZGWG6zdKxVR2dlu75SkwO6P8SB/Op+4l/3WKbKU/RyTxN3t9uDtpNMVH1YB55US4/
         6xYcsogdYCAYvdfBMfHH1xSDv2LTGerO/fpmeZmFW8PZZUU0SDN9/hLx6OozjnlYTbUk
         Otmw==
X-Gm-Message-State: AOAM532QRziEFodvpVsuSCkldmXhLeuknZ+wZIq4YqxNjWmHkVivQvzc
	7wXEbU28ePIbASEIpfS97VU=
X-Google-Smtp-Source: ABdhPJxzjI5Rl2q1EiTW7SB4I1X8txmmBiS8CnzNYr2HT/4U+cqVdMO9YjZcSEvmcnk3khIExr0AsA==
X-Received: by 2002:ac8:7241:: with SMTP id l1mr13586554qtp.13.1618248561779;
        Mon, 12 Apr 2021 10:29:21 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:29a:1b49:fcb:5776? ([2001:1284:f016:a037:29a:1b49:fcb:5776])
        by smtp.gmail.com with ESMTPSA id t198sm4363812qke.44.2021.04.12.10.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 10:29:21 -0700 (PDT)
Message-ID: <babb019f0950cf11857a4bcf20a572f2eace1777.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH 1/4 v2] staging: media: omap4iss:
 Replace macro function by static inline function in file iss.c
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy-kernel@googlegroups.com
Date: Mon, 12 Apr 2021 14:29:18 -0300
In-Reply-To: <YHRjPpMVVrhTF7Tc@pendragon.ideasonboard.com>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
	 <e302566a3d9e5180ab27eb2c2824fd1b678a6d99.1618231618.git.alinesantanacordeiro@gmail.com>
	 <YHRNzq3h3LEp3Dgc@pendragon.ideasonboard.com>
	 <7457fd4eb5afbf66b3a6f2fed4dd1e440e6ed422.camel@gmail.com>
	 <YHRjPpMVVrhTF7Tc@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em seg, 2021-04-12 às 18:11 +0300, Laurent Pinchart escreveu:
> Hi Aline,
> 
> On Mon, Apr 12, 2021 at 10:58:45AM -0300, ascordeiro wrote:
> > Em seg, 2021-04-12 às 16:40 +0300, Laurent Pinchart escreveu:
> > > While testing on a device isn't a requirement as you can't be
> > > expected
> > > to have the necessary hardware, changes are expected to be at
> > > least
> > > compile-tested before being submitted.
> > 
> > Hi Laurent,
> > 
> > I thought recompiling the kernel would be enough in this case.
> > I recompiled it in native Ubuntu 16.04 without errors.
> 
> Did it compile the driver you modified ?
> 
I'm sorry, It didn't. I forgot to enable the option to compile the
driver as a module in "make menuconfig" and now I'm seeing the problems
I generated.

Thank you for warning me,
Aline

