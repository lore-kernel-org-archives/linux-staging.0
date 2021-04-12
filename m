Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9EA70
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 14:29:53 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so8921062pji.5
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 07:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tKKcJsInlPqpfcFDpQt6bNttFP8cv3zMw+nHpvpdxuE=;
        b=T6ww3nDrZI5sxtE+ufOahTQ4WPxiy+Gzu+qA5iJQ4rE3l0r9k43GF0Bh+p1yOXxqza
         f+d45JZi72IoqYHbzV8y9QHbaFURzSvZSUyL05T+xivYN12j84BMjirB5qLJTAbaYvul
         tjS4gZzljNJXxAe1Rz1jSOdt18LyPPZtpi8Ovl2YQnOHdsX9d+jK8qIrBsnEmS7ozdbN
         JXibGXtnRBAgfdVO85fjIL4ErfXAzlbgn4MdrzSEOXfN2bPWHXFJSy54wT4sycvT0XC0
         8TWIcrRn6AunL2q7oAdFmTUjtJXXm0Pig/HcD8JZWtxFAd5qVwgakKE2SDHjBJZpscbm
         ODRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tKKcJsInlPqpfcFDpQt6bNttFP8cv3zMw+nHpvpdxuE=;
        b=jPVxnuNwXrK1UUMzId7NXrJCMSSvAZCDcTdWUKy2J+Vgr3P49qmYBTNAPH5eXP0RnU
         KmZo85aa9vwyF7uOQSzjbXekAAm1R3SpPcWnpiNJ62GAj4ODupiOeu8/sdnves8K87dI
         hAtEFViRJl/4EjjjsJ1VpTVhjhJDmIqBnaVpFo2B0+ytsdJ8RgFF2vwlm+QINKyUNsS3
         /cUs12J6OPTolNBFoUjsqMfiMOvraz9QGLr6wdM8x66V5QVgvkxuyLJoVxkkEZihHad/
         sDaeY92hrB8ywFqQD2Wzu433D98HdQeLhQXnSljTd9glCWCv38YOWmflmk7CYpe6XHDL
         H4Ng==
X-Gm-Message-State: AOAM531TKcf/RErVXGMiybaFHSdNEG06Qr/jKwdxOCEaIFqgH86vJ9Bt
	7+IxB1Tze0E58zG+jg6QaPM=
X-Google-Smtp-Source: ABdhPJxBRYhkbeLMLQQUz+zvf+lASZDN4Ft87LNynMBa/pXYyZ3WhXB6LZZpew/h3AT920zAoEAZ3A==
X-Received: by 2002:a17:902:106:b029:e8:de25:4a1d with SMTP id 6-20020a1709020106b02900e8de254a1dmr26971190plb.7.1618237793240;
        Mon, 12 Apr 2021 07:29:53 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id r1sm11410647pjo.26.2021.04.12.07.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 07:29:52 -0700 (PDT)
Date: Mon, 12 Apr 2021 19:59:29 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] Re: [PATCH 2/6] staging: media: intel-ipu3:
 preferred __aligned(size) over __attribute__aligned(size)
Message-ID: <YHRZSYmHfXTh/S39@kali>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
 <20210412094315.GJ3@paasikivi.fi.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412094315.GJ3@paasikivi.fi.intel.com>

On Mon, Apr 12, 2021 at 12:43:15PM +0300, Sakari Ailus wrote:
> Hi Mitali,
> 
> On Mon, Apr 12, 2021 at 04:38:59AM +0530, Mitali Borkar wrote:
> > This patch fixes the warning identified by checkpatch.pl by replacing
> > __attribute__aligned(size) with __aligned(size)
> 
> Same comments on this than the 1st patch.
> 
> It's a staging driver so even if this is a user space header, it's not
> under include/uapi/linux.
>
Sir, I am not able to understandd what you are trying to say in this. As you
mentioned in patch 1/6, I removed and added header where BIT() macro under 
apprpriate userpace, but what should I modify in this patch?

> -- 
> Kind regards,
> 
> Sakari Ailus
> 
> -- 
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20210412094315.GJ3%40paasikivi.fi.intel.com.
