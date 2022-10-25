Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A434A50
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 08:54:15 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z97so35162629ede.8
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 01:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezeNa0KTk2LzeMG5JhgWIVDQRQDMmtK5jUjmS8DSveY=;
        b=aSnigHEoQW6zMZsvzBlSGlaGf/YJDJY/viTwyD/cryQ1AAM2cMo/yR/u2Xvd5aB8/l
         nKMIxOHRqxMp24TxH0yY75kjQVLu6r0ggRki31sGz9OWSsMEw3y1KThHkFxxmYJDQzQR
         7MzDSzXmGdWt54DU/MMi6A7hA+gmLqCamfnHUffOlsaNs7oQ2VzAOOdkDz0IUCkOGGXJ
         YQIHst7yoGMGu1VkeUEthj5tB6M2MyTbLypRMNB5mVFbovKv2+uRrzPZywpUAwzWwELb
         sYVtS1PzLeZ23ZPr9TAaNqHJhAaSqPwgSwG3235pZt3m0dtEnLohZrEqRH2jLBsTvvQG
         +tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezeNa0KTk2LzeMG5JhgWIVDQRQDMmtK5jUjmS8DSveY=;
        b=HdWXKP57oTll3vgOHdRRYVhB/WEv9u8+EfEIOUvw74y9VMc2t6NACtWupHTJfEXtFV
         pipCECffRpJu65h7Ix0M/uehHI+IubZIhir4tPH0mRgy3yAVViy9K0mS/aD8N3O3UQrP
         G7J8tsM3/G41SWpXc1cz3rEaOIdEH8eOUIUNpPiLXYgWHUpWXc7p/KCKCqqISex328yQ
         mRwZjzaUytDDpPmvPegwS6t7cC2ZxH1cjDK9FCqcdg/k2ztAF6IhNMrXfU+L7E2n2Ax+
         q1nK2dQvt8/XfEfOcIzEvhlB8K2F+2uk+BdesFpLIkM9RQqk56qMolLITUG1zUcRGM2+
         kp2Q==
X-Gm-Message-State: ACrzQf0tbPo3xJje8tyscfaJ4uVeO0vR17E1jnbWC8/Pf6CZ62zs3Mat
	UggTAAtMKUdPeizWo8laMb4=
X-Google-Smtp-Source: AMsMyM5m9ddl+EduppwZSQwDXO95/iY9B1gwgu7wF1ojRZR2sd6ZZhlB2brLCCKUEO4umWgM8mSEww==
X-Received: by 2002:a05:6402:1d86:b0:457:e84:f0e with SMTP id dk6-20020a0564021d8600b004570e840f0emr34418751edb.241.1666688049383;
        Tue, 25 Oct 2022 01:54:09 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id er5-20020a056402448500b0045cf4f72b04sm1200945edb.94.2022.10.25.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 01:54:09 -0700 (PDT)
Date: Tue, 25 Oct 2022 10:54:00 +0200
From: Nam Cao <namcaov@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: rtl8712: check for alloc fail in
 _r8712_init_recv_priv()
Message-ID: <20221025085400.GA246874@nam-dell>
References: <cover.1666645510.git.namcaov@gmail.com>
 <ce12408f17f90b3b368d077a7321a2a252f52b72.1666645510.git.namcaov@gmail.com>
 <Y1eI4kTRSwEG+G6g@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1eI4kTRSwEG+G6g@kadam>

On Tue, Oct 25, 2022 at 09:57:38AM +0300, Dan Carpenter wrote:
> On Mon, Oct 24, 2022 at 11:24:07PM +0200, Nam Cao wrote:
> > The function _r8712_init_recv_priv() and also r8712_init_recv_priv()
> > just returns silently if they fail to allocate memory. Change their
> > return type to int and add necessary checks and handling if they return
> > -ENOMEM
> > 
> > Signed-off-by: Nam Cao <namcaov@gmail.com>
> > ---
> >  drivers/staging/rtl8712/os_intfs.c     |  3 ++-
> >  drivers/staging/rtl8712/recv_osdep.h   |  8 ++++----
> >  drivers/staging/rtl8712/rtl8712_recv.c |  7 ++++---
> >  drivers/staging/rtl8712/rtl871x_recv.c | 13 +++++++++----
> >  4 files changed, 19 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
> > index 003e97205124..47d7d998fa86 100644
> > --- a/drivers/staging/rtl8712/os_intfs.c
> > +++ b/drivers/staging/rtl8712/os_intfs.c
> > @@ -309,7 +309,8 @@ int r8712_init_drv_sw(struct _adapter *padapter)
> >  	if (ret)
> >  		return ret;
> >  	_r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
> > -	_r8712_init_recv_priv(&padapter->recvpriv, padapter);
> > +	ret = _r8712_init_recv_priv(&padapter->recvpriv, padapter);
> > +		return ret;
> 
> If statement missing.

Probably a rebase mistake, the if statement is there in the last patch.
Will send a v2 nonetheless, thank you for noticing this.

Best regards,
Nam
