Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08FC71
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 12:43:39 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m9so11907876wrx.3
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8dWNJqGeO28h3+LJctIyuduk63WWQ2H2We1e6Kmdbcc=;
        b=WJlqlfw4KqEJEYtwo3XvIxHn2oPgFjIosnEp35LUQWmP6KIWRPCLeFPwhBe2hued2W
         qRPVKROfJq0qsWqSW+VhzZLwF36wc2sjLKsvWCSRD80Z3a8efekHbJmuTjHbsH2JDrGc
         gltTqoqxFiEQbhF3C2wuq7Qd/5T8hGkTyLRqun1VbtNH5DkxmA+aWC5RSsiuE1eZsOAz
         omUhnanjUSPgUlNIq1/mwvczuUBycxAFvdkSSrVmF+4d3dAYd1GcZtwcsugcOHuxOkRf
         dWp6UkJKc1EZJB4bqflfrj6ptYZ+RiVSOWjX9YtdbZU4Chk6xqB1i5O/xNlIq11yQhhn
         qIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8dWNJqGeO28h3+LJctIyuduk63WWQ2H2We1e6Kmdbcc=;
        b=RZDKIQ6VpeJO9ms8l68hrzhYlF/hc+XK7xOxyseGBal0JcwuvIUxo0Z1wYfxJNa3OW
         CVc2+//vvG6oXddR154W3G/0GQCztNXVVXpajHTaePrlhR2XhFVqDfv4c/PrOBeywPV1
         2zC5ETywVj5j4CzmzOVaRPTR+s1S6Wxxi/qKLVTrUr71AxRWtANVmTIJpYbEVstpP8Pz
         ndvP3zBtkWIwtr8PJyay2uyoPPYPOH8eQaHkpmLiR0RGS8uNCFXbsWYdpHMFznUUKViS
         KardYp7HnkIrycHr892Uoz2mgRgvHead9yo8yCC+YNlztoqsxyC9Hu7G9Qn34ThxUKcS
         P8og==
X-Gm-Message-State: AOAM5310EpaMgLQiAvL1Yyr0TGIVVGVzMsRPU2XQVXFViAQGdfUjiVkK
	gCrBuZBUjntAVitDNFBEAzc=
X-Google-Smtp-Source: ABdhPJwHlX5yjTi1BS6fd7w3SLeYJMZkzI9LwKOChEaQhz+1kQpQxmiv8o4Q6ozyrp+9E8awxNt9OA==
X-Received: by 2002:a5d:4acd:: with SMTP id y13mr18747852wrs.185.1620477818392;
        Sat, 08 May 2021 05:43:38 -0700 (PDT)
Received: from agape.jhs ([5.171.72.44])
        by smtp.gmail.com with ESMTPSA id e38sm16491786wmp.21.2021.05.08.05.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:43:38 -0700 (PDT)
Date: Sat, 8 May 2021 14:43:35 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: media: atomisp: remove useless returns
Message-ID: <20210508124334.GA1403@agape.jhs>
References: <cover.1620475909.git.paskripkin@gmail.com>
 <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Pavel,

On Sat, May 08, 2021 at 03:21:52PM +0300, Pavel Skripkin wrote:
> Breaks are not useful at the end of void function,
> they can simply be removed.

this commit description is not really describing the changes that
have been made

> 
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

thank you,

fabio
