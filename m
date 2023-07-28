Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C81FAF
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 06:49:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so18593915e9.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 23:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690526970; x=1691131770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LmJ6BXegUrc9i3x0UWFPriRnJhYU37oWkfBZx21F9OQ=;
        b=NB+3mL2mAhd0YNBs/9gVkXH/rRmzR6u6M0m7sPyFprTN2R/hGF+5M2mPSNp4/SOSpl
         qC0s1rVwnH04Tk6QWodWYUUHLIcH+jFdHAZfoRGwnjH/GLQCa9+nvvGBatiULPc+zTp/
         hLdvXQRjhv53Mqo7bCMHNs9tTrjfkk76AxB1Upfm0/yK4ojTTGQMsJ+QoUvRekHJb9Mr
         cPRJwKWHzTfnGlifODQd6PI/1eV7yapZ0J1wKMVxFNCyhUljvt3cZpY/vV3LYtIStstk
         +iQscmKU656z51yzL0X0N9UgIZlVFj4tiJfLr4kvaMpO8gEXZGi4O2ifVMxnICwrKoXC
         S4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690526970; x=1691131770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmJ6BXegUrc9i3x0UWFPriRnJhYU37oWkfBZx21F9OQ=;
        b=cRgWqPyckCc1Een2aHn7YrjIo3W8E6Z6QM4I7HinUsRaS3i5KJbvObhJd40GteRb0v
         fnVsa37P7qnKTFqfybq4za6aKW2bKEEOGJLEsJCtsuWmszHZyGi/N5sYo6sSWyjGiwdL
         kw1uosIciMvReM802Du5d70nJ+9fWRcfdI9kaDccP/7KlekiVilia7Z0fTcLswjmIEKE
         4uQgjQDQ/GsJ5fA9hFCfFgoRcmwB+V2efvT5xW/uSWg+mt0xUwo4/apJkgqcEc5lMyzt
         cy+yU88UGCZQ8pwRkKwLuguhuvvpg3KuFfgncFMspQE1khTiAfxo6OWRhsKS4AbANGX+
         BysQ==
X-Gm-Message-State: ABy/qLagTKnrlZ5qThHeh6Fw0GjGA9M8+ucve041DbKlVIQmMc/vYLRO
	e33RQC5LiYOvS9mgpItVWgkqVA==
X-Google-Smtp-Source: APBJJlHndBTQ7yQ5tqQ+eyksuvSaue33KmB/4JaPkdv9G0scjZN4tAaQl2hHktY8JagmgFSWeQ/+NA==
X-Received: by 2002:a05:600c:21cd:b0:3fc:4e0:be97 with SMTP id x13-20020a05600c21cd00b003fc04e0be97mr891135wmj.6.1690526970178;
        Thu, 27 Jul 2023 23:49:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d4407000000b0031766e99429sm3907635wrq.115.2023.07.27.23.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 23:49:29 -0700 (PDT)
Date: Fri, 28 Jul 2023 09:49:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	gregkh@linuxfoundation.org, anjan@momi.ca, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Staging: rtl8192e: Function name cleanup series 1
Message-ID: <f47c3d86-aada-470d-8ed8-5d7957edb28a@kadam.mountain>
References: <20230728054742.622297-1-tdavies@darkphysics.net>
 <f4aaf5f5-a6b0-ef10-0d9b-fc52035ca309@gmail.com>
 <ZMNf2d615rXJ8O95@basil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMNf2d615rXJ8O95@basil>

On Thu, Jul 27, 2023 at 11:27:37PM -0700, Tree Davies wrote:
> On Fri, Jul 28, 2023 at 08:16:03AM +0200, Philipp Hortmann wrote:
> > On 7/28/23 07:47, Tree Davies wrote:
> > > Rename functions to fix checkpatch warning: Avoid CamelCase
> > > 
> > > 
> > > Changelist:
> > > v3: Changed patch #5, Rename global function ResetBaEntry to rtllib_reset_ba_entry
> > > v2: Sent to mailing list via git send-email, patches are the same.
> > > 
> > > Tree Davies (5):
> > >    Staging: rtl8192e: Rename function ActivateBAEntry
> > >    Staging: rtl8192e: Rename function DeActivateBAEntry
> > >    Staging: rtl8192e: Rename function TxTsDeleteBA
> > >    Staging: rtl8192e: Rename function RxTsDeleteBA
> > >    Staging: rtl8192e: Rename function ResetBaEntry
> > > 
> > >   drivers/staging/rtl8192e/rtl819x_BAProc.c | 44 +++++++++++------------
> > >   drivers/staging/rtl8192e/rtl819x_TSProc.c |  6 ++--
> > >   drivers/staging/rtl8192e/rtllib.h         |  2 +-
> > >   3 files changed, 26 insertions(+), 26 deletions(-)
> > > 
> > Hi Tree,
> > 
> > those patches have been accepted and cannot be applied again.
> > 
> 
> Hi Philipp,
> 
> Right, patch #5 was not accepted though. Grep asked to fix it up.
> I thought that because it was part of that series I was supposed to
> resend as new version.

But now you understand what to do, right?  Pull the latest code and do
all your work on top of that.  Don't resend the stuff which was applied.

regards,
dan carpenter

