Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023F27F
	for <linux-staging@lists.linux.dev>; Mon, 26 Jun 2023 13:01:11 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3113da5260dso2735274f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Jun 2023 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687784470; x=1690376470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PRFMtW1n5WTYQjYvVy/I9g/WOAZN488DDgX8HS+qDGc=;
        b=Jrz1KAMAKfMtJJsQH6PyeitwpJnwbJBDFkHRjFASqFOFrua68iYG5NJNX1SZ6Lyb6t
         Vp2ecpdBSPh68DWhtDeEqY4LgYXB+1/LBxmHE8xpgfl9/8k//O04MiYqNcu3XnZA4Jty
         f3k0vA1YBFa9sMaumBZY6ff25exH4+izejZHjGQBmgxeDQJK2wlDdDUfpeSzXgBj92nD
         4/uEr4SgdvOfwFejTqapjzsoPku8niMKfS4THYXhpIRL4sdQEBJT+yUKBuTVEDyKJ9Xi
         ZjUmqJPdD9YZ0qVkh3U1Ub73VLZYreKw5pfrvwPt8nRNZB2PxpvuEcpJDeaMRBFUTe4W
         H4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687784470; x=1690376470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRFMtW1n5WTYQjYvVy/I9g/WOAZN488DDgX8HS+qDGc=;
        b=lzasskBktZeLCdr/a6z+K7lhB9il1zDS6kUwfrsKY8lVJJkXa+sIrnF59c1U0uIEDS
         PJc4NWugD/FENEokKgCZsfv9Xz5LiQZOPhz3FSKTe/VPCPkpPGU3lAPgL8p8fv33aj/E
         AHBr6wW3CX03ksMtzTrxMpEV1L6SkGk2dl/szFJoBXVCsywhNbpBWwh08NIJoQwY5m/K
         t4/o/jE8VYxe7xNt2VKO9fkv3TKrB3exiWJdiofqxTzCsukSCIrpqkHCQVxsJDGApc9o
         Y4PM3SLuIBTiOPeraIdmt8hrvs9gqCSyPt1Q2EJ/byKK3+62mHedmOttLHj+a8/5lAw3
         u7fA==
X-Gm-Message-State: AC+VfDzJZLKxm3a3Cec0gonuwUObn8O2QFJsh+spuMtulTr3vGTFFIDd
	fnduAwWXiCfVMbK0F/NnSEOACuUX6o399tXUzb0=
X-Google-Smtp-Source: ACHHUZ6RIDygr3u+3XCSH//4Wvdyamoykdy3IJ7M9oTa5bNTdhSKtq/rdDRfYml9nEsfvcZsmswFMQ==
X-Received: by 2002:a5d:68c6:0:b0:313:e952:e500 with SMTP id p6-20020a5d68c6000000b00313e952e500mr2855606wrw.7.1687784469960;
        Mon, 26 Jun 2023 06:01:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i18-20020a5d5232000000b003047ae72b14sm7373703wra.82.2023.06.26.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:01:08 -0700 (PDT)
Date: Mon, 26 Jun 2023 16:01:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uros Milojkovic <uroshm@gmail.com>
Cc: linux-kernel@vger.kernel.org, marvin24@gmx.de, p.zabel@pengutronix.de,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: udelay to usleep_range
Message-ID: <b7319d00-d8db-4e8b-9143-7926f8a34fbe@kadam.mountain>
References: <CAP=xWk6GvVQxzTJ6jS2pQ9dKvgoFFHc=m4yMma101MGKgdcm5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP=xWk6GvVQxzTJ6jS2pQ9dKvgoFFHc=m4yMma101MGKgdcm5A@mail.gmail.com>

On Sun, Jun 25, 2023 at 02:55:35PM -0400, Uros Milojkovic wrote:
> Checkpatch pl alerts that usleep_range is preferred to udelay. The
> change is made.
> Signed-off-by: umilojkovic <uroshm@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 2823cacde130..8bb3b691d1f5 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -627,7 +627,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>          break;
>      case 2:        /* first byte after command */
>          if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -            udelay(33);
> +            usleep_range(33, 200);

These kind of patches are only allowed if you have actually tested it
on real hardware.

>              if (nvec->rx->data[0] != 0x01) {
>                  dev_err(nvec->dev,
>                      "Read without prior read command\n");

regards,
dan carpenter

