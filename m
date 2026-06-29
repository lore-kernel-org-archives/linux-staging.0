Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EFF3F7891
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722707; cv=none; b=AaoNBP3bFmBYQc3xRifXV+5cb8NLF3/pOddp35tR/g3HwbFp+wWKxG2sbGmZYMPMsydBpTOIBK3Xj7CxdmJnU/XeZMqUtyb2TurjlFCEaqBso17XhQU0eu0nDlciPZ2F2e32jShPPx2EDMQN7rGHjSxoFwCefYM7/F/balO+uOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722707; c=relaxed/simple;
	bh=PqUtr1O/9Rr/1GDJpATJz0DIJhMT0UahkE7jMkE26yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHFtW+6bqkoAyxw1uqixr/a4Y5Bm7P4t5GdjqB4CCC9aJuePoHWgz6Sf+GdlcqqX2YnN31/2i+llEcFG1dfFI6cy/NSXsAH0SX1E2e5KOTCcU2Tu0J91IvE0jy86k5KsevENrMaQVURuu/CKuTrVALCDH8w4HXOAak8F+vWPbF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYrOs57O; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYrOs57O"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493a440bc10so8591545e9.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782722705; x=1783327505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xfP6gJBe4uusDe5/gbTzwGZK5eXh7AKWDOifOM5dDWE=;
        b=JYrOs57OdpwS9f8h58ys0off3BK30yVXkYndizzyC6F8/+0oZZmu3q4yuTZoLlvy8Y
         oLdEXPnhbMwtygC6OZdG+VsHsPPoWL0I8LkWyFIlnHEtBTKXkOvlDhClA5iLKgipsHpu
         L80lnFfS++MtEil2KUldvlx62wr1g9FuMMUAXhNESbfYXyPaG0Ai21TsNDxQVJnkCAva
         gd4g0dHz+gxLS6syozhMc1Zy/hsE9uSKrn3osJo4+vquOfNsAumPQev5kqhCF5WeaOOE
         pNHgqWrfR6kY2pOYmKrwm137C0HKwS7u3RUr3MCSbaTSJqn2W1nwA0XK/mtbbRlMAjSA
         lUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782722705; x=1783327505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfP6gJBe4uusDe5/gbTzwGZK5eXh7AKWDOifOM5dDWE=;
        b=UTMTGMqlv6XTMfupvbLAZ5yhM2QzVO41n31K856IaIrCphvPhvhDBG+G/Tmi+Y1nGk
         K+vi/T5J6L74gJ8OvBCE/GdOwf+DTvXPurDQ+MI8WxsbYjWJcgh2BV7LcfaUAVPWgymK
         3UEWAguo+VmZIxYj86P03XHT0mZnCjm7rlQoBZkWfhCHrgwrjIStyQMolSLj+iMmXVCI
         ViRGSwik2kD1qIlwd3Gz8Mb0nb4UpZpGpSZcV6rXOOwDx8h6t3pJFPz45k2IC1ECMVvj
         vR818Z8yazHs4JIbIjRD+pthYKfJEfDgcTVn+AeloUMeAjD1s5ik2YTUemUhUxbQ0Uc+
         FYig==
X-Forwarded-Encrypted: i=1; AFNElJ88ibmwCrjL82B3gWZMApEu02D3WzWPOwR9uuMlXYRX07zqQt5CEi6tzuH6iRs3wDrdgH0mCDbjGXtGnmBF@lists.linux.dev
X-Gm-Message-State: AOJu0YxPUEAAuz+jJsFXOG9f4MjkEH3dL0QdTXfcowq4gRp/dRcL/c4q
	osMtGRgriE2nbqmVlooxS4D74Xb4qOGmMSgD6Vs+eQ52jtZbJ3R7TChP
X-Gm-Gg: AfdE7cmFSzqTKEea3YyPzmD0bRhSwG6Qs1vOlNjA9IDD1//Q5Nd0rNJdzTya9cYuEI1
	oPCAIyvXpnxHGtFPemhrZr0U2Oj16ckS+5pCRjqZrc+9jgrNx1w1PQMHDqnRevxCRp93wmHkOSM
	2l1Iesn+QF3MaPpr8U2iLQ2TVQ7h4+tizJMDCgjd8WkAS/RXZ/+9G27QTreV2mDmDhtp26Cp9zQ
	Z0PYtqXA8maLiA85fYORksPTzzkE382rxZs8a8NWA/QJpBJoT2j4CCw54EMOYhLXFE/odWwQXlB
	oLn/nwWkl6Uhb9+rXEUyp9CT12WeJ7oEcuzYX0y+iR40CRA59mp3WekJeFd5ziwfxWLCbU3fw0g
	hDW7UpTRdPeinMbuR9ZsPrfGiWeCsM/uppiuPi/hmlgoETfK9O/NVuZg0dEFAWmNaTo4VYjmcMT
	51ove3xSUXdA==
X-Received: by 2002:a05:600c:c0d2:20b0:492:409d:b7c3 with SMTP id 5b1f17b1804b1-49266873070mr185101485e9.13.1782722704967;
        Mon, 29 Jun 2026 01:45:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46fe25429d5sm27696127f8f.7.2026.06.29.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:45:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:45:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prashant Rahul <prashantrahul23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: octeon: Improve initialization error
 handling
Message-ID: <akIwjIzETXGnOBaj@stanley.mountain>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
 <akIdyUhcH6O-Iczx@stanley.mountain>
 <DJLE1OGDMMV0.1TSDJRDW4Z547@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJLE1OGDMMV0.1TSDJRDW4Z547@gmail.com>

On Mon, Jun 29, 2026 at 01:55:46PM +0530, Prashant Rahul wrote:
> On Mon Jun 29, 2026 at 12:54 PM IST, Dan Carpenter wrote:
> 
> > You need to say when you haven't tested your code.
> 
> will do, thank you!
> 
> > You need to say when you're using AI to write patches.  There is
> > a format for it.
> > Documentation/process/coding-assistants.rst
> 
> Thank you for pointing it out, however I have not used any AI assistant
> for this patch series. I used Harper, an offline grammar checker, to
> help me write the emails, do I need to specify that? Other than that I used
> basic tools like an editor, make, git etc.

Ah, fine then.

regards,
dan carpenter

