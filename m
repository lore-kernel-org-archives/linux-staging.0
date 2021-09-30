Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A7629CA
	for <linux-staging@lists.linux.dev>; Thu, 30 Sep 2021 21:30:40 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id v10so27538810edj.10
        for <linux-staging@lists.linux.dev>; Thu, 30 Sep 2021 14:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z38Pff8rNHkpmHHsiE/EcUCBdc5ews9xWggX89bh2PM=;
        b=jBAvtPK6du6rAgKGQHZ8yVhlGXtowsq1cPeEiyZLMNjDSNjApE6daz9tsuvoJam2RR
         V5kqHkXN4gxDevQpociV+DaBSPpayl9qtBwZx3M51jbBSHiUM9/i0d9MzaeVBIN/DaES
         xh/MaYZ/8tVeYIqhgeSWJdhOpE2vX9Yd74wZ4I+H99fYsedRii1WmATbxokDAzGUsV60
         lw2NRN/VvGjRYuAM/ZFTp58iBWzehRpFr5YjLax05QN7U44row8IqCk3NpHeYb4RTyMk
         f1lbjNFKxldJ8wpolsk4cKIHqCAOMVcyYZrbv5NrDP8sRbkZNr+/Ko69qhApcZj7IS/y
         YAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z38Pff8rNHkpmHHsiE/EcUCBdc5ews9xWggX89bh2PM=;
        b=br+iPTwcHU/E1PHvAcBZRyczy+Zws+p6jw2cUKnIepSaOkZRrcoPV+jU+BytyCmlQ9
         dnTFPahvO5CRuT3PapaJrq3Skm3aTc0bmj71iE0GOoQmscklGM8Af5O8ocDDXdAVoNgB
         FWnNLfuGLXl0QgNW56g/gZf8s2Y8tKLJ9O0R8v7HIaY3qGfm7/a5fIYaTht/X7zfOMYc
         wRIf2t2Re2A6hEWv6GbDWYcFV8v0aC12KecigSZPCgilHXEDzclHLN+iSRwpJ0TdyTuh
         1WglJuD+9DiHIstPJHab9zmoDRhCsgAGY0HcsiwvwfiFc2Txs6l54LmtKveD14VoH3rh
         pT/g==
X-Gm-Message-State: AOAM531fQgJpZWj1wTLvO79gWd84pc+q3h6N3vubEDjZXxPSQJXYMDE5
	LixaS+ai8GshFj7CC7mkP+g=
X-Google-Smtp-Source: ABdhPJyIs9IWzjK743hlXZoMFHInBnLRvDmLCWyajvYtiX/RZyuArU0Ujf4/VWAO+ti3AC/Ken4gfA==
X-Received: by 2002:a17:906:ff51:: with SMTP id zo17mr1800990ejb.193.1633037438506;
        Thu, 30 Sep 2021 14:30:38 -0700 (PDT)
Received: from tom-desktop (net-5-94-68-71.cust.vodafonedsl.it. [5.94.68.71])
        by smtp.gmail.com with ESMTPSA id cb7sm2109271edb.49.2021.09.30.14.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 14:30:37 -0700 (PDT)
Date: Thu, 30 Sep 2021 23:30:35 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] staging: vt6655: fix camelcase in ldBmThreshold
Message-ID: <20210930213035.GA45822@tom-desktop>
References: <20210926162527.21462-1-tomm.merciai@gmail.com>
 <20210926162527.21462-3-tomm.merciai@gmail.com>
 <YVHirHixyOIgvqKB@kroah.com>
 <20210927214624.GB6953@tom-desktop>
 <YVKdJdTxlNJ55zCy@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVKdJdTxlNJ55zCy@kroah.com>

On Tue, Sep 28, 2021 at 06:42:13AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Sep 27, 2021 at 11:46:24PM +0200, Tommaso Merciai wrote:
> > On Mon, Sep 27, 2021 at 05:26:36PM +0200, Greg Kroah-Hartman wrote:
> > > On Sun, Sep 26, 2021 at 06:25:19PM +0200, Tommaso Merciai wrote:
> > > > Replace camel case variable ldBmThreshold with snake case
> > > > variable ld_bm_threshold.
> > > 
> > > Same here, what exactly does this name mean and why did you pick it?
> > >
> >   You are right the same here. What do you think about "bm_threshold"?
> 
> What does "bm" stand for?

  Got it. In the current variable name "l_" is for long (hungarian
  notation), "dBm" is decibel milliwatts, signal strenght.
  A good solution could be "dbm_threshold"?

  thanks.
  tommaso

> thanks,
> 
> greg k-h
