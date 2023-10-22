Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C15698
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa4lXneK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-27d0a173e61so1398585a91.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 05:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697976227; x=1698581027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/eE2iwjhBbOe3VZZ3RYTaBbrjxq/R/X+GGySVAzau0=;
        b=Sa4lXneKP4KRL9tC0WEzFJwQPzjj0Tie03NnMCpoj8UQF0qUNj1PDsxs9aWPh7MvVX
         v/EAVFPhB+S2PSMJkocmQio0EHx36PE/sWRfqiECMIsm/GcvHZ3mAhg8WYZzu6zeTBUo
         SaTs3mysRlXh838aQHPRBVJxu4ggeRCjk27cwDHH6pGPj0z9MVu58gmC6xzP7LTgmES0
         /Bu8ZIYbOyeTqqM7Y/D+6sxUGe4oB92A2Ir8qBu51Mwc6S7RgHlndL/pjKENUpKM/Gul
         MBMB4TDoBUhmugBzcED9HOebM0F+vifiWTlwVaQ2YwyeZO5eyqRTAF6sE3cy5t7WSC+F
         oi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697976227; x=1698581027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/eE2iwjhBbOe3VZZ3RYTaBbrjxq/R/X+GGySVAzau0=;
        b=KntwIR9bHBIwkDDVCLbpX9L/b3c4HcieBdwArqotEn+ndQ5qRrEaYwzT5Y2GYb2GIJ
         Ho+0h8k+44+S1KanXDQ1sNFxYyHCiuD0Cm1knfj06crIZjmv7BtETTLTf7ZPjeSKZNpF
         Wy7IBglyaecmZzXRdNuw99vP57kq5ismiTiWF7cjAbrfgf4XZXGx5I8QT12+bbTQdg9T
         Sl4MjrmYCe+ISiN8Np91hojjTaYremIFmhAsEnJWCoulzq1d/Bbidi6+gf3FNyKrCIUA
         WOBKFEUTE1+bZdsdNTD7uMO8p0WDUK/372ZaO/bIJyTfbNypxbp1669T63MfH4/mIMhX
         +1yg==
X-Gm-Message-State: AOJu0YzdNkPsc06tc6mrB3tYJ6I3p6meMVSSHUBLsh6n+z7mKiDHHkSF
	ImIHJmgAtjPCdgKvKqoAGiQ=
X-Google-Smtp-Source: AGHT+IGRFz9ZInmubBn8DZsC49Gxsp+1AuFYvUY87+ZRzwqgsgTlaeyx7ImsdMRhqntoNGx1a4wq7g==
X-Received: by 2002:a17:90a:55cf:b0:27d:ba33:699b with SMTP id o15-20020a17090a55cf00b0027dba33699bmr4572377pjm.2.1697976226880;
        Sun, 22 Oct 2023 05:03:46 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id t3-20020a6564c3000000b005ac384b71cbsm3587393pgv.60.2023.10.22.05.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:03:46 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:03:31 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumaran.4353@gmail.com
Subject: Re: [PATCH 3/3] staging: greybus: fixed prefer using ftrace warning
Message-ID: <20231022120331.GA3552@ubuntu>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
 <cade10d4b94127900a015e0b2ab94da5dd8c2c63.1697969950.git.nandhakumar.singaram@gmail.com>
 <2023102219-boat-shaky-f491@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023102219-boat-shaky-f491@gregkh>

On Sun, Oct 22, 2023 at 01:19:33PM +0200, Greg Kroah-Hartman wrote:
> On Sun, Oct 22, 2023 at 03:42:26AM -0700, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >  drivers/staging/greybus/bootrom.c | 2 --
> >  1 file changed, 2 deletions(-)
> 
> Again, subject line should have "bootrom" in there somewhere, right?
> 
> thanks,
> 
> greg k-h

Will update and share the patchset again.

Thanks,
Nandha Kumar
