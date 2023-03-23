Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F15CD2E2;
	Thu, 23 Mar 2023 21:11:10 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id h8so362715ede.8;
        Thu, 23 Mar 2023 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679605868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KmmCdw9M5+J5Kmm/BSbt7uI0C9wsx89ZvFPHESAbpkI=;
        b=odP/JZc1gb5UHyOibWoevm2Bp4y1bvD670zN20xP9umqA0IJ1VyIajOHH8kfaWxtK7
         9R7RE+DnxJgmuEQeXsMWSAgUVM5MMoPGCUu1+4Qijy+DQPcvRv8PNuw/CCxe21ijrzr/
         Yb77TqRaKLOdfDXVgHOGo/lG+RBnIH8fHzKFi8LZEfy107cUHAaGy9R4IBJNu/NIuGYC
         cp0hws6URqI6DoxuqK4hIa1w2Y+vzy1y8s+AT+m5ur1c1voCaluxMudrLYZZ13vcqInJ
         AyYfdNJDTsm/eNConQMprgOJRlZrQruuRUaCdRd1ILQcpKNFh9uCrLPZA9oi2p/vXloy
         SOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmmCdw9M5+J5Kmm/BSbt7uI0C9wsx89ZvFPHESAbpkI=;
        b=QD7WiII9omgU0da7Nif9exeDa5vJHG9eg/+vWzuvehOr9aMz6sh0MMqOTn8zPK04yI
         PInwzMOyc0ckQAuCUbfNNudeufpg7HDrVBSlChwv52bskXaWYv0Z/MHkzzoHfghi4WTm
         hffuM0kGCiyJcKDYtl169oS97lxCRiDDClsds6v//Er3f8geWbrTcpsekkXzCuwaY0m6
         szzda/g7ORhbmLGYp2KbnN94hxfGODW8HBQ7nlC9aDbMxl3iwS0J5GlBZVNnPjvAb5nQ
         GBaoW5UGYaXU8AwbyjunITjwwcBgwNpAfLD09+9LvnnUhb6gx38elXRHO5S7AxkcT2o4
         Tsfw==
X-Gm-Message-State: AAQBX9eEQPDd2MTmOiLog9vlbKuqzxmE++s9zw1yLyUDY0jOZqutdWdh
	C9p8e3n+K20Ih4nbgPtZKHU=
X-Google-Smtp-Source: AKy350YQv0wuqUMzATOVUccjZo3qStRSuukNFSLKJqvpXgB8KjlL66ralMqUgXf/4qgv1nbqs1asDQ==
X-Received: by 2002:a17:906:9f0b:b0:8f3:9ee9:f1bc with SMTP id fy11-20020a1709069f0b00b008f39ee9f1bcmr485751ejc.13.1679605868465;
        Thu, 23 Mar 2023 14:11:08 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id lc5-20020a170906dfe500b0092973e209f2sm9122019ejc.109.2023.03.23.14.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:11:08 -0700 (PDT)
Date: Fri, 24 Mar 2023 02:11:05 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: fix line ending with '('
Message-ID: <ZBzAaZTOZrL4BTsM@khadija-virtual-machine>
References: <ZBsSOlPbaGZcAaSY@khadija-virtual-machine>
 <ZBvbP8ugDFjSoVp/@kroah.com>
 <ZBxtpyT8she++602@khadija-virtual-machine>
 <ZBxwKQdl8CDPqD2L@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBxwKQdl8CDPqD2L@kroah.com>

On Thu, Mar 23, 2023 at 04:28:41PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 23, 2023 at 08:17:59PM +0500, Khadija Kamran wrote:
> > On Thu, Mar 23, 2023 at 05:53:19AM +0100, Greg Kroah-Hartman wrote:
> > > On Wed, Mar 22, 2023 at 07:35:38PM +0500, Khadija Kamran wrote:
> > > > Splitting function header to multiple lines because of 80 characters per
> > > > line limit, results in ending the function call line with '('.
> > > > This leads to CHECK reported by checkpatch.pl
> > > > 
> > > > Move the first parameter right after the '(' in the function call line.
> > > > Align the rest of the parameters to the opening parenthesis.
> > > > 
> > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > ---
> > > >  drivers/staging/most/dim2/hal.c | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > You have 2 patches here with identical subject lines, yet they do
> > > different things :(
> > >
> > > I've dropped all of your pending patches now for the most driver as I'm
> > > totally confused.  Please resend them all as a proper patch series with
> > > updated subject lines.
> > >
> > 
> > Hey Greg!
> > 
> > I took your message literally and sent a RESEND PATCH. I should've sent
> > a new version of the patch instead.
> 
> What message?
> 
> Remember, we get hundreds of patches a day to review and have a short
> term memory of a squirrel..  make it obvious what is happening when
> resending or sending a new version, otherwise we are confused.
>

Okay noted. I apologize for my mistakes.

Thank you for your time.

> > Would it be okay if I send patch revisions with changed subjects now?
> 
> What would you want to see if you were on the recieving end of this
> patch to know what to do with it?
> 

I have sent revisions with an explanation about why the patches are
being sent again and what changes are made.

I hope I am not making any mistakes.

Regards,
Khadija

> thanks,
> 
> greg k-h
