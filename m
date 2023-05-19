Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94DA6ABF
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:09:38 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f4c6c4b51eso29471255e9.2
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684490977; x=1687082977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qJlEOvjOYMzVHa6nkNTyqakYgS1PMcSlu4GwECBSsAg=;
        b=IVx5j+UggibN8TcmUU1ozNMKzNQaoHNCQhDJFR/dFNQVgevyOIMwL5Taw6dhV4lKJu
         OnRQ6UdEgtosHxufuS/2w+qouJ3OJqS6TxVBJ9CftfqbSiNEb4sINRpB4eqehULeIs1A
         +eQLCSMzy9NldqcWwXjNlnGQXhSW2fV+d2sTXFQsLWhqqHlcRDxcFh3rgoLStL/o6SKF
         ubRB3qoxxPPy/VmF459/b8krXol1OXV8JTrf6wh03tHUbsAhdScCb4R4wLk4l2CgnrrU
         l+6URWDZ046rxebSPuFqFis9oWUv+rdE84HVm3fK2ZFPD9mC5MsQ13LD0d8rmel6Sj+o
         7A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490977; x=1687082977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJlEOvjOYMzVHa6nkNTyqakYgS1PMcSlu4GwECBSsAg=;
        b=JwUnzjy9dTO5yPH6j+r2xuEGQ46gTvLW3tK7R9ChiUvClMuuauhlGJrBj9siQYTA3b
         WpplCCw7OfRnKDgmUwhT0nYg+mbZ+2cUG91M4Y/nnAbctEGbweRKW8aVuEsW7Vx7sBhu
         6yTnd2/b3zRQpJCLVW3onFJ/F6/Lbcb0Zyhv9/VXCceTRslGYwaAD0eI7rTjIKTETuVB
         d2BNlvAHqk4XibVdy/MPyEdLuLZJUeM4M9KmBZimosRRpAn2sTCvuqZ7XfT8dZZBIymy
         AtVqAvNZ1647hKm/6KwIkJK94h4FVQVyPf1kcbi9xdw+6Z8xp1uS1KdnNXmG2AJcPL35
         qwsw==
X-Gm-Message-State: AC+VfDz8HIz+OktSKXY4j7HPo6i++NUynUp8SO+Yykb6h6w3WtZbKoFF
	We8QfGarAbud4CVYgvqRcaKzFtTgYyEZxtqoWyE=
X-Google-Smtp-Source: ACHHUZ5WGSwQQ7EEO1V31pVH0j2pTxUgl+1Bv1Lk9gY0K2gUi29/J53PK5LFtcZKjUtEBt74c42wwQ==
X-Received: by 2002:a1c:7908:0:b0:3f4:2254:bd86 with SMTP id l8-20020a1c7908000000b003f42254bd86mr999177wme.8.1684490977014;
        Fri, 19 May 2023 03:09:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n8-20020a1c7208000000b003f50876905dsm1920690wmc.6.2023.05.19.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:09:35 -0700 (PDT)
Date: Fri, 19 May 2023 13:09:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] [PATCH v2] Staging: rts5208: rtsx: Moved else statement
 to same line with else if
Message-ID: <f82a3d65-8c01-4537-9ec6-bd6fca5d84c9@kili.mountain>
References: <20230519100119.25482-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519100119.25482-1-kartikey406@gmail.com>

On Fri, May 19, 2023 at 03:31:19PM +0530, Deepanshu Kartikey wrote:
> Moved else statement to same line with else if,
> this warning was given by checkpatch.pl
> 
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> 
> ...
> Changes in V2:
>     - Moved else to the same line with else if
>     - Moved comment on else statement to inside of it
> ---
>  drivers/staging/rts5208/rtsx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Please read my blog about how to resend a patch.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

