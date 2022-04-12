Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927E37B;
	Tue, 12 Apr 2022 03:57:44 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id r25so4946997qtp.8;
        Mon, 11 Apr 2022 20:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=40nfkm7AJFhrLlgoTZd+KNaCMw5aAK6dNL2X6kEOaPU=;
        b=FLUUa7pAkmcOG05Rc9OftUY87lGEUxCbrJQ7/SOliJA9Ykq6xkAcFgcbXkpMOg2kVZ
         L8QUyRyRAgoPCmg112qYV3BMMby5ETwND3amZT9RdeVkO5CZB3iAYByCa2WpaopAnV5l
         u/RqrlAbTp60+FI+Mi8AgP6xABq2Qd6QyD0UEa6dRNZkuTOQGHu372NpkRrMky/ah+vx
         TWLQSVYgPs6NdL5Zh/+8Iy32yZaZZFrANBj0q+PF/1tOC1X3zo8LqX+9WWWSHF4G3bii
         YOTtxFOLxjGtfTiH5q/dOqW+/g2MaN2q3ySZyvbnIXnp7eBkJbvxuoyweYtD1JYM+iYD
         MKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=40nfkm7AJFhrLlgoTZd+KNaCMw5aAK6dNL2X6kEOaPU=;
        b=o+G5x6X9BOrieRW2P0lV61j3wQxgSaEE6DbTCdyJnTpi6KGPGmU4DNN8DN3nqRgcKU
         LA2T38EnOihJNQ+C8lTmogBf+2MX7E/lN3trYCcaZYoXnYP7DKnFbGBcyrE31HMFLjWb
         EGjK2Uxbu87j4uDCRO/zh9iVe7ww3qXKbCUdRu88meFWU8c1cgmHI4wHr8OVVlM9od5Q
         NNOe9hPeOBFIhNUXaBk2vNuEkJ9xwmvItpvm5vJkDsNskAUwY63qnN/QTQLK5k+/YASK
         75bRtSQ60BHHPgDKJoNs6ouLSwql1QEZF4Dm0Wkpy0e5XJzjTL6hWnyoxLAyZmKESy0m
         WZWQ==
X-Gm-Message-State: AOAM530lIx7H9yAzMXQxqd99p2LqBcX1sheJx63qq8EDJoauA/ym+GUT
	an9mtdjnkJYw7l30KMd7lY8=
X-Google-Smtp-Source: ABdhPJwDMrb79BrLKLc115ZZRDqdpyb645S0tJcA3zF36sWQXtHMvG9UT+hb1VJ3oa1zZQuQlFvpQg==
X-Received: by 2002:ac8:4f57:0:b0:2ed:d8f:d0bc with SMTP id i23-20020ac84f57000000b002ed0d8fd0bcmr1926261qtw.280.1649735863414;
        Mon, 11 Apr 2022 20:57:43 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50fb:900e:25ab:983d:ac30:58b5])
        by smtp.gmail.com with ESMTPSA id 8-20020ac85948000000b002e1cd3fa142sm28152189qtz.92.2022.04.11.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 20:57:42 -0700 (PDT)
Date: Mon, 11 Apr 2022 23:57:39 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v2] staging: wfx: use container_of() to get vif
Message-ID: <20220412035739.GA2856917@jaehee-ThinkPad-X1-Extreme>
References: <20220408032349.GA2132476@jaehee-ThinkPad-X1-Extreme>
 <20220408061936.GP3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408061936.GP3293@kadam>

On Fri, Apr 08, 2022 at 09:19:36AM +0300, Dan Carpenter wrote:
> On Thu, Apr 07, 2022 at 11:23:49PM -0400, Jaehee Park wrote:
> > diff --git a/drivers/staging/wfx/wfx.h b/drivers/staging/wfx/wfx.h
> > index 6594cc647c2f..78f2a416fe4f 100644
> > --- a/drivers/staging/wfx/wfx.h
> > +++ b/drivers/staging/wfx/wfx.h
> > @@ -25,6 +25,8 @@
> >  #define USEC_PER_TXOP 32 /* see struct ieee80211_tx_queue_params */
> >  #define USEC_PER_TU 1024
> >  
> > +#define wvif_to_vif(ptr)(container_of((void *)ptr, struct ieee80211_vif, drv_priv))
> > +
> 
> Better to make this a function.
> 

Hi Dan, Thank you for your comments. To make sure I'm understanding your
concerns correctly, do you mean I should define a function instead of
using this macros here?

> Stefano's comments are correct.  It would have saved space with the 80
> limit to do a "struct ieee80211_vif *vif = wvif_to_vif();" at the start

Got it. I implemented this on the next patch (v3) that I will be sending
out soon. 

> of the function.  Also dereferencing the results of a function call
> like this, "frob(foo)->bar", without checking makes me itch.  If it's
> at the top of the function then that's kind of different.  I normally
> assume that the functions in the declaration block cannot fail.  From
> analysing static checker warnings, putting functions which can fail in
> that the declaration block is risky.
> 

The frob(foo)->bar in my case would be wvif_to_vif(wvif)->type?

> It's always better to test things but this patch looks correct to me:
> 
> The add interface does:
> 
> 	struct wfx_vif *wvif = (struct wfx_vif *)vif->drv_priv
>         ...
> 	wvif->vif = vif;
> 
> The remove interface does:
> 	wvif->vif = NULL;
> 
> Those are the only places where ->vif is set container_of() will always
> work.

Yes this is true. The add and remove interface was the inspiration point
for this patch.
> 
> regards,
> dan carpenter
> 
