Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C99B45F55
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ5vNFtK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c9b95943beso61206655ad.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 12:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697658307; x=1698263107; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJVlIUOl8W19bUYlGTLgzwgWuuHldRueu5Ig9o95wVc=;
        b=XQ5vNFtKkOc9/mSXzKc7WCw9NFXf1Mji7qkYDXJ+nuGojumGG8vllMiCAu3kq914qM
         0WhuM0o/8qYgFT3wPMEUN8U0Yd2WGo87snPngCmzDaA8aGRof3CNMIKfqteOYl2qDn6S
         /R39HgI3medMEhu/9UK8yjyMvx2523UpFafCT4kUss2GcCz/RcM3dae0shjaPoGliKmo
         9X0GvtFFc0nPwkoeSdj0bfry4xIwfI/Cq8Y9h3Q9EwolyfOp8yjHi2F8nrbnSsfOv6UN
         qNYFF6rBo9hwj8SWtGSUKN9J2+e7OklJltr0dYe9fYO76kdTiYXmpH+nS0yshpx43HzR
         nAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697658307; x=1698263107;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJVlIUOl8W19bUYlGTLgzwgWuuHldRueu5Ig9o95wVc=;
        b=eVoPZoM42UAc/FlRSaj3SNCfDdBS8FW6lJVhTMsoOoDYaZuueyvV3/GAwRNRN7T8Oi
         on0m5ZuhPxK2Qd/aZ5IeErSwgFY5tGJeWs0jBPs7z744jqtcWfQO9OYq6+xYyRYmT7E+
         DCDQAaCb+2IDEI2OkSFN+49cJ4oRaGzOaLtBQ2vRIrQM3VXTX47bMWxuYu+D4wb8Ex+l
         EKATdsnsKBXvNSMrID2kMCKwEQZipkRrbBRI1JTASGHdnX8rUfIRyu9Nd1fIw6eP+ygQ
         Qd9UL39eLXUBnet3/9qunBkIklo/vZvmW2h+3a5Uc+P7AKDiKHZA8D5Fc1AvTTjIKk4n
         Egkg==
X-Gm-Message-State: AOJu0Yy/fi+twgSNrZFGZWXLCOkFgHl/GYoxVqkyym7Z+YYYVfyiwprf
	DNMcTnvOp4dszwlfIsrzd5g=
X-Google-Smtp-Source: AGHT+IEnw2GODP2TQr19/yPsWRkrHfroOFGXjYru419Vfac6A+miAjMgQVaT1L7BpSorND7kMv9b5w==
X-Received: by 2002:a17:902:7590:b0:1bf:4a1f:2b57 with SMTP id j16-20020a170902759000b001bf4a1f2b57mr366891pll.13.1697658307146;
        Wed, 18 Oct 2023 12:45:07 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id f18-20020a170902ce9200b001bc18e579aesm305786plg.101.2023.10.18.12.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 12:45:06 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:45:01 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH v2 0/2] staging: qlge: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <cover.1697657604.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset performs code cleanup in qlge driver as per
linux coding style and may be applied in any sequence.

v2: Ammended wording in subject line for all the patches
    Suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Nandha Kumar Singaram (2):
  staging: qlge: Fix coding style in qlge.h
  staging: qlge: Prefer using the BIT macro

 drivers/staging/qlge/qlge.h      | 388 +++++++++++++++----------------
 drivers/staging/qlge/qlge_main.c |   8 +-
 drivers/staging/qlge/qlge_mpi.c  |   2 +-
 3 files changed, 199 insertions(+), 199 deletions(-)

-- 
2.25.1

