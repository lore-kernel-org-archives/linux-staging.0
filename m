Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E1A71
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:14:06 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id x7so16613824wrw.10
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SjgV5385CX2e5+OWSQrXWQJFfcA9bCZwhTPE5sMFetc=;
        b=iO5Xx4d4eAZO68cB3l0JjGqMRQ6AxbP/OBiWZKDBD4OTn+eI7tbT0HlW0XPjeaUYvm
         ixN2NnU2d92l4Tpy/+Shyphc01Al0M+YbUVcbLHHWi0OHx0VUqvPjw8fbk+4qGP5mYiC
         uW+F/W2rYWHlj1y33PCS432zZGsUDNeXW3BIA3Ag1S6VhZ7AoWJRJh8/NkMWU2LN6H7Y
         C4DX1uIMEsZ5g8baQZvboShWd2NH/McsNzkylTb+m8EsxQVgGW7T9JRjdzuMqbWbVVmn
         DekzyNaeuDE599jfsQkXxHFfqNW195Fe3Udc2l+pTuMli4hY6H3V8NrBawo8yKYsyhcI
         0zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SjgV5385CX2e5+OWSQrXWQJFfcA9bCZwhTPE5sMFetc=;
        b=m6yFDEhW0cQzDxrJ6hNQYf4MdmW6x2K7Ah8R0zWbEmvJSKYxWy+5RPT8I2/wPR983B
         thqkz6o7Ysoxe6fBJpE+2vxVKdQme5VW/MaPmxYpNeAQFy/I7VCKOCRegTv8beW3oIgE
         3s3R1vLPpD2ykmdX5NwdPJuXrmqvg98dgMM87tNnOgTOr220EGi6mXS9eM/zAfH1uM3g
         p+Q1c4FLlBq99R+MvVKqnG60u+3Ae+zLAh0aSwM6bkvtF7wRDhI+EgqOH8X3rzLo0EW2
         25Fblg4q/qS3m/YqTMKNBlbZR6BCid0ERmyc/X1gyXj2qV548PHPNdM7SyyAoMUWLzPW
         5hvQ==
X-Gm-Message-State: AOAM531Xv186Q1jTZs5EKpeQ6n+Guuma5Ry8AYdwL2pRhOpfMAGDphGd
	3YO19BuUajyJOhFpJNueAIk=
X-Google-Smtp-Source: ABdhPJwGPcl+/TVw1SwXvFhY9ZoO0gyZOKBTo/RwlOYDs6i77Xjwxp0UcBPWkzo2971wtaLLl1tnVg==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr19574532wrp.173.1618323245394;
        Tue, 13 Apr 2021 07:14:05 -0700 (PDT)
Received: from agape.jhs ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id c18sm17169268wrn.92.2021.04.13.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:14:05 -0700 (PDT)
Date: Tue, 13 Apr 2021 16:14:02 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org, julia.lawall@inria.fr, joe@perches.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] staging: rtl8723bs: replace DBG_871X_SEL_NL macro
 with netdev_dbg()
Message-ID: <20210413141401.GA1400@agape.jhs>
References: <cover.1618322367.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618322367.git.fabioaiuto83@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 13, 2021 at 04:10:35PM +0200, Fabio Aiuto wrote:
> This patchset replaces DGB_871X_SEL_NL macro with the driver
> recommended log function netdev_dbg().
> 
> Macro DBG_871X_SEL_NL indeed executes a raw printk call as
> default behaviour. The other behaviour is doing a seq_printf()
> call which never occurs.
> 
> First patch replace dump_drv_version with a netdev_dbg() call.
> Second patch remove an unnecessary dump_drv_version() usage.
> Third patch removes dump_drv_version() now unused and
> 	unused dump_log_level() as well
> Fourth patch apply the following coccinelle script for macro
> bulk replacement:

please ignore this patchset this was a typing error, I will send
soon with right recipients.

sorry for noise,

fabio
