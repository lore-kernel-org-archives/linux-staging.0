Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8A925B0A5
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 19:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780170738; cv=none; b=Re5cTOeu6J08cZuC79gdQu/TOZJzuCI2DWYjwEVl87S6jr9g/SdQcT8sSL/X1rr0Nqfkf70UfXSUb11oB/SAOmT+NxWrbmfjL1xGeDiuT5d4rMgWTIXgrIbs03rCIQxhG9qjLp/7c48d6TGV/KblziOMhPNx4ttxTXgrNrPthr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780170738; c=relaxed/simple;
	bh=RylDaD5hhxsd6PNZhB2ePBepn0s10Zl2UMRJoHTMqq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak18vGl0wVBlWOLQ9RmmdpUoTBeybX9mOEJr+bfdki9Y9n/SMGSOTdUVM1tSyUpnJLIVEWDXuJRBmCeeQmAFzVLY4l2vVf1Dcrx5/KWso5zRhxaJD+oVxeL5fyC12v5f1AepzaxGylqBtvH+XGn2nbZ8t2gb6ew/4m1beBBDo54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0JuT4oW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0JuT4oW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so1010045f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 12:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780170735; x=1780775535; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mG1r5W6r/pdjE2plwFQi75uU1JyttffvzikhmbVB9NI=;
        b=e0JuT4oWduNeSwsWuYQhdDqem8ruCjoq87RhSnqp1HE3eFidvwycauCHYcWCbXOgjj
         doAIAKoL0ys1D2Ox5ZzBODj+7EAQxf6xVKRenRITCb0O6bFnRMYv38daf9kMlf1aQ7gV
         Hp8QeS5KtGoa7p2eyBjmZezzMH9Q3KwDWd16JmbKJX8qHoGmkHtRocsEGGaojHerkefr
         tqCTU7XpR9o7A7RdQN2FmSVshndSyZPJncwVPiHktfUEJx4tw6asEgkg7958jQO+o1iU
         M/yQks6IKxlpJOgbDG+eghLE0RJ5ZfedZ85xvuAvDGXdKxTs5cq2RlRT+PEfYpmqcYFa
         VmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780170735; x=1780775535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mG1r5W6r/pdjE2plwFQi75uU1JyttffvzikhmbVB9NI=;
        b=IYhE3MEM/DJ7ac0y/IEgn0KW3jUIKHS+Dh+PXDG2aLO8dFC5ey9AFaOcxujhI0RBkF
         wW2nbrnXfei4pFN8UwCNutpEAkKU8PR8qKeBqoDP/XiFUYBHljdnLbaBMr7Rp7mvxQ9h
         TRWHkkVv2VwsXhIvv+YiSWkJfrfhaQepyjIIGcoaSpo71rBuWGdceSVE1AJ45/4AoFl2
         tNunkmG+O+7IFAOVS8sk9kMYPHYJdja03+wWYUP7WpCcUZuBxh7DAi8G96NI0WD51f/Z
         kRLAU6jUM5hcHnYG/kEXMYbk4wJsdT80yn4zALCQ75282wn1h0/VlxoacsXT2s9lCwka
         pQFw==
X-Forwarded-Encrypted: i=1; AFNElJ8960FrNl6A6+ohCOoUc02Bhd918hZ2A65BxRuhH93zUybm18Ju1BO3O7bPLRWBs1suuN4QP7jafADPIpGV@lists.linux.dev
X-Gm-Message-State: AOJu0YwlCdaaKjl3sWJno9EeLi/ZgeLScl0Ua7IS07SEI2w2JPkS+hqa
	L8OrBzIeDm55zFZ3yqOOLJVeNzorBCRqQhB2c+FX02jI+Ao8PNWXE9bm
X-Gm-Gg: Acq92OE8wWyZSHytiWNHQd5ZsNiWtbmECU0enK0XQcx+TPmDFxTaQfrWolXcgyoZeth
	v/GM4z6bHJTcS5Byz1FEGD5NwiBBidIDDhBVoVNJy3KtZRQyMmzO/Dxl8ccBhM8YJRgNP1TBqZ7
	2+QbBZ2NRXCXTOS1CPnANAWzrYoN8DRwXVnt6B6giW8LfqveuTO2JLA+9B5o1bTnx/1SncL4NLA
	jaWBSs4aAhUKgpikHlPTqgFnx93kUM4+eN2aykHdcjE1tS4cfn1DSWE2LIhxp1+b0YKAS8y+ym5
	HuW8zQe79q3ngQmGwKJrsM4ruGs22AA0uVG4p6+j9KhM7XEnBa2g8ZEcsmT6VpG7FJoTOHfAmXW
	E6Axobq9/w/4GAOWoHycnDVqGFMvF6/10nxeU7opXGo0hFe0KQMYZ0KkX2vaNh1m4Qro1LDs5pO
	DhkKPuabXNdu5tL3LAW9wqHS3+s1yqiky6HXkFPeZob0Os
X-Received: by 2002:a05:600d:8654:20b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-490a292111bmr65783815e9.14.1780170735382;
        Sat, 30 May 2026 12:52:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c103baesm40806935e9.17.2026.05.30.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 12:52:14 -0700 (PDT)
Date: Sat, 30 May 2026 22:52:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: neha arora <neharora23587@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: remove unused variable
Message-ID: <ahs_63SvPOK-pwTp@stanley.mountain>
References: <ahlXYIqzu4O5-u9J@stanley.mountain>
 <20260529101242.10189-1-neharora23587@gmail.com>
 <ahlszyY6Nd9ANz-X@stanley.mountain>
 <ahlt_3J9HQVz7Zby@stanley.mountain>
 <CAOWJOpt1ywtQFiazSBO5F7npLj6M4_tk7R4E8o0DVkHE5sWSvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOWJOpt1ywtQFiazSBO5F7npLj6M4_tk7R4E8o0DVkHE5sWSvQ@mail.gmail.com>

On Fri, May 29, 2026 at 04:24:49PM +0530, neha arora wrote:
> Hi Dan,
> 
> After looking into the structural dependencies and the cross-casting
> between init_status and initchip_param, I've decided that this refactoring
> is outside the scope of what I want to work on at this time.
> Please feel free to drop my previous patch. I'm going to shift my focus to
> other areas.
> 

No stress.  I feel like we see this often where people sign up for
one project and then it turns out way more different from what they
imagined and it actually isn't fun for them at all...  It's fine to
move on.

Let's add this as a KTODO though, in case someone else wants to work on
it.

KTODO: remove the init_status or initchip_param struct.  (They are
       duplicates).

See this email for more details:
https://lore.kernel.org/all/ahlszyY6Nd9ANz-X@stanley.mountain/

regards,
dan carpenter

