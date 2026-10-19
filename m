Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27F6489FBE
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394133; cv=none; b=WU7lKYkDOODUQBSDrTu4bAtxSNXqIcGCFDHmqAR6QqikGB2/mACO5pePVIbje2+H3LMR7/8mxb4C9fDXM2xlixDdmMe3Minr1SLbUdRC8Or7FhfnkV1iL+28DdAyuK9WATJxntn0xTW8DzzChJkcVLFvr7NjNb0Q6lO+jP/l+0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394133; c=relaxed/simple;
	bh=euPFOSxanSFPi2Zpw8qrz5T/8Lck+/AaQ85OLuB2GjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+Vvhe2n+m9M4wG+45DMZ08E5yKe7PXUQz8QAA4fWl+ynVFg/p9CAJsLB++68V04QXFnT+pVruylhYLcx/hDLXIslUXXc6kC5fIORkMS1lKk2r4MjiCT1ZOyavXyyRtbpZ1+vNKxiU+MLGzD2GcGIzevoUzWjpbjGi5jX+4iAbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAOV4fMd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAOV4fMd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so23678665e9.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 00:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394130; x=1792998930; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lh/rfye6OYmPn+uBQKUoMnQVrTTMgM/f0x7DqQdwTJE=;
        b=QAOV4fMdD52nFi46sTyhgb/lLmJWy87DtdzighmzWU1kedNtxefLBjRbwAK6DYVD4M
         DiFiiv9MGE5VxKMskHWYP5z4KCHBvDX8w8RqTgnlHihGelqFfaaf7KywdhqX35eMplbH
         azRbSi25TXEdC+X8eAYrAZ9XdHrYOunBuHCOTEsqoUKCo+1Pv1UgJN8h/BBEeddWovli
         R4obBhc4MJv5x4ksA2rm5qjD4+hzWGvxfGYDYgvNPIaVJTNJeVH6iiugECRl+oiHSPfM
         BYF6UF4CJk/n2qnYh/6coxgXtB9Y5zuAiZ20v/ctu+M2wWwwSSRPfDC9AJPagU1ghH4w
         S8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394130; x=1792998930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lh/rfye6OYmPn+uBQKUoMnQVrTTMgM/f0x7DqQdwTJE=;
        b=CcvaDQYrseqtageweeTsg+XktJ1951uIgh/2lvdx//ix2lYezZADvr4N6NGm7EGHPx
         eQ7Iy38lzIWHqTtRYFTvpjA9G54tH5+JXIofBclbEFQn1mkuWURw8P2z3Ain+JiZszBH
         0rNG39g9obrV7PcHaGFVemd8+pQVWnyoy5DfwkYPNbPEu5yeh5AQfmQzKAhzty+4mp9C
         kDlZPQYbNbkZIy38T0P90TYZ97CBW6mUVfGL5m2wyDqkL79vjkzHD4yzUE68fLpYhM4w
         6NGZOsESQJUDXimKOBU04w5zeQkSv5c84LPYHJq3KiT4GD5kxE8zCSR9aqQ8m4guOV35
         H7vw==
X-Forwarded-Encrypted: i=1; AKwUvBy4zAl5nt1Hx5DjuUA+UWMAzVgutRpejtYQm2KD4B16+8vxIkmYnYud1R5xXNQZ/5TRi14ZjCoI0ErpBLCF@lists.linux.dev
X-Gm-Message-State: AFq9FYKjempFGJS2vqLFMDdxWRileQnY5WNQz+KmTf+mqo+4EIQxemJ7
	m+hz+3z+lmhMFzDqKCy/HU8qyJFv7+f0uoHDlNe4tpY8rX2UJHpg2eiV
X-Gm-Gg: AYBFou1i+G7KF9nHSN40CX0IjFmH6LwA8gCO1Xj4CuDt2gXLde19dZBvJyREZAs9Gjs
	J1ihAIfDJJbc9DEGMu8gV+ovML4Z0spvdlSTPfhetiMp5a9aIqw6j4Wb1MzhPxYmV0Y28BRZ9Hs
	uJndBsCDoB9sx9V7EA8ovhSlleCqX4cxLYy9LrdQaKda3OVFgcdXEpDVno1Yhopbc6k2+RVuZFv
	t7I2kWJOiTM114V44OGe7rcXZOvjjmfC74PAs4E47wpVNTLcDM0rzAtXjsNfMuuN9QokjxjrqRK
	vdz8ncuhI+GdXaVhtTnmjiy0vJQAF9RsCN/0OSCVtg1FllbuEPnZq024weXTbquvcLYT1mx6qvL
	+viwY/YEXEjTQwiyoW4PpEM4dnlHfwBGfkFQZB3XRrK/8alSJPoSp6lwqY+Iyn9K20yhNfDTVAg
	cCIBYpTtNeQy/lL7wN4CVzsV8nGW03LRa+CQQbMOcE1s9vuNvSoHht/BMhBlymqgP7aA4=
X-Received: by 2002:a05:600c:348f:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1e7743940mr39926855e9.30.1792394129754;
        Mon, 19 Oct 2026 00:15:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cc642573sm208220875e9.2.2026.10.19.00.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:15:29 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:15:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Comfort Oyewole <coyewole7@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: remove trailing semicolons from macro
 definitions
Message-ID: <atXDjUmhI38WQhaJ@stanley.mountain>
References: <atTnRr-JGIb9eLQR@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atTnRr-JGIb9eLQR@ubuntu>

On Sun, Oct 18, 2026 at 04:35:34PM +0100, Comfort Oyewole wrote:
> Remove trailing semicolons from macro definitions to allow the
> macros to be used where callers provide their own trailing semicolon
> 

This doesn't match what the patch does.  I'm surprised that this code
compiles with all the semi-colons removed, honestly.  :P

regards,
dan carpenter


