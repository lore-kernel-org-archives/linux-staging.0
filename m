Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387B6259B;
	Wed,  4 May 2022 17:07:32 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id e17so1255647qvj.11;
        Wed, 04 May 2022 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IgL2IduVNcxBKQc1brpNbRJTmw+R5dGVZ1KkF4Imnfs=;
        b=Eg5gAEMva3cKrtqR2A0Cc+3z5UUxLVsQA8v8rh2j36ZiCIVUt2H4HorcB4rwOuvWR6
         JKNe++YLVfI/Sve1YFOIGZQfOgj6AfpwPRB3m/gb/hpvooo0XnPg0HpJYkGOH9nFB0/Q
         jTK+a8wIo7oIvH3qgH5+ZRDz0YB9ixQ/yKzoe3Ez0ADPXowkRCfMr+HrgabOymRJoOb/
         3LaM0ZlStKwt1NWQQWzHvaMoDJ0ayZ9I1kITpzOHM6iNWLBon1t3UAb6iJMoXE84vHGy
         NsinH4cIOjFQgXdOI4hiZwDbidIff8YK35NKG3wSwTuTejjAgkljnlNx93NbwOEOFML8
         NQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IgL2IduVNcxBKQc1brpNbRJTmw+R5dGVZ1KkF4Imnfs=;
        b=Yi+FUfpYZ+qUszmN1/2bayrHPNgoDDAvMqC9g8cAO+eHk+cCQj8O6nGtwETK6ZbPub
         G+JUu5ABnt6I9nlrrlWR0bbW/s7QUugjgLBoAH3udNgWFFLTbo3sFX0+0gluiwdwHGyt
         /FXGAtcSrwo0AI6zYdUU/GFEpT2IXzPooYH0AU91V5c/CsDtADXWri+S5VX9rTV8azTy
         eZXYW2KmvLCRolXHeR0c2jS5nexTSL3TFcHaGOaNpEWiU7IBwmdvfzQyZ8k/r9raWFXW
         Q6pryMfG8oqWSzdVTYcpfOYMVcFISpGqtzSj+EV62DlkF6D9nAPKZa19Z2NuwVAGpfMn
         NO5Q==
X-Gm-Message-State: AOAM530OKhKltvNwg9mW5ls2GnoKj9YSiGqC5Yu3t7u9N2jclvYcUir9
	AZwhntyanv8ezq0VCq4FmgU=
X-Google-Smtp-Source: ABdhPJymonwwKJEu+zKIwUyz7H7uJGSZslAlFiLL0za6AjT3ELvv5KYH3MFj0YwaRMr8wXpaUes4gw==
X-Received: by 2002:a0c:ec41:0:b0:456:51c6:1800 with SMTP id n1-20020a0cec41000000b0045651c61800mr18384061qvq.44.1651684051063;
        Wed, 04 May 2022 10:07:31 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id h3-20020ac85683000000b002f39b99f692sm7647171qta.44.2022.05.04.10.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:07:30 -0700 (PDT)
Date: Wed, 4 May 2022 13:07:26 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Stefano Brivio <sbrivio@redhat.com>,
	=?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Outreachy Linux Kernel <outreachy@lists.linux.dev>
Subject: Re: [PATCH] wfx: use container_of() to get vif
Message-ID: <20220504170726.GA970146@jaehee-ThinkPad-X1-Extreme>
References: <20220418035110.GA937332@jaehee-ThinkPad-X1-Extreme>
 <87y200nf0a.fsf@kernel.org>
 <CAA1TwFCOEEwnayexnJin8T=Fc2HEgHC9jyfj5HxfiWybjUi9GA@mail.gmail.com>
 <20220504093347.GB4009@kadam>
 <20220504135059.7132b2b6@elisabeth>
 <20220504132551.GD4009@kadam>
 <87o80d9tay.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o80d9tay.fsf@kernel.org>

On Wed, May 04, 2022 at 07:05:57PM +0300, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > On Wed, May 04, 2022 at 01:50:59PM +0200, Stefano Brivio wrote:
> >> And that it's *obvious* that container_of() would trigger warnings
> >> otherwise. Well, obvious just for me, it seems.
> >
> > :P
> >
> > Apparently it wasn't obvious to Kalle and me.  My guess is that you saw
> > the build error.  Either that or Kalle and I are geezers who haven't
> > looked at container_of() since before the BUILD_BUG_ON() was added five
> > years ago.
> 
> Exactly, I also had to duplicate the error myself before I was able to
> understand the issue. So I'm officially a geezer now :D
> 

Hi Dan and Kalle, thanks for your messages!
Understood -- I'll copy the error for reference next time. Sorry you
had to recreate the build error yourself!

> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
