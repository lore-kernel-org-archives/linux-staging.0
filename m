Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB10D1C2B
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 09:57:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id ay40so12819500wmb.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 01:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vbwl4qUPGRAlJXKlemR7F5hUymgNY+Rqyr3JN4InMPI=;
        b=bgeSrfqZLnb+LKnbAay8ONwFAens+hd+UfOQR1Sd7f1DOgjG5jCK21So0RDgTDPWJy
         Smuov+DJQd+e31TYKZCTUyCp4tNp9P+TBKHf1kHYSnqeTKOF1etaVsiMoEuS689DGXlg
         Pp087ghit5bz8fRhRc/goMUax2nyjBbZJi9NZmbD2QjBFLu2bGlE93JOueyK51LHssCo
         XfGyuz2LT4I/w6SDsbYhCSidEDw4oGHrkbFzD2A7hPZPWMfG4jJd8H8kUPtYOjyOhbxb
         fQZ8xvVxfp7sFzeGPk5xm+UDjSrQSiNP7QlL3ciU9E5MXDCYZRV+9IDOjouPCWmVjF5x
         yxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vbwl4qUPGRAlJXKlemR7F5hUymgNY+Rqyr3JN4InMPI=;
        b=TVxeqLbFJYXVLsGJ4e0YdMt/pyvmYwJTWeTkB1qQSThkvwa9K5mkGZqxaOdRYutCMt
         MSNrVDYCy8MafBaSIRDIs3/Ej+jcyVgtbINjkGpYJHUw9V8bXrTptXsF8ZyLZULa8QtT
         Qggg6P4zCzzqstyJmKRTQtzk5Qkvc4gOQ80zjLo+2u4YZ/3QYZu9pFB7mNJivWqhbnjO
         Z1LXsmClqlzw0TrzNz3GXPWC/iNeKoWhD0mEODv+jlFXCWGSQ+U5S5TRsT8wsvYPZ3N5
         9vVvmZ4Q7Sgs1PPFhw58IVnu1tuwGM8rWkv4FqTaWZU00ll8CUWmQeVg1RJ84mYjvRvv
         uRqA==
X-Gm-Message-State: AFqh2ko4odxGWPuI0H+7XTXrkk1/RoEr1s7ZcSytqYIu3AuWBuDcnS8k
	s4fsAO2QweYMMp0oYqv7MmueSrae7Uac+Byx
X-Google-Smtp-Source: AMrXdXv571mtW6o1ZZg08VCmlfl6qxlVXOPi+4bXkKaKnWTZcycK0kaqf2s2O60b86m50CBZyJ9jEw==
X-Received: by 2002:a05:600c:3d8a:b0:3d3:4406:8a37 with SMTP id bi10-20020a05600c3d8a00b003d344068a37mr19611689wmb.41.1672307857119;
        Thu, 29 Dec 2022 01:57:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e16-20020a05600c4e5000b003c21ba7d7d6sm24386690wmq.44.2022.12.29.01.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 01:57:36 -0800 (PST)
Date: Thu, 29 Dec 2022 12:57:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: yang.yang29@zte.com.cn
Cc: larry.finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	martin@kaiser.cx, abdun.nihaal@gmail.com, straube.linux@gmail.com,
	sandsch@northvilleschools.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, xu.panda@zte.com.cn
Subject: Re: [PATCH linux-next] staging: r8188eu: use strscpy() to instead of
 strncpy()
Message-ID: <Y61kjbim7IDSLSyd@kadam>
References: <202212261905476729002@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212261905476729002@zte.com.cn>

On Mon, Dec 26, 2022 at 07:05:47PM +0800, yang.yang29@zte.com.cn wrote:
> From: Xu Panda <xu.panda@zte.com.cn>
> 
> The implementation of strscpy() is more robust and safer.
> That's now the recommended way to copy NUL-terminated strings.
> 
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> Signed-off-by: Yang Yang <yang.yang29@zte.com>
> ---

Looks good.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

