Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDFB5F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 15:37:53 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id kt15so9026123ejb.12
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JvTqLqjF2BxPa9rbaWsGSP4Tx+zEQ6GgSUin1hhiJFc=;
        b=duPK2L3f2xMV2cQxwFr0MZYGQk29YUCPK4VwOYbun2D0IPQEW8b3vAMnYrOfZM8ClT
         fVELkkqCkMjcrnBV9UB4wY4SbcgxQc1rs4clR86YBV1jBvzU4bWpzmfCZP5KUMmacmu0
         uthI6nf5Mo9EkvwNNHIYaG5M7/74Hu8O/oAF7LcnbMh7+2pStsOPOJasHrT6L/D/1+2U
         YBbpI/eMCBofdD52VC8k4OwpkN2KNjQZREAq+kpF7DBEhtGHewzPR+BMQ8X19YVC0lvl
         1Mbp6Btiqkiu5uNS5eB2ixBjxPvGjN2Fp9OaRjIRq12skdPD49WUE56v732mh8vbG+5Q
         rR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JvTqLqjF2BxPa9rbaWsGSP4Tx+zEQ6GgSUin1hhiJFc=;
        b=EAzhiVMxn0b3FeMOh5LWl2FR7OmGTENs0SO4/6UCzXugF4FiK+K9yDsny0VyOBhRNq
         WpNksrzrXsV1HUxQtNTwrblRb5TT/52ePHTOOZBfL2YSpXd76VSldkhw4aepjg9pDswt
         rFyNkCNWGMzMUTXgcr8aIMu/7MtOf4MdktJC12hLLmOgbjsLEA7RVvBUeV9ktCY3wD2f
         RyqHjFVMf+Mf7ZjMF4r9xnAHR0eLqml1rC4qOICN5N8XQP0fP1pqZodS8Vu0jBAq38pG
         jAmJeVB76K0L62dLEDJalhxK3EKuT7GbsBvLp0RkZ4zxMKdKW9nBZ50oCRRgupznevw/
         zQpA==
X-Gm-Message-State: AOAM531OXxtBLnuoOgJBBRx7MgE3AEZrQRtCRSzP3luEaYAgsJFERlMy
	9MWEVgpXgefnAH3gPmiRW3Y=
X-Google-Smtp-Source: ABdhPJzBtxWyU9XaE6IqhbSjg2zd+wMkNJ/yU4pcKsF8lxjEvrHzp4oIbytnKNwNjju5GDwsm3QZPg==
X-Received: by 2002:a17:906:bd2:: with SMTP id y18mr16266418ejg.482.1616773071754;
        Fri, 26 Mar 2021 08:37:51 -0700 (PDT)
Received: from cesati.gmail.com (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id q26sm3996052eja.45.2021.03.26.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 08:37:51 -0700 (PDT)
Date: Fri, 26 Mar 2021 16:37:54 +0100
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 00/33] Staging: rtl8723bs: remove unnecessary enum names
 and definitions
Message-ID: <20210326153754.ndl4k3duxsn2qfz3@cesati.gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
 <YF3p2ABUhzSxYRsP@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YF3p2ABUhzSxYRsP@kroah.com>

On Fri, Mar 26, 2021 at 03:04:08PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 24, 2021 at 01:44:23PM +0100, Marco Cesati wrote:
> > The staging/rtl8723bs driver includes 82 enum definitions whose
> > names are not referenced in the code. Furthermore, 57 enum definitions
> > are useless, because the enum elements do not appear in the code.
> > This patchset transforms 82 'named' enums in 'anonymous' enums and
> > removes 57 enum definitions.
> > 
> > 
> > [PATCH 01/33] Staging: rtl8723bs: remove named enums in rtw_mlme.h
> > [PATCH 02/33] Staging: rtl8723bs: remove named enums in rtw_cmd.h
> > [PATCH 03/33] Staging: rtl8723bs: remove named enums in rtw_eeprom.h
> > [PATCH 04/33] Staging: rtl8723bs: remove named enums in hal_com.h
> > [PATCH 05/33] Staging: rtl8723bs: remove named enums in rtw_recv.h
> > [PATCH 06/33] Staging: rtl8723bs: remove named enums in drv_types.h
> > [PATCH 07/33] Staging: rtl8723bs: remove named enums in rtw_ht.h
> > [PATCH 08/33] Staging: rtl8723bs: remove named enums in wlan_bssdef.h
> > [PATCH 09/33] Staging: rtl8723bs: remove named enums in rtw_mp.h
> > [PATCH 10/33] Staging: rtl8723bs: remove named enums in osdep_service.h
> > [PATCH 11/33] Staging: rtl8723bs: remove named enums in hal_intf.h
> > [PATCH 12/33] Staging: rtl8723bs: remove named enums in rtw_pwrctrl.h
> > [PATCH 13/33] Staging: rtl8723bs: remove named enums in rtl8723b_cmd.h
> > [PATCH 14/33] Staging: rtl8723bs: remove named enums in hal_com_h2c.h
> > [PATCH 15/33] Staging: rtl8723bs: remove named enums in rtw_wifi_regd.h
> > [PATCH 16/33] Staging: rtl8723bs: remove named enums in wifi.h
> > [PATCH 17/33] Staging: rtl8723bs: remove named enums in rtl8723b_hal.h
> > [PATCH 18/33] Staging: rtl8723bs: remove named enums in hal_phy.h
> > [PATCH 19/33] Staging: rtl8723bs: remove named enums in rtw_mlme_ext.h
> > [PATCH 20/33] Staging: rtl8723bs: remove named enums in rtw_xmit.h
> > [PATCH 21/33] Staging: rtl8723bs: remove named enums in rtw_rf.h
> > [PATCH 22/33] Staging: rtl8723bs: remove named enums in HalPwrSeqCmd.h
> > [PATCH 23/33] Staging: rtl8723bs: remove named enums in hal_com_phycfg.h
> > [PATCH 24/33] Staging: rtl8723bs: remove named enums in ieee80211.h
> > [PATCH 25/33] Staging: rtl8723bs: remove named enums in rtw_efuse.h
> > [PATCH 26/33] Staging: rtl8723bs: remove named enums in odm_interface.h
> > [PATCH 27/33] Staging: rtl8723bs: remove named enums in HalBtcOutSrc.h
> > [PATCH 28/33] Staging: rtl8723bs: remove named enums in HalBtc8723b1Ant.h
> > [PATCH 29/33] Staging: rtl8723bs: remove named enums in odm_types.h
> > [PATCH 30/33] Staging: rtl8723bs: remove named enums in odm_DIG.h
> > [PATCH 31/33] Staging: rtl8723bs: remove named enums in HalPhyRf.h
> > [PATCH 32/33] Staging: rtl8723bs: remove named enums in odm.h
> > [PATCH 33/33] Staging: rtl8723bs: remove named enums in HalBtc8723b2Ant.h
> 
> Was this a "v2" of the series?  Or does it not conflict with your other
> series?
> 
> I'm getting confused...  Please check my tree and see what I have not
> applied from you and resend...
> 
> thanks,
> greg k-h

This was the first, original patch set. However, I got a comment from
Dan Carpenter from which I inferred that transforming named enums like
"enum XXX { ... };" into anonymous enums like "enum { ...  };", when
"XXX" is not referenced elsewhere, was not desiderable. Therefore, I
submitted another version of the patch set ("[PATCH 00/21] Staging:
rtl8723bs: remove unreferenced enum definitions"), which just removes
the enums having no reference _at_all_ in the code. To be clear, the 
patch set ("remove unreferenced enums") removes a strict subset of the
enums touched by this patch set ("remove named enums").

This patch set ("remove named enums") has been properly applied to your
tree, so for me all is fine.  I guess the decision is up to you: do you
prefer to _not_ remove the useless enum names? In this case, this patch
set has to be reverted.

I apologize for the confusion.

Marco

---- 
Marco Cesati, PhD
Dept. of Civil Engineering and Computer Science Engineering
Univ. of Rome Tor Vergata
via del Politecnico 1, I-00133 Rome, Italy
Tel. +39 06 7259 7389
