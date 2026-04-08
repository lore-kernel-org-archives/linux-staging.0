Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0B131355C
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 07:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634592; cv=none; b=duwph1Oe/AQNE5eI3pfTcLOpTsZaEzTe1abfIB2FdMeLZST5xueueIPqWwiGsPmJKvN15Bg7c2wtgaTsIXiiZzDr/OWBjRPWQ5gNIKXWS0qVeUFn3zxtdoqadGf0gqWVrDXN8e4u/Xdvx8eTl44nx9NWBebUFtpO/P5C6dZfNpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634592; c=relaxed/simple;
	bh=j2m+28wFnM21PNcJiTyCkaE9sg4yVbTJ5ECX6bjiyQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFvYVviMD5iIROTFpo87ScViC4x5xeh9hZCMSXtuFsjGp3ZdGD207bRP+MZc7eqiGLFz+uthOsHLacbU+ZPoZpyhnQDLu69+HTGWVWweiKB7om8Xw+13/0ZLyV5x+vf/1BxoNWMRcPEEMk61FdcLfzdEsLBFjFLnhhPTMSlhW3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGN7eID/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGN7eID/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so5676701f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775634589; x=1776239389; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AYeyMdAvcHlCnv7W4CW78l90s8d4QhdcFeE49GqL0f0=;
        b=sGN7eID/7VKuQF3/lDxlzdaJI5DK5VPrPjES4T5F6X8QnPzi6keX55xUHZ219WjvHz
         +OzZt0H7aNgPDSykguwOrgmipogb/t3rTY2B5yc4tA4DP/9aOQK3Ioy4oeOxM4+bW9qk
         jrvv5lrGW9J0bzFqCylcwtLbdwU0AYl8ErSSN2YkYImf+mnhMFSSoEW+vaURliXs9ARY
         XJew08Lhx0BrrKxU0BlXhTH7W6DLtJfuVP++JNofYdv3R+BU3aGwC9/dY+Bz6jdpxOgC
         Uta0iam8ta6p3TPFMtcq+YPBniGZBscGhatwReMqwZCL4W0ytaiwcrlclZe/f8poDd3y
         6gQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775634589; x=1776239389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYeyMdAvcHlCnv7W4CW78l90s8d4QhdcFeE49GqL0f0=;
        b=AbswJsNquaDlaC7X6CXO38swLSazR2YkTDcLk6MwjgWtvMntyWq6VjkT3BRsRG+7FV
         oXJNYI8Z1EWEk+STRm22zB5TpypfIC3OMqQj8Adyx/NB2K0LZSwHd6dSaPdULXsQvrYi
         iyCgLJllkmn+9C6Uvq+6LasfxnzmE8OA/3Ukspeq5xYHdsOx37RNPUK4y59FfSYTCjmT
         /yoWCFN0IiW846or6a+S58dAK697sc7xDjmZp/M0WdvJQ7hd0JgGmdZvWo5oyrJJ9YNe
         OU8UW+R38g1YraGig8dYtlcCglc7mR8snzWFE9fja5SqH+J/eUFDdZyQ7MlfgNUj7T8z
         FUTw==
X-Forwarded-Encrypted: i=1; AJvYcCVR0YPRTO0nhltW9yWF7qeyUEF05m7gEiDesA5aZN+9vp9xe6FDscLavPKLQbw5Z44bqP1fq9l4uH0GwZ9Z@lists.linux.dev
X-Gm-Message-State: AOJu0YxajLLsZ6kj3hAIx+o8GYfxdtY2xRwPdcbZcrG7yMNzsfxvEFcN
	8Eh1b/svoDh3sJSJRiSSy8bnH9nXzVq50UL5SsShXyWMt1Ayr6OLNxoU
X-Gm-Gg: AeBDietVFbm7BKN8AehCiYvXOkPSPipWR7lSW5ZhrKmpgHFEf0HWuBV4z5610ld+oSZ
	twpTxyCLzud6ufRxy/u7vaI5rsow9wpaYf0vMiKVrf3jJ/psbdhZ/2/+dabQVLiF/yftwuTJFzV
	XMabeXx02Qi0jmN2k84xveLvixyVVo6LSLoW+ohm/HV91NfH5oCwJ8cugkhP4fRcwgcjEBrD5Bc
	JLUp1t+xAkwe8h6e1qh2CTaOWV6TAzYCf7xaoK7GG26skp2/Kiuz8brHuB9wJv2I/yEny18kbOy
	IObJQttRZWurSDQjUfCL06r2yr7MjkbloFlqyrwMaNjybXMO9mDm9HUgPG88pbGUU8SRlYDHU53
	lY25Vy4082cQ7GxpUDOgwGYZp3h0Gk+KcdZx1htZKT3wLCTRuate+1sYyFS7xnb2Wf93CgECjYB
	zUzgCNULzJhx4UyJWtAMI=
X-Received: by 2002:a05:6000:250e:b0:43b:998c:9bbe with SMTP id ffacd0b85a97d-43d2927bc12mr29185072f8f.13.1775634589329;
        Wed, 08 Apr 2026 00:49:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e6224sm57026799f8f.25.2026.04.08.00.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:49:48 -0700 (PDT)
Date: Wed, 8 Apr 2026 10:49:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/3] staging: rtl8723bs: cleanup booleans and style
Message-ID: <adYImQMCJN9ImTKX@stanley.mountain>
References: <20260405160135.22291-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405160135.22291-1-khomenkov@mailbox.org>

On Sun, Apr 05, 2026 at 07:01:32PM +0300, Andrei Khomenkov wrote:
> This series of patches cleans up the rtl8723bs driver code to improve
> readability and alignment with the Linux kernel coding style. The
> changes affect if-statements and while-loops, including:
>  - Simplifying boolean comparisons by removing redundant ' == true',
>    ' != true', and ' == false'.
>  - Adding spaces around bitwise operators.
>  - Removing redundant parentheses.
>  - Wrapping logical operators to the previous line.
>  
> Changes are limited to 'if' and 'while' statements, where both logic
> and style are cleaned up at once. No functional changes are intended.
> 
> Link: https://lore.kernel.org/linux-staging/20260402150429.14761-1-khomenkov@mailbox.org
> 
> v4:
>  - Combined logic and style cleanups into single commits to
>    avoid fragmented changes, as suggested by Dan Carpenter.

I'm sorry I wasn't clear enough...  I meant if you change:

	if ((foo == false) || (bar == true)) {

Then don't leave the extra parentheses:

 Bad:	if ((!foo) || (bar)) {
Good:   if (!foo || bar) {

However, if you leave a comparison operation then *DO* leave the
parentheses.  Also moving the && around or deleting white space
is unrelated.  Don't do unrelated things.

However in the case of the parentheses it *IS* related because now
the parentheses look crazy.  You *HAVE* to make that kind of change.
The one thing per patch rule cuts both ways, we don't want two things
per patch but we also don't want half a thing per patch.

regards,
dan carpenter

