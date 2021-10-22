Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E2D2C8B
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 10:10:34 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id w19so8294edd.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bv15z/HDZ35Wd616+xa+/jpdcT0apCXDkRvFnPklDls=;
        b=kiBdR54mITSRu5ns86DVh4gDUSrpfWCfMqH81je5wJYnJBlwI6wTR6qROG2sVgA7XZ
         cP8jzHgXCwaBav1WCCtK2/nHT2AZ2KMU5CAFsuNIDjPqpq6H0eddxRe5nImRDcWo2Nx0
         fGCqgD6vdO51CullAoKmny5za7gl/w8ZaRGLnUrt5Vj6Dd45Xs8JT6iW+IcO4BNtm9ze
         tPzluTmQNiLcN3CLTjUK1fFaD/dEN6rF39nfSnLzuzb7SOLcE0wuJCwA2J34r2r35DoB
         e11pgCEw/jDNHVMaSrksPxYPJOaFljksSEkTlXE0TRSUudv1VNecQky5a+lLUgG/c7Df
         btPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bv15z/HDZ35Wd616+xa+/jpdcT0apCXDkRvFnPklDls=;
        b=W6YWmef66eTtlLcvRKprWt4Nn8fATKEIzkKgtb5soB0uME8Frda3naQnOSyYCHhrjE
         9RsmHaWzIlh1bdh75scMvfRyNI0RiTmmY9of4Rx7xaBcB33MubUX5Pn6lZJLjROpV3kY
         v5SiaEVutVza9QB0Dj15ycEnfOMdgYWEeo9yqamsZLNGAa7k+OkIxVfhL/ielCo7sLgV
         jdieNynQ6mTd0odDNOWTEv1Xl94GlRcvMePIp+HoAVJKYh3AsHC+W6a3rAH351uu1B8r
         Jzxkxtkvc4/a2U1GHkQLxwl8pYnAS1Ap/S2/25ZfGRHYbIxvn50jNjtT5g0fpvovLisP
         pRQQ==
X-Gm-Message-State: AOAM533Q+JpApjX34GJ25RTfmJdCz93mQH1Ycdqtf27MGY2XruQEtgHf
	TNn9SXwo8qd1WNB32cbn4bk=
X-Google-Smtp-Source: ABdhPJyF4xoqdQfZaEt/p+BZgolJWRosGplKMdH3wi6wgMgnFEKwIFh0kfg8aY/4NVVLVe76gtzWDA==
X-Received: by 2002:a17:906:3542:: with SMTP id s2mr14081859eja.379.1634897431731;
        Fri, 22 Oct 2021 03:10:31 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.retail.telecomitalia.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id j15sm4243446edl.34.2021.10.22.03.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 03:10:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 0/2] staging: r8188eu: Remove unused semaphores 
Date: Fri, 22 Oct 2021 12:10:26 +0200
Message-Id: <20211022101028.30367-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove two unused semaphores.

v1 => v2: Add missing subsystem / driver name in cover letter.

Fabio M. De Francesco (2):
  staging: r8188eu: Remove initialized but unused semaphore
  staging: r8188eu: Remove unused semaphore "io_retevt"

 drivers/staging/r8188eu/core/rtw_xmit.c      | 1 -
 drivers/staging/r8188eu/include/osdep_intf.h | 1 -
 drivers/staging/r8188eu/include/rtw_xmit.h   | 1 -
 3 files changed, 3 deletions(-)

-- 
2.33.1

