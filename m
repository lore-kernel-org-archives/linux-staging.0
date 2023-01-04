Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97943C2B
	for <linux-staging@lists.linux.dev>; Wed,  4 Jan 2023 13:33:12 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id bk16so19751609wrb.11
        for <linux-staging@lists.linux.dev>; Wed, 04 Jan 2023 05:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1OZYEOsIa4HC8bLEt9jxOMrEzLh4jE7nib0ZT+FWq/g=;
        b=SpSZbnAzW6o9lg07NRzRVSfCJpbhYU7a2YVcM/TLkt2cPBzgq5yO33mVU57wQ14Ez+
         lzUdAcGRRgxyCuqpYSk8Bq4k3/N4Jj4C+CyVZROziBQ0kgqELjPMNQTgm2pMaIilbHz9
         /kT+HrG87x5VlCzEnKybjkC3u2hgkRrW7cO6PDSI7BMHVAgIUuEZQE/Tx7s4dGPQxItx
         Pwccv0rxsXD2UyJc/7TsLF0xQb8oYXWCsNegth8cxa73RWYXa2F2nKtgtqS7GiUl6/+r
         UYsxu5am1bQCRzGlem2QX1gEh0jw0YuzNu1ROY18vdETW9ZGOoTv5nzEtZvshPytMk5b
         szcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OZYEOsIa4HC8bLEt9jxOMrEzLh4jE7nib0ZT+FWq/g=;
        b=WFv/MonvxpyZhYtIONHpYf/5JEwZ04xSLkUFeM2wc6TYETF66LTYX2Au5hwRWDfsOD
         0Ocd4Du7+16hDOF1de/6RGZEEu0TYjoE8CdszTtECrf9A0zRLvYOThzFWkzq7Y+aVzAx
         oaNq4kdMdkpBJwNxRTAVlpUuFNEBIdf1hrG6Po+1O9ldg82fCjc4mj7gpzZ6c7+yyVEL
         hptHEiKSEwjJEa9OaSDF/YiD8ptxs6asLRJAlFAlAzLIeNx5sNCcaWil7Qg9HX0bQ5cO
         40aosIb49Prs68X5egpry+ATxDwizsBKO5GJfmz+wviWKvLh7lqiXoK6FErCfzzU/EK/
         I2rw==
X-Gm-Message-State: AFqh2kq77Zzh7TP80rJ64eYO0vpB2KVrg8iQbYzqMQctWvCQek7S+uTL
	5tJv+JvBsvIFGs8+BQbcLBs=
X-Google-Smtp-Source: AMrXdXs4S3mE1SgBSPU2HGJPt7oU9k09p3+BZXz1hKBcx6RAjNzKLxxc12jfkmafWZjX6s/MtZFqOw==
X-Received: by 2002:a5d:54d0:0:b0:24a:e56d:e20 with SMTP id x16-20020a5d54d0000000b0024ae56d0e20mr29166930wrv.29.1672839190899;
        Wed, 04 Jan 2023 05:33:10 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s13-20020adfdb0d000000b002420dba6447sm34648247wri.59.2023.01.04.05.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 05:33:10 -0800 (PST)
Date: Wed, 4 Jan 2023 16:33:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Aleksandr Burakov <a.burakov@rosalinux.ru>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] staging: media: ipu3: buffer overflow fix in
 imgu_map_node
Message-ID: <Y7WAExw/lQg4cd1E@kadam>
References: <20221223123025.5948-1-a.burakov@rosalinux.ru>
 <Y7LfAR4QdIzp81yW@paasikivi.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7LfAR4QdIzp81yW@paasikivi.fi.intel.com>

On Mon, Jan 02, 2023 at 01:41:21PM +0000, Sakari Ailus wrote:
> > diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> > index 0c453b37f8c4..cb09eb3cc227 100644
> > --- a/drivers/staging/media/ipu3/ipu3.c
> > +++ b/drivers/staging/media/ipu3/ipu3.c
> > @@ -60,8 +60,10 @@ unsigned int imgu_map_node(struct imgu_device *imgu, unsigned int css_queue)
> >  	for (i = 0; i < IMGU_NODE_NUM; i++)
> >  		if (imgu_node_map[i].css_queue == css_queue)
> >  			break;
> > -
> > -	return i;
> > +	if (i < IMGU_NODE_NUM)
> > +		return i;
> > +	else
> > +		return (IMGU_NODE_NUM - 1);
> >  }
> >  
> >  /**************** Dummy buffers ****************/
> 
> Thanks for the patch. It would require a bug elsewhere in the driver for
> this to happen. If some handling for this case is added, it shouldn't be
> hiding the issue.
> 
> One easy way could be to add WARN_ON() for this, and return some value (as
> you do). Zero would do equally well.
> 
> I.e.
> 
> 	return WARN_ON(i >= IMGU_NODE_NUM) ? 0 : i;
> 

I sent basically the same response but somehow my email never went
through...  I'm using mutt with gmail Oauth2 and msmtp and so my
weekly(?) login has expired then something silently eats my outgoing
emails.

In this case the emails that I sent directly before and after went
through so it seems like my login wasn't expired or everything would
have been eaten.

This Oauth2 transition has just been so frustrating.  Am I the only
person having trouble with it?

regards,
dan carpenter

