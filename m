Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CDB2FAE
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 11:15:06 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id w12so23695867edx.1
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0tZ8DtgbQqRdhtr+WgOdau3mUqR+b3/o6rYGN75PUbk=;
        b=bP1ytHZRh1aqwGHMsWWBu109zLcjB5fYFD5flBvBv+H8zZDq62dvu2DcUK0RY8Yhek
         pPXMdPI9KMxjk347pthwQV8TZA+xBcBWSI5O2SKDpCp53cFU60fpYh2W/YXbNNDfyrH1
         /6DXo1EB3OvndIpmSK/R0yNHCZ67fV4uWFVe2hAz3b/bmubAJDs7xKNFoXV0Rt5SZL39
         u3PKY2ne1dEyZY73Q595FqF2/EVpkCyowoIFg5UxolPZXCM41GzenLjZpMPK/l0FTzmN
         jteTLwKp/XyOk+dEwHxOxww36DgGKCDEl0TU67v2Pvh3o6Pa2tZi6cZryv9wF7TlRiX+
         aSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0tZ8DtgbQqRdhtr+WgOdau3mUqR+b3/o6rYGN75PUbk=;
        b=B0H9jSWPLxb68RcVImiYjf5/OYSZMVRMMmQoJcJOnM+IdZ+hQGkERdaPRZ1OlPyw64
         OAnRzLMtAaIlVawQ+7+LVnXCa9zyFd+jalzHkL0/FUajgbrpNlyKhzuhW13MKJpPTZGV
         W3mjXDr8bHu0BFYm4c+MsHN1t8L9YcG6AhprcUjL5VyXuSeFzfMA+J/1WIDAWlsSD9h1
         TNQvgAVS26zBzHhA0n4Mdp0yiUMRq8PZ45ehk+GDhiHcE6y2b87aldD6WQ6BsoulWBHo
         /P2fixbbpGBEiqIFPWqTIjJnhKQLV3yNit7tiKkIinFN5yeVSMBPf+JTt5IJ2ntVRD9t
         Mi3Q==
X-Gm-Message-State: AOAM5318pZWTf/mFB/MTlWIxC49NH0+cl/3e1Y5wGTtBE8sS8AgmwcvH
	Zhf7bo3jtRVNHPEX+Ma+PiE=
X-Google-Smtp-Source: ABdhPJw0/EZf6cUybkvy0L9qZdLe0u9nLukYifaF27YaaqDlT2YzP/Mu+djtXFl/V140SAUUGQlNpg==
X-Received: by 2002:a05:6402:1115:: with SMTP id u21mr25103788edv.383.1621854905629;
        Mon, 24 May 2021 04:15:05 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id zb2sm7847075ejb.52.2021.05.24.04.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 04:15:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: core: rtw_mlme_ext.c: Remove set but unused variable
Date: Mon, 24 May 2021 13:15:03 +0200
Message-ID: <2101445.5PPBstrGkB@linux.local>
In-Reply-To: <20210524092552.GO1955@kadam>
References: <20210523173042.19785-1-fmdefrancesco@gmail.com> <20210524092552.GO1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, May 24, 2021 11:25:52 AM CEST Dan Carpenter wrote:
> On Sun, May 23, 2021 at 07:30:42PM +0200, Fabio M. De Francesco wrote:
> > Removed set but unused 'reason_code' variable. Issue detected by GCC
> > running with the warning option -Wunused-but-set-variable. Removed its
> > use as a storage of the return value of get_unaligned_le16(), which has
> > been left as is because it has side effects on the argument it takes.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c index 
9fc612fb736f..a13b3ec42bc9
> > 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > @@ -1721,7 +1721,7 @@ unsigned int OnAction_back(struct adapter *padapter, 
union
> > recv_frame *precv_fra> 
> >  	struct recv_reorder_ctrl *preorder_ctrl;
> >  	unsigned char 	*frame_body;
> >  	unsigned char 	category, action;
> > 
> > -	unsigned short	tid, status, reason_code = 0;
> > +	unsigned short	tid, status;
> > 
> >  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
> >  	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
> >  	u8 *pframe = precv_frame->u.hdr.rx_data;
> > 
> > @@ -1791,8 +1791,7 @@ unsigned int OnAction_back(struct adapter *padapter, 
union
> > recv_frame *precv_fra> 
> >  				psta->htpriv.candidate_tid_bitmap 
&=
> >  				
> >  					~BIT((frame_body[3] >> 
4) & 0xf);
> > 
> > -				/* reason_code = frame_body[4] | 
(frame_body[5] << 8); */
> > -				reason_code = 
get_unaligned_le16(&frame_body[4]);
> > +				
get_unaligned_le16(&frame_body[4]);
> 
> It doesn't have any side effects.  Just delete it too.
> 
It seems that I misinterpreted the semantics of get_unaligned_le16(). If I'm 
not still wrong the above function uses the __swab16 macro, which returns 
swapped bytes with _no_ side effects on the swapped variable.

I'm about to send a patch v2 with the deletion suggested by you.

Thanks,

Fabio
>
> regards,
> dan carpenter




