Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF157F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 01:31:20 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id f63so7549563pgc.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 18:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y260yV0KwzJMWztWomChr6XjkeANTGLTQ4tvjJ0MEjo=;
        b=TKEydQ03RMa9QtlYHQ9kam9/7IjjTELFUI/eVsEkFh4B/POIx4PVxpouMU/TygwM49
         5gybcTx+bVhWT/9qwQ6ZmX0PaW1RXr5EGrso6CB8oan/CLh/aA9wQN3pSIUiYaC3Vdwz
         01ebZmoGdeV8KE2zfiDT8M6W/aPMhQ11yxbYHNADCe3MIcfy5oZ4H6KkAs9zgdY+flsG
         v724YyrQ5HEKHT/0YLSg2C9xEwO8L8oSkIRFP7U2aj4ir5Af1VjYL8J04QEGqeOabhRy
         gW2mY3xo4/cixkeayWZyC0Bo+K7l7y8O6uywq9NuwnqYa0Jo8Wa0gQnrJM93HL1uUWRc
         3+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y260yV0KwzJMWztWomChr6XjkeANTGLTQ4tvjJ0MEjo=;
        b=hxxDkgNUlxAk5L54erfHD7QLbQPpSOu6k0NbLndiZ3N8kqAJqZ4vfzITrSofu5h7c7
         VnQxKHr33ssduf/+pcASAvTGXOThNog/hqUQNCKoA7dglVQE8jwdE8I2Q8wckBzfcpTs
         x0u0fscNhUyqrj995Ez2uYav0QekqtFxwIS3XY8qNrdd3m39xri0AePVVe6sFwsKJX5I
         jmoG4ci7/L6Qgx3+IDdiJdJyiI6Gb6irM0Q2bx7XKSafJ2GpaL8wU0lt5wuhCTZTp+hy
         kLnOnq7k7kSiRpzOLlVNH+Lr5c9PCDE4aeTzp6ouFZchgHgGQktZOg7n16+lTPevPD+e
         Jd9Q==
X-Gm-Message-State: ACrzQf1kII17tHSvf3BpYO3/y0PKg/zqkkp89dIDNSsPqRXD6wmDr86T
	C7Ov7AZPZQRle6DzUybnnno=
X-Google-Smtp-Source: AMsMyM7bDzOsLshdLnslU7hfHneEU9XmmUErBS7/0F3Xr8MF+F79KkRN/O7mSQ/i0AcWZrtaMl/lnA==
X-Received: by 2002:a63:f50e:0:b0:470:274b:53a2 with SMTP id w14-20020a63f50e000000b00470274b53a2mr12034698pgh.524.1667698279843;
        Sat, 05 Nov 2022 18:31:19 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id b10-20020a17090a12ca00b0020dda7efe61sm3686468pjg.5.2022.11.05.18.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 18:31:19 -0700 (PDT)
Date: Sun, 6 Nov 2022 12:31:15 +1100
From: Jacob Bai <jacob.bai.au@gmail.com>
To: Joe Perches <joe@perches.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] staging: rtl8192e: remove unnecesscary macro
 defines
Message-ID: <Y2cOY/qq8hFrxV+m@jacob-Ubuntu>
References: <cover.1667694826.git.jacob.bai.au@gmail.com>
 <6cdf838429ca9b553fb572f55a53ec25fa4e5f6a.1667694826.git.jacob.bai.au@gmail.com>
 <8fea8008f0ebb85d7e893513117347712e68fba5.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fea8008f0ebb85d7e893513117347712e68fba5.camel@perches.com>

On Sat, Nov 05, 2022 at 06:18:41PM -0700, Joe Perches wrote:
> On Sun, 2022-11-06 at 12:11 +1100, Jacob Bai wrote:
> > remove useless macro defines
> []
> > diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> > index eabb4187d907..aad1842857c0 100644
> > --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> > +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> > @@ -307,12 +307,12 @@ void rtl92e_config_mac(struct net_device *dev)
> >  	struct r8192_priv *priv = rtllib_priv(dev);
> >  
> >  	if (priv->bTXPowerDataReadFromEEPORM) {
> > -		dwArrayLen = MACPHY_Array_PGLength;
> > -		pdwArray = Rtl819XMACPHY_Array_PG;
> > +		dwArrayLen = RTL8192E_MAC_ARRAY_PG_LEN;
> > +		pdwArray = RTL8192E_MAC_ARRAY_PG;
> 
> Perhaps use ARRAY_SIZE instead.
>
As the other drivers under rtlwifi are using ARRAY_LEN or ARRAY_LENGTH,
maybe it's better to keep the same format?
