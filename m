Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBD372
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 16:31:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id d11so9880868wrw.8
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A2lTwqt4P6DJWoiwe8vEwFF0T1hZp/JmRCbEZcKL7HY=;
        b=QJ0311u+v1cnbHbXJMCGOfUV35+G/PKJ7Z9E0QUxbSg0q5KlNPQlIE8gVa3xtvYF9U
         QJ4mZ8gVN01iNq8GT9DXwF7aMPJ2Lj+AjllisKi0Xceq6rNE8ggCYg5fOQoGn+8W28WM
         Fri0y6jlXDtbLvnIO/mtU8fMehqGtnB9MSer+CHTjD1141akIkbi0U4rC58KV6u0SJ7I
         UrJ2+djgeArUCPnMXmE+kbOCqO0tBzo5v1oX2C2dUkIjTHI1MZNJdDL9DCgpaTR+8dfp
         vQ8Y983B4Yk0pIAZBJAGqGvlb7TSmzE7FP+n40aJ+/A8aRJetmQ2t6uUuc23+KWo4ol9
         rC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A2lTwqt4P6DJWoiwe8vEwFF0T1hZp/JmRCbEZcKL7HY=;
        b=phstgPWeSJ/Am2thzkAWZAhhemb6tyw6wgrBI5aPsuewvS9TQvXjOfkEGGvoriXTKr
         3W9Na3+UhGgbfUZSW4O9Y6nYLeFbfvVqoLp59b11lzMMfmSS5kBYhPtAGPXhLk6ad56C
         ekLjD200huWCv7tvmTJRDheDrZlfmrv8fC87gqiK0SociEH3MfbFoW3dM/bPjfGrBeKt
         9uG8dg19CXwB7bFO/0lEYUIRbxEp7pVhPAl8RaC3yCdywnQEkwqXyua8X5YcvLDeOxwq
         mfjXezm3j4NH+gr8n9nPZQ9b8xywc8GMBSig2eUdWLMCfYHxivf9wFUGcdfzNY8eYdaN
         X4Zg==
X-Gm-Message-State: AOAM5333jC1WvPbvpYtYfGZ3C38hp3wvmG0YdfkICfEoxsf39MkYNOPY
	JpejpjUqEt0o0dg7IGOpL8s=
X-Google-Smtp-Source: ABdhPJz1/x6r3lDvQR+U7cpNSEQbHjk8Yj0z1rCIfJRhwD9/vCothf9pp2TjVUVQY7T0iqMf18rSfQ==
X-Received: by 2002:adf:f948:: with SMTP id q8mr13480155wrr.296.1620405065221;
        Fri, 07 May 2021 09:31:05 -0700 (PDT)
Received: from agape.jhs ([5.171.80.218])
        by smtp.gmail.com with ESMTPSA id n6sm9070085wro.23.2021.05.07.09.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 09:31:04 -0700 (PDT)
Date: Fri, 7 May 2021 18:31:02 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg KH <greg@kroah.com>, linux-staging@lists.linux.dev
Subject: Re: Bouncing messages from linux-staging@lists.linux.dev
Message-ID: <20210507163101.GA1410@agape.jhs>
References: <1620376201-3408-mlmmj-4f932172@lists.linux.dev>
 <20210507090826.GA2106@agape.jhs>
 <YJUnqO8Dje/gZPEd@kroah.com>
 <20210507143201.GA1408@agape.jhs>
 <20210507161034.GH1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507161034.GH1955@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, May 07, 2021 at 07:10:34PM +0300, Dan Carpenter wrote:
> On Fri, May 07, 2021 at 04:32:02PM +0200, Fabio Aiuto wrote:
> > On Fri, May 07, 2021 at 01:42:32PM +0200, Greg KH wrote:
> > > On Fri, May 07, 2021 at 11:08:27AM +0200, Fabio Aiuto wrote:
> > > > Hi all,
> > > > 
> > > > On Fri, May 07, 2021 at 08:30:01AM +0000, linux-staging+owner@lists.linux.dev wrote:
> > > > > Greetings!
> > > > > 
> > > > > This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> > > > > mailing list.
> > > > > 
> > > > > Some messages to you could not be delivered. If you're seeing this
> > > > > message it means things are back to normal, and it's merely for your
> > > > > information.
> > > > > 
> > > > > Here is the list of the bounced messages:
> > > > > - 2608
> > > > > 
> > > > > 
> > > > 
> > > > what I'm supposed to do now if I'd want to retrieve the bounced message?
> > > 
> > > What do you mean by "retrieve"?
> > 
> > bring back home the message 2608 which is a message to me that could
> > not be delivered. I mean, a message sent to me which was never delivered...
> > 
> > If I didn't misunderstand.
> 
> Just ignore it.  We all got the same message.  If it's really important
> people will resend.
> 
> regards,
> dan carpenter
> 

got it, thank you all,

fabio
