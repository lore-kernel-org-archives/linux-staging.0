Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4120A6D14
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 09:43:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id b136-20020a1c1b8e0000b029012c69da2040so2805440wmb.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LzwkGbnxl9M8rDSBY6BJKN+53l2qgIFSzWD8Wt6PTAM=;
        b=VDb5ntFrW4CbbZ4al2ton8uH8H+Ji9ae1UW1cDXmcdAQ2YAN6KqblLyk7YWINZssOx
         IXfdyl4RZNjwCFFHUXhgwr1F1bm2td6ygV4VnrsY83Lu/XQjnCgwWjPUB2qFar5uxbAu
         vfCfXZRF63H/LMHkACrH6LkkIG1cnLuiqB4gdEVC2B6Rt5Lx36exzozjGuDLvj/apE/8
         UoxKOBPnucPDXGXzrQYxXEzNuWiGw3cdp2gMyOgPUEgZgilxY4k7yx7w+WLrEJEJz2ZH
         qdzEACgV45vsEX+9kTcsfkVUrrh1z7FKTxR5bfE3c+t8Thk2Yca+NDuapIMCrMbrpR4T
         3Ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LzwkGbnxl9M8rDSBY6BJKN+53l2qgIFSzWD8Wt6PTAM=;
        b=VdLhgjp2smEX+6MsJ512M4HgziqApovEGD05ZnMUnN2+OKJEyaMxQRIpVsSQPrmPIJ
         Ed+gTAx6NTsiU/jS6F9PsN5W5dXIQZgIfjSuKPk8FaH+zFA7UAIXW4jVL4fr+wVR9Azr
         MAeVp9zRXBALZRAXKaMptaiHCuTLIoTjrQivtR5IU4VgoVsOrVIPj/oFTYHPsqBXBZ3a
         rppc6imKRXZG5/jwUSVITgb7heGtOknj3EuYkPN4UhbVjfpjEYVKmuON9j+u47bpP2CB
         NnZSN3zDmMkVPgpFPjcngmW8Xv2fRnSWNas2Td93AXlTIiGKB4vs9ATyjklRBNXzdesL
         vSaQ==
X-Gm-Message-State: AOAM532bZx+UBrbnDBh1Gi0HQ4BaadTAh3sBCmOZseGQKkiGWEYkiGgJ
	rGkhalIbIMsf2TUCQ9L3UPk=
X-Google-Smtp-Source: ABdhPJyUCG2524rkdwi3qb1gkGBWdJylcW2D7K73f5wxMe+5J3U+SWG6+drsu5Cz+1Zc30DATRd1/A==
X-Received: by 2002:a1c:9d94:: with SMTP id g142mr2202789wme.154.1618393424733;
        Wed, 14 Apr 2021 02:43:44 -0700 (PDT)
Received: from agape.jhs ([5.171.25.35])
        by smtp.gmail.com with ESMTPSA id q19sm4713030wmc.44.2021.04.14.02.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 02:43:44 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:43:41 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: julia.lawall@inria.fr, joe@perches.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] staging: rtl8723bs: replace DBG_871X_SEL_NL with
 netdev_dbg()
Message-ID: <20210414094340.GB3931@agape.jhs>
References: <cover.1618325614.git.fabioaiuto83@gmail.com>
 <a798262b8e1dacf225dd42f2863243c543667d5f.1618325614.git.fabioaiuto83@gmail.com>
 <YHanGdS1Kc/4zq4q@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHanGdS1Kc/4zq4q@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 14, 2021 at 10:26:01AM +0200, Greg KH wrote:
> > -	DBG_871X_SEL_NL(sel, "%10s %16s %8s %10s %11s %14s\n",
> > -			"TH_L2H_ini", "TH_EDCCA_HL_diff", "IGI_Base",
> > -			"ForceEDCCA", "AdapEn_RSSI", "IGI_LowerBound");
> > -	DBG_871X_SEL_NL(sel, "0x%-8x %-16d 0x%-6x %-10d %-11u %-14u\n",
> > -			(u8)odm->TH_L2H_ini,
> > -			odm->TH_EDCCA_HL_diff,
> > -			odm->IGI_Base,
> > -			odm->ForceEDCCA,
> > -			odm->AdapEn_RSSI,
> > -			odm->IGI_LowerBound
> > -	);
> > +	netdev_dbg(adapter->pnetdev, "%10s %16s %8s %10s %11s %14s\n",
> > +		   "TH_L2H_ini", "TH_EDCCA_HL_diff", "IGI_Base", "ForceEDCCA",
> > +		   "AdapEn_RSSI", "IGI_LowerBound");netdev_dbg(adapter->pnetdev,
> > +							       "0x%-8x %-16d 0x%-6x %-10d %-11u %-14u\n",
> > +							       (u8)odm->TH_L2H_ini,
> > +							       odm->TH_EDCCA_HL_diff,
> > +							       odm->IGI_Base,
> > +							       odm->ForceEDCCA,
> > +							       odm->AdapEn_RSSI,
> > +							       odm->IGI_LowerBound);
> 
> Something went wrong with this change :(

thanks Greg, I sent an example to Julia, that reproduce the problem.
As soon as it gets fixed I will send you a v2.

fabio
