Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE04168
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 16:27:51 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id w5so19291354ejq.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ImhGSizu51qcAiPtd7HLBN22Lau/TM3KbSolcI8f00k=;
        b=RWKHnEj+1M8YE0PLOqaDZVnZjruu6unn14Hg9b/LdOWYpftRNvPZjMNs//UKcqArUM
         dzrwBBifdrrijisFAqQf0rcJv56lQ243uUSSD3M7E5kYWtbrIijb0k7b2DTumc+RUR+d
         hdxPl+vCudjouRaI7Porl5ikUztuZQMxKnrjMWAzPMtB0swUU+riAaswfA024ly8E/5Y
         6TThc4WNFh5/FnpOGBjTx6lLtogvgWsk37h/FhiAXOYSX+qiZWo8fPKT/3VnX3uh5rkg
         mtc4rpcOyNWoih8x/A99IMM4BXVFM4faB7BmyPoLhFlQYmifWPt/k8QlO6W4Spxf4x8W
         F/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ImhGSizu51qcAiPtd7HLBN22Lau/TM3KbSolcI8f00k=;
        b=MpEllNb6rE13GyOaZeDZztO8zy/AqOEuOqA13/6Tm9lB1o2E+metPVcU57bS5laqPQ
         FUTWccUJEgaulXtw7dMlUWRKfi3P4AQHyzpuJfNSPbEBBI3CNqveeiHuuaehrfleb0B6
         fQ5kyW7ZUVI5NGQJX/R90O0xn2c8MsHhDgm4/ScJUIFKuIH4EQ3fQIhrNlo6EQJ0HRSD
         xlk4DIGcocZHaoBoo6+d0OGwfJoiuA0nidS5ih1OMp9kAH83gaTj5zjZTQv+NIhYpIGW
         QGgWIGeNAbjmCvS3HhgZWaZ3OvcYReFQJKXRkYQZYGYCn9ZtAzaP+7k6Xov72XrPDyFW
         KH9w==
X-Gm-Message-State: AOAM533wdKkIo3i+wlqGO2K3kQquVn98k+IXvzsjlPQdZO8kqSDMW27O
	6JyyviL+0NbgPsKY/CN6C5o=
X-Google-Smtp-Source: ABdhPJwJGwcRLMAAg/iwe4fePXNNMSVl91JwT+NeusWxvJeP2w1mp3sT0YiWL86TjZi6ORQS2PAMbA==
X-Received: by 2002:a17:906:4f03:: with SMTP id t3mr3364891eju.369.1628872069951;
        Fri, 13 Aug 2021 09:27:49 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id h19sm821013ejt.46.2021.08.13.09.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:27:49 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH 1/4] staging: r8188eu: remove 5GHz code from Hal_GetChnlGroup88E()
Date: Fri, 13 Aug 2021 18:27:48 +0200
Message-ID: <7543688.ql1GSxUkq4@localhost.localdomain>
In-Reply-To: <20210813073109.25609-2-straube.linux@gmail.com>
References: <20210813073109.25609-1-straube.linux@gmail.com> <20210813073109.25609-2-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, August 13, 2021 9:31:06 AM CEST Michael Straube wrote:
> Remove 5GHz code from Hal_GetChnlGroup88E().
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 62 +++++--------------
>  1 file changed, 14 insertions(+), 48 deletions(-)

I missed those lines in my "Remove 5GHz band related code" series.
Nice work, so...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio


