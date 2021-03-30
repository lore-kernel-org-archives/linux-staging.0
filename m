Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7149D5F
	for <linux-staging@lists.linux.dev>; Tue, 30 Mar 2021 07:21:16 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id s21so7290006pjq.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Mar 2021 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6AWbxRR3ovKhPy18pgbZKBcDCZkiPi+DKCTyfvtM7OQ=;
        b=tCQyB5y1N77+8Q36EAUCWIGXIzQF9hYVvqt72xdiMsbKKnFj+ANMSu7P++cPZ44zJ4
         mXE1NTOT5f2y077eiIMW20zimj9W3iogu10R7hnZ2Nk8GeCEp57wlceeNGs8XRicVY0d
         abaUvudh37KQ3MewnpJ1q0pv2Y9BvXIoKR2yfd2HiHjcoEyqeiXZ+FH0av/qHwTGshq0
         AtNxZJUq44ddyvMXg0ug6MXhY0rSNvw7XrbsmTpNG/JviJHCsInHcnMffaB+wbvtPCAE
         JczRuEu2s2nwh3hWLw2ndiZoGxDTYUafMxceogKZlKDCUPjG1BN0zRUdl2AqCwZWsrxE
         IDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6AWbxRR3ovKhPy18pgbZKBcDCZkiPi+DKCTyfvtM7OQ=;
        b=VuNMqUfl3lRUlEL4Iw4bE2M0lULbhstLBSvkH9sNzBGj66vdU8b/5BvR+ZGVrUlQMb
         rW3Xu0obPNkNLSwy8zB+RtlUVuJFmzMJQZuM5h7Llzo6cqhvEVq8ghbmnN37yTG8f/Df
         6IBw1VTI4oJHlIDfvLfK4Q7xLXqctDbzft+LwdNvju3AbX9JbbLwFXhFYLk6KPmEZO0K
         gD9bhpl8vJkMc3+HsncjCk2LZJMLe/JCpMGerXjJLORtRsvxQVhTJcDGAEvqKk0lNiCR
         yOlwNt5MPtWkEudM/gofNr0Kz8e2NMxrxAtwHpRrAoaPS0M3sDxKd/UaWpkupOTSwpxg
         /3ug==
X-Gm-Message-State: AOAM530LwOLoVgZgO3B6EM7Jc3TR6ejiuIb4T/CqCwEHXrqJh4MK4XGp
	0Tys45VdCxYWqd5Bv7Hh5RQ=
X-Google-Smtp-Source: ABdhPJyDMXJU2SJetxKoq5cxCluKKPwaxsnUPUUHVlYIANFEgi3tRfSOi5Cfg/mZCwFy1GN7I9PBuw==
X-Received: by 2002:a17:90a:eac7:: with SMTP id ev7mr3038224pjb.158.1617088875921;
        Tue, 30 Mar 2021 00:21:15 -0700 (PDT)
Received: from localhost ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id x19sm19449315pfc.152.2021.03.30.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 00:21:15 -0700 (PDT)
Date: Tue, 30 Mar 2021 15:21:10 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: zhangxuezhi1@yulong.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: fix a typo
Message-ID: <20210330152110.0000006c@gmail.com>
In-Reply-To: <YF3bpuh8RVg+3Nx3@kroah.com>
References: <1616763351-7433-1-git-send-email-zhangxuezhi3@gmail.com>
	<YF3bpuh8RVg+3Nx3@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Mar 2021 14:03:34 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Mar 26, 2021 at 08:55:51PM +0800, Carlis wrote:
> > From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> > 
> > Change 'tft' to 'TFT'  
> 
> That says what you did, but not _why_ you did it.
> 
> And this is not a "typo", as it is not misspelled and really is just
> fine as-is.
> 
> thanks,
> 
> greg k-h

Ok,i will undo this patch.

thanks,

Xuezhi Zhang
