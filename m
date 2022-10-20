Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233D915D5;
	Thu, 20 Oct 2022 05:06:00 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id g28so19241594pfk.8;
        Wed, 19 Oct 2022 22:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FwKto7TSal5dxBVmx3CRrWrq5lUyanO6Lbi2idmJE8M=;
        b=eK2WXRI/qx2ckaQhY7nc7vkpXxBAUS2LIMhxLJqE/6qAsC3J8L6LL9CfapVATR8kcR
         7K6Mq8ltvve3Sq34kq/vvGPL4sW3YVu7BPSNGYms34mzuIlQFg6Ns+2pn3Ja3uzI3e6P
         g037iH/5HCqdgvmiXiLLXwQLrSVrvgSstwhjaanbs647S5eJZL3rHqcw79x7zzccitsd
         bfykWpwsA7I8vAk/rQqEqD4cMKsDhs5CXGMTeaF7hNRVEj2lCm+oMhyDMiapxEf+osKX
         1Ppe1NbHi+4S6hQC5y0PAwXyjY3hSLnC17U5pteuJv6HJc/fDh3LvxYKjnIIhaq3hhAh
         Wqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwKto7TSal5dxBVmx3CRrWrq5lUyanO6Lbi2idmJE8M=;
        b=t07LDbYtts5ZPdVzaRt0FNAeCGhwfD+gKSzixggRxe5E7JNi991U/e68zhS4kPq1Qd
         emJK00T5cO8OF86aiqOYqo2UjwoKwxKTyTrxoRTfR6MA/VPdrGVb7mQnFyeqjNvwrp4w
         VR6krbaJpxHdsRmNwBCub/IIY67wYm74dqtt6a6cxQh5mZPG5tJLyglFafEQvUvrolYl
         LwFxHsogHyFlu2GqJEvKkhM/YOmOC/IgmRIxH2/+SZ4L/NVe+j3/jfXWDDc1kF9iJfTk
         EnjUblxDkRJZYjZMmEBnpFzaqdnjMRqf74KjkjzAaIdiF4jfuw3Tq+Ciraf8CFTlMr3g
         0rtg==
X-Gm-Message-State: ACrzQf29u2pfReVE8m4MUyetDYPiMIKMPQkMo6icPFkww2jZvU6zj/t/
	QUkAv+O1AsjHuNMn7CjhTXI=
X-Google-Smtp-Source: AMsMyM77iKTryvyYMzgjipvgRM624aLeq9rPBpSD6XJxE+U3zNGY0T7WNcJeRuvJ+5Kwx1cS2nbKZw==
X-Received: by 2002:a05:6a00:1781:b0:561:7f7f:dc38 with SMTP id s1-20020a056a00178100b005617f7fdc38mr12389086pfg.42.1666242359548;
        Wed, 19 Oct 2022 22:05:59 -0700 (PDT)
Received: from marshmallow (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id p14-20020aa79e8e000000b005626c3e5fdbsm121291pfq.143.2022.10.19.22.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 22:05:59 -0700 (PDT)
Date: Wed, 19 Oct 2022 22:05:57 -0700
From: Emily Peri <eperi1024@gmail.com>
To: Praveen Kumar <kumarpraveen@linux.microsoft.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: fix white space warnings
Message-ID: <Y1DXNYai6M6niWXQ@marshmallow>
References: <cover.1666230736.git.eperi1024@gmail.com>
 <45558673b486808e7978e2e4838c6ce5a2485b8b.1666230736.git.eperi1024@gmail.com>
 <7025b8d8-e23a-0148-75b5-a06c18c6dbcb@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7025b8d8-e23a-0148-75b5-a06c18c6dbcb@linux.microsoft.com>

On Thu, Oct 20, 2022 at 09:34:07AM +0530, Praveen Kumar wrote:
> On 20-10-2022 07:40, Emily Peri wrote:
> > Fix the following checkpatch warnings in rtw_ioctl_set:
> > 1) Add missing blankline after declaration
> > 2) Replace spaces used for indent with tab
> > 3) Remove space before tab
> > 
> > Signed-off-by: Emily Peri <eperi1024@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> > index 8c11daff2d59..354e61a8f2bd 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> > @@ -78,6 +78,7 @@ u8 rtw_do_join(struct adapter *padapter)
> >  		goto exit;
> >  	} else {
> >  		int select_ret;
> > +
> >  		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
> >  		select_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
> >  		if (select_ret == _SUCCESS) {
> > @@ -311,7 +312,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
> >  		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
> >  			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
> >  				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
> > -	       }
> > +		}
> 
> I think indentation is wrong here, it should be only 1 tab instead of 2 tabs ?

Thanks Praveen for the feedback! But I think this if-statement is nested inside
another one beginning at line 295. Can you confirm?


> >  
> >  		*pold_state = networktype;
> >  
> > @@ -367,7 +368,7 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
> >  
> >  u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_ssid *pssid, int ssid_max_num)
> >  {
> > -	struct	mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
> > +	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
> >  	u8 res = true;
> >  
> >  	if (!padapter) {
> 
> Regards,
> 
> ~Praveen.

Now that I think about-- in this last edit I removed a space to appease
checkpatch, but maybe I actually should have removed the tab?

Thanks!
Emily
