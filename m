Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ACF70
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 16:19:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id m3so20095424edv.5
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 09:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XayuMeXSD5c3FE14Gz9sb1594kQqDHscOmzXsH25B70=;
        b=qfuKtxb0VpVHL1X0JDFQCKt+pRuk1PNCztuZUnWa+SoDNf/PGkVhNpcVxsFA+pHbC6
         UvvU+KjhAqx6LKXsKT8UeXHlFmjJNGZpgbuvj3cBEg2os3pvoX4Isp2k0lOkyARcxM1t
         c4XLaUB7yVDUUq2rJusHec4qUUT1l5oax9fb1tqxS0w8RPaj2LDeFYVSMMrCZsw8MR9h
         GvTq73QlsHhZY8flQkjzxgUD7pc4FKGpN4wWgwHoJYEeTa92PS+fTNzrx/7Yk9marXlV
         wI8Y19JdMAKJJ6sRaR4fqAbw/g6lKNrxoVYevwSjlaAzoPEaYE+igGZysNEYkhtWRQNv
         t8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XayuMeXSD5c3FE14Gz9sb1594kQqDHscOmzXsH25B70=;
        b=rAi0NWGjiFeEQJbe3EtoLMb0sbiJYfIPgcE8czn6rhbl3NLLZxjqieUA68KVItaAPb
         JL7UmI4pIen0Ejxi5o+FFP549egZCz3l/ZkPn9lDAcgbWsHfgAf2Jp6Fkax8EyPK4zq8
         M/4XGb3grhk3XDCxpkQKBTocqBQSZg60bs/Re6H66ZDI7Ay4aQCoWRfMSyDe1OlqPNtI
         WnIFz9SYM8srkHQ7FUWy6Q1BDAI2kjCEU6u6uZUHIT1Ds7BpMbM3yjCFcwc1PjfV3puX
         P84CqH3ovasTmYv7oNmhiL4AziXSQeO1CuEAlaaRaye05vG1aDQoJt8e643rkqWU8Vno
         syOw==
X-Gm-Message-State: AOAM530f8A9nNRPNbZDPE8tQf+YnOuU8drz0+D8CgcBI+BI8LqcA71dW
	cJ7aGPh5+0h8gH0QAP9/UD4=
X-Google-Smtp-Source: ABdhPJxg1K3uEAvQITGHMXwjXxO5W5SKdLQ51df71SJRdsIBxguNffcMBas1zxMru0ZMrLsTPS8r8w==
X-Received: by 2002:a05:6402:757:: with SMTP id p23mr24082487edy.49.1618330774708;
        Tue, 13 Apr 2021 09:19:34 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id ho11sm8082862ejc.112.2021.04.13.09.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:19:34 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy-kernel@googlegroups.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] :staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Tue, 13 Apr 2021 18:19:33 +0200
Message-ID: <1843649.8FsqevVC75@linux.local>
In-Reply-To: <alpine.DEB.2.22.394.2104131803270.8430@hadrien>
References: <20210413155908.8691-1-fmdefrancesco@gmail.com> <alpine.DEB.2.22.394.2104131803270.8430@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

On Tuesday, April 13, 2021 6:04:16 PM CEST Julia Lawall wrote:
> On Tue, 13 Apr 2021, Fabio M. De Francesco wrote:
> > Removed the led_blink_hdl() function (declaration, definition, and
> > caller code) because it's useless. It only seems to check whether or
> > not a given pointer is NULL. There are other (simpler) means for that
> > purpose.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 1 -
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
> >  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
> >  3 files changed, 11 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > b/drivers/staging/rtl8723bs/core/rtw_cmd.c index
> > 0297fbad7bce..4c44dfd21514 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > @@ -150,7 +150,6 @@ static struct cmd_hdl wlancmds[] = {
> > 
> >  	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
> >  	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param),
> >  	set_chplan_hdl) /*59*/> 
> > -	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param), 
led_blink_hdl)
> > /*60*/
> This is worrisome.  Doyou fully understand the impact of this?  If not,
> the change is probably not a good idea.
>
This is that macro definition:

#define GEN_MLME_EXT_HANDLER(size, cmd) {size, cmd},

struct C2HEvent_Header {

#ifdef __LITTLE_ENDIAN

        unsigned int len:16;
        unsigned int ID:8;
        unsigned int seq:8;
#else
        unsigned int seq:8;
        unsigned int ID:8;
        unsigned int len:16;
#endif
        unsigned int rsvd;
};

It's a bit convoluted with regard to my experience. Probably I don't 
understand it fully, but it seems to me to not having effects to the code 
where I removed its use within core/rtw_cmd.c.

What am I missing?

Thanks for your kind help,

Fabio
> 
> julia
> 
> >  	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param),
> >  	set_csa_hdl) /*61*/ GEN_MLME_EXT_HANDLER(sizeof(struct
> >  	TDLSoption_param), tdls_hdl) /*62*/> 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c index
> > 440e22922106..6f2a0584f977 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > @@ -6189,15 +6189,6 @@ u8 set_chplan_hdl(struct adapter *padapter,
> > unsigned char *pbuf)> 
> >  	return	H2C_SUCCESS;
> >  
> >  }
> > 
> > -u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf)
> > -{
> > -
> > -	if (!pbuf)
> > -		return H2C_PARAMETERS_ERROR;
> > -
> > -	return	H2C_SUCCESS;
> > -}
> > -
> > 
> >  u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf)
> >  {
> >  
> >  	return	H2C_REJECTED;
> > 
> > diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> > b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h index
> > 5e6cf63956b8..472818c5fd83 100644
> > --- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> > +++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> > @@ -745,7 +745,6 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter,
> > unsigned char *pbuf);> 
> >  u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf);
> >  u8 set_ch_hdl(struct adapter *padapter, u8 *pbuf);
> >  u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf);
> > 
> > -u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf);
> > 
> >  u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf);	
/*
> >  Kurt: Handling DFS channel switch announcement ie. */ u8
> >  tdls_hdl(struct adapter *padapter, unsigned char *pbuf);
> >  u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf);
> > 
> > --
> > 2.31.1
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "outreachy-kernel" group. To unsubscribe from this group and
> > stop receiving emails from it, send an email to
> > outreachy-kernel+unsubscribe@googlegroups.com. To view this discussion
> > on the web visit
> > https://groups.google.com/d/msgid/outreachy-kernel/20210413155908.8691
> > -1-fmdefrancesco%40gmail.com.




