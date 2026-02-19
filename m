Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF50284896
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492675; cv=none; b=b+JMsyrodbGT1TZXgy5bCM8829pzAUnQBoUd7p9LbBr29bufAqm4qoZfuxJtIWsa1HKIuClxZ+d/L4MTyUMlQ4seI71onVExW7mf/bVmXyVsRZXQ6gY5d1aRJj5lTG5yuMC9UWxEZE40ms/4atKDQy5AYhQgk4hdEQFE+5i3nBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492675; c=relaxed/simple;
	bh=5ArMPRjvZkzyJOF2+7opXs21ajKN4FwrSSOVyacUd0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRaRojlqV/UfRUHyBSBW8WUKHCzMP829lLHHmRSioMZIX6/lL9TvPJHlLq+I84RL/Q/JJwHELq/L8euLGNR9NIYTfftl/5ccPWL0VwAa6h5F1zleFlz70QPYZCldBh8cx/cdV+J+2QTATkUnBEN/heCqh3gbIaGcVhgnwlFPAIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb37htAS; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb37htAS"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ad8435f46so582113d50.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771492673; x=1772097473; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/zWTGu4euyuzYwKt6Em7cPCv8n8J1ezr9DM/05hS8I=;
        b=Hb37htASbngjsGA2tcGcjXJh70Ubf2Bspsar26yj0Cb5inkCXlZ5PRn+0vSnb3RvJp
         6IFX/LJ4eN6DT1cfV0dlPx/17ftKgb+d2/YJ8fsQAdSI7uTq6CCOwa/kTCA3vvq1Go7v
         vYT5XZhu+rEkeC2Dydm5NL3b6uwWdLI0ykzqp5VgGJPRitcQUmzFF/8WAfOO1zsLppnh
         Q3AejTnleGzZuMHTjzNRjBYU9ikq2M4sup/o4/AO1BUz0VPsLMkrgrofMZ5IGx5ElIz3
         VSs9PyUWnzQiEMAM+yYpYL1SpM7Oj2ZVLVkYCI7YpuUxGbtP2cILgmG8Pnm5UM0wPqZa
         GctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771492673; x=1772097473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/zWTGu4euyuzYwKt6Em7cPCv8n8J1ezr9DM/05hS8I=;
        b=EjFvZiRIJoeFAF/GqKFvxDP6KpdXUlloBQrjiZAGmy8c/hpj71O3inIMS4MKesZw39
         wxpdizNvlxkWC0yFjLBPYNQ2iCyPOMUCjuRalwXgQWoWBVKY0+2H9vEhWSuRd2UrBPgD
         +P8/WDXHdEk9i+B38uLYkRdDzPfypyFBYqYsk6qGVOkGbOgExuk/UhsXNwo0gBv+fZRE
         sVtXG4dtqpAnVJYlScduxCfjVYNPYACu8VPNZNozmw3hkBphp5vzs+MqetNUhsYahHvg
         ftRqxuQxsTurAUHrY8djkyEdLX2neUBxYQuNbIv9xKZ73CcmQpvFz6OkUjaAYRjvuPtg
         rp2g==
X-Forwarded-Encrypted: i=1; AJvYcCUlCgnWaxqLiwZxbSB3eT6lNLKvxBs3QKCQR0BeAmd8sPllsunFr90EPe9PilKtrZydIyA9BWOHP6duW+/D@lists.linux.dev
X-Gm-Message-State: AOJu0YzS+JF4YtqgXgOkNkROCTtRWAK+WGWmvso7zLcw6h6JXbfJC9zi
	Np3qzS50kkIH1xa3LoE+4mERl8s1xW6o0saQH+p4xVZM2iB336r1MwyMUMexNSg3
X-Gm-Gg: AZuq6aJqSrw366MvD/g+FRkl+PUWINqV4UWBa0JXC/qENBvfmGpJkF6/lGl+gswyY7z
	Su2gOtMuegNw0oJIiKmyGSXq5UXxG4CmHvoBFeSGa4H6OR3aDD5Vzbic6xcqiz38Q+0/XU5E4Gu
	f1AFX0Kula4CySusGWzqTAdK3unxejyrALALLkabCbYtPj8GqIAz/9IEDP2LIkjoJjhhUXG9Icl
	QbLHOtv+xCqNGHHJ1jHiIau0pZAx4qQZ648dUiXQTCUg4TnHc3bgSad9XeCUTnbGBrHzeQYTt2a
	tJzar33WU1qALAj9DlGmP1B7c4Idl8Q4OVpSOHiH1EGtNz8hAE+cmec6SdcqncG1X4PqrO8xtNe
	HUIDA/V9uV+op+7rbWUt8VUIAx1idl4xSJM2DPFFxM5E0f5f0IgnwkivYgKva+BKWXIUgrk7oYt
	ysph46UdBZzz2L4ClpkeQIFw==
X-Received: by 2002:a05:690e:1281:b0:64a:e61f:a6f7 with SMTP id 956f58d0204a3-64c21b599a4mr11936960d50.71.1771492673285;
        Thu, 19 Feb 2026 01:17:53 -0800 (PST)
Received: from archlinux ([93.186.111.52])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22fb7860sm6958551d50.19.2026.02.19.01.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 01:17:52 -0800 (PST)
Date: Thu, 19 Feb 2026 12:17:47 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix spaces around binary operators
Message-ID: <aZbVOzEgj6ljtfqf@archlinux>
References: <20260218113229.9171-1-nikolayof23@gmail.com>
 <DGIAYPXFFQ1Q.1J195CKVQVKWI@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGIAYPXFFQ1Q.1J195CKVQVKWI@gmail.com>

On Wed, Feb 18, 2026 at 12:34:56PM -0600, Ethan Tidmore wrote:
> 
> Logical continuations should be on the previous line:
> 
> while (cnt < in_len) {
> 	if (eid == in_ie[cnt] &&
> 		(!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {
> 
...
> 
> Alignment should match open parenthesis:
> 
> if ((*wpa_ie != WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie + 1) != (u8)(wpa_ie_len - 2)) ||
> 	(memcmp(wpa_ie+2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {

Hi, i saw these issues when i was fixing the spaces, but i intentionally
didn't fix the indentation to avoid merging different changes into one
patch. I'm ready to send a sepatate patch with indentation fixes.


> >  
> >  	if (MCS_rate[0] & BIT(7))
> > -		max_rate = (bw_40MHz) ? ((short_GI)?1500:1350):((short_GI)?722:650);
> > +		max_rate = (bw_40MHz) ? ((short_GI) ? 1500:1350) : ((short_GI) ? 722:650);
> 
> You only fixed half of the problem here, you need to space out the other
> ternary operator conditions too:
> 
> max_rate = (bw_40MHz) ? ((short_GI) ? 1500 : 1350) : ((short_GI) ? 722 : 650);

I initially thought that fewer spaces made the nested ternary more
readable, but i completely agree that following the standard style is
the right approach for consistency. Will update in v2.


Thanks,
Nikolay
