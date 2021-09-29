Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4580E29CA
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 12:56:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id z184-20020a1c7ec1000000b003065f0bc631so5233768wmc.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mg6RB6XzRIgaMR9CfScmPcuVXy1LoHJbNrKAbn6MCsY=;
        b=MtVf2W8kwLE5Dz9Kf5OkM9iCCBei4ivfvf5La+0PZPrtKmbQuYCA1Dp44QAXDMojW4
         Qt4JJMsd7EDCWEpXVENve3dmOZD13QP1g3H3pPA9sPkxPXeO3ZExyYGA0OLM+uykZghb
         1Yg01Arq4dN4/q+pY0QWgTbqEALts1FHZdSxqDthtE84AncFWVDhNRIQlGaIbgussQ3w
         fXT0qBVwTll6Dt/jQKjEBXjIi35fjPBd+lsvb/34mzL10dHvZymQLoGbe02qyZ6JwT1i
         RtketO83OdzoBwHqMFwEWPLV5AjIoOzVQ+lI/owVQIfaDMefebXql/h7zyfJ3+3J3r40
         jA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mg6RB6XzRIgaMR9CfScmPcuVXy1LoHJbNrKAbn6MCsY=;
        b=RCRuJaxIWn2tcWOAKPSCMQHe3OlQKwPyKdklOfQ1hqWxeQHRESEVQPWXIOPi3QoPGz
         FlniqKRM10iGwSqGOlKPUudIbn5IHx4Nwej0eco2mMVxwV9rTJgEsHASY9Hm3b2WMi6C
         OIIXCftUSF/qgeTkJcWANX2+w9AvENkERJ9FRAQlHwG6komITT29nCkScV9OEEaYWmdV
         HWVA+AvSY0rfxuukKlI5O67Mm0no/R1TeRQ29GyhtRgx2odTKsd3rgJcyL1mynEt1blQ
         1WWsWKgRll5e2t2wAtPpZiiWJ9iH6/BJv86bYqwivHEe1+VsULmFNooLhJKuzYiOss7Q
         L7sQ==
X-Gm-Message-State: AOAM53286wpiZIM1Mn6ozIqifT2Cl4hKlVtlNcjE/gNsMyG2dfrC7LOa
	f1uwWrVP25YrDKd8Ghur8Qw=
X-Google-Smtp-Source: ABdhPJyxXw64vUsBC6VyXIlZjSl1yjAsifsos4VgKTenYweIS80dZ21biXOB7E+RZppcLXdwwgeKaQ==
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr9744201wmh.171.1632920180560;
        Wed, 29 Sep 2021 05:56:20 -0700 (PDT)
Received: from tom-ThinkBook-14-G2-ARE ([89.42.6.254])
        by smtp.gmail.com with ESMTPSA id k11sm2197539wrn.84.2021.09.29.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 05:56:19 -0700 (PDT)
Date: Wed, 29 Sep 2021 14:56:17 +0200
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
Message-ID: <20210929125617.GA213077@tom-ThinkBook-14-G2-ARE>
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

  Got it, thank you.
  The right traslation could be "dbm_threshold"? In the original
  variable name "l_" is for long (hungarian notation), "dbm" is for 
  decibels relative to a milliwatt, signal_strenght.

  Tommaso
> 
> thanks,
> 
> greg k-h
