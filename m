Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532DA656
	for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 16:44:36 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-24df758db1cso6133302a91.2
        for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683823476; x=1686415476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+CQciB2RKFm7DX+nj1X2SqY+0xRx25wMssqvf1i/LxY=;
        b=aYxaMVnUt8QmVNu4qWGR9RFchQvr16wGL64RHAjtsEfvgmWv+KKzDT+CqWaM9CMsY1
         256G7Mlg5QtEH7Ak19oO+sYA+1uSB94CYKAwmy1aYGGMnCjL8uZvqZDhP0A2x8xszwA0
         YMgllLeC2oOmCVAR2Nw7R5RU/7H0SL5j6uh8i8Hnk/fEfNx6WWeuPoCa5S6kO0F97eLc
         Z4Qo/s8buozwF8Qho564hZBj9E6udh93T6WgG6bDlbA+2yfeOy6HyexZSL+QSdkaX9v/
         rPN7i4C3UoO39pEANdmX6uY2b6DHuII4T6gwYAeY0icigVoX2ziB37lKvEajiJS8d+Fw
         ETCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683823476; x=1686415476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CQciB2RKFm7DX+nj1X2SqY+0xRx25wMssqvf1i/LxY=;
        b=eN3tZSsqsg9Do9H2yAcBLmNkxmooNdg+0UoWYqiBFQfG6hRfusBKDuLyW2zNjExRdm
         AMQt9BVP3hKMCtlt3Ex2qE3sSqFrAfHaQ7aYlCvaeaZ816mLgZDmkUA/ovOnJgoeLgzS
         8zP8Fqe8rFlLVNg/0C210H2KEgSaG/sGjMpij6tyzcy/CQLWm7iua2sDYGtfS6Os8XGY
         zh0gGTOPrSI0cDxK2en3zInX6pMlZzzIYt6o9pNcJiVkoThR6axkzdgZZPZgRaC1dlmV
         cCsju8bI6+Ofrzif9h6N/cO9V03O51ylaQ2A4an8Rx+KK2M6zOlELV6sZ/xENF5LzRxW
         roTw==
X-Gm-Message-State: AC+VfDx/OCGvADi8EmtQOomsNz8YziK+ZUWRrPJyuzuIZpFmALkrGcVt
	Fz4lkCMyiRPPxdYjx52yDu+PZ7qJmac=
X-Google-Smtp-Source: ACHHUZ5RtBPZyTlPH3yHPYQRYYJU4+SWcQdpqlI61y+qzo/ew5YYMRSlmAXEGIOuvc7h8uFsFCy8kg==
X-Received: by 2002:a17:90b:a48:b0:24d:f2f5:f571 with SMTP id gw8-20020a17090b0a4800b0024df2f5f571mr22203677pjb.36.1683823475682;
        Thu, 11 May 2023 09:44:35 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id g24-20020a17090a579800b0024dee5cbe29sm20148662pji.27.2023.05.11.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:44:35 -0700 (PDT)
Date: Thu, 11 May 2023 22:14:30 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8192e: Rename tmpRegA and TempCCk
Message-ID: <ZF0bbv4b84eiIHe4@pop-os.localdomain>
References: <cover.1683730854.git.yogi.kernel@gmail.com>
 <c9c67f832db3a776c04f26e0afb083ae3ba99c07.1683730854.git.yogi.kernel@gmail.com>
 <290473de-5946-49d4-9309-6bebf7cc9873@kili.mountain>
 <ZFz5Lxc/gUTKkLNX@pop-os.localdomain>
 <613ae5dd-2b36-4c87-8b6e-959e58d077fd@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <613ae5dd-2b36-4c87-8b6e-959e58d077fd@kili.mountain>

On Thu, May 11, 2023 at 05:21:07PM +0300, Dan Carpenter wrote:
> On Thu, May 11, 2023 at 07:48:23PM +0530, Yogesh Hegde wrote:
> > 
> > Thank you for taking the time to review my patch and provide your
> > feedback. Your suggestions are duly noted, and I appreciate your 
> > guidance.
> > 
> > I will make them into separate patches and submit it. 
> 
> You don't have to if you don't want to.  We can apply the patches you
> sent as-is.  (No need to resend).  This was just in case anyone felt
> motivated to do some more clean up work.
Ok noted. Since the patches can be applied without further changes,
I won't resend the current patchset. But I am eager to do more
clean up work, so I will definitely take your suggestions into
account and incorporate them in my future patches.

Thank you for your feedback and support.

Regards
Yogesh
