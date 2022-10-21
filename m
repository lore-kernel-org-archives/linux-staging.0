Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609377B
	for <linux-staging@lists.linux.dev>; Fri, 21 Oct 2022 11:20:58 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id g8-20020a17090a128800b0020c79f987ceso6370127pja.5
        for <linux-staging@lists.linux.dev>; Fri, 21 Oct 2022 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PVxrbdloPyeC7I/bClCHPaphZOmS62WhGrOJR/1SEx0=;
        b=MyJKtJ/ZCHJdYsCn2j64p5BmT6QyI5frJjqts7FvsQSznMxcSspaLyESPqEOHYiyfN
         0gcY0cQ1CZCbz/CRw53i9ur6YO1StEHMH4daMsTL9kRYb+H7zVgRiucjG2gpoHvAeoZN
         8r/kATvwxpzdya4feBBsqjztLWSacMdF9SahGB1HlLlDm/JMR8tP5onZ9qoNmMlxZCpV
         aZXeJfPlhvwUt1QKoJVLwcpgRG1mccvv6+8fjroaoIlwADYcwELV9TGGx8kh4L15cFJH
         qYH7luxxGN/1hvb5XksLYjpflCsCwFCcei/xNneMaOMJqKGvixfZYFcIxI71FXdCNNJd
         Eb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVxrbdloPyeC7I/bClCHPaphZOmS62WhGrOJR/1SEx0=;
        b=uZJkIfzlR0+p/PeCFNdhAh0D1tLpEwMOtyAItAcQ6sQtOzx7/H2zgOKT2sXApzB6jW
         ClMsluOKVO/4wn16KINn1LFzFxvNZVFxakunLxYOuWDFYoeFyneEkovNvBeB8DwazgW4
         Bv47/Artvy88wvIYwLahkqZgCnuroN5idPIZdXyuJXBuOONramCjQYKwvh900Hyq5Bzw
         v8flIKPm+nrsCn+HgCP7A9chC42SaqEzYaXxz05oGDA+Dhkfj10r+2/x0SxN3lzxLb7S
         5olkTcBH42ebpEpA0R97xm2KCt1Coa8Ae/bCqrWfwAb5Mvk9wlGaDTcsRj7O7N+TH7Dg
         lskA==
X-Gm-Message-State: ACrzQf2KDW/pVrkn5V+TEr9oQ+zYdh6QBB2W8gzt3gx3HIc22AqrIemk
	eOeWTbhKGEfkzabq4PLW3sA=
X-Google-Smtp-Source: AMsMyM7f6OAkLIejzpa1Mw+h4+S7hXcJYNWXrgn44dgnez1Vgxyg0/EY/g/eVmZkfbWeQoUOq9uoDA==
X-Received: by 2002:a17:90b:3d1:b0:212:732d:a1c8 with SMTP id go17-20020a17090b03d100b00212732da1c8mr8188889pjb.189.1666351257756;
        Fri, 21 Oct 2022 04:20:57 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id t16-20020a170902e85000b00179eaf275d5sm14711612plg.27.2022.10.21.04.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 04:20:57 -0700 (PDT)
Date: Fri, 21 Oct 2022 22:20:52 +1100
From: Jacob Bai <jacob.bai.au@gmail.com>
To: Joe Perches <joe@perches.com>, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: replace IEs with ies
Message-ID: <Y1KAlCIt64/y/PE7@jacob-Ubuntu>
References: <20221018105409.18331-1-jacob.bai.au@gmail.com>
 <8617109bdc3e192b98e5c3b21ba871501a87f6d9.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8617109bdc3e192b98e5c3b21ba871501a87f6d9.camel@perches.com>

On Wed, Oct 19, 2022 at 09:35:32PM -0700, Joe Perches wrote:
> On Tue, 2022-10-18 at 21:54 +1100, Jacob Bai wrote:
> > Replace wlan_bssid_ex struct member IEs to ies.
> > CamelCase issue found by checkpatch.
> 
> Please try to avoid changing code merely to appease checkpatch.
> 
> What is the value of the last s?
> When is a specific index of the IEs array actually used?
> 
> Mere renaming may be removing useful markings.
> 
> (removing a lot of the rename blocks)
> 
Thanks for those advices. As this was my first patch, I tried to 
pick up an easier one to start with and followed commit 341f27d0
but changed "IEs" only. 
> > diff --git a/drivers/staging/r8188eu/include/wlan_bssdef.h b/drivers/staging/r8188eu/include/wlan_bssdef.h
> []
> > @@ -239,7 +239,7 @@ struct wlan_bssid_ex {
> >  	unsigned char SupportedRates[NDIS_802_11_LENGTH_RATES_EX];
> >  	struct wlan_phy_info	PhyInfo;
> >  	u32  IELength;
> > -	u8  IEs[MAX_IE_SZ];	/* timestamp, beacon interval, and
> > +	u8  ies[MAX_IE_SZ];	/* timestamp, beacon interval, and
> >  				 * capability information) */
> >  } __packed;
> []
> > diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> []
> > @@ -104,11 +104,11 @@ static char *translate_scan(struct adapter *padapter,
> >  
> >  			if (pnetwork->network.Reserved[0] == 2) {/*  Probe Request */
> >  				/*	Verifying the P2P IE */
> > -				if (rtw_get_p2p_ie(pnetwork->network.IEs, pnetwork->network.IELength, NULL, &p2pielen))
> > +				if (rtw_get_p2p_ie(pnetwork->network.ies, pnetwork->network.IELength, NULL, &p2pielen))
> >  					blnGotP2PIE = true;
> >  			} else {/*  Beacon or Probe Respones */
> >  				/*	Verifying the P2P IE */
> > -				if (rtw_get_p2p_ie(&pnetwork->network.IEs[12], pnetwork->network.IELength - 12, NULL, &p2pielen))
> > +				if (rtw_get_p2p_ie(&pnetwork->network.ies[12], pnetwork->network.IELength - 12, NULL, &p2pielen))
> 
> For instance, these consistent 12 and "- 12" uses may be better as some
> alternate array.
Could you please be more detail on this?
> 
> >  					blnGotP2PIE = true;
> >  			}
> >  		}
> > @@ -131,7 +131,7 @@ static char *translate_scan(struct adapter *padapter,
> >  	start = iwe_stream_add_point(info, start, stop, &iwe, pnetwork->network.Ssid.Ssid);
> >  
> >  	/* parsing HT_CAP_IE */
> > -	p = rtw_get_ie(&pnetwork->network.IEs[12], _HT_CAPABILITY_IE_, &ht_ielen, pnetwork->network.IELength - 12);
> > +	p = rtw_get_ie(&pnetwork->network.ies[12], _HT_CAPABILITY_IE_, &ht_ielen, pnetwork->network.IELength - 12);
> >  
> >  	if (p && ht_ielen > 0) {
> >  		struct ieee80211_ht_cap *pht_capie;
> 
> etc...
> 
> Also this may be removing similarities between a few other realtek
> staging drivers
> 
> $ git grep  "\[MAX_IE_SZ\]"
> drivers/staging/r8188eu/include/wlan_bssdef.h:  u8  IEs[MAX_IE_SZ];     /* timestamp, beacon interval, and
> drivers/staging/rtl8712/wlan_bssdef.h:  u8 IEs[MAX_IE_SZ];
> drivers/staging/rtl8723bs/include/wlan_bssdef.h:        u8  ies[MAX_IE_SZ];     /* timestamp, beacon interval, and capability information) */
> 
looks like rtl8723bs has already been updated with ies, should I replace
IELength as well like the commit I followed?
