Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55823FC5
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 19:54:44 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id c21so65142075edj.0
        for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 12:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TOeWGQccqNIO3Gt6IciB4/cPzEmqz/XqdZFiLVlEWq0=;
        b=bDrqRXrNNUauDRopz+n+sYeQFqZ+OvibCLkMNmaH1WxcRlq46RDtCsFdswnmuipmFP
         1zzzimMKzt3UC98fp9QL8tdvqFfJD9Xl5MbwWqLQ9RW7e+RfmHn3qyjWB0j8G9S2bxZe
         oQEYMDfq12DLkouVVKdGIT92jyLSdfxa0AajlS5WFS1UQxHicg+tfqbQWFgU8aQItq7x
         SeI3cnv2nBUqpKam4EookkUS1xtOL7A9CviwpZH4BCkevQ8wSfY1o2z3hSc937FefBDr
         vTF5xA1Sr+DULxBGRHuTogIUbWIWLhiLlCiwF+qbl5saE/lHMVwhDSgNKBs8F2wR350G
         eJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TOeWGQccqNIO3Gt6IciB4/cPzEmqz/XqdZFiLVlEWq0=;
        b=3lAGjPtif0WVm6UbBx2fuybrMlfU8zl9SeEwgVgDGcn+qvZERUVCUKK2lKSkaz2Bkb
         245/0MV4Qb12sApUJ5W4/IOiKNPUf34Zhg8Qx2RrUVLB8zY2bqB63fGPm73TVSZO8jYr
         YAZRutP2XA2bgLOMBKtudSSyzfyf5fP5uFg3pWSASnw23rlw+oDDgmZ9bT2EymKXeusB
         JKEjGGcnbs0JgASdoycovQjzKHnpYRcw6m8312oCuar08ZEeZyRX/Q4kJGzu43UlLxfS
         f6UHIvHFAMz3TsDL1JcntpgLF7qVuT+pmCBT6StgponJEJSmRBAs8p635o6UIbCMKNZL
         M1Nw==
X-Gm-Message-State: AOAM530RCUTztzguFicRhl56Htk2AvGMLcwUSQyz7ynLsVdXfkpE5c2Z
	Hj44mqNF1X2pa4/YbvdDaGM=
X-Google-Smtp-Source: ABdhPJzDGkAslpZRA4vTkrGCJmSSYSiU3d0sQK9NACOhYqiX9/7NX8AzJV2hVHYmy4UXIHPTlwTifg==
X-Received: by 2002:a17:907:2624:: with SMTP id aq4mr30819421ejc.448.1632167683247;
        Mon, 20 Sep 2021 12:54:43 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id g10sm6518271ejj.44.2021.09.20.12.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 12:54:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v8 15/19] staging: r8188eu: change the type of a variable in rtw_read16()
Date: Mon, 20 Sep 2021 21:54:41 +0200
Message-ID: <2079638.AGfTBEE1WJ@localhost.localdomain>
In-Reply-To: <20210920190133.GS2116@kadam>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com> <3187315.KoBY3qX4Pt@localhost.localdomain> <20210920190133.GS2116@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, September 20, 2021 9:01:33 PM CEST Dan Carpenter wrote:
> On Mon, Sep 20, 2021 at 06:17:36PM +0200, Fabio M. De Francesco wrote:
> > On Monday, September 20, 2021 3:10:36 PM CEST Dan Carpenter wrote:

> > Back to the code... uninitialised data is not a problem in the old code, 
it's 
> > just bad design. The new code cannot affect runtime, it's just better 
design. 
> 
> It would be a problem for KMSan and the kbuild-bot will email you about
> it.  From your commit message "Change the type of "data" from __le32 to
> __le16." it's not clear you understand why the kbuild-bot will email you
> and why it's correct to do so.

I guess that for sure you are right in saying that it is not entirely clear 
why the kbuild-bot will email me. However, since the change is correct, but 
the commit message is not, I confirm that we'll use your note with only a 
slight change (only if you agree): replace KASan with KMSan in your text.

Thanks,

Fabio  
 
> regards,
> dan carpenter



