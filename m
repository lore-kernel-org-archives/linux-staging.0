Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7197F4
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 11:36:45 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id f20so12792794edf.6
        for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bfnlfMH2qv7WqV/DohbyJR0+KCA0Bxzz3Ju/20TTuck=;
        b=KM7+7YtJEU2Jt+VczH+FOJJOGb2IQecJ5Qp1owYwAeXYYw7n4YJnvJGlvsAu0sIYva
         d1jLfvg8N7/Bur0LJzRfEOo/Qyqv1Syt77BJzLLwLKVVrrVXrvXN4RRQNehUnTHqwYPh
         5H2lHSKo79omxG4lLqBfM0Bsyzjx2Hr/gchEWLz18n0SYiFmD7u/45x+usEs01hzNU36
         oPzPjr7SrqfuMmnEv1fnPxtmGjseJw2CQE455Po685QQVFgQ27BpmDPlwScRqXyNePpO
         rSiwOKLPiVeJDcA6ztX1QOrpSf57DGLMLyZOa9X6GDUFXgkWeZCbAJsHDZc/kL/f9Thq
         nKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bfnlfMH2qv7WqV/DohbyJR0+KCA0Bxzz3Ju/20TTuck=;
        b=VVVUVkqfKptoJBwED1m4VPj1cTuKv8XBIeG+8yFUdD85vOzZEtfPQj/12/8ijlcXnt
         ntB5ZVRb2cry0OMccYoZcOf1QaPNQJBwo6RBKda4NK51UAnsA0e7xG7bDjdJOSYKL/zJ
         gPux31zhsnIdKtBFRl3Fz7SwTW42sBr7NCGmBaQXYXbX2gEUzlC0KpixU1xdvZoi89Hi
         DxOFtXevrqYdfA5ZEZLaYYeI19C/xAH157RWOrM8DEzTwUnQLYdyyBbFpeZyKsZP9cdy
         dehqnnEW42AIBHKXLNseEMxjyOLsnibqiAk6P2YC2waeb4hP3Kox0lpddnTW7mXW7BHB
         a7aQ==
X-Gm-Message-State: ACrzQf19NI7KuJLYizkLuYJzI27byMJrFSDqZgMzcWd6RtxdwIPt4MA7
	EOOcybYWIWss3sjebr6E1D0=
X-Google-Smtp-Source: AMsMyM67I24tsHpRlol/3ysQkUh+uaBFlDqnjfAw2LpK6jbhg/uMMY3S0UKgNq5+9B6bZ4OfH4iWzw==
X-Received: by 2002:a05:6402:51c6:b0:451:6379:81cb with SMTP id r6-20020a05640251c600b00451637981cbmr27022708edd.372.1664278603621;
        Tue, 27 Sep 2022 04:36:43 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id t23-20020a17090616d700b0077b523d309asm648689ejd.185.2022.09.27.04.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 04:36:43 -0700 (PDT)
Date: Tue, 27 Sep 2022 13:36:37 +0200
From: Nam Cao <namcaov@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: forest@alittletooquiet.net, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH 2/5] staging: vt6655: change vnt_receive_frame return
 type to void
Message-ID: <20220927113637.GA10468@nam-dell>
References: <cover.1663273218.git.namcaov@gmail.com>
 <f727ea04703858920f6da694676ec323469e7b97.1663273218.git.namcaov@gmail.com>
 <Yyg6J/u23jcB2v+n@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yyg6J/u23jcB2v+n@kadam>

On Mon, Sep 19, 2022 at 12:45:11PM +0300, Dan Carpenter wrote:
> On Thu, Sep 15, 2022 at 10:29:33PM +0200, Nam Cao wrote:
> > -bool vnt_receive_frame(struct vnt_private *priv, struct vnt_rx_desc *curr_rd)
> > +void vnt_receive_frame(struct vnt_private *priv, struct vnt_rx_desc *curr_rd)
> >  {
> >  	struct vnt_rd_info *rd_info = curr_rd->rd_info;
> >  	struct sk_buff *skb;
> > @@ -133,13 +133,13 @@ bool vnt_receive_frame(struct vnt_private *priv, struct vnt_rx_desc *curr_rd)
> >  		/* Frame Size error drop this packet.*/
> >  		dev_dbg(&priv->pcid->dev, "Wrong frame size %d\n", frame_size);
> >  		dev_kfree_skb_irq(skb);
> > -		return true;
> > +		return;
> >  	}
> >  
> >  	if (vnt_rx_data(priv, skb, frame_size))
> > -		return true;
> > +		return;
> >  
> >  	dev_kfree_skb_irq(skb);
> >  
> > -	return true;
> > +	return;
> 
> Just delete this last return (it's pointless now).

Will be changed, thanks.

Best regards,
Nam
