Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C100270
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 18:26:13 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id x11so6737798qkp.11
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=c+DbAEwm0zRiHXUbKphWseVw53MsK9wYkvb3a3fbewM=;
        b=lXeEtyAca43iGOTwSlP0zw5k6vVxMpXPwmtkGVDHceQMVS6ieis3frq9h8IaSRBVi4
         2fPmzKe50P9tL4LZA4G0mPxKCfeNvB5MVpF9N7e4csTMTMvKmEhlxYf+c+wSoSgtRaV/
         b7jMt/2yBfclVcmch4A+aLHf/jvI/AkE581hPmZzCKOoipBUUeztXGF8eblCYRxeVIZ6
         6yXk5qSSz5IIPw9uqF8XbCXiM1mmHVvzddUzAZU5mLgnhrB+DZWUVyj5ebVhi64mKm4F
         PkvZp3sp1e5tIWUQyisrGsJYrt82lBJxkLF6XLr7bGqhmiq7nquccTCuzo7KNXkmQhrl
         VLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=c+DbAEwm0zRiHXUbKphWseVw53MsK9wYkvb3a3fbewM=;
        b=Q5S2Hcdy3iBe2xlKoTEKMUdy9IuzwYUrmfYEj9DCDU+ORlxFy1ms8WGUVNb9d6eOxY
         LqiBMHqc/hk/L+jI+yqZ9H4TzticzdmyM2r7kPyca+eYYyCRDohUHaMb/OZu7P61jxuF
         QALYA6Xqs8LsBvzLnUHql9ZOe/fwpsmaN7ba7Thf9CHzMFeL7Xr0sCMftSfr4MEVFSl9
         rsj05XoOeWmoERv2qMhiHtCGnz1WHGjWzuuiEK5fH5FVEpV68V28GI8E9ZEFfxpHSTYP
         j+TkzSkJw2thyFavHjmmxT+i/4VxAPv8oZCK6NvmdMBTeQaOh9OjUykbW6/OEqbMEhaR
         f7Ag==
X-Gm-Message-State: AOAM530MfujGchmrcaUqTFkaL9TXQ356GtSW7uFLKHk/F23lQxK2ATvc
	G/ldcuVMF7MQbpT+BG4Nv/4=
X-Google-Smtp-Source: ABdhPJxbIXjazCV7IMjXK4LTzgF0mrELA4f2g4oXayX59ZrQRRbJ1g7LgpoLPbX74QMzNDLHlmM3oQ==
X-Received: by 2002:a05:620a:13ac:: with SMTP id m12mr15181568qki.458.1617992772882;
        Fri, 09 Apr 2021 11:26:12 -0700 (PDT)
Received: from [192.168.100.7] ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id d190sm1058319qkf.103.2021.04.09.11.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:26:12 -0700 (PDT)
Message-ID: <aff7af9caab6fab8ec2c7ee0980669323b449aa9.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>, Julia Lawall
	 <julia.lawall@inria.fr>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date: Fri, 09 Apr 2021 15:26:08 -0300
In-Reply-To: <532a72f6fcb6f51451e12444413c0ad4441a679d.camel@collabora.com>
References: <20210409135404.GA26172@focaruja>
	 <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
	 <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
	 <alpine.DEB.2.22.394.2104091924510.17316@hadrien>
	 <532a72f6fcb6f51451e12444413c0ad4441a679d.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em sex, 2021-04-09 às 14:42 -0300, Ezequiel Garcia escreveu:
> On Fri, 2021-04-09 at 19:25 +0200, Julia Lawall wrote:
> > 
> > 
> > On Fri, 9 Apr 2021, ascordeiro wrote:
> > 
> > > Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> > > > Hi Aline,
> > > 
> > > Hi Ezequiel,
> > > > 
> > > > On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro
> > > > wrote:
> > > > > Rewrite macros resembling functions #define
> > > > > HANTRO_PP_REG_WRITE
> > > > > and #define HANTRO_PP_RED_WRITE_S in lower case, according
> > > > > with
> > > > > code style.
> > 
> > Maybe you can see if these macros can be converted to static inline
> > functions.  Macros don't provide any type checking.
> > 
> 
> I'd like to leave these as they are for now, tbh ^_^
> 
> A more massive refactoring is needed in this driver,
> but it needs proper testing and it's a more complex plan.

Okay, thank you for your attention :)

Aline

> 
> Thanks!
> Ezequiel
> 


