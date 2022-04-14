Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0CB3219;
	Thu, 14 Apr 2022 19:46:57 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id p1so4430991qtq.10;
        Thu, 14 Apr 2022 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eHFyNRnOj/Hxzbtit9ErbPyMn3ggMxI97B8KNHlSfnA=;
        b=XmBXwU+6Qz2sJFPbjWiAhS2IElnJo3bLBXUs7w53UyBUWGzxaImzO7bmue2bTlHVsz
         pj86/B+0QIb+YY/CmD6qV7kvEJDg+Z3yOLNxhXEnYyRtHY7D4mfmxpdf41MN8T9dsHUu
         qobIpJwyg2zNKQXFkCatxq9HKGiBoK7XCcpYCq3Uu+CUeCPweUX4o5yI2nngnTe0H1m0
         FdDadaX110mnc8iUxE194XGSFM9Pmnh7lb/rmF2Ty9ISksoDfylEKFQm5x5FSYrUdjJZ
         zjXsNx51beK0WfOU1QqZLa4+7XqMURWAl4his/iIc6KB/DQBlEjEIM8a80lM/sygYGmU
         kihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eHFyNRnOj/Hxzbtit9ErbPyMn3ggMxI97B8KNHlSfnA=;
        b=wKHHryvGm6/TtiV82gOtFKDfBwQtiw5jp0QMzgD++zA6uEw5jNhwujL0bEa7LRF5ym
         YC2HGVGrSITvIdItZDHP32p/MSqD3ZQllWNeC4KupQdmjoN+YcxMP0Bgc8aXtCqYIpP1
         smNpKVUZOUNl7K1SWCW6RL2iQgDqw/TZNy6KzOP9xeHOUZnQhqeWtMMpS3qY5T5Tq+Fi
         N1QJk7ynr/p+YGaPGnzsVYdBemjkDciLIYbCXgYZfNSy2eE5EFsJpJF3lhhYUYtWEEyI
         QQysn1OrJRSI/80nKMYRu2yRZ+6jjfz5X0xqlmypkFlCXxhxscAyUI3jRccFHKmny7+h
         qCdg==
X-Gm-Message-State: AOAM530gI4LYOyZrAwVSbuM2JiXEPLpQiVta2skf/zdybhVEySO279XY
	7ilojglcC0KMkhNzS7b0Yxo=
X-Google-Smtp-Source: ABdhPJwwxLI+rQE00DqqustI+INL2vQrHLXTZ76110K9L8pdQP6KkWX+uyARX6v+p6R29zzFIj+D3Q==
X-Received: by 2002:a05:622a:50a3:b0:2f1:d143:e533 with SMTP id fp35-20020a05622a50a300b002f1d143e533mr3098282qtb.208.1649965616139;
        Thu, 14 Apr 2022 12:46:56 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id i18-20020ac85c12000000b002eea9d556c9sm1632590qti.20.2022.04.14.12.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 12:46:55 -0700 (PDT)
Date: Thu, 14 Apr 2022 15:46:51 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH 4/6] staging: r8188eu: place constants on the right side
 of tests
Message-ID: <20220414194651.GD4144553@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649880454.git.jhpark1013@gmail.com>
 <d2469155c37b8677a8dcbed28bc0840745d46f76.1649880454.git.jhpark1013@gmail.com>
 <eda6a3a94b768f06e67581bbc4d9974b391f0651.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda6a3a94b768f06e67581bbc4d9974b391f0651.camel@perches.com>

On Wed, Apr 13, 2022 at 06:16:58PM -0700, Joe Perches wrote:
> On Wed, 2022-04-13 at 16:11 -0400, Jaehee Park wrote:
> > To comply with the linux coding style, place constants on the right
> > side of the test in comparisons. Issue found with checkpatch.
> > WARNING: Comparisons should place the constant on the right side of
> > the test.
> []
> > diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> []
> > @@ -1997,19 +1998,19 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
> >  	else
> >  		pnetwork = &pmlmepriv->cur_network;
> >  
> > -	if (0 < rtw_to_roaming(padapter)) {
> > +	if (rtw_to_roaming(padapter) > 0) {
> 
> Do you think this change is the same test?
> 
> What happens if rtw_to_roaming returns 0?
> 

Hi Joe, Thank you for your comments.
If the roaming trying times is none it wouldn't need to associate with
ssids. And we wouldn't need to go into this loop. 
I think this change is the same-- am I missing something?
Thanks,
Jaehee

> []
> 
> > -				if (0 < pmlmepriv->to_roaming) {
> > +				if (pmlmepriv->to_roaming > 0) {
> 
> here too
> 
> >  					continue;
> >  				} else {
> >  					rtw_indicate_disconnect(padapter);
> 
> 
