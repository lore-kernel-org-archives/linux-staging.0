Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124518476
	for <linux-staging@lists.linux.dev>; Thu,  6 Apr 2023 15:06:34 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id 18so2141586ejo.13
        for <linux-staging@lists.linux.dev>; Thu, 06 Apr 2023 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680793593; x=1683385593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jpVWorwXOmwB6F9aalVF/BJLXYdyvcrGxRcPnrYyuGY=;
        b=Mq/ugyTreF1tq8eO1viaJiMjXXsdq1csjTuAMrBlPqXOtwE1uxjW/+HGWe2364Hq58
         +zdEpFb5xdsShlJiYKOqsenhVwfK9AMiL5HW1P9Dew8esiiPTyh/xZJgn946Od9skPdm
         Jkg2d1Mg2dbnFxmaVqAKmm4e7QzmiyMGZaugpC5GGPfCwgBe2XoK9mUD5YRu54kWSe7s
         ZN/s4P0XGE3ftLr889p1ivMrEc2GzxheqtdLERo9rVG3XcKNd1iUxwllDkFfFveanllP
         +MVT0d79C2Ev+vpDV6xb0Gc4QBChRY5a8aU6XsBZJCcyidoRlX+i9GTcpsRLgijRyPGt
         DG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680793593; x=1683385593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpVWorwXOmwB6F9aalVF/BJLXYdyvcrGxRcPnrYyuGY=;
        b=TZKEahqT0kef0Mgwc6bDEtcf5XsY0chaqV2QA6sjq2kfuStzIHbm8uqSq+DocxHong
         r1zfhuoQPdx5axQEwAeLW8s6V1OlJ5o25NzVcD2iQ7xBgUg2Wv0WgsII7WY0vWxmqVdH
         sTHhGg257j1X3oTLkhJCcnCPfwctdBIHlfbrZkMmkDMYqZRprWhRnI/DUJpK3hPq+QqP
         3mnfPQdqmS5VtUYmCXhAMKp+bxS+T/JTTTb3Nug1grEGK4lu+wm1upjXAk6I9VkhZJ+Y
         TpwJ2dy6dr8IKlJVFqaEHEhNDR3Uq5xSPw6wIkMK/EU3GWphj5gz/gFZN0slDvSnURZw
         uB+g==
X-Gm-Message-State: AAQBX9fOpxhcikVqOjxR07Y/ErnVlgYuh3gPoZO8LD+idUA5gVdzvDFc
	U9e/9phZx9oGPkmVP2v3rWM=
X-Google-Smtp-Source: AKy350bwkLXyJWEmQ5ppR9OTGGlu3H0nRdbtPmGaReJArAh1ETH2lWrPn2HUHAehrCEUaoIfSsjY9A==
X-Received: by 2002:a17:907:6c17:b0:931:6f5b:d284 with SMTP id rl23-20020a1709076c1700b009316f5bd284mr6443576ejc.57.1680793592963;
        Thu, 06 Apr 2023 08:06:32 -0700 (PDT)
Received: from localhost (h130e.n1.ips.mtn.co.ug. [41.210.147.14])
        by smtp.gmail.com with ESMTPSA id lr7-20020a170906fb8700b009476dafa705sm908185ejb.193.2023.04.06.08.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:06:32 -0700 (PDT)
Date: Thu, 6 Apr 2023 18:06:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Remove macro FILL_SEG
Message-ID: <bff9626d-095c-4bed-ae8b-2be50610aee7@kili.mountain>
References: <20230405150627.GA227254@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405150627.GA227254@sumitra.com>

On Wed, Apr 05, 2023 at 08:06:27AM -0700, Sumitra Sharma wrote:
> +	err = err || qlge_fill_seg_(fmsg, &dump->core_regs_seg_hdr, dump->mpi_core_regs);

I have not seen anyone do this before.  I sometimes see people do:

	err |= frob1();
	err |= frob2();
	err |= frob3();

I don't like this very much, but it basically works-ish...  I don't like
that it ORs all the errors together and that it continues after it has
errors.

Another idea would be to do:

	err = err ?: frob1();
	err = err ?: frob2();
	err = err ?: frob3();

BPF and networking have a couple place which do it this way so maybe
it's going to become trendy.

regards,
dan carpenter

