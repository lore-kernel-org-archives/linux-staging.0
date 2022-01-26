Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E01173
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 01:00:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o30-20020a05600c511e00b0034f4c3186f4so2753559wms.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 17:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mCiwpH1Tj5ffm9C4sC9/lxXD1d3SX51Xb1WLfTTfu20=;
        b=LpRIG/VrnC6GCrp4hdyXzRJ38dQdmTrFu6iHffjBsOO6UtM32czxUv1s40/WnD4Kmm
         JNLB82PTekSexth1gIQi4LGs4HzATVIUw+nA7vt222vuoB0iejyMMmmoYn0FbKsA/6nK
         H2JSGeVM2zsrrqyCASnVH9VsYE/P1GbxvWuxKpR+ssiAHH9aB+BPvbuufNmpDvon+8b8
         HeHU0UkeWkAuGJNhIAbadl+Hwi3JNK1h1YYPaexC52k6aRem0Bj60P2HkBlFdExadeCa
         meE+xqtoope/PM/dl8LUs3n85jbTq6RsJd0cNwzygnfK/8VZBDZqKspJU6CAW0LOqJ/O
         sNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mCiwpH1Tj5ffm9C4sC9/lxXD1d3SX51Xb1WLfTTfu20=;
        b=kgia1QpmzYb01Hje9FN6gEjEUj+68zrpy9IUQl9wlju3Hbf/HgorkgyzL5zpVvLe+p
         suSeb+9lbeWOn0A/OX7g377xVu6eg3T6zZo2a/gfZSqb9OOo53NGMbWPcT+edR7BkKzA
         eFiBVcTXoZ+S10FxH0zSO4tKA5bx8+XLYog+YdKvX/t4UuSrjrHj/ynf/8FoaL8xJ7yv
         elUONlDh4ROhLT4rLoy2oZifDjYgOEULPRs4V1ljoxwg327h+PuVV9gBGJ/Vrev6d9RA
         FKgmSoiH4pwV8Ji42CHJ+PH0ip9sI1KJ+X5TH2OiU0Lb9TN/a25T16/ni/BnA19rm0f2
         A6Xw==
X-Gm-Message-State: AOAM5304a8c8TfnBk2VefwJ6GVgT8p4miHPeSQ5IuVjVqfk5SnzksHl8
	yn+4EiYrV5ZfGhzF1SrbGEiSUw==
X-Google-Smtp-Source: ABdhPJxTrc+Ub0Jexcef6gOzGjahcLBE2Htwq0AZVRPSV8ZVWwbeT25qz2t7gC3CpNrMSaxROuUYVw==
X-Received: by 2002:a1c:a90e:: with SMTP id s14mr5116245wme.13.1643158817279;
        Tue, 25 Jan 2022 17:00:17 -0800 (PST)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id a14sm19528005wri.25.2022.01.25.17.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 17:00:16 -0800 (PST)
Date: Wed, 26 Jan 2022 01:00:15 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] staging: r8188eu: remove smaller sets of DBG_88E
 calls from core dir
Message-ID: <YfCdH8PS9fV2flw2@equinox>
References: <20220124224415.831-1-phil@philpotter.co.uk>
 <20220124224415.831-3-phil@philpotter.co.uk>
 <47fcbfb5-ee59-a1ef-781d-83989e26e1aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47fcbfb5-ee59-a1ef-781d-83989e26e1aa@gmail.com>

On Tue, Jan 25, 2022 at 09:17:46PM +0300, Pavel Skripkin wrote:
> Hi Phillip,
> 
> On 1/25/22 01:44, Phillip Potter wrote:
> > Remove all DBG_88E calls from the core directory, other than those in
> > core/rtw_mlme_ext.c, as this contains over 100 on its own so will be
> > done in a separate patch for ease of review. These calls do not conform
> > to kernel coding standards and are superfluous. Also restructure where
> > appropriate to remove no longer needed code left behind by removal of
> > these calls. This will allow the eventual removal of the DBG_88E macro
> > itself.
> > 
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> 
> [code snip]
> 
> > diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
> > index ad87954bdeb4..62354c3194bd 100644
> > --- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
> > +++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
> > @@ -653,13 +653,8 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
> >   	/* first 3 bytes in vendor specific information element are the IEEE
> >   	 * OUI of the vendor. The following byte is used a vendor specific
> >   	 * sub-type. */
> > -	if (elen < 4) {
> > -		if (show_errors) {
> > -			DBG_88E("short vendor specific information element ignored (len=%lu)\n",
> > -				(unsigned long)elen);
> > -		}
> > +	if (elen < 4)
> >   		return -1;
> > -	}
> 
> show_errors seems unused after this change
> 
> >   	oui = RTW_GET_BE24(pos);
> >   	switch (oui) {
> > @@ -674,11 +669,8 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
> >   			elems->wpa_ie_len = elen;
> >   			break;
> >   		case WME_OUI_TYPE: /* this is a Wi-Fi WME info. element */
> > -			if (elen < 5) {
> > -				DBG_88E("short WME information element ignored (len=%lu)\n",
> > -					(unsigned long)elen);
> > +			if (elen < 5)
> >   				return -1;
> > -			}
> >   			switch (pos[4]) {
> >   			case WME_OUI_SUBTYPE_INFORMATION_ELEMENT:
> >   			case WME_OUI_SUBTYPE_PARAMETER_ELEMENT:
> > @@ -690,8 +682,6 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
> >   				elems->wme_tspec_len = elen;
> >   				break;
> >   			default:
> > -				DBG_88E("unknown WME information element ignored (subtype=%d len=%lu)\n",
> > -					pos[4], (unsigned long)elen);
> >   				return -1;
> >   			}
> >   			break;
> > @@ -701,8 +691,6 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
> >   			elems->wps_ie_len = elen;
> >   			break;
> >   		default:
> > -			DBG_88E("Unknown Microsoft information element ignored (type=%d len=%lu)\n",
> > -				pos[3], (unsigned long)elen);
> >   			return -1;
> >   		}
> >   		break;
> > @@ -714,14 +702,10 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
> >   			elems->vendor_ht_cap_len = elen;
> >   			break;
> >   		default:
> > -			DBG_88E("Unknown Broadcom information element ignored (type=%d len=%lu)\n",
> > -				pos[3], (unsigned long)elen);
> >   			return -1;
> >   		}
> >   		break;
> >   	default:
> > -		DBG_88E("unknown vendor specific information element ignored (vendor OUI %02x:%02x:%02x len=%lu)\n",
> > -			pos[0], pos[1], pos[2], (unsigned long)elen);
> >   		return -1;
> >   	}
> >   	return 0;
> > @@ -752,13 +736,8 @@ enum parse_res rtw_ieee802_11_parse_elems(u8 *start, uint len,
> >   		elen = *pos++;
> >   		left -= 2;
> > -		if (elen > left) {
> > -			if (show_errors) {
> > -				DBG_88E("IEEE 802.11 element parse failed (id=%d elen=%d left=%lu)\n",
> > -					id, elen, (unsigned long)left);
> > -			}
> 
> same here
> 
> > +		if (elen > left)
> >   			return ParseFailed;
> > -		}
> >   		switch (id) {
> >   		case WLAN_EID_SSID:
> > @@ -839,10 +818,6 @@ enum parse_res rtw_ieee802_11_parse_elems(u8 *start, uint len,
> >   			break;
> >   		default:
> >   			unknown++;
> > -			if (!show_errors)
> > -				break;
> > -			DBG_88E("IEEE 802.11 element parse ignored unknown element (id=%d elen=%d)\n",
> > -				id, elen);
> >   			break;
> 
> and here
> 
> 
> 
> With regards,
> Pavel Skripkin

Thanks, will take a further look when I fix up for v2.

Regards,
Phil
