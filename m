Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39E94432
	for <linux-staging@lists.linux.dev>; Mon, 11 Sep 2023 12:39:11 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso3743676a12.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Sep 2023 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694435951; x=1695040751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=67gCs8f5mdy5XgNTerTC5kFAgH0Oc7zcxedUQ1vHbvQ=;
        b=akExBilydUXPm1dv6zaDki8js0TGoDbZjYeqnokbckuX1lUywsyyVUV+mmPjDEC3f2
         7abTWdParGZqmXBGnklshb+8FMOVtrjP065K9eXfttrrlmalhydPlbKscexlrp9NWSz3
         tcI/nNOAagVN0sMJEmX3bhx8YdzwipQM7K3twRGYh8dN2ofJDdIACcfsVmWkYCrxFJpg
         zTghY/MroS0FpiFbDDllCQWXjGjEYkY+b2lTyR/QAriAz6m3wg9AlvtM4gl6/I7zButm
         2hT31bhO5+tETjdFxoCKtGVyg6pLFhDg9um3ehPv7r5G7v9Phzm12dnpMNQccA3uzfc1
         27LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694435951; x=1695040751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67gCs8f5mdy5XgNTerTC5kFAgH0Oc7zcxedUQ1vHbvQ=;
        b=wsomIw75l4d2jgXdSpvIYDO5yG4llNZZDUxSSZ7ks8Wj1CIDtYOpvNnYC7BG1gysfF
         crY05MeGVfgsmxtI076rYVxyLYN9ypy8wXPElHaPJmLwSgHpNZpJImkcIBe1ENn3BZvI
         VI1jn5wjj2P/RGxBNjqLXobJmkbHTqLiiRYYbMQeeNikoMz30UR3TU4zdYpcmFivEmL4
         ua/Q+rIqL2d11BAyCiIg8XSlWY0pHhTzuib6tbim8NW1Q1kKDYUERIR1Lvnas0v74jjr
         EzK+Ibh27LAcXH67nrfW3LqhJ3xBn3B6NUeb+nyWTlTm6N7CPVzQqHUiVx+kho6nFhbv
         WEUA==
X-Gm-Message-State: AOJu0YyVaq1UlP1BiVVklBBubeGijur3jM2dbPxLUI8WXCbuMj7DPM+7
	Zsms5trUMTDMst/OHU/Gy1U2hKIV8D8=
X-Google-Smtp-Source: AGHT+IEN3B/vp/Bz84j6bhpYODzTYGAD4HzUT+dgxsIzCZIrQdRUDOCEReBWrAFEKjKxEyeSc50bnA==
X-Received: by 2002:a17:90a:1548:b0:26d:17e0:2f3d with SMTP id y8-20020a17090a154800b0026d17e02f3dmr9014298pja.44.1694435951137;
        Mon, 11 Sep 2023 05:39:11 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([106.205.101.29])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090a0d0800b00262fc3d911esm7968067pja.28.2023.09.11.05.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 05:39:10 -0700 (PDT)
Date: Mon, 11 Sep 2023 18:09:06 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Type encoding info dropped from
 array name "byVT3253B0_"
Message-ID: <ZP8Kakx1sUjnjWrQ@ubuntu.myguest.virtualbox.org>
References: <ZPnLw+njcL/D391S@ubuntu.myguest.virtualbox.org>
 <2023090724-trial-ipod-93d2@gregkh>
 <ZPwwHY1TDOBEljxr@ubuntu.myguest.virtualbox.org>
 <ZPxCa/UOd7T2phqX@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPxCa/UOd7T2phqX@nam-dell>

On Sat, Sep 09, 2023 at 12:01:15PM +0200, Nam Cao wrote:
> On Sat, Sep 09, 2023 at 02:13:09PM +0530, Pavan Bobba wrote:
> > On Thu, Sep 07, 2023 at 03:43:53PM +0100, Greg KH wrote:
> > > On Thu, Sep 07, 2023 at 06:40:27PM +0530, Pavan Bobba wrote:
> > > > Below array names updated as per coding guidelines:
> > > > 
> > > >    1.byVT3253B0_AGC4_RFMD2959
> > > >    2.byVT3253B0_AIROHA2230
> > > >    3.byVT3253B0_UW2451
> > > >    4.byVT3253B0_AGC
> > > > 
> > > >    Conversions performed:
> > > >    a.type encoding info dropped from names
> > > >    b.names replaced by snakecase
> > > > 
> > > >    Issue found by checkpatch
> > > > 
> > > > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > > > ---
> > > >  v1 -> v2: Name of the tool added in the body of explanation,
> > > >            which found this issue
> > > > 
> > > >  v2 -> v3: subject modified to more specific detail
> > > 
> > > Any specific reason you are not sending this to the maintainer that can
> > > take it?
> > i used scripts/get_maintainer.pl to get maintainers names and i am
> > adding all those people to the mail. kindly let me know the maintainer id
> > and the correct way to know the mainter of a file
> 
>     ./scripts/get_maintainer.pl ~/Downloads/PATCH-v3-staging-vt6655-Type-encoding-info-dropped-from-array-name-byVT3253B0_.txt
> Forest Bond <forest@alittletooquiet.net> (odd fixer:STAGING - VIA VT665X DRIVERS)
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:STAGING SUBSYSTEM,commit_signer:2/2=100%)
> Michael Straube <straube.linux@gmail.com> (commit_signer:2/2=100%,authored:2/2=100%,removed_lines:44/44=100%)
> linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
> linux-kernel@vger.kernel.org (open list)
> 
> Greg shows up as one of the maintainers for me.
> 
> Either a bug with get_maintainer.pl (unlikely), or you did something incorrectly.
> 
> Best regards,
> Nam

yes. now it is showing Greg as maintainer for me too. i might have used
the script incorrectly earlier. added Greg to my mail while sending
next patch.

Thank you,
pavan
