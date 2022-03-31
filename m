Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF4EA2D;
	Thu, 31 Mar 2022 16:59:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l7-20020a05600c1d0700b0038c99618859so2064337wms.2;
        Thu, 31 Mar 2022 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vrgHRAcGFYBW5//Px3FPaIXJFM+ziIQctDRECHM/5Yc=;
        b=L5mcU8fek7ltwjMyOO8VtBdjLOs6rCjrIcH1SxftOcNUCue44IkMbLx0FutOlIy9Gy
         678tQasKLTf8JXDUXlAw+pdCKki/CSbvtJcQYLW9o4sZs9wlmwzgAzh99PpGut4nG4Nr
         RdmGICjFxuXuEu/eaCSkEN2vfeWihguDKUEgDseKIZ2x+ENnyf4eFeJCik5OZYUGB0O0
         ihJudIy+wwooJad80VmxU4sXePSaQ2LDxtDBF6lQ5poJNMC77F7VM3VH+0TdzQsdAhFO
         LYXb2xvRsHAsnQudaJJNKBXt6HIXmpgu8aKngWU32vZwTEpwWepfIbmNH7s8IdlBe1v5
         0ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vrgHRAcGFYBW5//Px3FPaIXJFM+ziIQctDRECHM/5Yc=;
        b=niV5MTX8ubf6tptnfw1JKWnjUGATW2do336+e+vhEe4dUwLEmncID308EzAp2oIX8p
         OtB0qNML4i9BwKbyeGAjGvs4HI+GcyCaOq/KlMDC5NbN7iMNE9uV/sUqouTZDVdt8GAb
         VlI4FrvKCAlTDTitBaVY86D+69ASqVkVhipaobf7yb27FA7YDBsfAZzHGSnAgiWj0Tma
         vV1vAU8SaxIXPfEmMHREt6HHGcvtyf3ZRR6sLAUED20K+euegqt1J/u1cbbbCCCWnfUE
         Ly917jRpVM2PRsIQjEY04oX0mwokigDwPTYRiDtOAkdOb49unoqPoEw/Ugk7BcIDDjAB
         hbPg==
X-Gm-Message-State: AOAM53271cu1FZHa9Yp6W++iDdd8Zytti4EwWDrk6+qY+IeoCf39UuBy
	Zfguod5hFneCZvExsxrcMuA=
X-Google-Smtp-Source: ABdhPJyY9VFEb1OxfOzeK9H/V3w75Pxss7kmhEAc3nqyEsc2M5BH0HyOboimDEnBmqGNI8ZTgrH3CA==
X-Received: by 2002:a1c:4e18:0:b0:38c:bd8d:6bd9 with SMTP id g24-20020a1c4e18000000b0038cbd8d6bd9mr5410289wmh.94.1648745941467;
        Thu, 31 Mar 2022 09:59:01 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id d5-20020adfef85000000b00205b3945fdasm13858693wro.92.2022.03.31.09.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 09:59:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: sparmaintainer@unisys.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: unisys: Remove "struct dentry *eth_debugfs_dir"
Date: Thu, 31 Mar 2022 18:58:58 +0200
Message-ID: <5558288.DvuYhMxLoT@leap>
In-Reply-To: <20220331082202.GZ12805@kadam>
References: <20220331064751.29634-1-fmdefrancesco@gmail.com> <20220331082202.GZ12805@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On gioved? 31 marzo 2022 10:22:02 CEST Dan Carpenter wrote:
> On Thu, Mar 31, 2022 at 08:47:51AM +0200, Fabio M. De Francesco wrote:
> > There is no need for "struct dentry *eth_debugfs_dir" which is used for
> > debug / sysfs directories. Therefore, remove this "struct dentry" and
> > everything related (i.e., creation and removal).
> > 
> > As a side effect of this change, the code has no more need of the
> > "cleanup_register_netdev" label, which can also be removed.
> > 
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> > v1 - v2: Add a couple of "Suggested-by" tags which were forgotten. 
> > Thanks to Dan Carpenter and Greg Kroah-Hartman.
> > 
> 
> Thanks!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> regards,
> dan carpenter
> 
I've just noticed that visornic and visorhba do other calls to 
debugfs_create_dir() and debugfs_create_file() functions.

I'm not sure whether or not this driver still needs those other calls.

Do you think that they should be removed as well as it has been done 
in the patch above?

Thanks,

Fabio M. De Francesco



