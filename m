Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8120C72
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 21:10:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y13-20020a1c4b0d0000b02901c20173e165so428178wma.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 14:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0lptI6mxMVXNr9ldiINhSrP9hdrEvGc4RX7GvmEwDJI=;
        b=LAyi4WXCq8ky86HrZv1w1WUWI7uW3W+9mr4ehI5wyHMHm2SyQ7hZBTnz5vaI0OR5kF
         2LElWftztzV2Qmziv7KOp/kUcIJt4tkQgH4KuPtzoSetfINkZixPhyz6p/pV5RZevM9S
         Al0J/elq84i4oP80b19jpUvpyzsymSH01tcOC35hkr9t8f0DHJEEwb+H0vFNtW4kyRBf
         Cl1PtlqhOEN7kvJHBPzUoVyr1wOkmRAQhY+JWVAE98EkfGnJ+EE7beIVSi/U1g+WqFKi
         bJTGWuRuF6RZepsjo/ZK5r0G3kDiHaX6z8FfttZ/TDo2A+uquUHweJr3C8slD9a6TUYS
         ZYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0lptI6mxMVXNr9ldiINhSrP9hdrEvGc4RX7GvmEwDJI=;
        b=hY3WRT8sBwyCfq3G6mgq6Rf1mnjuOaaZmbsjIZiuT9e0rZdWu35lmiJ3NCTkzv5eDi
         rYKumOAiFxyD0E0Y2//GsmRLHVKTcyWyEBmQ/ddNkCQ+QL9BRFniwmY/51qToqGYfNMy
         fIG+PqEOsLKYIB5yj3ayJynPTpVdMiDmfUa1X4gkH0hauH/27rnaM6zK9G/47QWP7k9H
         gTebwXyOcY+tMakZRmioBvtJSa7N8NPXS8FmPov7MSI/Ep8HcC2zVIBdyq28G7UnHvIR
         dcY30o4D/88XXL+MLsZNVe0CsXGRpMBYYICWOOdSOaMytKtxNr8nPfz2lSD/vMUgEC9M
         JAAA==
X-Gm-Message-State: AOAM532q9RGoUQjl7iwx3jiy0voIRR6rEsfKJJtv44946ncvyfqr2Lm8
	79rHWLxZ5EjuWCyLfMb4s8EHHg==
X-Google-Smtp-Source: ABdhPJy5Ebwdwf7oaK5xFM9vknd5Nljt7U9AMNm4IU5RBPoQsXpslmAzC4ci7LZlwglr5JR7Y1WYwg==
X-Received: by 2002:a7b:c396:: with SMTP id s22mr1286756wmj.131.1623791414001;
        Tue, 15 Jun 2021 14:10:14 -0700 (PDT)
Received: from KernelVM (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id f12sm74202wru.81.2021.06.15.14.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 14:10:13 -0700 (PDT)
Date: Tue, 15 Jun 2021 22:10:11 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/28] staging: rtl8188eu: remove DBG_88E callers and
 macro
Message-ID: <YMkXM3/IHaouqgAR@KernelVM>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
 <20210615125125.GC1861@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615125125.GC1861@kadam>

On Tue, Jun 15, 2021 at 03:51:25PM +0300, Dan Carpenter wrote:
> Looks good.
> 
> The future is vast and unknowable but I feel pretty confident we will
> never miss these at all.  :P
> 
> regards,
> dan carpenter
> 

Dear Dan,

Thanks, felt good removing that much code! I will get started on the
other macros in include/rtw_debug.h shortly :-)

Regards,
Phil
