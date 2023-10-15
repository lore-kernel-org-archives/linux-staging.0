Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165171878;
	Sun, 15 Oct 2023 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cr11OvR7"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6b1e46ca282so2062577b3a.2;
        Sat, 14 Oct 2023 23:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697350039; x=1697954839; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3kGlq2Xx5BQrtm1OWloUhGm2g6MFTZwo7jhQhW9zsg=;
        b=Cr11OvR7S3gflfoC0+lVn2I4qb2+vEFwZ+1TVn1VLjJBrXdnePxCweOxP+82WzGbSq
         ylAYVbQOinha/sTz47scolAvFX2wC4rzfZTalB4R4B0n36XB5TDX67nV5VQpLb3/+Aej
         Sfn/K0mdotxCCq5gac6mth/bZ5rZy5GDUvMKRjKV6cOOhWaFx+175kuLQdFBMjyrZzPQ
         P4O2ROWvuj4tJBNoetP8faTVYHJw0Na8MeSj7NC3EUL8j++JWv/NBlep2HU84C8vpaUz
         z/wOP03vxP0lDKVoPOdrfjGL8qUxMnnSFgkuuPMD9rLNhNufa4SKEIjFi8Szb0IYVvOt
         VZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697350039; x=1697954839;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3kGlq2Xx5BQrtm1OWloUhGm2g6MFTZwo7jhQhW9zsg=;
        b=R0zByh1jIRugaPNq3x7QHNwbgGDbHhK3IRnkBNMEWQb9bCZ7WKJ8K57OM0Yez0iXtY
         0vg53Ccch3LCEKhfnrdlTsDjwpxBw4BNkUnwWqN6h49tPeyXPoH7+GepXZBO6qJtGCqX
         NdTYmC0DqXmbTNLfPenig6gHZqCvdTOCPlMAxClEy8/A3KvFlVXoO4ObYhOzbWeeMWCQ
         VxJDRgpHFEEFw2Dg3rQiY6ODJ5rFG7253jdz+K9ru7zoqjageE5XXR8+S8JyzpG4LTj6
         kqB58yKw5A7yeBVSacIjAR3pQ3r2oySaoU8J+lpj8QigLc7jTKxNx62H+NMnCbs1OkX1
         rOhw==
X-Gm-Message-State: AOJu0YzSOS6BUhhEtfnSQlB2y9xwmJX76CrKsQPA2JB9zleLyqOLZX97
	X+tJ7Fy6IvluhAtk9d6iMeI=
X-Google-Smtp-Source: AGHT+IFZon2eyX8yO2v2tuhGiWGE3ETezS14zyfWDXYBmJGr4Z49Me9EoSJztJD6sCKGOcbAMQHq4g==
X-Received: by 2002:a05:6a20:9188:b0:140:f6c4:aa71 with SMTP id v8-20020a056a20918800b00140f6c4aa71mr34483243pzd.8.1697350038868;
        Sat, 14 Oct 2023 23:07:18 -0700 (PDT)
Received: from Negi (2603-8000-b93d-20a0-2184-6fa4-0d39-1c6b.res6.spectrum.com. [2603:8000:b93d:20a0:2184:6fa4:d39:1c6b])
        by smtp.gmail.com with ESMTPSA id bx29-20020a056a02051d00b0056606274e54sm2284008pgb.31.2023.10.14.23.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 23:07:18 -0700 (PDT)
Date: Sat, 14 Oct 2023 23:07:16 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] tty: gdm724x: Add blank line after declaration
Message-ID: <20231015060716.GA31326@Negi>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
 <3b24ca9976cf873dbaadb499e09d7b545e9db89c.1697184167.git.soumya.negi97@gmail.com>
 <2023101551-placidly-garnish-3ee7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101551-placidly-garnish-3ee7@gregkh>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Sun, Oct 15, 2023 at 07:37:30AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 13, 2023 at 01:26:35AM -0700, Soumya Negi wrote:
> > Fix WARNING: Missing a blank line after declarations
> > Issue found by checkpatch.pl
> > 
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > ---
> >  drivers/staging/gdm724x/gdm_tty.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Why do you have "tty:" as the prefix for a staging driver?  Shouldn't it
> be "staging: gdm724x: ...."?

Hi Greg,

Thats what I thought too. But when I looked at the git history for
gdm_tty.c the last few commits had "tty:". So I went with that.
Should I change it to "staging:"?

Regards,
Soumya

> thanks,
> 
> greg k-h
