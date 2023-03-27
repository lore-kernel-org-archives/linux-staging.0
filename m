Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A9EECF;
	Mon, 27 Mar 2023 12:46:08 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l27so8670957wrb.2;
        Mon, 27 Mar 2023 05:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYIGAgh3bNQtQ2hkLhWzVHkkyMwA2A5wfdDvnocQpCQ=;
        b=OtF5U5GeGMC1joLpFhdjkzQSJl2EpNpTlz9dgob+XXltcZTyEVsyud07oqsVyyE8Ni
         3pfq20RG85/LXrAr2IlkhLLtWEnjMXIg60PPNouvkfSP4eb29R/uqFHyO71VrX8qeZr9
         o1X1wRpoo3JjbY5A6DeNnr5kph4BKPzJdKXRE7z0TkFqLErrcezfd5RJbQmaTDn00AzF
         XmTBYQ5cu17kcjsKEkcHJHrhPZUo9YYeHBnz1UBvbdnqPBLvs4uCEO8XHv/ryysm+hjl
         fOeVSFU5iq3wP/sOYdVwPp44td+VgKKMfZrQIiQhXhmi7/xz8b/KAWz1YEh2GFmu9jy2
         gp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYIGAgh3bNQtQ2hkLhWzVHkkyMwA2A5wfdDvnocQpCQ=;
        b=xe4NrbeuMfVrYmVemhns4n+4Mgt1H2ub3DOcG6wt3BBW4aNPaLfWPaIjLiYT7h5sQN
         aQprefRhdb/2AIAZFEi93XFf9DA9iHzLrzW3R2XPQznXFk81JOsGGq87zMyWWSgLn4wh
         1LX75Jfnz4HXgKKquleZOSdDG1noliHCqYYn2+BLIwwBjWA7X7xWrt3stskRmt2CrFfH
         JWDZsmKPgLq6fR8Z3YsYqbOlinFf5jn31lYxFqSKpgEgBCitsltqCLs/8SUiabTLWoEl
         aYkt3lc8huToNLBimz/Gs+wHJ7rcUypXfZpoMX77zN6Hlzk9XMhYRhGoOPte4XzUzr+6
         f/ww==
X-Gm-Message-State: AAQBX9d4PZkoeolDOhRLjJKZiYQlQZ1XLjdDlGF7DpP4HR2VOyfsQqe2
	r/GuPMlwnRy18QSqKzjcPQc=
X-Google-Smtp-Source: AKy350Yb6KtmVuwqs6rupocORTaQKhgvxpira9yWvAE63AxgWO2SnPEYWy1Lgar60+D+9m7kWGbbUw==
X-Received: by 2002:adf:eace:0:b0:2cf:e3d0:2a43 with SMTP id o14-20020adfeace000000b002cfe3d02a43mr11015922wrn.4.1679921167038;
        Mon, 27 Mar 2023 05:46:07 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id x4-20020a1c7c04000000b003ee0d191539sm13662716wmc.10.2023.03.27.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:46:06 -0700 (PDT)
Date: Mon, 27 Mar 2023 17:46:04 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: outreachy@lists.linux.dev, Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: replace udelay() with usleep_range()
Message-ID: <ZCGQDLEsCr6dY6/e@khadija-virtual-machine>
References: <ZCGK4+zUDT1lLz6s@khadija-virtual-machine>
 <453453f4-1496-4735-8fab-efb7e4240e05@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <453453f4-1496-4735-8fab-efb7e4240e05@kili.mountain>

On Mon, Mar 27, 2023 at 03:25:43PM +0300, Dan Carpenter wrote:
> On Mon, Mar 27, 2023 at 05:24:03PM +0500, Khadija Kamran wrote:
> > Replace 'udelay()' with 'usleep_range()' with 1000us as upper limit.
> > This issue is reported by checkpatch.pl script.
> > 
> > CHECK: usleep_range is preferred over udelay; see
> > Documentation/timers/timers-howto.rst
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> 
> This kind of change requires you to test on the hardware and have
> slightly in depth knowledge of the spec.

Okay, thank you!

Regards,
Khadija


> 
> regards,
> dan carpenter
> 
