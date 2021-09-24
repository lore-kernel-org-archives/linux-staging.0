Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1B72
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:37:57 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id eg28so35764067edb.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=emF/n89T1EgeKKKG223R4wP2lObDfuVVuJMX8gbpTGg=;
        b=IhOFpZiqx5m+PHXyfrLCKxrb5rlM6BZ0QgtBJGuTAdyYzmWKRTyLura98cCGiaIHZS
         jlPkx/8zrBtddV5UszUVygKSCMI/s1fNd15WA3dTwdIH+WcZ9LBocvIxZrz6n7qURGjt
         qRHQX3XmJfPM1P9jUc0nxs850AkVfD3ryDWynjJ0gxFEAwSdRbO1dIVjj3Nj/920PQmK
         /Vaa1XlxDZETi4Vl1Pk0GOWeoHoemheESThVElUHlHTlD8Ww+fn2sbbsfdb7jXBQ/vJZ
         JrYKyuifZDeRVCoV4c1/eEbyJeCZDlM7CFXzyR6kudydozTjClQRJRYoRswf8fCAzFle
         WJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emF/n89T1EgeKKKG223R4wP2lObDfuVVuJMX8gbpTGg=;
        b=iDChA3AlALeguspTH0hre7OS0E2Ic4CFrh53L/elOgyjX4P7odGq9Vbb9/1QjBDOLl
         yoqqTOgglGiNmlNTH+gw661aG4jyqqDpu6mIk2Rczp71OrmUtxZDJKXeily0MMqCDFhW
         yZaJwmt22afBAlTkLsRkXpqpK31jkmqo82D2rnG40c+ZCxMA6i0aqboFnNUGZawv63EE
         eHtU6Go4TWsWjvy9plc2ULzdAv2RKm023tEk6DB5B2nh6g8y1NhTVMY/rapHtnWrcUt3
         GcrIlgnbG5QY0Jf0AXhKoCQH2eYzQBkuQakJuUjnRPer7OvvJaTa7lPdBss0JK6hlvgE
         OGFA==
X-Gm-Message-State: AOAM531c4Vb/KUNyKB5OUKXm1peHuNw6heYq9nqmxAwJRz7tWd+qP60y
	8wF+2bZENrLCpvkfzO6HoT4=
X-Google-Smtp-Source: ABdhPJyH/ccPOQC9ctRvzI44Il3JY6Sbmi+VC4LSE8JbSSFrM69KEvgCxuwfhEDsfHZzteyteA/T2A==
X-Received: by 2002:a17:906:c251:: with SMTP id bl17mr10743963ejb.219.1632487075519;
        Fri, 24 Sep 2021 05:37:55 -0700 (PDT)
Received: from localhost.localdomain (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id ca4sm4995920ejb.1.2021.09.24.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:37:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>, Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v9 10/16] staging: r8188eu: shorten and simplify calls chains
Date: Fri, 24 Sep 2021 14:37:52 +0200
Message-ID: <1836626.W0nMHyKdkH@localhost.localdomain>
In-Reply-To: <20210924122705.3781-1-fmdefrancesco@gmail.com>
References: <20210924122705.3781-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, September 24, 2021 2:26:49 PM CEST Fabio M. De Francesco wrote:
> --- Preface ---
> 
> This is v10 of "shorten and simplify calls chain". The 14 (v7) + 2 (v8) 
> patches have already been applied to staging-testing, so we have been 
> requested to reset the numbering of the remaining patches to 01/16, while 
> discarding from v9 the above-mentioned 16 patches (otherwise we would
> have submitted a series containing 32 patches, that is 1 patch less than
> v8 because it has been dropped by us in what we considered it
> unnecessary - it was about fixing a misspelled word in a comment).

Hello all,

Please disregard this weird cover. I don't know how I've been able to make 
the mess you see in the subject. The good one has been sent soon after this.
And please, let me know if it is necessary to resend in order to have the 
cover letter as the first email of the thread.

Thanks,

Fabio




