Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439102F3A
	for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 22:27:14 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-991c786369cso330164166b.1
        for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 15:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693175232; x=1693780032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5YbIHdhv+mU6ZQ/4jyYH5LBYMtEme8GL5cG7vGjkPQA=;
        b=IJvWkDX/VaqY1Cj5/4UO7pdMR2l41xGdi8dCKtPzeybTZw/AuvEnxj9dItxaWsHLrU
         QWKxwFweURZNVi73rOqvHjqtsX5ZNA+UpMfeX8V62Ppb/jSblA8t3pIVNBBCef3ggBcT
         XBFRYhGnwsaYRYhbiNOYTwOECtwGhGq8RB27okVXCquHqb5cIlpI5lf0znDdrbuRaunC
         /remlutxzn44A+odzV2dWBO8WUK4Xgkt9Os98FPjLbXHetqHQ1Fbc8TYZMusZBh9tNG8
         U36zcpWWFCvbEatDkCW5lx1b/giB48KYVJssLzIX3f4Bwhy5BhO6UDTYDEwer1jiyQqm
         qEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693175232; x=1693780032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YbIHdhv+mU6ZQ/4jyYH5LBYMtEme8GL5cG7vGjkPQA=;
        b=h2OY0RQX3Xpb+jTMrYmpf8KsY9pMh87PIlfRgL8HcG7nsvDGeqm8485FSaHVdwcHWB
         s5tiGPpVGkxF/IkeQ09faHYSrnPU/pcxnP+6iG3SO8WnQ7BprS2djKxRtT9XNi+MFYo0
         SATkiwYJy7EI4SL6g/mMc9MsbhTyZFzmmO25yIUET9ZF3I+JFVMSk/HtL+y2pZaZLIfc
         KYV0x3wR4VsKcjob3e2Isdm7XvSSuN6SZ16gLszoRkxJN6jimTvG7EzTTVU22HvbMlEC
         G3B0VG1N3bzjsoDuRpa34Hl/Osaw0VAVUmWUo43lu97VTI6sm713Q+ABdRNXPzHAdZqK
         Su5w==
X-Gm-Message-State: AOJu0YyeTaT/A2DCnPV34PBhdIlj782YE524eJdEn8af351rFwzIEEjR
	JMX0vGAsMZDJCPuq/0ITVwPFAuaoobg=
X-Google-Smtp-Source: AGHT+IE/f9vLn93SlidftzfnBTAqmuoN2lz7DeJrY36pahuG1SeuBIhpVCeqdqIolBpwwJvceI0Vvg==
X-Received: by 2002:a17:907:7602:b0:9a1:d400:39e7 with SMTP id jx2-20020a170907760200b009a1d40039e7mr10522197ejc.5.1693175231739;
        Sun, 27 Aug 2023 15:27:11 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090699d000b0099315454e76sm3842680ejn.211.2023.08.27.15.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 15:27:11 -0700 (PDT)
Date: Mon, 28 Aug 2023 00:27:10 +0200
From: Nam Cao <namcaov@gmail.com>
To: Oliver Crumrine <ozlinux@hotmail.com>
Cc: gregkh@linuxfoundation.org, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/6] staging: octeon: clean up the octeon ethernet driver
Message-ID: <ZOvNvkRJstLt4ghx@nam-dell>
References: <PH7PR11MB76436F3A05897D8F8DC9F967BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB76436F3A05897D8F8DC9F967BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>

On Sun, Aug 27, 2023 at 05:12:04PM -0400, Oliver Crumrine wrote:
> Make the octeon ethernet driver better adhere to the
> kernel coding standard
> 
> Signed-off-by: Oliver Crumrine <ozlinux@hotmail.com>

See this conversation about a similar mistake that you also made with your
patch series:
https://lore.kernel.org/linux-staging/ZOpq4t22iRXewekD@alolivei-thinkpadt480s.gru.csb/T/#t

Best regards,
Nam
