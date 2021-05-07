Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E440770
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 14:32:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id h4so9469596wrt.12
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3//Kat2kLRfs6xz02EouC0hnwC89ScuchUiDT4egjbI=;
        b=EEeOrkp0HAG+v/4udPRERGFRmns8fAEOyY8OdnnkWw0GBQ6FVpKn6VIYmR4KikkugJ
         hvoZHHu7eO++zFXYk/kENxQQbGM8M7Z86w5ixmbViwEczNE847a3GZ/zsp5/EnXrEa6Q
         OF3/WHRTiNpNMyDw4oFI0GOl6yeUhX821nE8HtnWh70fF9q/tfdvBMlo3r/85yrW4RpW
         zbjKjd3dgPaGycqadaRg1O/3Phy8Fcdv68bh7bEI48Vq22+YvvR6We+l+lenI+muxMjO
         g1NS9hbsg9FVTzkumP4qwzwJrgIa8w4DHhEtnDMY5I8/P36i20D+hu8GesPUS7zm1T5t
         jrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3//Kat2kLRfs6xz02EouC0hnwC89ScuchUiDT4egjbI=;
        b=A9264etBDH1X9TQ/eGkwSAj+4eLmAcm5INtJPNeHNuIZ8/nTBKUj80FQmreab7FiDE
         XcVndoOfzQr7d+9cNs5H1fVXT0M1EJFvniEpSJIX9EyLjk6TcBqQiLWdw7KCSYdV6DA1
         JJenN3PQBe9lPmBzPXHjALLyQ8oUjCazTPPHUBIOJa339oPjzoPQ9mt5QSAlkY2KLC7b
         MWZGmX6a4avf8Ba14YgQo/Fuho3S07eXO9PC2/8+CWVr5FIQr3wKLqeOpQap43K4UWP/
         b8ksGQwpFVQEQo89QQBEgbvfKRoqsYA/7vROqEQvzA6grsTItKTSahgxweP66vVQJQsP
         HUfQ==
X-Gm-Message-State: AOAM531FVUTJzHiMK3sPSecVMymbVXhnuk0D08Svzhjly758KJyOtb+F
	Rfsw8HQg4g2j8bz+u/k85eqUqAEo/TDRIQ==
X-Google-Smtp-Source: ABdhPJyXlGAWT60LUKWblGyM6JtnZn6r7m8UE3IM+fuTHlGX5AiTOxWlvyFmxO/84Syrg79HX7N9eQ==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr12591508wrv.239.1620397925345;
        Fri, 07 May 2021 07:32:05 -0700 (PDT)
Received: from agape.jhs ([5.171.73.10])
        by smtp.gmail.com with ESMTPSA id x8sm8306418wru.70.2021.05.07.07.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:32:05 -0700 (PDT)
Date: Fri, 7 May 2021 16:32:02 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <greg@kroah.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: Bouncing messages from linux-staging@lists.linux.dev
Message-ID: <20210507143201.GA1408@agape.jhs>
References: <1620376201-3408-mlmmj-4f932172@lists.linux.dev>
 <20210507090826.GA2106@agape.jhs>
 <YJUnqO8Dje/gZPEd@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJUnqO8Dje/gZPEd@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, May 07, 2021 at 01:42:32PM +0200, Greg KH wrote:
> On Fri, May 07, 2021 at 11:08:27AM +0200, Fabio Aiuto wrote:
> > Hi all,
> > 
> > On Fri, May 07, 2021 at 08:30:01AM +0000, linux-staging+owner@lists.linux.dev wrote:
> > > Greetings!
> > > 
> > > This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> > > mailing list.
> > > 
> > > Some messages to you could not be delivered. If you're seeing this
> > > message it means things are back to normal, and it's merely for your
> > > information.
> > > 
> > > Here is the list of the bounced messages:
> > > - 2608
> > > 
> > > 
> > 
> > what I'm supposed to do now if I'd want to retrieve the bounced message?
> 
> What do you mean by "retrieve"?

bring back home the message 2608 which is a message to me that could
not be delivered. I mean, a message sent to me which was never delivered...

If I didn't misunderstand.

thank you,

fabio
