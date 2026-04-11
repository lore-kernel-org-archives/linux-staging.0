Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BAA23C8C7
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894858; cv=none; b=j9frsAdJ4vr2ae92Ivw57nachaDkZ9sAl4gOOqWDgWDiGmuWr4zWGgkQiunSK4c+zIWqozEBU3xGUKS+FiYRXu9VVoh8e4+yWmjnWdkp1+XhHwTkGvv3sF9wIEG+DN1daLIRVA0NXNUizfeNIyO1d2cd3bBzgdSIZMbh2rQz8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894858; c=relaxed/simple;
	bh=jTXH3qJNHehIy+z8HxDAKrnbSnBKJDeZ+LdTRhVvCyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIjQL52WA7n8cLprJ04rhCYIPjHmUpmlidKJRgcgk3mHuW0rTI6Xp0GmbCBo/Jbrw2pqOgPwDy4o7xR3AyI3L7uArQmLAqK+SlGnuWIJK0xwFY8wrjkqHerngnfnl0o6Hs//V0Ar9LfrF7Spie0AUADilFyV9EFZj2ehMQUzgvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9piW8je; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9piW8je"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfd832155so1764333f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775894856; x=1776499656; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j54PpEAKN+VAsZTNtYfE2e2QQFNE5h8+vlAzogm3DEU=;
        b=P9piW8jeGGRQxjGSdpxyN6w6ER/BvBAXVxGFshDUd/XLfM6aDlYhM1GRLsHhocjHsv
         kh6cAEaNeK9vfTaOjyyjnTBJp8BGE31wc8DF13jZGO+mhyq5iEQ8yD3nEcOfp0/vhMww
         nqYi7sQdOGbfDrUvZiuVKQ1zCvWkW6MsfDq7DI0ALMiaCcSFudzspN6cw1ys6QzCA8+Y
         JQMf3Bym2Gjy9JC32TZ/tupXo3Qt3Vy01Jy8q9K1Ri0rViJZhmmXePBuwfH8RIYL0cbD
         8pX8+/RFgL/ZjyBUQGYagZgTYyg/bE+cGWxXJHJ2UStl7NKgT3w76kvmBAVNT1jBBcbS
         M8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775894856; x=1776499656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j54PpEAKN+VAsZTNtYfE2e2QQFNE5h8+vlAzogm3DEU=;
        b=WhtF+v8xRxPxZWrpl0F6Pbo8t7LGAMjznuky/R1G2AZCQzeZGGfT8wsQx/ANQb8xF6
         3SzJAz5B0JcA5V/49RVgiRwF+fM66PZ4zA0+azQ/hJVulRL67jXUXCqst45Yt+KJbQUj
         AkezeDCpz24DzH4KsmdrXC2IPda18A9PNL06VLKlnD5xLIYetms9iWO6FsJK3/lZJPYy
         X9bQHnznYwKfFQ2dbyg6yUctL5GeK4cBEuAbwKlWswhI8Iz7oqpmgI4b0yq0F2CPp6XM
         oGWeVi2AmiH91Rw0gYgbepQt1dV7CvFNMXoOd6E/tgoQAojUlI+taqzQHxuA83De26d2
         M8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXIWDRSlNa046cWO6HuVfYGxcpOt1wiG6Nw+EXN779VHFfpc6aPx0bP+O8hAss6Z9aM05HUBce4f2w4tRVD@lists.linux.dev
X-Gm-Message-State: AOJu0Yw16hrUxJB07BkDZv8/DS0qFaS0GlGr3Ywbno7gVLGvDd20dmKZ
	aBcRcBp1Tsszpa7p5Q9IGiNvU24UAZXbWGTppdSKP109Zr95yalhO5bF
X-Gm-Gg: AeBDiesx4yENgKFJ8HXLCAwabjg86TgoX1/4yyz73P5LXGviftmfiuoLTLroKKk/BvF
	k9twgAkj+wm3e+Gogf7db3jFgRIFc7uNBZL/OKBOp50jFwW3ddtik/t+G5QfAqxiyYs/B1QrMhN
	p2lINpG94n7JmlZrp/0kNfhaflVlBUL9yUXtJusWFgCU36ePQi5mzWmx1BTRVlG1G7QVFNpODwb
	BIG8Y92ToUQfsGCHhrqJPLghuXDKCPyF7Ztlg2BKwTvEGCvyNYwcjXe98RzOdvuIvZxixQ6ygty
	LKm0G2PB2ZRYeKSeSDhSKRhuUyldCmQZKo53xfMxcqJ2+TycwhwaXZRL48I3QBeP5WU4PU1qhI5
	SM/I5jWkVRFyXT2b31EysnBXS4VHB2zmPxDeFowrG4Qg789AFI3IiE6P+GS0ghnMMTQ//RnN8FH
	XfnqGE73dniPtSHrHtCdc=
X-Received: by 2002:a5d:5f53:0:b0:43d:5833:fdc5 with SMTP id ffacd0b85a97d-43d642b6b90mr9902538f8f.25.1775894855766;
        Sat, 11 Apr 2026 01:07:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e468c5sm14810726f8f.20.2026.04.11.01.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:07:34 -0700 (PDT)
Date: Sat, 11 Apr 2026 11:07:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adith-Joshua <adithalex29@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: replace magic numbers with named
 constants
Message-ID: <adoBQ8skQ7aRXKNr@stanley.mountain>
References: <20260411052817.354594-1-adithalex29@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411052817.354594-1-adithalex29@gmail.com>

On Sat, Apr 11, 2026 at 10:58:17AM +0530, Adith-Joshua wrote:
> Replace hardcoded magic numbers in rtl8723b_InitBeaconParameters()
> with descriptive macros to improve readability and maintainability.
> 
> No functional changes.
> 
> Signed-off-by: Adith-Joshua <adithalex29@gmail.com>
> ---

Where did you find these numbers?  Presumably there is a spec
somewhere?  What does BCNTCFG_CW mean?  This really looks like an AI
patch...

regards,
dan carpenter

