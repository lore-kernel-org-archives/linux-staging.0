Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7183FCF
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 13:28:40 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id v24so16836097eda.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=doZM2TIQ3sjpALd6Z7h1VFOT7OfiEaaF9Rf0rCfAyto=;
        b=OjQQFk8y+gC45AGlup0Mco9jzBnPlMQvAt/BgMasKuA7fxTy2UUf6HXsq21cwQnNDq
         zY3KZGFqV60BhwrM3FC3LWEtn3oGaixHL9AnrtqrH5ipw6S5UZNi3nSDNqTUunLFbd20
         YbGC/Z8uAjP/lt9i3nXnJ8YdfgE1gXTGmT/vFILcKRLH/5wAV3wdBDpF13eerbWxtANP
         CxvOilHYVMw8OVoPpl1kwv/eKjEhB95ibBtAOIaMo1w7gIhn4CGEUxcRhdovA0/MVfgN
         uBu4H7vYjnl5MCW/6kbSv5S8PHZGrc+/Q0pteZQMX7Qs19aweFtMCa3byGmi0RSCw5Ka
         N5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=doZM2TIQ3sjpALd6Z7h1VFOT7OfiEaaF9Rf0rCfAyto=;
        b=orkvaOkWu5Go5E8FjNHAN9UwJ9FTyUNGJ8xLQFGgVNwguBtY/riroOTVsxxVV2xwJH
         59IozVIFg64f5pSD3vUgG4tIcEkJluhVPumBF2kd5jfyKMGtRrOV3k27Y7kKtqEp17vK
         Fs/IQw9ZzLMYIXvTVYsXoEIQ5YZHTUgyHTBxfT16Y/m9aeNChpCRtMqAL1guXK5ZYaVL
         5ginvdRxzD51/GMtWw2p0C9yH4L7U8QCO+BVqgx0KfGqRTJAlfNLz8Up3EAqsNZ5+rI6
         6rQWclYxjLPgaFPDfPmOsIifIJKn2+6gKcmaUNLN0sQNsjGuxh1z9E/5kzqVLv0BVCzs
         UziA==
X-Gm-Message-State: AOAM5323zjOPzUw3io1ff7BwTp9afscejyFapypmXf5xRaDvCM/CKyry
	EFCsdAp/9V2gR519jHW08D4=
X-Google-Smtp-Source: ABdhPJzNGqsOlP8FNyJxYLKNRkeDEaIU8dXyNil/vvYEgeehUyk4ZpCbBcDaNyeqXmuU+Y3BYBh83Q==
X-Received: by 2002:a17:906:2a0a:: with SMTP id j10mr6201020eje.103.1631798915380;
        Thu, 16 Sep 2021 06:28:35 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id dm8sm1398996edb.90.2021.09.16.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 06:28:34 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>
Subject: Re: [PATCH v6 14/19] staging: remove struct _io_ops
Date: Thu, 16 Sep 2021 15:28:32 +0200
Message-ID: <14709143.SPC8MWreAs@localhost.localdomain>
In-Reply-To: <20210916125200.GM2116@kadam>
References: <20210915211103.18001-1-fmdefrancesco@gmail.com> <20210915211103.18001-15-fmdefrancesco@gmail.com> <20210916125200.GM2116@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, September 16, 2021 2:52:00 PM CEST Dan Carpenter wrote:
> Patches 1-14 are great.  Those 14 patches are:
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> regards,
> dan carpenter
> 
Dear Dan,

Thank you very much for your "Reviewed-by:" tag. We really appreciated it. 
And thanks for the suggestions you gave about the other 5 patches. v7 will be 
made according to them.

As far as it regards to 1-14, I want to point out that the bulk of the work  
was done by Pavel (all the coding). Of course we discussed the general design 
of the 19 patches together, but for the first 14 I just wrote the commit 
messages and subjects and obviously I also reviewed and tested them.

Regards,

Fabio



