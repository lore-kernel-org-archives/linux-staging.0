Received: from mx6.ucr.edu (mx6.ucr.edu [138.23.62.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D3870
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1627032028; x=1658568028;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=11hdfmNQdEcgN5T5M4TZZU7b8pnUY8wBhrlerw8iwXw=;
  b=m7L293NfQziyj3irMTsU4944lzvWjLHETqKYWdUt8NswSnE/tUwLdalb
   cihosSi4PBZ8yvG6K4hKyEWpu2yy0mOIYXSzPv1jRLwA6y6kUZslExHLF
   e1DDbi+ocy9COXWqvmNXUFmhPTYwlnzXRtY9p0OSmGStbualKSRVWrkYI
   geyK0OaER9ldqSo7mVTU9xrPr97/3odnKQJUw7aXIzBhub+iAOBGxi+Cq
   9U0qUG/5S1Prg2PThlYzszKdyJ2LgUGv56QqXzmg5q7rspRmyE1tPdfLn
   KzM8NEiUmyGuoS4OSpYCEQyTSSeEosqr/NnUvjXArmHsqUVhjWfJ0Yqoe
   Q==;
IronPort-SDR: +RGHF56pG1E95ka4GTxz3nB7thGAI+fyffQoY84M+rYV05/Pzz5Va6mv+FRKiHzacRn6s1CtpJ
 31rSOA9gU1LShjK3Y8wMWK5r1QhG5APFLjSd+vLBYu5tPDStQi3cQX9Z2+mQTArabcn4FW/Xwq
 HXzd9yRY9E6ACGaNBmkKE+Ajn80IvTzyv4le+WD9qUcH4RWSMeq/lYT0hbIMO47oyE5TzQ9x1R
 rAlJErTooQgqk8L7J46qBAK6msJEQ4A22wVt6adB5NH/6f/8fyymbPRlZ9MqkJMSjlSsy5z7A9
 pKQQqwxhcqgL1f9UQ2pCT84W
X-IPAS-Result: =?us-ascii?q?A2H7AgCKiPpghkXYVdFaHgEBCxIMQIFOC4N4bIRIkWqdW?=
 =?us-ascii?q?gIJAQEBD0EEAQGEWAKCegIlNwYOAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBA?=
 =?us-ascii?q?QUEAQECEAEBAQGBCgtZC2OBT4F5BgQ9gjUpAYNtAQEBAxIRVhALCw0CAiYCA?=
 =?us-ascii?q?iISAQUBHAYTIoJPgwgFnFaBBD2LMoEygQGCX4VFAQkNToEVEn4qhwqGYieCK?=
 =?us-ascii?q?YFLgjg3PodbgmQEgx1jGG6BTheBOQEBAZAxgyGJOIIJnQ8BBgKDDByNLoUXi?=
 =?us-ascii?q?3org2OLXpciuzEQI4FTgX8zGiV/BmeBS00BAgECAQwCAQIBAgECAQIIAQECj?=
 =?us-ascii?q?jWOViQvOAIGCwEBAwmLaAEB?=
IronPort-PHdr: A9a23:fMfFFB26WDq5BPsCsmDOuwQyDhhOgF0UFjAc5pdvsb9SaKPrp82kY
 BaHo64yxwaRB83y0LFts6LuqafuWGgNs96qkUspV9hybSIDktgchAc6AcSIWgXRJf/uaDEmT
 owZDAc2t360PlJIF8ngelbcvmO97SIIGhX4KAF5Ovn5FpTdgsipy+y+4ZPebgdHiDagfb9+M
 gi9oBnMuMURnYZsMLs6xAHTontPdeRWxGdoKkyWkh3h+Mq+/4Nt/jpJtf45+MFOTav1f6IjT
 bxFFzsmKHw65NfqtRbYUwSC4GYXX3gMnRpJBwjF6wz6Xov0vyDnuOdxxDWWMMvrRr0vRz+s8
 7lkRwPpiCcfNj427mfXitBrjKlGpB6tvgFzz5LIbI2QMvd1Y6HTcs4ARWdZUclRWS5ODIOyY
 YUMEuQPI/pXopLhp1cStxayGRWgCP/txzJOm3T43bc60+MkEQze3gMgHtMPsHTJrNXyKawdU
 uC1w7PJzT7eaP5X2Tb86IjSfRAgvf2AQbx9fNHMyUYzDQPJlEufppH4Pz6M0OkGrmeU4fZ6W
 +21l24ntx9+oiKpxso0hYTEgoYYx1DK+ylnz4s4IdK2RU10bNOqEJZduT2XOopqT84jTWxlu
 zs2x6AbtZO4YiUHxpsqyh3CZvKJboWF/hTuX/uSLzdgnH9pZq6zihKo/UWjyuDwTNe43EtLo
 yZfk9TBsnYA3AHJ5MedUPty5EKh1C6K1wDU9+5LP1g5lbHeK5492r4wkYcTsVjbEi/2hkr2i
 KiWe10h+uey6uTnZqzqpoeeN4Npkw3+PKUjl8ilDeQ3NQgOWGeb+eCi27H54UL5R7BKguU3k
 qnfrp/aOdwWqrClDwJRyIou6BayAy243NgFnHQLNlNIdRafg4jsIV7OIfT4Dfmlg1SrlTdm3
 /DHP7zhAprXL3jPjKvtcLhm5k5B1AUz18pT6IxJBbEcOP7zQFP+tMTEDh8lNAy52+LnCNR71
 oMDVmODG7SZML/Ivl+H5+IvJeaMaZQRuDb8MPgl++XugWU9mV8ce6mpwJQWZGqlEft4PUXKK
 Ubr1/sIFy8htxAmQer2hUfKBTJaYTC5Vrgk6zcnBZiOCp3KTYSgxreG2XHoMIdRYzV3C0KMD
 HCgRYWNWr9YeTCSK845ymcsSLO7DYItyEf950fB17N7I7+MqWUjvpX52Y0wvrWL/Sw=
IronPort-HdrOrdr: A9a23:coJtoaNWYijd3MBcTvqjsMiBIKoaSvp037Dk7TEJdfU1SL3hqy
 nApoV/6faZskdyZJhko6HiBEDiexLhHPxOkO0s1N6ZNWGMhILrFuFfBODZslrd8kPFh4hgPG
 RbHpSWyuebMbG3t6nHCcCDf7gd/OU=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; 
   d="scan'208";a="230629297"
Received: from mail-pj1-f69.google.com ([209.85.216.69])
  by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2021 02:19:19 -0700
Received: by mail-pj1-f69.google.com with SMTP id in8-20020a17090b4388b0290175556801d5so1110506pjb.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 02:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZ6nos874yRZpIgf2Vh5xy3KOkgY+nI+yWtvY2gRCVY=;
        b=fAHAOMj+QmZzzPt8razIIizIqoOh9xcG+untUce53nyMCTFPy7VTP9D7dq7DAa5DCx
         mvTPahZwpncByiwO3bi51LMmw5/DOZqIDfxHIDkgG8EDxJk6jQOErSaLtqw51OKerTtC
         etGWNxO6KzUCpzm2Mj2NoRxM/5e9BzLMSs7Wrks/aJnMwKQ6QCXES1twtKDt2Wq8fgFv
         ebPGUukES7lTE9+kXKLm6j/459VroDJOHthHMAfPr2+tGRLCnxMAA2k5TnVu0Ogxzvm5
         g0IMxR13MWWn8RkQQsO+/sxPyiLYeoV78gU/1ySkITOfaC+iyLHmg9oYCGeFPGEosWYO
         41iw==
X-Gm-Message-State: AOAM533U8xqJo+9/HV87vEPnOzDkBz8yFKgBmiDEPJ18HxOuXRCbShSF
	V3psCLydNBI/l4JRM1icS/6w/GO76v5GhThLeDiow8G8SSFtxzNNGgzWcTBX94DBnjlq4Co5Dtr
	Pgzt2g1El3YHTcNaAgcfxxzfd3FDLGNChKAfC6gFriKc=
X-Received: by 2002:a62:ed06:0:b029:32c:a800:ba47 with SMTP id u6-20020a62ed060000b029032ca800ba47mr3647610pfh.56.1627031959288;
        Fri, 23 Jul 2021 02:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+WXiuLmnX9MFdAd1e0I+8fQgzAvcb+FLbne5Z5luQOERXOyWsR3539QrgvbRqjef6Dr1euYIuxwFmnSGxjeM=
X-Received: by 2002:a62:ed06:0:b029:32c:a800:ba47 with SMTP id
 u6-20020a62ed060000b029032ca800ba47mr3647587pfh.56.1627031958961; Fri, 23 Jul
 2021 02:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723085145.1ce7ee5c@canb.auug.org.au> <20210723003607.64179-1-yzhai003@ucr.edu>
 <20210723081034.GD1931@kadam>
In-Reply-To: <20210723081034.GD1931@kadam>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Fri, 23 Jul 2021 02:19:08 -0700
Message-ID: <CABvMjLQ5PW+cddeYCgiR4xx9dKWVdKsaJLrUYFPMmsOLk+a1HA@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dan:
I updated the fix tag in this version, I would sign the patch using my
full name, thanks.

On Fri, Jul 23, 2021 at 1:11 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jul 23, 2021 at 12:36:04AM +0000, Yizhuo wrote:
> > Inside function mt9m114_detect(), variable "retvalue" could
> > be uninitialized if mt9m114_read_reg() returns error, however, it
> > is used in the later if statement, which is potentially unsafe.
> >
> > The local variable "retvalue" is renamed to "model" to avoid
> > confusion.
> >
> > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> > ---
>
> Is your full name just Yizhuo or Yizhuo Zhai?  Please use your legal
> name as if you were signing a legal document.
>
> I don't think you have changed anything in this version?  It's basically
> a resend of the patch from Jun 25?  Please put that information under
> the --- cut off.
>
> Looks okay to me.
>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> regards,
> dan carpenter
>


-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
