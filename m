Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D10A2109
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5r6e2ya"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so2224098e87.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697890451; x=1698495251; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1hgO9nuruEPiuqumF8sjkjB66g/Fe7TKQqbXRKwxJw=;
        b=A5r6e2yaCGYRJGlo4Ocaec4W2fXXctIkrPctQQ80vLgCDRaOzTJe2AiiLVmp8pzTLN
         S+bWw/6ruWPmsztEEwOLmE4gUd6IpbToTzAmGYEDPuyGDXs/LIPrk6esuMJDGEvaPtbr
         NYp2qOuutWmuIq7lcwl/GPvc2sCTJKdB2TWOPSbqHy65arfQHPfqmYdW+5wpcMJiLYqG
         HPtxG4M1IRE16gY49U2A9nkCz4ua2FFEo1RNVMPm4u7FyfwI4afTHY18hBaMWh2m2WZF
         mqekZ1vnSZJ45IVsyWWcfWoKiQXjBPILSNFpsUPY5TmDKWYDNTVukh6MDYJO9bnzZTYc
         2rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697890451; x=1698495251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1hgO9nuruEPiuqumF8sjkjB66g/Fe7TKQqbXRKwxJw=;
        b=nlrm+d8GSzeZdaiaga7STV/3a07RABruD0pSBG4WTfp0QJvtl1uqZ4OS/QRxK7C3lZ
         0gq/ah03r8YoxcXgQBexvuKRVR529JmmRmK6QlwBj9D3L7Kh/SfRwpt3p8QB5waORm4/
         O1znYE4B/GPp57+i5gsB/cumP9vbqwGaED2JY8uPJfFH/ovyBX6ScDbfC6tkJMpF62fc
         XKgNLjRLEm4bfJq+qLEP5l9i1AbrloyVM3c9Am/bxaAWRfywK1Dia7HTbNRS3Qu+QEeu
         hofOKtuiuJLkNpXw72FsFh4D35kfrMVsC12chHOUyU4IwGHpjcNF6CBF6wL1tC1Q0d3u
         Mtww==
X-Gm-Message-State: AOJu0Yx0EmUXM2q+Bgg543cX2qiIu+D2PxvZ3Zs6zbHeNcfFGQL5P2xy
	Qn1qwLC2sHbn7O0+FKPhNq6YshmEPKw=
X-Google-Smtp-Source: AGHT+IHcaUBqaa9y/JY77Ly0qeRzu7cZNMMZA9tzpGfIS2zW6AE8M/fagm+xE+mBNmWtazC5eFoAsA==
X-Received: by 2002:a05:6512:2808:b0:507:aad2:96af with SMTP id cf8-20020a056512280800b00507aad296afmr3567348lfb.21.1697890451104;
        Sat, 21 Oct 2023 05:14:11 -0700 (PDT)
Received: from HP-ENVY-Notebook (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.gmail.com with ESMTPSA id s5-20020a197705000000b00504358a9423sm857780lfc.280.2023.10.21.05.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 05:14:10 -0700 (PDT)
Date: Sat, 21 Oct 2023 14:14:08 +0200
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] staging: media: atomisp: Removed duplicate
 comment and fixed comment format
Message-ID: <ZTPAkFCIjgWNBY2u@HP-ENVY-Notebook>
References: <20231021110058.85013-1-bergh.jonathan@gmail.com>
 <acf1fade-7693-9332-03b1-626f4949f9ff@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acf1fade-7693-9332-03b1-626f4949f9ff@redhat.com>

On Sat, Oct 21, 2023 at 01:57:05PM +0200, Hans de Goede wrote:
> Hi Jonathan,
> 
> On 10/21/23 13:00, Jonathan Bergh wrote:
> > Fixed the following issues:
> >  * Removed a duplicate comment
> >  * Fixed up minor comment format issue
> > 
> > Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>

Hi Hans, thanks for the msg. 

> 
> Thank you for your patch, but please don't resend
> it every week.

Apologies. I dont remember when i sent the original but I was cleaning 
up today and thought i would resend it. (I dont recall resending prior to 
today (?) but if so, apologies). 
 
> I did see the original patch and it looks fine but
> I have not had any time to work in atomisp support
> recently and this does not seem like something
> which needs to get merged urgently.
> 
> I'll pick this up next time I have time to do
> a bunch of atomisp work.

Yes, for sure, it was just a small thing.
Thanks Hans
br
Jonathan
