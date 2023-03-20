Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C17E1383;
	Mon, 20 Mar 2023 08:44:29 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso12964239pjc.1;
        Mon, 20 Mar 2023 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679301869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gs8rcm/d7d5rUf8zE5Zuo/A8IdhoZtRoqNxyEktI7DU=;
        b=D1Zmcz+v1MK/aSof4oDyzd7q1lx9K9HTk27r+LV6Lh1C3y/VPTkYrWUQMA/OMPpcKU
         we08QnxWPTFCyvkjbDwhE3gvfDeg2Jn0RzBP4V+/2fH0eNEg36YInV9OONtM4o6Dh3x5
         qXABGpInu9pkf6OBcanjeGCD6sMY50g9QkfUk2RT3Igek5ixe3O75VESxkXnrq00JXyr
         9Cs6qlykNDGCbrYqav6bfOyJ82b9huN0+x0ahdhTu3wnkJNC2whpCfZf6e0MOZHAtgBi
         VO8GxL4tZ1h9YYEM6GnojpOykTBVhIcWmpVO+SHsjNgsnvFU+NBzkK4GWrBATqH6zCwk
         gUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679301869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gs8rcm/d7d5rUf8zE5Zuo/A8IdhoZtRoqNxyEktI7DU=;
        b=uyF/ouiu2TBNKsfEso78pw6P3CPhbnkPJlPoo5jaNi0ZwNkPehikDmgvrGSghu9oed
         X18ztQm+vtLYcTwgKOBiCVegb7bAGVjqnZYoeyMi2+nkztN5v1j47BT9OkMtcPU8wcPQ
         wg7UjeROifAH2h86M2qnW9MvvX51TR1/QODlRNqpj74nxbjxLfCjEqaF7FwQS0Obz2QQ
         qaJiBKJHwnaw+n+FrkVgkqHvVtK5u0GXwPQshJSyGtCv6DrFe1W6GFp1h0lu1vYwzlQH
         /5kTschXCJ5+9ZXIy/pLoC9n2AnH/GO65/JmBWXjUm26slLFglNyjnLiqh4eOF/9huO+
         HmZw==
X-Gm-Message-State: AO0yUKV7/yq51sn5zioHAZNyCm0mXZJbKE0C8CP5X3jol0Y0A8lANZ7H
	1ESB74t833E1XSoNOEIt980=
X-Google-Smtp-Source: AK7set/c7pstRRWuhurf3gUuxnXwtKb1375FG/fOeRr1dGCOpfdeRb7/xUqrWb2ye0HQRVT8Xbwv3w==
X-Received: by 2002:a17:902:e742:b0:19f:7977:c9d6 with SMTP id p2-20020a170902e74200b0019f7977c9d6mr18905610plf.28.1679301869033;
        Mon, 20 Mar 2023 01:44:29 -0700 (PDT)
Received: from sumitra.com ([210.212.97.176])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902b70400b001a1c2eb3950sm2847455pls.22.2023.03.20.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 01:44:27 -0700 (PDT)
Date: Mon, 20 Mar 2023 01:44:22 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] Staging: nvec: Convert to_nvec_led from a macro to an
 inline function
Message-ID: <20230320084422.GA126429@sumitra.com>
References: <20230318175250.GA49618@sumitra.com>
 <417e944c-4653-43ef-b492-c82c536e4d87@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <417e944c-4653-43ef-b492-c82c536e4d87@kili.mountain>

On Mon, Mar 20, 2023 at 08:39:49AM +0300, Dan Carpenter wrote:
> On Sat, Mar 18, 2023 at 10:52:50AM -0700, Sumitra Sharma wrote:
> > Convert to_nvec_led from a macro to a static inline function, to make the
> > relevant types apparent in the definition and to benefit from the type
> > checking performed by the compiler at call sites.
> > 
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > ---
> 
> You need to compile test your changes.
>

Hi dan,

I am facing problems in creating modules and in compiling them.

Any help in this would be appreciated. Here is the link to the thread https://lore.kernel.org/outreachy/alpine.DEB.2.22.394.2303191336090.2867@hadrien/T/#t

Regards,

Sumitra

> regards,
> dan carpenter
> 
