Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39853372EED
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301293; cv=none; b=RgXfkUhCaAhGj2pLXPaEcZmm7AUK0UeIeqUfvlR/KcPqWN25Akqep4soUCOEOZHFXHuL5/TDnZOaJ5j1td2lDanYBnreeHfiKsdeMO1pIknzGBzLrYXT2WoIOuvECdgL8v8ATHftvhqXeQ+s1bdFixnrItxKa/mUMZd2GG/cl3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301293; c=relaxed/simple;
	bh=4xdstEQtN9d2VydlCsWuNlInxa0I2W3Gw3auRkkxvgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEGKkXyu7TuVdPDPTVjEoDA/xhTIbZOfTTXCGVF9bD0Yycb9DZdxs7FpLH1M5yoZJvClfdxcHw5bugWjAYwtwFkDjbzYxDNnQE9bhFljMP+RdWLd2zdhDspN4bHRYLYh1SIKTXBaVafDSa2Ug2ismn9pGtvTuhr5mC0Pe4g8Cp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaLnkmht; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaLnkmht"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d03db7f87so7106802f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777301291; x=1777906091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTcA7y4hzbQFYWxx1WwEVcRWIQQQtI3KW/oxlJQFs7Y=;
        b=TaLnkmhtoOfddLHn0xlNVFkJ2wGkDkHgZ/D+84Zp47PKyc4DsexZbGSZgkOj4wa6jc
         pGroRLm3qwUUqjT2ld7vDVAu7quUqdijug3pet8a+CtnLttzFjIv+Joli9LJdA9J5/qU
         v138GD9Rw+jNfgO7Sl0pFgZPOtGToSRDTIYwOxYqVOZ6/+N5ODEkX8tY5CnnhUky2P0d
         LZ69vh7mgMxKWPsMZbNr8znfqP1+2bFNvT8KD7+F+w+A3OgeTJUXosBJzYZyGUN6vpg0
         rTrJ3NS0gwCKwm7pys+LFUs5luVzSW8mtEfOEhQtMEd0PdllJV+IxWwKMYrLPyWHFu7y
         0pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777301291; x=1777906091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTcA7y4hzbQFYWxx1WwEVcRWIQQQtI3KW/oxlJQFs7Y=;
        b=WIo6z50hH0KUNFr41Vkh8euJifpkbim/U5YVRwSK0U43WbKm/9zUT6EnSnfzKYhVWq
         vi2PrZJ48DAJ+0xqmUlZKT7EoJDWmJLxPYmkohP0hldZNq3GqHL2j8Dv6BdUU0zzZAEG
         pPKnIC8HQBBPa7UPG1oNutiOH9Gef91BDiIUMM7eiK6EeZZYX+vlhNtNGsSO0cum2NeQ
         PcCx/qztaE42Yxs3aYe4UwGUtHv4CEKnbbUEgESHvdQ5JH/852Vh85Xo2PWLvQGofoXq
         kw+o3Zx+NO0livijhJ65VA6UuQJmeYkKW5/3nw5NUAjXIp29RlNz9h/CHWpwGRH5/hST
         eMMw==
X-Forwarded-Encrypted: i=1; AFNElJ8aQR+VvXh+wD0CrOn90ewXMI6G9gpUKGTFRhfHFYsxjGZa81PhqCD/Q4BgQ9fFPeTKOeQNuLC66mLMUVPj@lists.linux.dev
X-Gm-Message-State: AOJu0YxI5iYeNmqANl+5ydgCQIF6wTq7AP90xvJ9iMdvzq7q65/CWGeJ
	cTfw5wqpFN7jQm45jwSHYLzguU4RT/6ilUtunkzwF9Xh6aaJsmz3sFWgN/h8LQ==
X-Gm-Gg: AeBDietq9kSp/VoEwj/H5jMZj0Od/5s/3ob1cW26HPPh2jOrZGwmlxNcKZCDfPOZkP4
	MTLjv8jX3Rp7hABIu9R8Z7zgVw0aTFAnNRvXu+oR3zVCFoqYpPPMH/agHG2rVXJ6c5/tG/8lU+B
	d/5PxXWjPfDSv4H0LucYoy0qVlF7INoYI1wuLz7hskkl5EpXxez0o95N8Zixd48qADwwkvLG5Cd
	iq4ijxeSeE5QHZWm323yfwhwKD5Hzhs78xN73AfrRJWeaqbam2yphg9ahUV/ZbaipFbbLYRC3lh
	NLnnkKdeKZMafKh33unu44BfH3F/OeFQQKEdsapY7cTHS6kkP7VKnbcuQuSobhlAIqomCPTDidu
	7XgFl8PcibEc8QCv8wo5l8SoRcdnpHu9KdyPv+/9m21z1lUcLYZ5+V9RxEc0P1PedjvC+MNtdfX
	mj3ivuDa4b3qwaLQGY2dD0/+tg0vKxiw==
X-Received: by 2002:a05:6000:1447:b0:43d:a37f:8d5e with SMTP id ffacd0b85a97d-43fe3dc595bmr60078822f8f.18.1777301290496;
        Mon, 27 Apr 2026 07:48:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e44f69sm85182307f8f.25.2026.04.27.07.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:48:09 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:48:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandru Hossu <hossu.alexandru@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
Message-ID: <ae93Jke4n9nH2kCg@stanley.mountain>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
 <20260427081748.3407939-2-hossu.alexandru@gmail.com>
 <ae8pq5YzEe2wTJmx@stanley.mountain>
 <69ef2c47.5d0a0220.2e33d8.bde8@mx.google.com>
 <ae8w9tkpM8G2NWWM@stanley.mountain>
 <2026042737-riding-bunkhouse-f8e0@gregkh>
 <ae9db6KjYMsFOG3F@stanley.mountain>
 <2026042713-buffing-recite-c3d7@gregkh>
 <ae92d2MQXf4MZcPg@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae92d2MQXf4MZcPg@stanley.mountain>

On Mon, Apr 27, 2026 at 05:45:11PM +0300, Dan Carpenter wrote:
> On Mon, Apr 27, 2026 at 07:11:28AM -0600, Greg KH wrote:
> > On Mon, Apr 27, 2026 at 03:58:23PM +0300, Dan Carpenter wrote:
> > > On Mon, Apr 27, 2026 at 05:11:19AM -0600, Greg KH wrote:
> > > > On Mon, Apr 27, 2026 at 12:48:38PM +0300, Dan Carpenter wrote:
> > > > > On Mon, Apr 27, 2026 at 02:28:39AM -0700, Alexandru Hossu wrote:
> > > > > > On Mon, Apr 27, 2026 at 11:17 AM, Dan Carpenter wrote:
> > > > > > > We need a little change log here.  I was hoping you would provide
> > > > > > > a link to the AI review in the changelog.
> > > > > > 
> > > > > > Hi Dan,
> > > > > > 
> > > > > > Sorry about the missing changelog, will add it in v3.
> > > > > > 
> > > > > > For the AI review link, I don't have a direct link to the bot output.
> > > > > > What I know is from Greg's reply in the v1 thread on lore.kernel.org,
> > > > > 
> > > > > What about a link to the email on lore?
> > > > 
> > > > Sorry, I was on a plane with no connectivity to look it up, here's the
> > > > AI review for my patch:
> > > > 	https://sashiko.dev/#/patchset/2026041408-grill-mahogany-d1e3%40gregkh
> > > > 
> > > 
> > > Ah.  Very good.  That's fair enough then.  The AI is very convincing.
> > 
> > Yes, but is it correct?  That's the problem with these tools :)
> 
> If we go with this approach then probably we should probably
> change HT_info_handler() to match as well?

No, sorry, I think HT_info_handler() is fine.  I don't love that it
doesn't return error codes, but since we set pmlmeinfo->HT_info_enable
on success that kind of works as error handling.

regards,
dan carpenter

