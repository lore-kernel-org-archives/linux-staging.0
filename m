Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A232C8B
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 15:58:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o24so3378201wms.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=oxg7wtYVb2I8ZNupHXd2gl7ipYhOJwG6Q/eeUjge9ic=;
        b=mObrmk3neCUnsocnuZ1ARAuQDBLO2Pv0jgshOruwD4Pp1dH5du/dxLfpPtLC/BK8EK
         gkrEHLoo32P5ycx9wBLj8bRKBIBLeexPKSM0epgdp1a/fcAmHkIltMNndDtKcvzGBPDL
         KPPAuyn+L/K5FiL6s/mWb6aA9hXCS/GVW7VwzuSyJp2M0aKTSy65rO1Z6tpQWZOe9vpm
         aGZ6hr96qqs3V+dcTjqezDAyQtuv4k/Vld1b/dbRObxiLYrFcsxNSiqw8dJMycqfnWpW
         skkg7umXzpJATMSqK2EPoHMaP+qFuwTniSJeCI5nF/6BLbXqVClv7sz3R2URE3Pv5wd7
         uNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oxg7wtYVb2I8ZNupHXd2gl7ipYhOJwG6Q/eeUjge9ic=;
        b=fMdr1r3Rhx4rqG04wBFd18LIA3q0vV0riFOyjlkmPCXQBdkX1xYouKt/6PYtq22H0y
         e2iB1n1UvRHrGr5nCSTDgI4ksq5hte8BVFm+sQqFzYZTHo/RDX5XYW0NlvXZSajXuIha
         Po7BXNZ7y5ihswlQK+Yq0KLYfdptv5MXMc4nExaL9lheKADeiwPKOxJTfd5RspQHG2NS
         UV8wNueU3xTCQf65Csek+qAHPjut85j+CeU/MJEmmEGT7DAxJWD/HDAlpoKG90O0YieK
         R2x4ZkU0qCWIz9VkFaSZ2lVIusmxvDXVOJm8lf4T1kLxCZ3E8XpSNwKC37mzQrukhYZg
         8qhw==
X-Gm-Message-State: AOAM53355PTxoWJhVvsvXk2DovUCMu8ysPWnNDXsH0O4XModR4hTkQjs
	2foIIjyIoBy+wrOyaGuHhUk=
X-Google-Smtp-Source: ABdhPJyuX+UxDE43oOxLtTPF+QzO5lezSDRse91WnwSQJocAbTWj/Pta2ldHRGdH3fuIR8C0LSUAqw==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr587438wmb.37.1634918284369;
        Fri, 22 Oct 2021 08:58:04 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62? ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id k17sm8152897wrq.7.2021.10.22.08.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 08:58:04 -0700 (PDT)
Message-ID: <bf2a82e5a5f296ea66bda0cef84acbf78e88ffe3.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH 5/5] staging: vt6655: Rename
 `byRFType` variable
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: Praveen Kumar <kpraveen.lkml@gmail.com>, 
	outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 22 Oct 2021 16:58:02 +0100
In-Reply-To: <049d4b3e-ed32-9b48-0c2e-19f9af95ca37@gmail.com>
References: <cover.1634826774.git.karolinadrobnik@gmail.com>
	 <f0b6818d2b15982081bebaf14f830f4646f61fe2.1634826774.git.karolinadrobnik@gmail.com>
	 <049d4b3e-ed32-9b48-0c2e-19f9af95ca37@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Praveen,

Thanks for taking a look at my patch.

On Fri, 2021-10-22 at 19:56 +0530, Praveen Kumar wrote:
> IMO, probably we can sync RFbSelectChannel as well with similar
> notation in another patch.
> 
> >  bool RFbInit(struct vnt_private *priv);
> > -bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char
> > byRFType, u16 channel);
> > +bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char
> > rf_type, u16 channel);
> >  bool RFbSetPower(struct vnt_private *priv, unsigned int rate, u16
> > uCH);
> >  bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
> >                     unsigned int rate);

That's a good idea. I plan to clean up `RFvWriteWakeProgSyn` completely
first and then I can move on to this one.


Thanks,
Karolina


