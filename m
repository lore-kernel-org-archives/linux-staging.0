Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDDC7E3;
	Mon, 20 Mar 2023 14:36:08 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id w9so47638780edc.3;
        Mon, 20 Mar 2023 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679322967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+bhKdJGctfgNktjxuVj2so7dX31mlyALoONZ3xTxQAo=;
        b=h8UPhcIEH39Ywj5eMgZz0xyTP3unUC/KUfkRJw0CqfGPlEKN6SwKqG2gqt1qfYfKz8
         UCy6FmSEU6W7FJdpoEKE5cBmfQuvwRdvomX+bZRIIUpHIwRsKgXNLAuaQvndtkd17GzJ
         HJK4SKYWulZhCWvfwkMozsbjVthDUgWwl2fold1owMQTDwa6vsG6ivVxdFTu/iTccaRy
         RRH/I+NOLyu0XndnjKft6VjQ7okAs7qb9X4s60zwKW+2jmFN/ty7U3NqEOSZxHkV379c
         mhV4P2VKedk0b7yxKVEddlF89/2DHCvGPs959aXjJOrEPBZjE/RrqN2xIicXLCYG+AUy
         4lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679322967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+bhKdJGctfgNktjxuVj2so7dX31mlyALoONZ3xTxQAo=;
        b=tbRe5wLnf8/zkw3t2lDFst4D9wX27sB1ILhbVXid9eeksxrgekJLy5MxrbLb86uG3g
         TzQf3ZCGAflH2oBGNh+sjPqdDaTV15cXd7M0FxsX8gJunA5xrj7zXZoPYlxmv4Iye/oG
         6OZyMSpDsOPyjB44Y+lOyYwX5pAwuWiL/8BrpcoWEeQia0Ndi2QFs6piqSdPbZyMh1/O
         iKsEon8d8fMag9Wr306efsWUbRgB99NvhyAYAAm0AIFva+kMR3sbuO5AAT0fqXuG5/4u
         hI37y8jKE9Tw0Ei77EJ6zUm6Ckbz14alNF/DhtKaKv7n1Vo3FbBGOmhUAivMYvO3p4er
         ywsQ==
X-Gm-Message-State: AO0yUKXqYenebvguFH0G9j4fL3ssQzA8IrCHk4ssDy5o2AmXCh0IWMyE
	6s9wNKk3ZcI6VpjZoPU8q10=
X-Google-Smtp-Source: AK7set8jbwJ62Rb4/CWNBz2G/at5rbfmgI979Xo7rDZoF8x9yzaT6t4b5n/rH43xpuzCDJQl76yolQ==
X-Received: by 2002:aa7:c658:0:b0:4fb:e14:c25b with SMTP id z24-20020aa7c658000000b004fb0e14c25bmr12070380edr.33.1679322966785;
        Mon, 20 Mar 2023 07:36:06 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b44-20020a509f2f000000b004c09527d62dsm4969535edf.30.2023.03.20.07.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 07:36:06 -0700 (PDT)
Date: Mon, 20 Mar 2023 19:36:03 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] staging: axis-fifo: initialize timeouts in init only
Message-ID: <ZBhvU/USP0es8e4P@khadija-virtual-machine>
References: <ZBN3XAsItCiTk7CV@khadija-virtual-machine>
 <2222576.3ZeAukHxDK@suse>
 <ZBf+XDN8GM0xDDCq@khadija-virtual-machine>
 <3180435.l52yBJDM9G@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3180435.l52yBJDM9G@suse>

On Mon, Mar 20, 2023 at 02:38:24PM +0100, Fabio M. De Francesco wrote:
> On lunedì 20 marzo 2023 07:34:04 CET Khadija Kamran wrote:
> > On Fri, Mar 17, 2023 at 11:29:25AM +0100, Fabio M. De Francesco wrote:
> > > Khadija,
> > > 
> > > Congratulations for having your first patch in Linux, via Greg's staging
> > > tree.
> > > 
> > > It will take some time before it reaches mainline, although it is already 
> on
> > > its way to get upstream.
> > 
> > Thank you! :)
> > 
> > > On giovedì 16 marzo 2023 21:09:00 CET Khadija Kamran wrote:
> > > > Initialize the module parameters, read_timeout and write_timeout once in
> > > > init().
> > > > 
> > > > Module parameters can only be set once and cannot be modified later, so 
> we
> > > > don't need to evaluate them again when passing the parameters to
> > > > wait_event_interruptible_timeout().
> > >


Hey Fabio,
I am talking about this below:


> > > Greg made you (and indirectly me notice) that the statement above is a 
> kind
> > > of short-circuit because it misses to make the readers notice that you are
> > > dealing with specific permissions granted to these two module's 
> parameters.
> 
> Only "read" permissions for owner, group, others.
> Obviously, when the module is initialized, "insmod" can pass actual values to 
> the arguments. The point is that from that moment onward nobody is allowed to 
> change the initial values associated with this variables, but they can still 
> be read at will.
> 
> > I am trying to make sense of this. As the permissions do not allow
> > write, so the value cannot be configured afterwards.
> 
> Yes, if with "afterwards" you are intending after they are set at insmod runs. 
> 
> > Instead of saying 'cannot be modified later', we should talk more about
> > permissions here too.
> 
> I'm confused by this statement. Can you please rephrase?
> 
> > Am I getting it right?
> 
> Not sure, it depends on what you meant with the previous phrase.

As you said above that the commit message makes the reader miss the
permission details, so should we write more about permissions in the
description?


>  
> > Thank you!
> > 
> > Regards,
> > Khadija
> 
> You're welcome!
> 
> So, thanks for working on this patch as long as it takes to get it done. 
> 
> I think the lesson to be learned is that in our community there are barriers 
> to the entry of substandard products and therefore people have to do their 
> best if they really want to see their work applied.


Yes, you are right. Due to this reason, the whole process is making me
learn a lot. I am really glad to be a part of it ^-^ 


> These tasks are not for the "faints of heart" :-)
> 
> Fabio
>

Regards,
Khadija :)


> 
> 
