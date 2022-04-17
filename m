Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A322C9D;
	Sun, 17 Apr 2022 20:49:54 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id e22so9820127qvf.9;
        Sun, 17 Apr 2022 13:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ofmszlcyf7yX+uAYXy8RK5mMYEQfM2GF5ksPIibzvA4=;
        b=mQ4y6rZsU8aFE+nbIUOJM99oQjKbOER5NGwNRqBddx9G1u9vf1Ua0z4tJIYvcwKsxz
         xbXbPWsYRFwnaKfPzn/iM7Kp6K4nx1cY1JbRLx+Ybo6H/6Y5yiyeTsyHvdNmSiG33qJB
         GNOJKP3IX2WHx6PNMv/bffy6MtuCBNfoTE0wH9d5M17lAOCO6trcbAWRmChjzUieEKnJ
         TYsr+t1S4i7X2yCfGmVPxevvannGkOZDt2/b2AaYoPtKNm6nDLYPTKOi1wBOAUaIVMVJ
         /nxGPLT/RyQ9iT9Go/8n/Fy5zpJ/izXN7sXu30IsFFS99FNlQi4OLdiNjlNcNQCcq3ig
         NIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ofmszlcyf7yX+uAYXy8RK5mMYEQfM2GF5ksPIibzvA4=;
        b=kNs35xXIxLnklKffRrIEJjzjGD6oWAqf/I7yi2s0u9FWr+gVAswL6OQuoC9dTikeKE
         lGnllPCxVhBwV4tgTKKCL1lz4qbWDnP+6Em214hVJTJ7piqlmOSHk1WPjc6xbR7V7YaJ
         lQjA8s1zJ8UAYfFmb+wQxWTv2Ut1nGG3XgCB1Vg0HNn5Yo9p/oFLj6Seod0FlEKbqBxF
         qFp/C/VFplDc/A4JpmtXqNyNZNPePWBnoUDP7BYSG8+XzXdeonxlIJsW+iQk1120WSZO
         vlW5QFzhv7WIT5ETPsxi7YkHhzr4o6Jjdu2bGdSiLwUDsyN+CuSYWmmtsU7ziXDmErna
         UOEw==
X-Gm-Message-State: AOAM531FxrTIQq/LN0i53kWqh0pKjp7xjvt+z/EKKFluXoCxFD+31V+H
	zpDpvgwLNPcSC4bMjHsMr4NcfsiqSH2rMSRS
X-Google-Smtp-Source: ABdhPJyAqe9ETikkHL2arPI2VeYUke76O3gh94yEez1/EUSyYufKF2PW7+QnRLUyXwTDctursVwsxw==
X-Received: by 2002:ad4:5969:0:b0:446:636c:9fb1 with SMTP id eq9-20020ad45969000000b00446636c9fb1mr320373qvb.88.1650228593048;
        Sun, 17 Apr 2022 13:49:53 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50e6:61ed:4df2:ed9f:52ea:476e])
        by smtp.gmail.com with ESMTPSA id o21-20020a05620a0d5500b0069c59fae1a5sm5552385qkl.96.2022.04.17.13.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 13:49:52 -0700 (PDT)
Date: Sun, 17 Apr 2022 16:49:49 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH v2 3/6] staging: r8188eu: remove 'added by' author
 comments
Message-ID: <20220417204949.GA238538@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649990500.git.jhpark1013@gmail.com>
 <c0eaa7cbc61d89967d81ef864c1a791f4adb1978.1649990500.git.jhpark1013@gmail.com>
 <6925e230-b816-ea9a-067f-60cefecd8af7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6925e230-b816-ea9a-067f-60cefecd8af7@gmail.com>

On Sun, Apr 17, 2022 at 11:23:03PM +0300, Pavel Skripkin wrote:
> Hi Jaehee,
> 
> On 4/15/22 05:48, Jaehee Park wrote:
> > Author comments "Added by Albert" and "Added by Annie" are sprinkled
> > through the file. These comments are not useful and can be removed.
> > 
> > Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> I don't remember giving that tag, but now I am OK with it, since patch looks
> good
> 
> Please, don't put random Reviewed-by tags in your commit message, since it's
> not how Reviewed-by tags work

Got it. Thanks

> 
> > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> 
> 
> 
> 
> With regards,
> Pavel Skripkin
