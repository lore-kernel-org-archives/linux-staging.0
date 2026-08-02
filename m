Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082D62FD7C3
	for <linux-staging@lists.linux.dev>; Sun,  2 Aug 2026 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785658343; cv=pass; b=DrE21kddmv8YqIQzWa8DGIURBFIzfKtDT4UnRWrUOLiPD7VucqbpylWm3YzJD0+dvGgwWUmMy4JrXdBbxNY/Gl1awMP8kVK4Ei90ZN9a5/MQedZ7adjCGeJZb3eP781TVjSfA/MkSD20amqJ4hLrff5kAV8WBysXAU0tCzYOtmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785658343; c=relaxed/simple;
	bh=1TORRMwagEkH3m4HVbG7jEKUDDo1IhXvwo4W++CfiOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcVFiKW5teiSbYuIEo5ci4xjoukaW4sgE1cjivXBCaohOaPUsGxPIB1aI7mysp6oTDQ1DKxeExf8ISzJG9wNlBC12hhuuG26ZLcdui2hVAr8Jw2lapWs6owCwJgUNfEbxWesh25ZvUG0MBLCmGfjDU8gihDdPGGG/0+xCkB3gxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lqn95Wt6; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lqn95Wt6"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9690c99c917so741934241.2
        for <linux-staging@lists.linux.dev>; Sun, 02 Aug 2026 01:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785658341; cv=none;
        d=google.com; s=arc-20260327;
        b=niE2FqjutC6MFDdYGdN8CsDj1Hk2XMbNUZFPz9GavoqN00NEf9rMaWRoVmvuPyaDGH
         dtvSNpw+JkJ5tWFOJpv/DGAP+3q7tGDNF8xAs8ily3E/cX5Rfnk4kkclXA6jrB4078sS
         ONlG+hwR182LFQ4QN3sBTlDnGoacO5qiZMkjbXtiTz5d0vAPzYpqN6L0EDXx5MLXzm2o
         w8SNgU7TmcxPNH1THJw16lDPrPpFM8xhOlIcU8JLpXLzYgtev4naW4TwlLRI7xxIHKRG
         74dCwhHX6NhWwZnzw6r3wKWd5wycvLwgL9eoV1v/d1inPBjQT4iZTq8kmRcffTVB/yJF
         4jsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1TORRMwagEkH3m4HVbG7jEKUDDo1IhXvwo4W++CfiOg=;
        fh=dshi+DCsBTBT53Y1GUqCFsnh0jdxyOc+sbeCeneMTR4=;
        b=pRK8loHLZWC67bzFJhmQInsKkxZ/hA56qnSs+OzI4giNRFAkwowW3oHy133wRD6AYK
         UejuAEDW6BpUJVIFMo7CjEzPsT6kM0pRV9C0/AMcb8+Vrcf5fcpcdEJABkd9SYtLMk44
         E69baNgJsQqvH4XhyKYGkbGxtA8Rl+1TrL7rfNuv/avJ7lcU3pB8sNmmm1RRFulwMBY6
         xKDwv3J/kh9fyDSGtKHDzVlPxtzfVKXUPKGBqLyBEKsGENajPdega7c7/uVhp1n05oXb
         b21oTvsSDRUiAO7v5+JDodTYZbT7GUX3m0vlCBbZoICInN8EJCvMZ+WOdhiZGbEX434m
         2i0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785658341; x=1786263141; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1TORRMwagEkH3m4HVbG7jEKUDDo1IhXvwo4W++CfiOg=;
        b=Lqn95Wt6xnd50q2pHVcwDEsmFJ5pBrSrgWCKTnIDS9d9aTdfOYhyzqQ812QUxQOShG
         xvUeDYh/iCcB7mTKKjpMYel+DwlotDljW7iDcBjOV+15tOJYxuTAnNecPut6cTzutTGS
         xERZGK00VoJBxK61aNuro/kFDIyeOnCz6iITOpFrR0TehG1pb56381VSO7WWy9tHO5fp
         HdIYj4zUvQOsG0MgI8bWiLtZLMJcrbThf5QU5Ff7YcbRL2yOZN4D3OffBVI4KxHVV15t
         eLjDt3QlRQT32G1kgo9jDjQHIvFZK3URbUplo/EHkDK8eORY1gP+6a+EcqbyaNTQpKY6
         AxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785658341; x=1786263141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1TORRMwagEkH3m4HVbG7jEKUDDo1IhXvwo4W++CfiOg=;
        b=mGyAyI2pM1x7ke1FsBef9kYuRW+hFTOLtZVHkd6zwOTeRkX7Qjngw55wNcJbGFsTMC
         7HKjB2SYJrlEoBpWdkN9NQK8lN3JeHS55BigfG5Cem4Mj/vAlh+2JaglVUu2eu21C6dF
         bParcNmHiEl4WLV6DEBIjH0ySMN7pQ2M+QHpjc2LWnIt/xHsX12VuwoPPdpVHOL7ywQM
         y2tZGkmyfBY9DGWVbgtPKJRqPPr6XGfUiDXIm9b72avAoADSfVp5r4uzLu8a20hxzRxs
         YNwye9pyQZa+QRLkQlH9yrpy3jbJ+iscGiUu8mqX0zU9WGM6pRDHsw1KiSvHguiYU+tK
         2Rng==
X-Forwarded-Encrypted: i=1; AHgh+Rp9cIwQu/YF8uQyVsKKD+wr3/boMX9p+C22WUC7TmG/f9aUpb5L9rFtu4sVWYrfuuFMl+0dav5HqKtuSCg4@lists.linux.dev
X-Gm-Message-State: AOJu0YxDf+qB6Xmx+8w1JHrsMmHs9S4tCcuBCOfUfVuw7mtBHiOfsRoA
	CpcTnZe+ZJp8f203ASWDWLd2m+GMpBhYC5PUmXlPBgLTpbl6Ao2viJrYL9Bc0AbTo8j0+EUS4xH
	btQH6rE8y++HbiSOAKa1KyzPnlLNWb2I=
X-Gm-Gg: AR+sD13i6Gfsp7nF2KTc89R8nN69ZUAOgSIiPheRQxsdsZMzFM+HMjNLquX72AkzmZ/
	gPVTcK06y9BWJ+xdivsd1BuO39AWwnfhRW6aA1QvksrBqXbA2I3aqzmMQlFJ5bYdVIfEI1Y4S5D
	CWPWjOss+TeYslUhiSN3HFDjtJuQMQKmJH3sSAAjL2GBswtJsz3Doj3X/Mwd8pg7Nmr4cD04Vox
	fVQpi0+S3NKXUD2BBdKISxP0x5z5UMD/Y95eIxVTO7N0gtrR7AdrwfpAtGNIiLZ5R/BRBq/TfYH
	Rvboi7OyOGM9K/UymQ7iu/1FgZh9he2jTCRblJoO7koWxIRzmr42rdFhINUqcubhtPBSRSIb2dD
	z70EQ2+JkGIXAlc8ObLwCHJepG6qyeeRQXw+Xsc3eBtFrOUY6qr6EQARvepoAD8N+SizHdS5zww
	aHu/wiTq2e8OEteu3wyR0UNLXudyn2unYinuZ46qPQ+6MP/2SWelj7oJNuSUoqR1baklpTUXJBF
	CLCggFje3ahbkEKafxAJrUaSjE=
X-Received: by 2002:a05:6102:3f88:b0:747:5bd0:a2b7 with SMTP id
 ada2fe7eead31-75b21c5c7ebmr4383989137.5.1785658340756; Sun, 02 Aug 2026
 01:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260801174611.49470-1-acharyalaxman8848@gmail.com> <2026080235-reverse-water-861f@gregkh>
In-Reply-To: <2026080235-reverse-water-861f@gregkh>
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Date: Sun, 2 Aug 2026 13:57:09 +0545
X-Gm-Features: AUfX_myoO1qlpV-EopFyV24JPx72p-OK35iA7VWjYto72LStuqBHkiEgF9OVE-A
Message-ID: <CAMyXUJm_m79_0D8a_PWLnouN7NaF4aBsd3r9doKWyrKncN0aHA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: validate WPS attribute lengths
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

This was found during an OpenAI Codex-assisted static
review. Codex helped identify the unchecked length and draft the initial
change; I then traced the call sites. I should have disclosed that
assistance in the original submission.

The reachable path is through received scan results:
rtw_cfg80211_inform_bss() parses a WPS IE and copies the Selected Registrar
payload into the one-byte stack variable `sr`. The outer IE is validated,
but the inner attribute length was not. An oversized payload can therefore
overwrite `sr`. An attribute length of 0xffff also makes the old u16
attr_len calculation wrap to 3, after which attr_len - 4 underflows before
memcpy().

I ran git diff --check, strict checkpatch (no errors or warnings), and a
Docker ARM64 W=1 build with CONFIG_RTL8723BS=m. I did not test on hardware
or inject a malformed frame, so testing was compile and static analysis
only. I will include the appropriate Assisted-by information and improve
runtime testing before any revision.

Thanks,
Laxman

On Sun, 2 Aug 2026 at 13:03, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Aug 01, 2026 at 11:31:11PM +0545, Laxman Acharya Padhya wrote:
> > rtw_get_wps_attr() checks that the four-byte attribute header fits in the
> > WPS information element, but trusts the payload length from that header
> > when copying the attribute and advancing to the next one. A malformed
> > attribute can therefore make the driver read beyond a received management
> > frame. Storing the total attribute length in u16 also allows the addition
> > of the header size to wrap.
> >
> > rtw_get_wps_attr_content() also copies the full payload without knowing
> > the destination size. Its callers copy the Selected Registrar attribute
> > into one-byte objects, so an oversized payload can overwrite the stack
> > even when the payload itself fits inside the information element.
> >
> > Store the total attribute length in u32 and reject attributes extending
> > past the information element. Add destination lengths to the copy helpers
> > and reject attributes that do not fit before copying them.
> >
> > Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
>
> How was this found and tested?
>
> thanks,
>
> greg k-h
