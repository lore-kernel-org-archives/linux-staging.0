Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8C15F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 10:36:36 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id h10so21693400edt.13
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=psGbAtFNcu5ED/UDNB3lCu6rq++to5JqkbeYH9vux0g=;
        b=j/mXdgAf42FIcClhqWC0WlPM7lGfrjxfC+C7Y2vOc7NTfskbcrtVx/+R6GdiAUbkCn
         LPwdrXfqrBkgbEvsl33uHtPfZqdAJXtF37P48soMjRNcTHCuzabYi8/w67iWFJiACU08
         xsOx4cZ2Bm/IfWOPYmP3nSP1LkOdTFI4lARF88bXkHM3fXUiMYwzmP7jU0iMTwLGS/9t
         qVEIj10y7NAxuc2hQuhooGEuqdDcUcsZna+1sBK2wc19MXyATx39e3XBRVy7IbeYIhzg
         4Gz2izrqWzd9WsnrgVnjHsHY11/IZV1VHWtCt7OZLV9KJExa6yxkry9FEBKrWqU05fRs
         wQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=psGbAtFNcu5ED/UDNB3lCu6rq++to5JqkbeYH9vux0g=;
        b=k+tdCX/szcXn6YT0AZsQ5/v8WUYN3ajqOxrYuLUmsjQQcuTMGZuUsjXBHQiuuTIk2L
         x9GRF/3zophIPQnJjjUw3mE7ZNdLgNqZFyVotuFe4QOWqDERLGeHg6ZvkGz3zqd+118y
         AxSSX7bt/FRBbfJ1B6bJ9I4apidcERfQTQUN892pYW++siwc7oLKqufd1KgEHBw6E5j/
         DVUyssjBL9vYB//CqeS1xDJlzeF8VdmXq+SVcqDFZ1mAnTsmKI2va292MatjY0ia59z/
         M1bw9XZIODOLcsFT12EPygmmk6ldYSwQTYj6cCUXYXekrkm+t2aCy2VmOwoueXLwx3Pf
         6zJQ==
X-Gm-Message-State: AOAM532RPSBoSXrbP1GMpJz9HMdb0PLzRqWsTkTikQCFizq/FLeF2wT6
	R1fnDyg7c+8BC8QgKC5qMqo=
X-Google-Smtp-Source: ABdhPJx/vfml6QnDlmi5412iIO6VWeNDhS+sZjmBNo7GFOv+ojHFTNkFP8V6JpUd756sMevCYTp0Fg==
X-Received: by 2002:a05:6402:2070:: with SMTP id bd16mr2795802edb.133.1617186994718;
        Wed, 31 Mar 2021 03:36:34 -0700 (PDT)
Received: from agape.jhs ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id la15sm916096ejb.46.2021.03.31.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:36:34 -0700 (PDT)
Date: Wed, 31 Mar 2021 12:36:31 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@oracle.com, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/40] staging: rtl8723bs: replace RT_TRACE with public
 printk wrappers in core/rtw_eeprom.c
Message-ID: <20210331103630.GA1450@agape.jhs>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
 <39c2cd878bc914a00e71ea988c3cacb651670822.1617183374.git.fabioaiuto83@gmail.com>
 <YGROiD19tgF8XnK6@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGROiD19tgF8XnK6@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 31, 2021 at 12:27:20PM +0200, Greg KH wrote:
> On Wed, Mar 31, 2021 at 11:39:31AM +0200, Fabio Aiuto wrote:
> > replace private macro RT_TRACE for tracing with in-kernel
> > pr_* printk wrappers
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_eeprom.c | 26 ++++++++++-----------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > index 3cbd65dee741..6176d741d60e 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> > @@ -36,7 +36,7 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
> >  _func_enter_;
> >  
> >  	if (padapter->bSurpriseRemoved == true) {
> > -		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));

I looked at this ---------------------------------------^
and so I thought that pr_err was good...

> > +		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);
> 
> As Dan said, this is not the same thing.  You are now always printing
> out this mess, when before you were not unless you explicitly enabled
> "tracing".
> 
> And you are sending it to the error log?
> 
> And finally, drivers should never be using pr_*() for messages, they
> should be using dev_*() instead as they are a driver and have access to
> a device pointer.
> 

thank you, I didn't know about dev_*

> thanks,
> 
> greg k-h

my aim was remove private macros replicating component tracing and log levels...

so what's best? Keep a simplyfied RT_TRACE encapsulating a dev_* call?

thank you,

fabio

