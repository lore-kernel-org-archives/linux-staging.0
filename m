Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CCF1C2B
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 09:49:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id y16so16956823wrm.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 01:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sGQu9zaoGiTvvokNF12XdMZeXrMDq+udW21w5TfdmPU=;
        b=Sr0cbGK6iyGpJRqPGXFi/1Gt4IVqCB8HIYvN5Nc26ZnQ878k1xBdd7X6yHDuA1RGXD
         4H45gVTxKCTQJz83XPxYSvGfzso0ZvGheZeN0T9/zXT2A/pZkDK68kwtYLwyW5uhC4tE
         6YrTyURGoQ+aLNwOjNLiYIoB8hLjANRTOelFyuAeynbH3EOK9Pto2gqxkH09mOshh8HV
         Z1Ug0r86MWCZ9eJa/yizzA1VkvXSKg2a5bgaWAezlyAof21yVE2YUtvcj97Xt922x8aG
         i1Bh65DWfRspifsGK5MTEOGwF2M5TmdAhlq+v7J5iigTLA6geNghfXvtcvGs7CEuz2Rz
         Kgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGQu9zaoGiTvvokNF12XdMZeXrMDq+udW21w5TfdmPU=;
        b=7A+NZjgwlXJGduMK2+61r9qp7KjQ9OUSCYxp5s1Cu2BaLH7w23DH/tTc51HPpBwluw
         aNn8ljI4R4nCBIWVr8YZ/8+PsMOSplo4vV5zHK52fijGGAfckeKJdhWLPT0RCyAUiYCi
         Ih+5dOP7vSuPHzi6T9Z7zJICfHfvhJl+t20rgRXbEcKtDWP16mOTTJoGpaLQXtJVUbU2
         K4jq4F64efsBPcoHOG17rxqJcj/5rdj86hn/ej0nqxHrbAc8D35O5TCTe+fksKSu+oaZ
         UZJItL+NPSZkRPYKMh+nmNwRg2lgM+4KvOwp1wBZKvwCgNv77mPw0DevdPJ6VIRdEZ56
         Vb3g==
X-Gm-Message-State: AFqh2kryscu4YN5Zw17tARuyaz3WZX8v29pvDI80PHYqoQ0HADU7uBYr
	+uPDGBd5sgfAYytjGyC7wB8=
X-Google-Smtp-Source: AMrXdXs9n04ZTXVb0tTcwCQaxPUqKDBHTXiszLnaSokx9MBxtjRZVELyIHROgISb344M6iUNU9qijQ==
X-Received: by 2002:a5d:4902:0:b0:281:cdb2:f351 with SMTP id x2-20020a5d4902000000b00281cdb2f351mr622047wrq.67.1672307347529;
        Thu, 29 Dec 2022 01:49:07 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6792000000b0027e5501f7f5sm9777775wru.53.2022.12.29.01.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 01:49:06 -0800 (PST)
Date: Thu, 29 Dec 2022 12:49:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: yang.yang29@zte.com.cn
Cc: gustavoars@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, xu.panda@zte.com.cn
Subject: Re: [PATCH linux-next] staging: ks7010: use strscpy() to instead of
 strncpy()
Message-ID: <Y61ikBL9ulTFHP9N@kadam>
References: <202212261903245548969@zte.com.cn>
 <Y61hpuMcp3NKbqL5@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y61hpuMcp3NKbqL5@kadam>

On Thu, Dec 29, 2022 at 12:45:10PM +0300, Dan Carpenter wrote:
> On Mon, Dec 26, 2022 at 07:03:24PM +0800, yang.yang29@zte.com.cn wrote:
> > From: Xu Panda <xu.panda@zte.com.cn>
> > 
> > The implementation of strscpy() is more robust and safer.
> > That's now the recommended way to copy NUL-terminated strings.
> > 
> > Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> > Signed-off-by: Yang Yang <yang.yang29@zte.com>
> > ---
> >  drivers/staging/ks7010/ks_wlan_net.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
> > index 044c807ca022..e03c87f0bfe7 100644
> > --- a/drivers/staging/ks7010/ks_wlan_net.c
> > +++ b/drivers/staging/ks7010/ks_wlan_net.c
> > @@ -382,8 +382,7 @@ static int ks_wlan_get_nick(struct net_device *dev,
> >  		return -EPERM;
> > 
> >  	/* for SLEEP MODE */
> > -	strncpy(extra, priv->nick, 16);
> > -	extra[16] = '\0';
> > +	strscpy(extra, priv->nick, 17);
> 
> I think this code is a buffer overflow.  This is an implementation of
> SIOCGIWNICKN.

Huh...  Maybe I'm wrong.  I looked at a couple other implementations of
SIOCGIWNICKN and they all seem to assume a 17 character buffer...

Let me look deeper.  I guess for now assume I am wrong.

regards,
dan carpenter

