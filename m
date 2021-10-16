Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C132C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 06:43:37 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id y12so48506163eda.4
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 23:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UWFffkeFsvPwNFOpRilez5i6fSLHTsRHCrNltfWljkA=;
        b=gbzE8SBRDWEglez5cXZkfgNp94px/0RmnitbdvFxh9MlAoz7bsETB29sFrr8XUoYEf
         mEOym4OcdM6Xdm9WbHqVOQ1qWfWt63rI9vvbrzfALAa44qoC0ywkXYStwqFflhjL9KMl
         43jNueEw6KsstHEw6K85z3LsmwB0mSrpQlPZLJa0P4CTnYylqwpaDriScI+xxvnteda7
         p3WZnC8T0HVXwM7CdKopisTSUmI7ZCGCixYhx4qKXT8RxA2/2NtFSJAOJYq1E8TmbFbM
         aXU9h2TaaueqPNyPLt+/jKvDguB+QuuHbCK5Hj8rnEfd8xGWMCmWvAGLghT449v2mNHk
         jvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UWFffkeFsvPwNFOpRilez5i6fSLHTsRHCrNltfWljkA=;
        b=NoTt57cXtp4tKRencYrPrkVBt8TOX6ZbL08Afn4VIAssVoSjqH5d1he5YPYt7uyBc6
         T+kTaqiYnAlaHE8Jra3VR9SqsWslT3RnnXgqgBkESs4yc1AHNDchbFmTmLN3Y6zkLWPC
         fl3CM+o4OaxyhMKv8RMF64rPSw5JZsn8GXrCEjFF8nWqOqeJXyOQ/344/fCmRTBHIVxl
         fYhAP/Ac+UtsCpDWfImgt4I/XQTlfVNe/fb+50SvLZASWJr/bVjFncQG5szW2US9wqH0
         8HNcKeNbJmPsazt3o3vRR8eylw1HREgsR6m43DyiVDN7ZZLFB1Wg5Qss5pefTDykL6Si
         e6qw==
X-Gm-Message-State: AOAM5320ZoTvx7NjNntZArQRF6j++HVmS45cIJmpz9zFwx5ChTAvEFE/
	AcJZBCAiRTDlH0r3gAMVTic=
X-Google-Smtp-Source: ABdhPJxLUukgcXIKo8A2H/JXFIq6srtPP7f3N0iQ+1yFRV679FBwEND3UICUa43rks039X5+VHsplQ==
X-Received: by 2002:a05:6402:1b90:: with SMTP id cc16mr24643352edb.2.1634366615887;
        Fri, 15 Oct 2021 23:43:35 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id f4sm5761908ejf.61.2021.10.15.23.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 23:43:35 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] staging: r8188eu: Use completions instead of semaphores
Date: Sat, 16 Oct 2021 08:43:32 +0200
Message-ID: <2097763.mHcV3lrXRZ@localhost.localdomain>
In-Reply-To: <20211015125020.GS8429@kadam>
References: <20211015110238.1819-1-fmdefrancesco@gmail.com> <2060953.sJFZD89sIB@localhost.localdomain> <20211015125020.GS8429@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, October 15, 2021 2:50:20 PM CEST Dan Carpenter wrote:
> On Fri, Oct 15, 2021 at 02:11:41PM +0200, Fabio M. De Francesco wrote:

[...]

> > Hi Dan,
> > 
> > Thanks for your review. 
> > 
> > I wasn't aware of Arnd's patch. If I were I would have sent a "normal" 
patch.
> > 
> > Beyond this, I noticed that other semaphore (pcmdpriv->cmd_queue_sema) 
but, 
> > since I was not 100% sure that my changes would be accepted, I decided to 
> > leave it as-is for now and wait for reviews like yours.
> > 
> > Now that I know that this changes are welcome I'll also make the other 
> > changes. 
> > 
> > I guess that I have to change one semaphore per patch and make a series. 
> > However, now I see that Arnd's patch makes all the necessary changes in a 
> > single patch. What is the correct approach? Is one patch per semaphore 
> > preferred or one big patch for all of those that need to be changed?
> > 
> 
> The two semaphores used in that function are very connected so I don't
> think it makes sense to split those up.

I agree with you: the two semaphores in rtw_cmd_thread() are (somewhat) 
connected. However they serve different purposes. 

The first is used in to signal start and end of command thread 
(rtw_cmd_thread()). The second is used to notify that same thread that some 
commands have been enqueued. They serve two different purposes.

I prefer to make a series of three patches that I'll call "staging: r8188eu: 
use conditions variables and clean rtw_cmd_thread()". This choice is based on 
the above-mentioned fact that the two semaphores are there for different 
purposes. Let me explain what I'll put in each of the three patches... 

1) The first semaphore came to my attention because of a Smatch warning about 
duplicate releases ("up(s)) of the same semaphore in the same function. While 
addressing that problem I noticed that completions variables are more suited 
than semaphores for doing the work. 

So I didn't merely change the names of the semaphores in order to silence 
Smatch, instead I chose a more radical approach that is to replace semaphores 
with condition variables.

The first patch is there, I have the commit message ready to be re-used, and  
it is self-contained even if we still have a second semaphore that is there 
for servicing another purpose.

2) The second semaphore came to my attention while working on the first and 
trying to understand what rtw_cmd_thread() is meant for. It is there for very 
different reasons. There is only one relation between them, that is that they 
are used into the same function. Nothing else.

So I prefer to write a second commit message (in patch 2/3) that explains 
what the semaphore does and why it is better to replace it with a condition 
variable. Obviously, this "why are you changing it?" has a different answer 
with respect of what I say in patch 1/3.

3) With 3/3 there is the "clean" part of "staging: r8188eu: use conditions 
variables and clean rtw_cmd_thread()". While reading rtw_cmd_thread(), I 
noticed that there is an unnecessary duplicate of an 'if' statement. I want 
to remove the first (the one before the "_next:" label.

Other semaphores is r8188eu (if there are more) will be eventually addressed 
in future patches.

I hope that you and Phillip agree with me on this step by step approach.

Regards,

Fabio M. De Francesco

> The others are less connected.
> 
> regards,
> dan carpenter
> 
> 




