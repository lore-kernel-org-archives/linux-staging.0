Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F241CA8B;
	Sat, 14 Oct 2023 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elmvFboa"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3573e6dd79bso12461015ab.2;
        Sat, 14 Oct 2023 13:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697313763; x=1697918563; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuUrYpvnqDMxLzTPZKkvRFwxUirANKIHNsy0NE09+KA=;
        b=elmvFboalsJIxXy6rWpg4WieOLC0YRVOipmb8mscSLZm3l838wiCxsMgihMoozMp1k
         rXjOEnMRSLq21SQgWD0xE78S5LUtxFGUh0hAKuDs6sX2B0IvYSF/38zT9LRucHC7FuLp
         nm2clTnsXSqZrtBClxY0ZtRW+bhWa47hNW+9U661j9alzaX7dji+hjI9+xrpbmEg8sXO
         ahwNoaNdu9ISKNmJzSCzQFVg9OaeP9Se/JxSGDMP5/HAGXHkvHnWDtjzniyoHQyxZgdI
         SW3Lxw5KpwO8jJn6WW+aQXrj5ZNUfXjs387rbR+r4UcOo3DIcUjEkM/5yYc1dsCA+QRG
         aijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697313763; x=1697918563;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuUrYpvnqDMxLzTPZKkvRFwxUirANKIHNsy0NE09+KA=;
        b=cIKEZSBdYZw5IY0HeOp9QQs6v9FM4AdxfGbLQPSplZTKH9LRRXw8LXzfqR8XjUsBMe
         RKHJT2tMlDMkpslojaJacskJR80UXRGEqfUx86HsSUzVSerSir3DmrRzFkAtF9h/kqr+
         6gzPsbFUQv3IpVhud8eoT7MCDkihRaPP9VU5l6CMcgi//lE/G3Ph8y+Bo07Se+YHKL0K
         4afx133dvnYDgsT93BqY9oNTIv0lKXfoaKSeuSeXwQxh+LDdgOYGQ9GNhzvVuprdKpZQ
         xRxBYRSR3nbx02ufRxINsTTR+Z50kwuBZZa+qkkDcKetVWry859a+sEDLr6dYoIHJ/SY
         TXfA==
X-Gm-Message-State: AOJu0Yz411LskwqbQYMNENGXGk5BKi+bK2l302b3SnbdTmAcpsvn0+5a
	/w5dXEZ5anh73rqmus4Yn8Gkd40kaOTVAg==
X-Google-Smtp-Source: AGHT+IHUbuZbMaT4g/6Kg6pA4EQGMHR1Ur43zi07zof3jJPeXKvSW3OtE+/h0wBWLhgGmPzGUlk+Tw==
X-Received: by 2002:a05:6e02:2189:b0:34f:e4e1:b4aa with SMTP id j9-20020a056e02218900b0034fe4e1b4aamr35858798ila.14.1697313763610;
        Sat, 14 Oct 2023 13:02:43 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b001c72f4334afsm5903041plc.20.2023.10.14.13.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 13:02:43 -0700 (PDT)
Date: Sat, 14 Oct 2023 13:02:42 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/4] staging: vme_user: Coding style cleanup patches
Message-ID: <20231014200241.GA20874@Negi>
References: <cover.1697240381.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697240381.git.soumya.negi97@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Oct 13, 2023 at 04:47:12PM -0700, Soumya Negi wrote:
> This patchset performs trivial code cleanups on the driver 
> staging/vme_user to improve code readability. All patches address 
> issues reported by checkpatch.pl, and may be applied in any sequence.

I have made a mistake here in the cover letter message. These patches need to
be applied in order. I think I will have to send a v2. Will hold off on
sending it just in case any other problems are pointed out by someone after 
review.  

Regards,
Soumya

> Soumya Negi (4):
>   staging: vme_user: Correct spelling mistakes in comments
>   staging: vme_user: Fix unbalanced {} in if-else blocks
>   staging: vme_user: Add spaces around '*'
>   staging: vme_user: Add spaces around '<<' operator
> 
>  drivers/staging/vme_user/vme.c        |   7 +-
>  drivers/staging/vme_user/vme.h        |   2 +-
>  drivers/staging/vme_user/vme_tsi148.c |   7 +-
>  drivers/staging/vme_user/vme_tsi148.h | 548 +++++++++++++-------------
>  4 files changed, 283 insertions(+), 281 deletions(-)
> 
> -- 
> 2.42.0
> 
