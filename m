Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF173FE7
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 21:35:19 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id g7so15376614edv.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 14:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8fIXLZFZklwKHdl3exETI4xeMDjaDuEQ0orstMQkXZ8=;
        b=KFMkzIwwW9lciMmKWfm/MpAQJ6JqEt/ksgk2f/1SvIkeFMEIvhj60x/DWbYbwAfO/H
         idNDXi5BqH5uEPUnIalkGHyrLcfhSy+z/HzkFvMTPb4u3ePTjCOZelxEBqpS7I6zsLfj
         xacHCczi8D5TEbeakKFZAc2tpWZxan4TrPD9EKsn98hAIQZaKHWeWCYOo1x+tmySvpS9
         PQSDjQj39h3V2GYzvMA1JWGCNQ1H/AUmL5HbG54eTrL/MceB8C1shpvGCXzvy2OhGT80
         NkhcBg7QW/PfCir9zP3b4j01WFg8c6E7WyuoM0WnBeAfNZLsGAGUU7Sz1dsx2rrZhHr/
         26/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8fIXLZFZklwKHdl3exETI4xeMDjaDuEQ0orstMQkXZ8=;
        b=z0u0cAXqRMd6bH8JX41A4IA873myl7GqfzqiZfV8/6uWgixC2Ll1gKh6gfrOF+syGR
         NrE3Ll2Nk2LzYhTE8LYhTNHiqkelHix9mXF0xZYqJ+2+JLc6n9IF5oCxlivbtSyn7ICe
         NH1t3VNvZyazEngwod0q3Y/kW5Hy7boOGY/GzK8aYq6ZF2CTIYjsuEcogL1L0W04DJ8z
         Fme0gUMZB8sGfexU7rkQWynHFCGik6jt4LOvhp2OfmAva10B+fJsgP9XErzQCfAZcM4r
         LjJECDy2o2AMRdG3uH7dZyuzmH6rSGWyvYyU2iQA8PI7jdQQehusGGr6EM4/l6bfGSJM
         JkfA==
X-Gm-Message-State: AOAM5305Qt5rhlBGRMYdtyHPs6PeM80Cf0z8epU3kMUqyt5Y21K0helW
	uaUhIXQwLQjOBeO8X8IR9UA=
X-Google-Smtp-Source: ABdhPJyokOtj5LXsKCcHluXvkmPQJmOhWxMhYJg0G/H019iApTB5xDAZDVX0f8AgPrwz+OiMB+Oq/w==
X-Received: by 2002:a50:d8cf:: with SMTP id y15mr3014927edj.66.1632778517759;
        Mon, 27 Sep 2021 14:35:17 -0700 (PDT)
Received: from tom-desktop (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id ck10sm11591740edb.43.2021.09.27.14.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 14:35:17 -0700 (PDT)
Date: Mon, 27 Sep 2021 23:35:15 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Yujia Qiao <rapiz@foxmail.com>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] staging: vt6655: fix camelcase in bShortSlotTime
Message-ID: <20210927213515.GA6953@tom-desktop>
References: <20210926162527.21462-1-tomm.merciai@gmail.com>
 <20210926162527.21462-2-tomm.merciai@gmail.com>
 <YVHilhCk3cgGhXrZ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVHilhCk3cgGhXrZ@kroah.com>

On Mon, Sep 27, 2021 at 05:26:14PM +0200, Greg Kroah-Hartman wrote:
> On Sun, Sep 26, 2021 at 06:25:18PM +0200, Tommaso Merciai wrote:
> > Replace camel case variable bShortSlotTime with snake case
> > variable b_short_slot_time.
> 
> That is a very odd variable name.  Why did you pick that one?
> 
> What deos it mean?
> 
> You do understand where the original naming format came from here, and
> what it was trying to represent, right?  If not, please go read up on
> it:
> 	https://en.wikipedia.org/wiki/Hungarian_notation
> 
> That style is not used in Linux, and so, when converting from it, do not
> attempt to keep the same style present here, that is kind of pointless,
> don't you agree?

  You are definitely right. What do you think about "short_slot_time"?
  
  Thanks,
  
  Tommaso
> 
> thanks,
> 
> greg k-h
