Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFBB11C9D
	for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 14:17:20 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-500b3f7f336so2533765e87.1
        for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693232238; x=1693837038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=znr7jcRrSJ1Rtj66K8AVDTql7nVoIVkV95oWwStm0/Y=;
        b=rXj/RLREkCMeOmmFTqEHO1MePaKjNZOirGnqEMoPdKn/eURsSaLlxCeKxePVKJ+qGt
         +uqH/oZJYdX0B0Q15s2kzDNraQS9EQDJ38mwix3OM6oVglg+6boNjfTpnBauORSs+RW6
         KY/J6Pe3CmyBfvVCzwqViELtWqrRFnH3LB3U2AZrUsV1wgbmtrq0GNskIlOqAmsvwkMj
         JpEazsTojokjE3hk5gDyFuDZJHFi1aBLu5A3BbOTI/Dk0ri92vTzmAOTcGRdhwbJRROx
         9bdURRf4OxODf+0xG5bBGqV9C4V0QnB5OlHRF1fzPBOkG93rMm9gm0SZpkUUoqzbIZJu
         clhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693232238; x=1693837038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znr7jcRrSJ1Rtj66K8AVDTql7nVoIVkV95oWwStm0/Y=;
        b=JXK4eO62+HC/0dcvy12v3GHEgxKJHG/92q/O3d1DsO3/LcI1DCXmwJciLvTL1vt9yI
         QZ/Clnw8unYCLbJiWE71YFNc1OoowrfU8FInAlpl6F6NIyZRXIylBfVBRzyrQ8yMMxz0
         GUZVzsUvUFGF6RzAt33oAftIsuIrLA3BFTGyCdIDU3rMRWEF6DWml/JztQgQe3LSUMJ2
         6qBoMadjyEf7PXQQ/PILszzIrtxJT2NnweiufIP5Mdyf8mjpfLDLeACEX46euQMzZ5uO
         2LbQikK6DLNrr3w/uz4Qr4XIUsX7QcSfxTV7I1C7osiL/2hVuG1bAQT0wFuGwH17ODPS
         O2cQ==
X-Gm-Message-State: AOJu0YwcygzwcMFgtiGmMwGl8hMXvpHWwRF16kGZONvcuEZp1XXRGdCg
	ae8MBg3d8Ijb3dNQkMhwxBPtCnMsMx0=
X-Google-Smtp-Source: AGHT+IGUpROOCsmb9my59ywO3DgU8ggD7WyvJYhxzdr19qAh981l8KPVz1/jicIv3oTHCgX+JHJC6w==
X-Received: by 2002:ac2:551b:0:b0:500:9a29:bcb0 with SMTP id j27-20020ac2551b000000b005009a29bcb0mr9735911lfk.42.1693232238074;
        Mon, 28 Aug 2023 07:17:18 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id n25-20020a05640206d900b0052a1c0c859asm4509324edy.59.2023.08.28.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 07:17:17 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:17:16 +0200
From: Nam Cao <namcaov@gmail.com>
To: Oliver Crumrine <ozlinux@hotmail.com>
Cc: gregkh@linuxfoundation.org, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/6] staging: octeon: clean up the octeon ethernet
 driver
Message-ID: <ZOysbIihBA5ZMGc9@nam-dell>
References: <PH7PR11MB7643280D48E45D2B660F5B6CBCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB7643280D48E45D2B660F5B6CBCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>

On Mon, Aug 28, 2023 at 09:39:13AM -0400, Oliver Crumrine wrote:
> Make the octeon ethernet driver better conform to the linux kernel coding standards
> 
> Oliver Crumrine (6):
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver
>   staging: octeon: clean up the octeon ethernet driver
> 
>  drivers/staging/octeon/ethernet.c     |  6 ++--
>  drivers/staging/octeon/octeon-stubs.h | 50 +++++++++++++--------------
>  2 files changed, 28 insertions(+), 28 deletions(-)
> 
> -- 
> 2.39.3
>

The patches themselves should also be sent with this cover letter. Instead they
are sent in a different thread :(

Best regards,
Nam 
