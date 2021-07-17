Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AC672
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 09:02:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso7269500wmj.4
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 02:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BD/V7r10o0SqwIvbsFiBdOw23ZNAoZULz/h9vB+2HHE=;
        b=U5reRpWclLkzod+TaWxDN0aQ6wmjLtlaqBhetuCsE9ylFW4TbYPdTij2kGTVk9Jf6W
         pKHb9S6Pw4lrCdSYI4MXNCJqBEwYRTRkIN2y/WEw8/LWHdHH5AYIAjzw0UYE803vu23R
         spvyEeqKhPStD+udGHU4kPQj7+HOtWyN6DeQbO/JEfOFz9qqu5xrs2vOLYP5wmzHxYpz
         RtkHdR90WN+ebO8ItZkZ4OM0o3GPJcyErxkODLw595wLPB2rzM+J+gVncCQDb7Q9ZnUE
         h1cCqB3ULHyIprXF90JpsdVsF/m34TDsnf0Zw0+uIylOikxo/PpGleZOFL93+3UpKPR6
         +EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BD/V7r10o0SqwIvbsFiBdOw23ZNAoZULz/h9vB+2HHE=;
        b=JWeyXZmOtkg7xzm4JKQ84cPzCBlaLAzt400uw7oNFNxkK7jPZWSynlRxph1yzzstmE
         89DUcg8SuNX2qWv6KHfqYaQ8gJ+MC7cKDwvbkYIhJZ+gUX3cRQ7l1dqyTWqFExJEo5yc
         9VH5PGhyy+rM+99J+UJj3Ox3wZSaeDFOXCTJp+J9izSG503NxlsswjjMYKxJSlaqThpy
         D4E8T53yRPHPv25B64ZYhNFppIyYqdfG4abjlcDOXStDH1njvkmYF8MvM35ocIHevqB5
         ObbVXXed/bxgcC1mE46Iv0hqZ37v034PGnoCZ/ijTpVYDh9qQaxyhfiuVVr1WOaUVDro
         zmew==
X-Gm-Message-State: AOAM533NLX8dIQ02OmcpsFq2enYoKeR0eaRc6ikYmfcK0IDNWY4xs87Q
	uICif2XKcZs6oMwKSSxKz8M=
X-Google-Smtp-Source: ABdhPJwFoHftpAwcI+2WWHk58jzC0GnymbZGwSTW1b4xuEvH2wNLpsZXkykRzHYXVMF5q2Z2f16JfA==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr15297545wmi.21.1626512518626;
        Sat, 17 Jul 2021 02:01:58 -0700 (PDT)
Received: from agape.jhs ([5.171.72.78])
        by smtp.gmail.com with ESMTPSA id h9sm10263619wmb.35.2021.07.17.02.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 02:01:58 -0700 (PDT)
Date: Sat, 17 Jul 2021 11:01:56 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8723bs: fix camel case issue
Message-ID: <20210717090155.GA1409@agape.jhs>
References: <cover.1626275102.git.fabioaiuto83@gmail.com>
 <a708b2b9902bedf5bd0466b05516a4c5b4f43723.1626275102.git.fabioaiuto83@gmail.com>
 <20210714152605.GK1931@kadam>
 <20210714190456.GA1402@agape.jhs>
 <20210717082901.GM1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717082901.GM1931@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dan,

On Sat, Jul 17, 2021 at 11:29:01AM +0300, Dan Carpenter wrote:
> On Wed, Jul 14, 2021 at 09:04:57PM +0200, Fabio Aiuto wrote:
> > Hello Dan,
> > 
> > On Wed, Jul 14, 2021 at 06:26:05PM +0300, Dan Carpenter wrote:
> > > On Wed, Jul 14, 2021 at 05:11:14PM +0200, Fabio Aiuto wrote:
> > > > fix following post commit hook checkpatch issue:
> > > > 
> > > > CHECK: Avoid CamelCase: <NetType>
> > > > 45: FILE: drivers/staging/rtl8723bs/include/ieee80211.h:170:
> > > > +#define is_supported_ht(NetType) (((NetType)
> > > > 	& (WIRELESS_11_24N)) ? true : false)
> > > > 
> > > > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > > > ---
> > > >  drivers/staging/rtl8723bs/include/ieee80211.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
> > > > index 8eb0557a077a..b2c1a7dafcee 100644
> > > > --- a/drivers/staging/rtl8723bs/include/ieee80211.h
> > > > +++ b/drivers/staging/rtl8723bs/include/ieee80211.h
> > > > @@ -167,7 +167,7 @@ enum network_type {
> > > >  
> > > >  #define IsSupportedTxCCK(NetType) (((NetType) & (WIRELESS_11B)) ? true : false)
> > > >  #define IsSupportedTxOFDM(NetType) (((NetType) & (WIRELESS_11G) ? true : false)
> > > 
> > > These are the same.
> > > 
> > > > -#define is_supported_ht(NetType) (((NetType) & (WIRELESS_11_24N)) ? true : false)
> > > > +#define is_supported_ht(net_type) (((net_type) & (WIRELESS_11_24N)) ? true : false)
> > > >  
> > 
> > NetType -> net_type, or did you mean something else?
> 
> Yes.  If you're going to change it then change the surrounding code as
> well.
> 
> regards,
> dan carpenter
> 

ok, will add a patch in next v2,

thank you,

fabio
