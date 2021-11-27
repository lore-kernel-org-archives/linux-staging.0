Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0034E2C81
	for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 09:49:40 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id v1so48860394edx.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 01:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ek72XmF5zebDTqplFEZ+Bj/2i72f7eNky/xq+3hGyBY=;
        b=NM7HNP+xs1nv8rmUE/Fv5cTZajnku4ZGJ+GMn7pdHT5/rkYz2PDmDP+DXYTPX7svyM
         2Gtbu7/DbENVtOXbXvvCMTM1G/tKZJnoKMtJylK/RPEEiYtNyMdAQiovUzsxBTIzY4DF
         LZwheNIW4shf8VNI3ERO0ULrlh4ze+Dj161vkgE7h4hYs6a7LYERJ4dSh8YFoX/RcEwd
         DTy/euZyEeZxAM+CAbJ5M1GfJ1xguI5fwsSw+Sek+yCrNO5pQI7Zp7AN+L8VHzbrEN3n
         b/UiEEYs+a+lJ901+jD0V8iywA+qkI+6pdV1YzjkNrEOuhFzsDEZXh0iB6sd/XRmLzgt
         Fhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ek72XmF5zebDTqplFEZ+Bj/2i72f7eNky/xq+3hGyBY=;
        b=Jak2GznV5qClaMqFksUCCtH4xSyxkEE//xkBc6UYrctFM5bEXgB6A8Px1QfSXev4+N
         9WcttmmOTCfMDFPHaDeKK+EPNDhVkpa6ys1nYJAGFDsvTgiFkG+QBJcP3egEQktJ43EF
         Gglu+g/CEzv73B5My9VUIBRsJArhFd5Fr3iL/kbvhNMqQomzxjdBD3gT/0gT7diX3l22
         8hN+xlznJqJ0DMAO71tN7m0Jwhiqsi/VA0lIsGIZP4ms3CJ1zv/JlhIHdnTCV8nKNGcB
         +N9yDcAHTYz3SfAiJh+lchAKIX7U5tBEcFQ5/TygcTSAftH/RH2Pa+JunY91opbRFwa6
         BY+g==
X-Gm-Message-State: AOAM533Wxm50aTC5XHnQyKZs9iP1I0AwPRVKpD5ZxGLuXytMen+XtOeR
	VML5Pra8bWz6cDUq992XDKg=
X-Google-Smtp-Source: ABdhPJwJ6eRiW1T2rUKkZGsdbAHv6Aai1hfw8Oiu1cV91/sTKHTGtrlrjsH8HEzTm+MKnxfsMFomFA==
X-Received: by 2002:a17:907:7f0f:: with SMTP id qf15mr45839969ejc.560.1638006579397;
        Sat, 27 Nov 2021 01:49:39 -0800 (PST)
Received: from bulldog (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id f7sm5296049edl.33.2021.11.27.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:49:39 -0800 (PST)
Date: Sat, 27 Nov 2021 10:49:36 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joe@perches.com, forest@alittletooquiet.net, karolinadrobnik@gmail.com,
	lucas.henneman@linaro.org, dan.carpenter@oracle.com,
	tomm.merciai@gmail.com, eantoranz@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] staging: vt6655: refactor camelcase uCurrRSSI to
 current_rssi
Message-ID: <20211127094936.GA3102482@bulldog>
References: <20211118211128.GA156436@t470p>
 <YZ+9yDiG1SoWrWED@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZ+9yDiG1SoWrWED@kroah.com>

> Is this v4 or v5?
My fault is v6, sorry.

> Subject says v5, but this says v4 and then you sent v4 two days later?
> 
> I'm totally lost, sorry.
> Please resend this again and properly set the version number.
To be honest I'm a bit lost too :P 
I will resend the patch with the correct version.

Thanks,
Alberto
