Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3D3219;
	Thu, 14 Apr 2022 19:42:01 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id e10so4874916qka.6;
        Thu, 14 Apr 2022 12:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mTODUQcmfHMXq3ycnA48JyJoU23qtMYGGZvxAogIduI=;
        b=J11JHHp+k6h93DRPv9GxhRTdkIyDSoPNvBepsNjSkaqgQd3zSice+Ln0lNLmZJ8dGy
         L+GN12biJbCjJx5REbVAYgbFnAaDYN5xcxGgmGn/WpOezwcUTI/tsPHRgs0SwGm0Hqf5
         oFXhdGr5dcPxt9ma+Zev9Ozawsp30U7NaR1g9Q4euZwyZKH5HXxyFeG5nX9sd9phIXOU
         +EFNN1N+Y7ohQWKfPNApmIWSHtHct8TI02lPqsY7r14m2JiO6oDvvWxOnGq31xmX4gB6
         CysFh3b+dr3gLqbMWh/EIlrunCFoUgPSoWhqAOqEHIYEH8xl1L8LNUfd6snJ9adbINbu
         iI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mTODUQcmfHMXq3ycnA48JyJoU23qtMYGGZvxAogIduI=;
        b=jUvJoU30Fgv7VWNw+ocJiGHzDbgAardBOWcCV8tau0JJkYMxTmggZJTMVsGVAQEEye
         gaB0q3/6qaJhK6QjjP8qCFMSMta1bc4MsX8RIE8AREJHUH19ymzip/jPkpn22sSPcubM
         63y+Ay9bxDtDzOqZH4cjQRNWHd5VeVdl0iIiWNTx0x+LP4BH3v5/9HChtj5sSCAcSR3e
         Tfk1nV3BVbWHzkey30QADwvYFFehKk/D5UbycaW7/KfUW/vZRVEPQXM512F2HTzO+/pF
         UPm2YOQ5+hOE3KANs3F2SWGGaosoJ+TuUDtVTS3ttFtBStsToUkIJW6qIKmsJD1wTpnZ
         PpwA==
X-Gm-Message-State: AOAM533prGLa9jR9JOdqBWErvO62Bz3NmxlW0GLERgk138PUX2x7xbDa
	L3Onopdb7vneXsY2Vcr37lc=
X-Google-Smtp-Source: ABdhPJyUBJLR/ybTeUMPng6XWPxe2qytprEupIR8YWUPQ7Th3wRiREJiReSp+6PuNz89uDk2494Z9g==
X-Received: by 2002:a37:807:0:b0:69c:7f73:32f8 with SMTP id 7-20020a370807000000b0069c7f7332f8mr2469446qki.665.1649965320803;
        Thu, 14 Apr 2022 12:42:00 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id t19-20020ac85893000000b002e1afa26591sm1857873qta.52.2022.04.14.12.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 12:41:59 -0700 (PDT)
Date: Thu, 14 Apr 2022 15:41:55 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH 3/6] staging: r8188eu: remove 'added by' author comments
Message-ID: <20220414194155.GB4144553@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649880454.git.jhpark1013@gmail.com>
 <c0c0a0e748ad85585b65e73841d431adefe86a59.1649880454.git.jhpark1013@gmail.com>
 <2eab9c9e-7e56-9920-de4d-2e53b3d7e6a1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2eab9c9e-7e56-9920-de4d-2e53b3d7e6a1@gmail.com>

On Wed, Apr 13, 2022 at 11:28:31PM +0300, Pavel Skripkin wrote:
> Hi Jaehee,
> 
> On 4/13/22 23:11, Jaehee Park wrote:
> > Author comments "Added by Albert" and "Added by Annie" are sprinkled
> > through the file. Git will keep history so these comments can be
> > removed from the code.
> > 
> 
> these people are not in the git log, since this driver was added in 2021. I
> am afraid they are not even in Larry's GH repo log.
> 
> Anyway these comments are not so useful, so patch is OK.

Thank you, I'll update the patch log message.

> 
> With regards,
> Pavel Skripkin
