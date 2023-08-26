Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49362FB2
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 20:32:37 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so6241752a12.0
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693081955; x=1693686755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PE9rZFLJE37KfD4a/UIuVo+Dsin6CGfHTs/lNm1wAFY=;
        b=sNNHyRTnLjffOF9k4gRZR066bax1rmjkf/WD7nNhtm4nn0wDtMuMD8M4RC4POw/jzf
         24ltZOIk9PRmwFFBRcUPySu9hAvuCGMkmHgjAT1/C4/iQXvwe0elrg7ZypdHKF2rPaoU
         QS9kRIV3RDGtnCHVQfb5CECxTBFKo0casMTSRTUMkCmPSCLC/HGjH1LNFTBB20z2WIzE
         NYEqiFrUIn2+sMk05/y2ZsfR65R/nav+f1BEjzi2ojdy8jNl77WAmewVZPHKvnVsFHMW
         LjDllz4wqDPxrDdWGGpL+cF9Kj+jhqJcSicvgPoZUuZEniS6MvCiWbGwsnanLCgkhQt5
         fXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693081955; x=1693686755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE9rZFLJE37KfD4a/UIuVo+Dsin6CGfHTs/lNm1wAFY=;
        b=g61mm88MmA4qhC3xT2z7kfMJR0tT1hKkI5f0njXYOID/zJkBDTRtTWKquJbYhF8GFC
         3izdc1skF1nxusm1OhHKFk4MbEZfITzWTCngmYYz11yvVjTb7JpXhYGBj5v55BZLg96l
         ZKttYuVuhmIj0HYOBJpX5npKaT+1rORBl84C4sJgau5B736E6aR8y+OgAw5GryJvVXiG
         MsPQM1p690Vyu7w8KrnzeClmN31OacdQveNFNVNF3XIBc8ZBJA7Vfp9UMBOKVhexHqnr
         wMISg94utd9PlfhOs15cBC+qfHGtIsAtcg5oONhbtOESN4wXaWcrAyvYOscNxgUO3zKH
         lWJQ==
X-Gm-Message-State: AOJu0Yz+9fISZrZ4Az7qaNhgVidosmoiwrVph2VHZ028RHStZj8Vcz1S
	tHIqbvexAE5hlNw87dSK/MGZDKCVIRg=
X-Google-Smtp-Source: AGHT+IHbqiHt+ugtV8o2hCN3fAJ5kGysqFKzACJkCK3IX47e27JTky7b/SKEEBVMvLpxNUYoL5lepA==
X-Received: by 2002:a17:906:51db:b0:9a2:295a:9bbc with SMTP id v27-20020a17090651db00b009a2295a9bbcmr6730316ejk.37.1693081955216;
        Sat, 26 Aug 2023 13:32:35 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id v17-20020a17090606d100b0098669cc16b2sm2565556ejb.83.2023.08.26.13.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 13:32:34 -0700 (PDT)
Date: Sat, 26 Aug 2023 22:32:33 +0200
From: Nam Cao <namcaov@gmail.com>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/4] staging: vme_user: fix check alignment of open
 parenthesis in vme_fake.c
Message-ID: <ZOphYXeTMM+QhnTk@nam-dell>
References: <ZOoWgZ7ZnGyWHUKe@alolivei-thinkpadt480s.gru.csb>
 <ZOpWxBjONs0QpFlU@nam-dell>
 <ZOpfUjRy3jDwZixX@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOpfUjRy3jDwZixX@alolivei-thinkpadt480s.gru.csb>

On Sat, Aug 26, 2023 at 05:23:46PM -0300, Alexon Oliveira wrote:
> On Sat, Aug 26, 2023 at 09:47:16PM +0200, Nam Cao wrote:
> > On Sat, Aug 26, 2023 at 12:13:05PM -0300, Alexon Oliveira wrote:
> > > Fixed all CHECK: Alignment should match open parenthesis
> > > as reported by checkpatch to adhere to the Linux kernel
> > > coding-style guidelines.
> > > 
> > > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> > 
> > Patch series should be in a single email thread. But your 4 patches are sent
> > separately :(
> >
> 
> Hmm, ACK, I didn't know that.
> 
> > Have a look at how your patches are sent on https://lore.kernel.org/linux-staging/
> > and you will see what I am referring to.
> > 
> 
> Indeed they were sent as separate emails.
> 
> > Here's an example of how patch series should be:
> > https://lore.kernel.org/linux-staging/736c8159-90e9-4575-3c22-5a62515d5c03@gmail.com/T/#t
> >
> 
> Please, if you don't mind me to ask, how's the best way to do that?
> I've already wrote the cover letter, generated the patches' files again,
> but I don't know how is the best way to send them as you instructed me
> using mutt.

You must use the argument "--thread=shallow" while generating patch series
with git format-patch. Then mutt should correctly send them in a single thread.

The instructions can also be found here:
https://kernelnewbies.org/FirstKernelPatch

Best regards,
Nam 
