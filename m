Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15762C82
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 15:53:49 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id u20so21672608pfi.12
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 07:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fcSYNuva57n7+RnRM9rr3l2aKQTdRJZrel3PVRDc1lY=;
        b=IJrlJgNd68JU2aUjwQjpEYSJi9psL6tTrpM33svuR4K6mxHJ5yIY9vZLAvrkbIpYKj
         9qV6hYIFzZN7fNIs6ucwcx2HP89qp8O6QfigtMOivWkDNUniXMJt4Stc6Myz//AXY/AB
         6Ebw/b/ADbqu5vV9YQOg3kfv0Qu/tkvR5PoRTp+QTuTFfWoaNT2JbrMqOhpn7RuhJyFp
         YiOzyGxWRG/Pz9dayQPXf7vZOJSt0N2XO+TG/9ORrWnKJ2BJ6k6F4Ymzy4a9tGTUBKwT
         y/JMW+trI7bi6/pbP3vzp25ARjqUTNZA3We6o7RKHAkgTXoodsmBIj4meTloVG5fEh80
         GS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fcSYNuva57n7+RnRM9rr3l2aKQTdRJZrel3PVRDc1lY=;
        b=ultAXUHuGJb5UXdNQ6HGPxleHx9dFuoDiVVquZRDhuX1LihAE7m4ig7F6J/WvTtf7q
         j5TCqG6hse9GzfxR/C/FudBPlqwGcZhUBuABvm3N7EUMbgB7RWlZzCGY531tQzbR+W42
         +Ay+FXulLoX/1qG1sy+Iz5C8GYaZ5Niiio9IqD//lvOUHziUAFAXk3RGQIgfjAFVOyN0
         x9aW4EoWuokzCBv0BcmnSGORAzXx0tH+Pqp/soob+F1PUMUnOAt7YmTiyeHBT6mbTUii
         h7BR5vZ1lrG59Jen1waCh/iWpzsu/gvsqTTFIzY7Xo3lBSx08zmi9sZF4UUlBAcC5Ys0
         MY1A==
X-Gm-Message-State: AOAM531sJpGBFkBwqzKRzFc1mQFYl3UPdi5RvQj2YycAHHghs1NR/ADA
	sfS6arcf2nGZvWqcq+WHAGs=
X-Google-Smtp-Source: ABdhPJxDjMGStn4l9DdX1W+2e7/z92qOtnCCzyxn+ensNfAlIjFuGx4dpJ1h2qGycXvr3YNbzyZyow==
X-Received: by 2002:aa7:8e44:0:b0:4ad:55c6:6376 with SMTP id d4-20020aa78e44000000b004ad55c66376mr32230187pfr.71.1640879629441;
        Thu, 30 Dec 2021 07:53:49 -0800 (PST)
Received: from localhost.localdomain (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id 22sm28057209pfv.173.2021.12.30.07.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 07:53:49 -0800 (PST)
Date: Fri, 31 Dec 2021 04:53:44 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: add docs to packet_format and
 tx_start_condition enum
Message-ID: <20211230155344.GA5404@localhost.localdomain>
References: <20211229094713.GA28795@localhost.localdomain>
 <Yc2QrMecuVQFRcBZ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yc2QrMecuVQFRcBZ@kroah.com>

On Thu, Dec 30, 2021 at 11:57:48AM +0100, Greg KH wrote:
> > +/*
> > + * Defines the packet format used.
> 
> What "Defines"?  This is an odd sentence.

Noted. I will change that.

> > + * In both modes the length of the payload is limited to 255 bytes if AES
> > + * is not enabled or 64 bytes otherwise.
> 
> What does this have to do with the format type?
> 

The rationale was that I wanted the developer to know straight away how
much info would be possible to transfer given the combination of
encryption + packet_format settings. 

But now that you mentioned it, I can see that this info/obs could be 
misplaced. I will remove it.

> > +    /* at least one byte in the FIFO */
> >  	fifo_not_empty
> >  };
> 
> Also, always run your patches through scripts/checkpatch.pl before
> sending them out.  I couldn't take this patch for that reason alone :(
>

My apologies, I will be extra careful next time.

thanks,

Paulo A.
