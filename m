Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10505F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 11:04:23 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k8so5243552wrc.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BzvMjDIOgQwhrDSEMqOWrBlRlYExfZKIsGCDktPRE/o=;
        b=eRPEXlydugzE72c1wI7n0ZYeecX8B67ZX+siv1jZSSMu26jEs5F5GTosJRbUAkMLJ1
         pv0x2aChpojoYmpdot/AN4u1XFRy4ySpWWgYJcSQJIHZ1bW0QbjN0xUYc/buQYZbnKXC
         dBodYvNY6luSSDorPgiZboYzZfX9r6aLX15OKOiSLKlnNWZ3KXH2vi2fJMT0MkDZTbbN
         kohAbHa4anTQoHehem0mFhF94A5F6fTqcCt7VB6xXvJvxE6+bpnl44TIQI0PxKQBryO+
         z5BKcF8vqWW6NJ8qpaZsnSzNttAVr8woYfv9cToo8xtVTyyI2FuQsR/IILDj/txesIGc
         nD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BzvMjDIOgQwhrDSEMqOWrBlRlYExfZKIsGCDktPRE/o=;
        b=WYxAJqkyizic0DGao3tiOVuraWubulKEjbaw8W+dkrwt0WAtBoqLIvBWHKVaZ7W45Z
         l23w2GxCtP51PA0ZZgq1KsRI0xYTGH5hNL5FK97ovS0+atDS7hkb+kkT/YonreBr78MR
         +U7kMiWsOL40eUvPp6/O/pt4wQrcZz4N+N2e8fx/8CAAyfBA54mlSmBXI61noUT9jirS
         Z2/Zx+ijuKBOWGSsHqpZ12JVEMGVBcMzdjOdBRxQp2UpHz+JAK2sd4TctkhATqA93mJN
         Qhtlg1sBWnvvNSGJerS81X4/cgEmhHMDBYGHcfckH/Bocjz+zMw8g47FLINlILdtBiNf
         ilyQ==
X-Gm-Message-State: AOAM5319Yn4FC2P9oz1QB7RqjOcm9adk3UwbRNMSFlnndEOQf3//bWJw
	7467fvFXSCWiqMwCYLIGM/0=
X-Google-Smtp-Source: ABdhPJx0yHoMTUZH+70hwtYWIi6HphiefYFjdalqhNXDzlN7UPi2vhIF3m95K3jJdg0XHBLYNkre9g==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr13721779wrq.227.1616756662370;
        Fri, 26 Mar 2021 04:04:22 -0700 (PDT)
Received: from agape.jhs ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id b65sm10429869wmh.4.2021.03.26.04.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 04:04:22 -0700 (PDT)
Date: Fri, 26 Mar 2021 12:04:19 +0100
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/15] staging: rtl8723bs: inlcude macros in a do..while
 loop in core/rtw_security.c
Message-ID: <20210326110418.GB1452@agape.jhs>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
 <2e02f646ab3f8058b159d6d790e202a0e4744af8.1616748885.git.fabioaiuto83@gmail.com>
 <20210326095220.GC1717@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326095220.GC1717@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 26, 2021 at 12:52:20PM +0300, Dan Carpenter wrote:
> On Fri, Mar 26, 2021 at 10:09:08AM +0100, Fabio Aiuto wrote:
> > fix the following checkpatch warning:
> > 
> > ERROR: Macros starting with if should be enclosed by a do - while
> > loop to avoid possible if/else logic defects
> > 33: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:33:
> > +#define WEP_SW_ENC_CNT_INC(sec, ra) \
> > --
> > ERROR: Macros starting with if should be enclosed by a do - while
> > loop to avoid possible if/else logic defects
> > 41: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:41:
> > +#define WEP_SW_DEC_CNT_INC(sec, ra) \
> > --
> > ERROR: Macros starting with if should be enclosed by a do - while
> > loop to avoid possible if/else logic defects
> > 49: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:49:
> > +#define TKIP_SW_ENC_CNT_INC(sec, ra) \
> > --
> > ERROR: Macros starting with if should be enclosed by a do - while
> > loop to avoid possible if/else logic defects
> > 57: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:57:
> > +#define TKIP_SW_DEC_CNT_INC(sec, ra) \
> > --
> > ERROR: Macros starting with if should be enclosed by a do - while
> > loop to avoid possible if/else logic defects
> > 65: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:65:
> > +#define AES_SW_ENC_CNT_INC(sec, ra) \
> > --
> > ERROR: Macros starting with if should be enclosed by a do - while
> > loop to avoid possible if/else logic defects
> > 73: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:73:
> > +#define AES_SW_DEC_CNT_INC(sec, ra) \
> > --
> > ERROR: Macros with multiple statements should be enclosed in a
> > do - while loop
> > 2082: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:2082:
> > +#define ROUND(i, d, s) \
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_security.c | 94 +++++++++++--------
> >  1 file changed, 54 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> > index 44e2b362c867..c92984fcf42d 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> > @@ -31,52 +31,64 @@ const char *security_type_str(u8 value)
> >  
> >  #ifdef DBG_SW_SEC_CNT
> >  #define WEP_SW_ENC_CNT_INC(sec, ra) \
> > -	if (is_broadcast_mac_addr(ra)) \
> > -		sec->wep_sw_enc_cnt_bc++; \
> > -	else if (is_multicast_mac_addr(ra)) \
> > -		sec->wep_sw_enc_cnt_mc++; \
> > -	else \
> > -		sec->wep_sw_enc_cnt_uc++;
> > +	do { \
> > +		if (is_broadcast_mac_addr(ra)) \
> > +			sec->wep_sw_enc_cnt_bc++; \
> > +		else if (is_multicast_mac_addr(ra)) \
> > +			sec->wep_sw_enc_cnt_mc++; \
> > +		else \
> > +			sec->wep_sw_enc_cnt_uc++; \
> > +	} while (0)
> 
> What are these statistics used for?  So far as I can see there not
> used at all.  It's probably better to just delete all the
> DBG_SW_SEC_CNT code.
> 
> regards,
> dan carpenter
> 

you are right Dan, I will remove all related fields in
security_priv

thank you,

fabio
