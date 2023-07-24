Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CB7C
	for <linux-staging@lists.linux.dev>; Mon, 24 Jul 2023 06:28:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so29845475e9.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Jul 2023 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690180138; x=1690784938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZMHw5ySxpMILXlb19cVm3X1DSn/JeHNvZEDgpJzQ2Y=;
        b=eSibnaCNTqBO716RSCmoRZy5NKQKS5Xhy5kcoNWmpUhJB+sz1weSoiX1wdG1wHCPBS
         /uAvkDYLXE9kiXI+2LUTEsZ1cQTGQGL87g48k610qGB1/vS9Ceq1C1NPvlyk2nU08P7R
         oWSphU3u72bW+6gyVacgKILhalTpdLF4awSwkUSRPDoyRvBUAT9PL+4EO4KRvJFbO1QX
         rb3dLHQMmUGp4l3ECn6Z5Pfv7FGUm1fblDIpNuDqkpLh9OMVnDsbxI/5kgYVm0bAwZnI
         lTFd+vo4hFfwj7NLH5BUdwYvNGlRLGddxsqNN54tstZ1pu8VNaCygeMxkztxICDHZ5qA
         bz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690180138; x=1690784938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZMHw5ySxpMILXlb19cVm3X1DSn/JeHNvZEDgpJzQ2Y=;
        b=UO3McZEOkcrNAxOx4BxM6Dm1Y/yNZSC88Hh5vc/FLG5eTuBFEC8j4wEimmti1geEe4
         2ndKA55ZouvSRbfZAbCVK7LV6nNVe9ez6L5JUk1W8U78h3XbNC1B069TxiB6MRfBphok
         Wimxr77kLlbHbXRspGLP7b/gUFg8LfnZGjikAXlx2W7rii9GZX4Wj5Ebct0Q4JA+y0Wi
         m2ZfXs2HBLFMP6IpQRfHVh1aty4sgHYF3OeT6ofuBjYg+8Uk32nqNpdXeHkCzIqYVB6d
         CXSwhxsNSn93ISO+O5KpgyB/ut9ivOtfFJPTpre8sBclChackiSLfOVs4ToqU6NFubZY
         PteA==
X-Gm-Message-State: ABy/qLbqJzxKGgqrquE7xtI4ATh70qCe5quXNzfhOS9bfp/LYj5wDWO6
	rnYC1dHNRZUn8DecZgHzGMWhjw==
X-Google-Smtp-Source: APBJJlFSBAQ9CJKqsVzHpAjfwM0r+MywCfh5ToI0XJxlm0ZuQd9F/MXyEMU2LUqOmciCRnHz+3ZVqg==
X-Received: by 2002:adf:fac1:0:b0:313:ebf3:f817 with SMTP id a1-20020adffac1000000b00313ebf3f817mr6177241wrs.22.1690180137709;
        Sun, 23 Jul 2023 23:28:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d6382000000b00314427091a2sm11622491wru.98.2023.07.23.23.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 23:28:57 -0700 (PDT)
Date: Mon, 24 Jul 2023 09:28:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Franziska =?iso-8859-1?Q?N=E4pelt?= <franziska.naepelt@googlemail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	Emily Peri <eperi1024@gmail.com>, Guo Zihua <guozihua@huawei.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Kang Minchul <tegongkang@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
Message-ID: <720bd622-a9a4-46d6-8296-f7ec644ac091@kadam.mountain>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
 <2023070123-unburned-worsening-0713@gregkh>
 <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>

On Sun, Jul 23, 2023 at 12:29:57AM +0200, Franziska Näpelt wrote:
> Hi Greg,
> 
> Am Sa., 1. Juli 2023 um 17:00 Uhr schrieb Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>:
> >
> > On Sat, Jul 01, 2023 at 04:43:09PM +0200, Markus Elfring wrote:
> > > You should not put only your own email address into the field “To”.
> > > Please reconsider the distribution of addresses between message header fields once more.
> >
> > Please do not comment on staging driver changes anymore, it is not
> > helpful to anyone involved.
> >
> > greg k-h
> 
> Am I supposed to adjust something here?
> As far as I understood, I can ignore the comments from Markus, correct?

Correct.  Just ignore Markus.

regards,
dan carpenter

