Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7810448BB9
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 15:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252555; cv=none; b=Prv7D+hBTKjUrFSZBG47W0fdagBPTQ4nsKJkR/ph7lrpj3NNNueB+U8OAUmg8mhQKV+n6IxnP7x0KivX1dNbWIil0ltXhoXXh+3HP/TbrTe5j1PJD9hXJ3xR6wCoSnsD9lFtqdJhmGLLywz9Qd+Z1FKcOAc386l8psOAAe3fee0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252555; c=relaxed/simple;
	bh=/+INa7ZlMC4ieTPEvDlWC7+3VrTM7mDlWZK4SeQR3sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R80XvwwE0/MkrpT3MhwzKxCslYt/vjmMDXQsHvpcHQkmOJX0LcZ/4hQ2NdI8pkTKGT9dLV5raCBeVo3vNaA7Cg2IPy8IiOL7Me5AQsTT05jVbjPoGsZXCoTUUe5C2m5r/ZlSNBCrDa4q+rZjP5cA4Ci2enSbYhfmxvhqdAYvOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV2zg7rQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV2zg7rQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so47847395ad.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785252553; x=1785857353; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzbL4t6BnXoSVwqqWngh+8MvV6fDYlOWZnFi/BUq+NQ=;
        b=MV2zg7rQlEe/IqCzipm5JrVwERITYk0XS8H1ARpArw484AniTpU5cd1XZv2kFQKmLo
         97It9+2OVMVG2ZROa1VxPLm5GJCHn8d54lXwpIlc/BjgEyy4hFiUUrFHRw0gGLVemXU/
         k4TnfOCA+8OCAg+i0WgzS++Wv2hB5Q8YKv7PWtNhpDDhLN40WE71+/bviRrj4E5EMHoq
         w7eJb2rjlHLT0JuaJLsL7Ba+DdAw3AsqMjKbV3A2vBSqRb6mwJ/v8r+XgfK7dyREeKqg
         GqMoWyz6T3tDsAAiki6Jrz9er3cGnY/PNbvbkwKcUWo6m13fi4aTzWAMyb/8U9iRLJEM
         uFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785252553; x=1785857353;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzbL4t6BnXoSVwqqWngh+8MvV6fDYlOWZnFi/BUq+NQ=;
        b=Pi9WBKZnU/grffrqSVL/9Dqjoilyw7sH9pRPNa6usAQwvG7zqCk7j5tUkhMdHE2lBq
         Dl8FZFvNzweXLVXZxq32qJeIQxGnszqPX2TXgCik89tCIMZdRi57akjGtbSi44HgiwIl
         /s6VMIqXTrga9hgbVr0N7IWaxuCgKhuto4Z3As2svCAI6Nt6KdOv9E+1QgWvYOHGSl2j
         Vj9AiWF7kWX1ojJFpgbPgkmhhmwPlzI9OB6umI9LqTZMsH5KNgn4ybu9kbUpTO58olho
         /PhCaxRykzWM+FnzVIBdC7xrDnifpxrIBgFYhuNDAffKCVHdxG1qrzj94MW07fTfr6AO
         hqvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSFSFu/DssC545Li741bSQoFHWuZCjToI5fWe1eVfTmNR6kKaJlEo4W5J9Wbve9iRvicFJftUhq+j5OrYL@lists.linux.dev
X-Gm-Message-State: AOJu0YwS1HTb4PMKT1r328L0qiLh2Dco6huZZsszgBqzTQbrebQTgTma
	iMclld/boLDxgsyRGcisiBNjBXXtV47c0ABk0m/x6ji0F3NDMpQfYdiY/go7blP3tVk=
X-Gm-Gg: AR+sD10RTy/QNF2fbSHotcRbYoKGDHTZzpskFstodS93KZiyRuIOtqG23nGNUTB+q65
	eSnODfPV42G6FWeDjhaNJ2M8lt3LHZyNHhWj0SVk92rrBJeIgy02iRcMf9eDaUUkci0nqAWAUKu
	tg+lpo3ULu1Z+VmigdWseaKt26Zxl7704Yk6JFM6R9bHDg7skgFX6gvxiQPaSedRxurQf0dddXI
	aiu0Bi2eDtvDM0NCWyrgZbuj+1JXcWnyVjHHH+b6utdx4ASzoAnSEII/AYFqBf9XbVtjNqcsNfV
	aVJfETLCyeZD1IsnfuKtdcXFimVg0UrRqBlK/HckEqmbuuZ3GJqH9rO0ZS5ctCHEwIJ9mEW2p5Z
	oIwl0MVGKtWjrwloul907wi74gYQyIYeqoEkD0mzB+g4piaDbGIwXl02yv2qeIKLpKql0hV+7IP
	R/GzQLSNI5JRs4eJGPmZ7qmlWiSEdc+r3+5VtzO1Pbefca2IERmQM7BM0=
X-Received: by 2002:a17:902:f547:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d0175cdaa3mr28817615ad.10.1785252553080;
        Tue, 28 Jul 2026 08:29:13 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b8d6sm54099535ad.3.2026.07.28.08.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:29:12 -0700 (PDT)
Date: Tue, 28 Jul 2026 18:29:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Artem Lytkin <iprintercanon@gmail.com>, linux-staging@lists.linux.dev,
	marvin24@gmx.de, linux-tegra@vger.kernel.org
Subject: Re: [PATCH RESEND] staging: nvec: use strcmp() instead of strncmp()
 with magic length
Message-ID: <amjKwgaQc0sM4UW8@stanley.mountain>
References: <20260723161823.23921-1-iprintercanon@gmail.com>
 <2026072836-swerve-splotchy-bf8d@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026072836-swerve-splotchy-bf8d@gregkh>

On Tue, Jul 28, 2026 at 09:09:23AM +0200, Greg KH wrote:
> On Thu, Jul 23, 2026 at 07:18:23PM +0300, Artem Lytkin wrote:
> > Replace strncmp() with a hardcoded length of 30 with strcmp().
> 
> I thought we were trying to get rid of strcmp() usage?  Why add it
> back?

I don't think we're trying to get rid of strcmp().

strncmp() is for prefixes and and strcmp() is for whole words.
They're not the same.  strncmp() with a fixed string always
seemed like nonsense to me and it causes a static checker in
unpublished Smatch checks because we've seen that bug where
people wanted to check the prefix but used the wrong number of
characters.

regards,
dan carpenter
