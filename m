Received: from cvsmtppost38.nm.naver.com (cvsmtppost38.nm.naver.com [114.111.35.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B645225785D
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 17:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533521; cv=none; b=Ls6fR7KSZS5koO/W0e2agzTPmosPuLvIq4T2lquTBGstGux4NRrpjkBSdOXbxNI8A1Q75alNavsPvKnQOsSv4SunziQw/sBJR0EDl2hiOTwcFpbznf+gxoniyv3ygj+ff42DhxaokPUfwO4ZTGcwUHiM7Ug41mxQjULg2MDDz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533521; c=relaxed/simple;
	bh=RvpbEvYfwy3EDwkFJ5j3rs0JoSs7X8/K+PqbZ5UrpFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTWBBnkx/oS7vCUjPjtNS+/YJpHiHAIlejX1B4XFHueq78ldPhiSOqFbpHYHwLMAyX9LJlvPMK0/FXAycHsnu462Px9m1IepFZFNKM1xCfGWMWljCkchrgXLw3kPlTIp9b4eoib8XISOLBGQzy0FRb9LglG6BPBb7QY9/teZAu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=vHBtuQLb; arc=none smtp.client-ip=114.111.35.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="vHBtuQLb"
Received: from cvsendbo019.nm ([10.112.22.34])
  by cvsmtppost38.nm.naver.com with ESMTP id -sbiZaj3SyaiUNJR-seVGA
  for <linux-staging@lists.linux.dev>;
  Tue, 27 Jan 2026 17:05:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769533511; bh=RvpbEvYfwy3EDwkFJ5j3rs0JoSs7X8/K+PqbZ5UrpFw=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=vHBtuQLbaByBnWMW6gChMHVgzW5FeAG11EwJp/HfMh5V01ol1K32V1uK5heeFzUQs
	 /vxYLUwqgXEqlvCgSjqyFiecGAqLnx77tgAoVyqUw+FgnLKwI4K4dwuuzFrPE1J//z
	 2PReodmsG44PydJ/tF9792bAOmrrMmQI2KobbpqotEbmUUgWbZAG9udNVsyt1vwis1
	 U4QmM9AxOLKjWkejEwoUPNazKQU7cM/Aa3k9rVf8AMnFCN1TUUOuQHZAS52+CTdBLE
	 bG2CHTtilLpnpxTKON+DKrOZh/wrTG0KQF/UMjEHExHZ9BVPRteyH72quF2jBdbTMD
	 JTQi3Ou00+Ukw==
X-Session-ID: o4-LIeTDSU+hyLVpW35mbw
X-Works-Send-Opt: 3dYwjAIYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: YmKmFxvrFqJZ+HmwKxuw+6E=
Received: from JMW-Ubuntu ([14.38.141.199])
  by cvnsmtp001.nm.naver.com with ESMTP id o4-LIeTDSU+hyLVpW35mbw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 27 Jan 2026 17:05:11 -0000
Date: Wed, 28 Jan 2026 02:05:10 +0900
From: Minu Jin <s9430939@naver.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bqn9090@gmail.com, dan.carpenter@linaro.org,
	abrahamadekunle50@gmail.com, straube.linux@gmail.com,
	bryant.boatright@proton.me, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	hansg@kernel.org
Subject: Re: [RFC PATCH] staging: rtl8723bs: fix potential race in
 expire_timeout_chk
Message-ID: <aXjwRsm7NhRpyWJH@JMW-Ubuntu>
References: <20260127131035.731607-1-s9430939@naver.com>
 <2026012704-lard-untimed-c88c@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026012704-lard-untimed-c88c@gregkh>

On Tue, Jan 27, 2026 at 03:15:24PM +0100, Greg KH wrote:
> On Tue, Jan 27, 2026 at 10:10:35PM +0900, Minu Jin wrote:
> > The expire_timeout_chk function currently do lock and unlock inside the
> > loop before calling rtw_free_stainfo().
> > 
> > This can be risky as the list might be changed
> > when the lock is briefly released.
> > 
> > To fix this, move expired sta_info entries into a local free_list while
> > holding the lock, and then perform the actual freeing after the lock is
> > released.
> > 
> > Signed-off-by: Minu Jin <s9430939@naver.com>
> > ---
> > Hi,
> > 
> > I noticed this lock-unlock pattern in expire_timeout_chk() while
> > studying the code and it looked like a potential race condition.
> > 
> > I've refactored the code to use a local list so we can handle the
> > cleanup after releasing the lock. What do you think about this approach?
> > 
> > Any feedback is appreciated.
> > 
> >  drivers/staging/rtl8723bs/core/rtw_ap.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > index 67197c7d4a4d..5947f6363ab0 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > @@ -179,6 +179,9 @@ void expire_timeout_chk(struct adapter *padapter)
> >  	u8 chk_alive_num = 0;
> >  	char chk_alive_list[NUM_STA];
> >  	int i;
> > +	struct list_head free_list;
> > +
> > +	INIT_LIST_HEAD(&free_list);
> >  
> >  	spin_lock_bh(&pstapriv->auth_list_lock);
> >  
> > @@ -190,19 +193,21 @@ void expire_timeout_chk(struct adapter *padapter)
> >  		if (psta->expire_to > 0) {
> >  			psta->expire_to--;
> >  			if (psta->expire_to == 0) {
> > -				list_del_init(&psta->auth_list);
> > +				list_move(&psta->auth_list, &free_list);
> >  				pstapriv->auth_list_cnt--;
> > -
> > -				spin_unlock_bh(&pstapriv->auth_list_lock);
> > -
> > -				rtw_free_stainfo(padapter, psta);
> > -
> > -				spin_lock_bh(&pstapriv->auth_list_lock);
> >  			}
> >  		}
> >  	}
> >  
> >  	spin_unlock_bh(&pstapriv->auth_list_lock);
> > +
> > +	/* free free_list */
> > +	list_for_each_safe(plist, tmp, &free_list) {
> > +		psta = list_entry(plist, struct sta_info, auth_list);
> > +		list_del_init(&psta->auth_list);
> > +		rtw_free_stainfo(padapter, psta);
> > +	}
> 
> Looks sane, can you test it to verify it works properly?
> 
> thanks,
> 
> greg k-h

Hi Greg,

Thanks for the review.

I have verified the patch with Smatch and performed build tests
it does not produce any errors or warnings.

About the runtime test,
I have analyzed the logic as follows:

Within the first loop, expired entries are simply moved to a local free_list.
Since we no longer release and re-acquire the lock inside this loop,
the integrity of the shared auth_list is perfectly preserved while iterating.

The actual cleanup (rtw_free_stainfo) is performed only after all entries
have been isolated into the local list and the lock has been released.

While I don't have the physical hardware to verify this myself,
I noticed that Hans de Goede has a working test environment for this driver.

I've added him to the CC list and would be very grateful
if he or anyone else with the hardware could give this a quick test.

Minu Jin
