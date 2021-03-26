Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42005F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 15:39:34 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id e7so6773513edu.10
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d9tLuUtGSD6T5w4Dyg6nGjD+KGVCsTJsFAaGumlWf6M=;
        b=HQjtybIN0Auc8LvioMPDqzLxkOamx8UDrbVS0eePYbnBWeZN+gbAwIU+DYDdcGi7W1
         H19megJ6ev5B+GdbGRBnNAC6FQaeaf9+qdLcOvv9RBJQMSPNB9aC7UAvkoWFDslxsv+j
         Hh/KweE8IOPf4C2Wr5cE2uPJH11QlVJbF6B5CCh121SbjUNdwwTdDlbyx+BZ24dnUG9M
         gx6epmb1vAj2DZdViJHm6rQ17q6x45TdVHAEpHwaYDO6Pz36jUHX7z7ukheVu14ilUiU
         7lqGJ6+8K/m4gk0cAKxfcf/zYvjmU1631p96SO6fJO5HB/v9+97yz3SNvosdLDxgz/bS
         mFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d9tLuUtGSD6T5w4Dyg6nGjD+KGVCsTJsFAaGumlWf6M=;
        b=pIM8KqR9mVqgbjk+M9hWScz8qRR6tLqRfXjpSshr0Rng0Wwj5axCgY4i3Tao9CaHP7
         95GwwTTaUaH5wYQ4sCDDYw/Wc2GpY9+4gUgvv2IQJqD2a3uu4yUBqj1OSd+wTOFcy6v8
         7zvuekB5XFo7fLkjPOWubJkrGAKUlni74BaFwKBQaSi608CSMLV8sFqqrpbjnPLAsJnh
         lLGwklhulHSnKacyLz35ObYammjzbBl69/KZT2fJwRoRssqmJnNhZhgKctLzanZgyMdG
         38iRgUCUl0QnppJh11aEoo7bZOJ0wEfJoFr0S+L7OSdLkkvtDxeUP7ingoZZP5VYNbeX
         mt1A==
X-Gm-Message-State: AOAM53114wemfm+pAnX+NtPxEawlfrAa11HY6eZml46LUbvU+j1Uuxze
	LUQ2xLFusc1dphT7cPCksyw=
X-Google-Smtp-Source: ABdhPJy26lwl0eqoHvRcEJ+1c74UI7gmjnEVoyXgVq5T5YE4/Yk8+Cj8bgvtlTKQjQQd5l4Jrms7Rg==
X-Received: by 2002:aa7:d3d8:: with SMTP id o24mr15927996edr.165.1616773173301;
        Fri, 26 Mar 2021 08:39:33 -0700 (PDT)
Received: from cesati.gmail.com (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id p9sm4420935edu.79.2021.03.26.08.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 08:39:32 -0700 (PDT)
Date: Fri, 26 Mar 2021 16:39:42 +0100
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: rtl8723bs: remove obsolete comments
Message-ID: <20210326153942.iq274qlh37u75fbn@cesati.gmail.com>
References: <20210324194721.14574-1-marcocesati@gmail.com>
 <YF3qCIiB9gs1TnLb@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YF3qCIiB9gs1TnLb@kroah.com>

On Fri, Mar 26, 2021 at 03:04:56PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 24, 2021 at 08:47:21PM +0100, Marco Cesati wrote:
> > Remove some obsolete comments in the staging/rtl8723bs driver.
> > 
> > Signed-off-by: Marco Cesati <marcocesati@gmail.com>
> 
> Also does not apply :(

Yeah, it was supposed to be applied on top of the patch set
"remove unreferenced enums" (alternative to the patch set
"remove named enums"), which you applied

Sorry.

Marco


---- 
Marco Cesati, PhD
Dept. of Civil Engineering and Computer Science Engineering
Univ. of Rome Tor Vergata
via del Politecnico 1, I-00133 Rome, Italy
Tel. +39 06 7259 7389
