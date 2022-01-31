Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ACD2CA1
	for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 19:38:03 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d1so13357450plh.10
        for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 11:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xzVa+kpI2P5pcrQ6q9RAyjwxclzwOqeJjWm5GlzFQtk=;
        b=lCV+OL9RHYZ/y/+aXRVJx2OIAAk0VGu75AVLXk973DnP+4Uwd6/Cj9rEh20rTDlKEi
         rj2JW+wENteqcF2sGP6/NWTC09K/TcLD2m4MBwdq+W4L9fFCtjbATklhgukmkdEfXEl/
         Suexv0Rr3NSjxuExdqiCP7gjqNX2RI0YjQG4kIkKtO9Vdw998ruMyLRQbsuI75KceBBy
         A0Orfx7aghxdVM9M7o+Cl0ZWbj48dgXwmj4IS3hODlMuREEPl+vAG8Hh4nhGGdi4tr7Z
         iBPfQVgGcEyGg/eJTSJeiTbRhnIetVgGjOU2XdmX17QwdxywBxcNVhq9nzJmrxy0qhVk
         gRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xzVa+kpI2P5pcrQ6q9RAyjwxclzwOqeJjWm5GlzFQtk=;
        b=aHkZMA//rgvLD1Vpa1EK/J2oGJ9A+vLbvvrdsWYnFgbGb+1b4Fh8DCAmXtUQSdnDgz
         Bro8l5EggNN3Jpuv2B3h6sPpniBdOXS2Js9XZQaXq4ZziAKguaitW7qvJgu9HRFaBKAI
         ZnvFBzWdZpzm0uK51+x7wtlvsFt41Wb+E+dtrcS3eWfN4ehufhP02PiozwE6OXpah4jq
         dkW7jkin3j+v2NkFfTBVDXyJSK0MP47I7wV4+rbLviYzzJZ0E0SArLRfPeFHRBpCkdQO
         1Skt40Aa1oK2ulTswJJduRaxLZ/ghxGk52bX/3Nh5AuKMTOBj/bZtzT622XH+x9Nj9TI
         gd+g==
X-Gm-Message-State: AOAM531hpBOuI9NAXp1l+nq2i5wNnbOT2LdalvDa4+wsGM0NB4FuZDJ8
	rcYOM1u9/LZGU6CxcbUIyDQ=
X-Google-Smtp-Source: ABdhPJzxdWGPv1XAWrMDsXWHrZgoHwdcemerau22RVBNPdYWRaF6qMmCgG/0CwqjNt0cfHA8s+aI4g==
X-Received: by 2002:a17:902:ec86:: with SMTP id x6mr22630459plg.96.1643657883448;
        Mon, 31 Jan 2022 11:38:03 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id j10sm19471459pfu.93.2022.01.31.11.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 11:38:02 -0800 (PST)
Date: Tue, 1 Feb 2022 08:37:57 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: pi433: add debugfs interface
Message-ID: <Yfg6laurUQF02TPR@mail.google.com>
References: <20220126132116.GA1951@kadam>
 <YfX+llwDWZZMz+NY@mail.google.com>
 <20220131134558.GL1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131134558.GL1951@kadam>

On Mon, Jan 31, 2022 at 04:45:58PM +0300, Dan Carpenter wrote:
> On Sun, Jan 30, 2022 at 03:57:26PM +1300, Paulo Miguel Almeida wrote:
> > +	dev = m->private;
> > +
> > +	mutex_lock(&dev->tx_fifo_lock);
> > +	mutex_lock(&dev->rx_lock);
> > +
> > +	// wait for on-going operations to finish
> > +	ret = wait_event_interruptible(dev->rx_wait_queue, !dev->tx_active);
> > +	if (ret)
> > +		return ret;
> 
> Drop the two mutexes before returning.
> 


thanks for taking the time for reviewing this patch.

good catch, I completely missed it. Thanks a lot!

thanks,

Paulo Almeida
