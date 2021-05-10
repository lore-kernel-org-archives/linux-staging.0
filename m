Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987371
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 13:12:18 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id l2so16574742wrm.9
        for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 06:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=arkEZloYG/8s7EHZSL/Wo17Slx2pmQjhiuq/ITnE6NE=;
        b=Ec/orbdIinVbI1WenpM55TD0ERq7ei93XnOyFkk+yOo2iizBZeYu3EfjzaxZReH17E
         RA2InuW7itLvWTg52rcpfbUseDR2W+muBlwqP0hjuY+SQdqcBP/VejmF7/4FoMdBjFcq
         285A1AbY0WNfvKuJ2rKSP9VUzc6iwikVxcjAzm9ejwQCq1YgZnqJGruhzxjUKWlRqY4M
         z2FgiHJdnWuEECfcLVI9OHMRIgH8vvr8kiMySX8YQM+obTPE+GYmCfKSd5YKFssTcztu
         E8nH9pnlGIWRb85K9LYZCh+fTtxR/nj7qigcodEbH5NbW4q4kQ0w/BpVxdXQs/ClMpVp
         Qmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=arkEZloYG/8s7EHZSL/Wo17Slx2pmQjhiuq/ITnE6NE=;
        b=BIJMcIbi1uHJfF1G3QcR8cY4QKtzqid0MJpXtA0arQIbT6oRjJL1dajosVrN8yQaA5
         hYvdibJiVkkoaFXstcer1TrapcHp5rNg7/n/z8oURfgRd4tr05ymO9ZmMJBYFrdOz9iW
         mkvp3bxBp+6ZZl1t+R9eznDjkDEgJZBfp9PZlZ93SSWv07ySDgB1MXMQHlKUHjkCmua3
         HyRXd2qHfNIVQsLBg+4F6jyeRxMPyKhmTIDd2+2wynlT+igazGjglunRQXoHQ/RJM72z
         dKLxikQjVqXR2GoUIqHqNnDHLumFq78ULzukrhJ0e9zz6LIbLfxspRG3s9OAPznZoOG9
         tGYQ==
X-Gm-Message-State: AOAM532GkMZfG3C32mQTdJKX4Jk9wKdzFfBV1I6OLNhkYRazwiWCp3HQ
	qw5HmxTlDCKYEDYXtz2d/50vrEYWPquKPg==
X-Google-Smtp-Source: ABdhPJwRM4BuJSt5TLHHWLjs9qW0+A1lQUtZ8+Vez53b40PqcA/VfNSa+hDfZYbwGyQlUUG1+KC34Q==
X-Received: by 2002:adf:de02:: with SMTP id b2mr14664098wrm.420.1620652336970;
        Mon, 10 May 2021 06:12:16 -0700 (PDT)
Received: from agape.jhs ([5.171.73.3])
        by smtp.gmail.com with ESMTPSA id c14sm23248959wrt.77.2021.05.10.06.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:12:16 -0700 (PDT)
Date: Mon, 10 May 2021 15:12:14 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: move comments to silence 'line
 too long' warning
Message-ID: <20210510131213.GA4434@agape.jhs>
References: <cover.1620650484.git.fabioaiuto83@gmail.com>
 <cdb37302e4d7618141997229c59467f9d196eccc.1620650484.git.fabioaiuto83@gmail.com>
 <20210510130019.GT1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510130019.GT1955@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, May 10, 2021 at 04:00:19PM +0300, Dan Carpenter wrote:
> On Mon, May 10, 2021 at 02:46:19PM +0200, Fabio Aiuto wrote:
> > move comments to fix the following post commit hook
> > checkpatch warnings:
> > 
> > WARNING: line length of 110 exceeds 100 columns
> > 115: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:510:
> > +					*((__le32 *)crc)
> >  = ~crc32_le(~0, payload, length);/* modified by Amy*/
> 
> Please delete the Amy comments.  :P

ok, will fix and submit a v2 :)

> 
> regards,
> dan carpenter
> 

thank you,

fabio
