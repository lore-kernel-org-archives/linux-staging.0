Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7B2564
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 14:23:59 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id ke15so5045563qvb.11
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vlSZXPc/WWB6O0Ntn/+6VGgM4mQ/P1gNa/KkL6kCL7M=;
        b=oeGPjNgtHVvKBxNMhG8G4Q8QuOtzWGHoB4yEDz/eqEuoLw4MoKrJV0Cu3zGSYz9kKw
         HVroEobn9e+OLjnrG12dG9ZFzIfqeETZYJZxwSrKNz7g0IG8De4hOMEkfSHY/z0Zejfj
         H1JlCxOss9whUG21mymflAK/TnzsF6V7KXt+IyKDTNevlzVXa2wn+6I48Nh6SdUCVmjd
         aiNXnTtKVoinWgCb2wJ7v3Qi0EOZlwzRriDJb7MKWBJ0CnXgrVJYJLMXgdiyy+v5tHHh
         41RpzdJsqTxqfiMUA/+gw2XoYaVRuDwkFqVtwMLYuXJ4pf560ZK2xU2By+QSLoO4DrjQ
         Ga+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vlSZXPc/WWB6O0Ntn/+6VGgM4mQ/P1gNa/KkL6kCL7M=;
        b=Ef/5a0T3gMn+vAViXCgNK1Z+JvsMGi4mwQzAnJV+I4J5PBQesrJHc9rt2yh67CLdmN
         SZq4jpVuLi6wguUvhSC+KyIVhT7mM+AWcdp4m0nUXPcYuPi9xgfaFo5fKyJEM3vi1bdZ
         Z+xfj9RIxWzuakRlPR3RPhZm6v4JfdSTv9mqaYqJPVibJ39v/QKUf8y7Hd8pFPFDQKey
         KJlutZPaB0ubn5P70EeWJ5BxkpMYkoBiahT97gB2EnhP1enkS2bQfqSaMfrUj8PtV2gQ
         EiwFbi+4jGQI2VOfunDxmxBf4o4CpGjiT8UJL5z8rd3aSq0rnIaE1ILsj7auudYSZZij
         /Lng==
X-Gm-Message-State: AOAM531DwxARQ15gJYxd9LkpspfLwxKO9UVjmZdf8E+HQk0cF9cEzban
	aP0QAMAIxkJgPIYZfZNPaMBEcA==
X-Google-Smtp-Source: ABdhPJwBTVSbg6sLzWrCS9NGMS5EzxPSS5wkz2ckXLOjrhXFly+LUsn4jydlD/Qq90o6V5TmAN5lHw==
X-Received: by 2002:a0c:a942:0:b0:443:a395:cc1f with SMTP id z2-20020a0ca942000000b00443a395cc1fmr11910876qva.68.1649341438080;
        Thu, 07 Apr 2022 07:23:58 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id t3-20020a05620a0b0300b00699c6a9b2d1sm7135084qkg.32.2022.04.07.07.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:23:57 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1ncT3D-00EF1o-Ui; Thu, 07 Apr 2022 11:23:55 -0300
Date: Thu, 7 Apr 2022 11:23:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: duoming@zju.edu.cn
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org,
	chris@zankel.net, jcmvbkbc@gmail.com, mustafa.ismail@intel.com,
	shiraz.saleem@intel.com, wg@grandegger.com, mkl@pengutronix.de,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	jes@trained-monkey.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, alexander.deucher@amd.com,
	linux-xtensa@linux-xtensa.org, linux-rdma@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-hippi@sunsite.dk, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: Re: [PATCH 09/11] drivers: infiniband: hw: Fix deadlock in
 irdma_cleanup_cm_core()
Message-ID: <20220407142355.GV64706@ziepe.ca>
References: <cover.1649310812.git.duoming@zju.edu.cn>
 <4069b99042d28c8e51b941d9e698b99d1656ed33.1649310812.git.duoming@zju.edu.cn>
 <20220407112455.GK3293@kadam>
 <1be0c02d.3f701.1800416ef60.Coremail.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be0c02d.3f701.1800416ef60.Coremail.duoming@zju.edu.cn>

On Thu, Apr 07, 2022 at 08:54:13PM +0800, duoming@zju.edu.cn wrote:
> > > diff --git a/drivers/infiniband/hw/irdma/cm.c b/drivers/infiniband/hw/irdma/cm.c
> > > index dedb3b7edd8..019dd8bfe08 100644
> > > +++ b/drivers/infiniband/hw/irdma/cm.c
> > > @@ -3252,8 +3252,11 @@ void irdma_cleanup_cm_core(struct irdma_cm_core *cm_core)
> > >  		return;
> > >  
> > >  	spin_lock_irqsave(&cm_core->ht_lock, flags);
> > > -	if (timer_pending(&cm_core->tcp_timer))
> > > +	if (timer_pending(&cm_core->tcp_timer)) {
> > > +		spin_unlock_irqrestore(&cm_core->ht_lock, flags);
> > >  		del_timer_sync(&cm_core->tcp_timer);
> > > +		spin_lock_irqsave(&cm_core->ht_lock, flags);
> > > +	}
> > >  	spin_unlock_irqrestore(&cm_core->ht_lock, flags);
> > 
> > This lock doesn't seem to be protecting anything.  Also do we need to
> > check timer_pending()?  I think the del_timer_sync() function will just
> > return directly if there isn't a pending lock?
> 
> Thanks a lot for your advice, I will remove the timer_pending() and the
> redundant lock.

Does del_timer_sync work with a self-rescheduling timer like this has?

Jason
