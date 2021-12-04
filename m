Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A522C9D
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 11:31:59 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id w1so22220269edc.6
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 03:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GooOIiXrE5oPnohZHDuYVBOk/AGEAvYFkup6wdSNpaE=;
        b=mKYPmc9bfweBc+WtTm39SF93PRyLkvKL3pUPHaRE4idLbKQ9thO8M/1Ylftp07WRKa
         6nQIqtPGPNQvmo9L4PdtfRNS64+MFFdHRKoHDJxSIS4kf2u3L1rfbWVqWaBqgzqv3BVo
         o8Lc1AfkgMRwnBhI24NtBQCu2sS01HpW3z1LTvrTsywrrQ1OCw36yynwFTe4kho6BoI6
         Eud1K7NkYKUtQKrMTNsUOXXpDVJ/pYpWLAa2cLD7xGMqA7A+Msuk3b5eJsx7Vp9IcVip
         zxrpzmLjHMQi4Jvrwku/cKm2DZVPSTaZxxcFDfrVpNQPK3KtV6LzVgtBV1k37G/y+wqP
         cciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GooOIiXrE5oPnohZHDuYVBOk/AGEAvYFkup6wdSNpaE=;
        b=MwBfA5cTt2wt7KED5H/8WbRmycVL8EhAQlmSnltKtnpDaw+ct/zK26l9vvaDGEmkna
         pScGajTMXpD8jJ3gOLL03LECJVIrywgbAOXzgrrNCpOP0EdAVLW6to7lOu0siSeKLcVY
         4q/8dOW2LUjYNGYn56PxOlZAQcGkjs8b24+wOOIhKZv0mCbHMXrLP/BliW+L8QVKkUWY
         MNQpeANzknIQwiNWq/oPQz9OnZ87wWm3hz2B+COg3AcyrA195/KnYojowekkDTuXFkfi
         nz00r5o2kwTYj2FMjbBu1x4pR7mvu85z1/aMfSgqt/+LqZyKNBL9pgWF+jLqY/H5gm9y
         ohsw==
X-Gm-Message-State: AOAM531kuC318sNlD4qyS0D82+uz0wk8QtvvX5XSwiKKfSw1OTTgYDOl
	qLcsnmMuk+yhxjpfKfCpX5M=
X-Google-Smtp-Source: ABdhPJx/XvGaGSZUvaRJUTw9fPP7CEUuiTWfVuZq60Q7q2Iep+jestcIngt/+75NCtwAzV3VhQoRwg==
X-Received: by 2002:a05:6402:2744:: with SMTP id z4mr35133046edd.310.1638617518251;
        Sat, 04 Dec 2021 03:31:58 -0800 (PST)
Received: from bulldog (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id r24sm3655144edv.18.2021.12.04.03.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 03:31:57 -0800 (PST)
Date: Sat, 4 Dec 2021 12:31:56 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: remove unused variable byMinChannel
Message-ID: <20211204113156.GA3940683@bulldog>
References: <20211204103053.3934783-1-alb3rt0.m3rciai@gmail.com>
 <e64fe951-8e57-4c28-5451-71872247c57a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e64fe951-8e57-4c28-5451-71872247c57a@gmail.com>

On Sat, Dec 04, 2021 at 02:29:32PM +0300, Pavel Skripkin wrote:
> On 12/4/21 13:30, Alberto Merciai wrote:
> > Remove set but not used variable byMinChannel.
> > 
> > ---
> 
> Signed-off-by: is missing :)
ouch, forgot it.. :P

Thanks,

Alberto
