Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA5571
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 19:57:03 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id p16so4867473plf.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pjmQnwxfPUybeCrE9NSnjQV62TPPi6ZBYSR55ZeQzdY=;
        b=XDGIZELhZ+0EIloHFZPdtwERzwXtg6kPYHwQYxP7NsOZrrps0tGe3FBm6wNhbL4L4D
         HeOF6C5yUjuBfnQgT2BlipmVf+iGqrPJQHhrHOdPEpX7FSr9cr8bWU4vbYXUpeid5kw/
         5SemG54HMUwhn9tOyJjRrZA4Xj0Reie5USxLNVOEP4K60Rm5hNetn8uHyQyC5GwdpFlU
         NTNJfCxCAgHNZ92OXtT/Bz++WzKFRhZFd3p+Mz4fPLlDXe60vep4zR8P0mmGyvqTgBk+
         /18DlAWz7bFhgwHZJsMBVz1O0WDyLYv+CpvPh2m5SAagaM2GYf3Dihly431U7QroN0nl
         72hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pjmQnwxfPUybeCrE9NSnjQV62TPPi6ZBYSR55ZeQzdY=;
        b=cujm5vgRHjjAXDfvfgdxH9HHsx6UXCqFyqLXg9XxACbDpTNrqWiRlIGMPZAbjWeEmc
         XXV5yWeEfSoS9roFUdCdZ0wJpbGL+sVLrShJLGwxl38m8JsTH7fWt75/kUG0WLjjuHX5
         Hyb1aLFwrkSBBRZPMTlvAN+Y4YRSaPlhjrWfHyCqJG4GqZxgmcwnbNA1/+BSUvdl8/W0
         OY22rgx71CG/LlcqEl9bYLnW5V1PdbYneoYh/auIjowQZmaQt2uQPOU41xYZSRVSy04w
         SwrAn2Q0tY/28QRY2aFxrYACBXL+/EEPcaPzpjkBDm75e/IV/6Rlowgc6ZftK6THlvX4
         /0bQ==
X-Gm-Message-State: AOAM532YWCEbmh8dbCpf2ggEbkaNz75i7IqjuDDKVVJuPItRXncPOG3Q
	QCnwU9Q27Tq/sUxtUSV57LM=
X-Google-Smtp-Source: ABdhPJwAQjtu9apHd32uFbz1TDHgiLSc1xIdvb9R6/S6jsjZ3RwnHQV4iKZgVMFoGuG+RAYrLDtnnA==
X-Received: by 2002:a17:90a:c501:: with SMTP id k1mr1707108pjt.101.1618343823356;
        Tue, 13 Apr 2021 12:57:03 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id x69sm13078153pfd.161.2021.04.13.12.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:57:03 -0700 (PDT)
Date: Wed, 14 Apr 2021 01:26:57 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v3 4/4] staging: media: intel-ipu3: remove space before
 tabs
Message-ID: <YHX3iVCNXJlOsmuQ@kali>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
 <01ad7ff353f805dfc48e7bcc26ed974e7bb5ef9f.1618326535.git.mitaliborkar810@gmail.com>
 <20210413181712.GI6021@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413181712.GI6021@kadam>

On Tue, Apr 13, 2021 at 09:17:12PM +0300, Dan Carpenter wrote:
> On Tue, Apr 13, 2021 at 08:59:34PM +0530, Mitali Borkar wrote:
> > Removed unnecessary space before tabs to adhere to linux kernel coding
> > style.
> > Reported by checkpatch.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  
> > Changes from v2:- No changes.
> > Changes from v1:- No changes.
> > 
> >  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > index 47e98979683c..42edac5ee4e4 100644
> > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > @@ -633,7 +633,7 @@ struct ipu3_uapi_bnr_static_config_wb_gains_thr_config {
> >   * @cg:	Gain coefficient for threshold calculation, [0, 31], default 8.
> >   * @ci:	Intensity coefficient for threshold calculation. range [0, 0x1f]
> >   *	default 6.
> > - * 	format: u3.2 (3 most significant bits represent whole number,
> > + *format: u3.2 (3 most significant bits represent whole number,
> >   *	2 least significant bits represent the fractional part
> 
> Just remove the spaces, don't remove the tab.  It's looks silly now.
>
Okay Sir, do I have to send a v4 patch on this now?

> regards,
> dan carpenter
> 
