Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B521E1DEC
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 00:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768350668; cv=none; b=BlsK3NhoNpO+HXmU80esT5OOr/AWMHHq+3u9OYzUfuR4XKFKEnzSmHfjNZzgWcNZ+v5jh1jJiNkSVJ9fD6TXzZFROMkerWjAqlEK01jMRSbDh9AeC8oOYF8qt3dpbFc79JgGmYeOVqRcsI/gLytFOzNyPWfUM/A71rbCgjgleGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768350668; c=relaxed/simple;
	bh=vmenlIdj0DGwfBWZsxKE1xaaNKq1pjtbPcDW8h80gAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZCjg/ys2CCvP97EoHnVYQ9pu6yZ45QDxJLnUU+2qcVzgbAUOprJhYpGBRUrIDjxB1gj6Ct9KBJJTU9OKJF5kz8un/bufSn36Ge9if5Me6Zwh/BnKzoGKYPX+ErUOKEtGk6xRhuqR8zc2+bDvsLq8gIyCg/DKg84rL0XV5GNsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo6Of118; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo6Of118"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso64223715e9.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 16:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768350665; x=1768955465; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qByM3glODBDyoV5gInqmAMAXUYme51REUv9iL/v9QrE=;
        b=Lo6Of118xZzgABriVgA2/WcN7EZzfgV8kxOFU37pTVR4tZ3HwxvkzgSuMX6gjgqYj0
         sm/BDD9SkfGgd5FXArQOoI6L0rcxddgqQJQ024kcqzjywnXIy/1pA8H/i++QilLH77jk
         n3i/2WETnA8iRdJ/vq1ys3ghIvsJqofbGJWNr4DmMK9BvQnsBlwoY8ZwfoQsehA1zkq8
         fzXm6HSAD0tJQiiIl0fUjCrTOFyzYxb4srfsTxOYxYlbtgrblFQ4UugWy61+IruUq9x7
         G/C4vWE4YuwwUkWZOaLiZb+f4ziXtn9OeeXlIHMCOyeI8qU1xHjs2RW158G9lvVIznW/
         AJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768350665; x=1768955465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qByM3glODBDyoV5gInqmAMAXUYme51REUv9iL/v9QrE=;
        b=jxnIVOJv/0+VwcFOhO7JclBxBSX27EXn6Z8rRBNBPI1PRd+z7GCJ0azwmWFqOy1/pP
         xTTqGtCdhjYkrP/gi2LGqGL/+msWHu6EVueVwcvcGmqmRNuzmPmiEV2DODRZ4x/QkMi1
         N36rlYZOU+NzbWxaeK/S14JPSPcAlTcCvUG6hA66pS329AukjnulOccqc4MRnhK7JrPk
         fgAN+WgHM+KL3BaY20yQw78qJM/w4bLp5bGRRs3jpSdSMZVyiDvp9YG2WjjKGNItNUG0
         fmakceGcq7dP6W54ZHQ92Iel/lpNtlc+C3z190uZRvRyPjtIRrB0bZb7zIKKt38VG14V
         dk8g==
X-Forwarded-Encrypted: i=1; AJvYcCUSEPMt+5iJT039+K5r62D88rbccW2iOxmAKsa1ew/L4JKztE5FdWR7dTEg2Y6NzYdEHATwmVaa9YKA6mah@lists.linux.dev
X-Gm-Message-State: AOJu0YzfYBO8ZOAaYvGyyuAsSto3nHbNcU95xBPgO/LuULFJ6VRUG7Dt
	Q7BQEPX9A//y7kKjytbGhokjJ+7Wu7WWjtlv7IUc9qIsSMVmlcxq4Mgc
X-Gm-Gg: AY/fxX5O8f7gkN9QwHvPHjYGgrqoYLEUdP7oPR+ceFWW+3aAm4Jy9wWBymWOwFHjTPH
	KflT0i/IkWHdiUG0dvqDwCPtRxzZZ7YDDRR+iMQ83omhb49rD3fMK81ajaB62b0ulHC0MGbzkRa
	Rx6YTRSFOYlGYvpm8cpPxXkuB0q+uM6GmI6qChd9JHzLnfCiXht8TFSE2Ee+mESI2za7KMNmD3S
	0RkLftM1B33Ds15BY0njhkQHKfue9HDeO3bMYedFmpRLCXd5NrLH5c1cxGueWcFzNEKLfcTz5BW
	9BIk2zVmpC4lKxKACqKp7Z6zkTngDRKWSDr/NRZNRCRmnoaxvb08wzpAdXDJU93BUn9TR/EUqnk
	uMcWY+8HjtVyKguDEKjIhxuQdU7fPhcrjetCJn1YQ0KBHJr57ZwZxEPgkLHW7//bvY89HVLPzBG
	XVJhV48yY+m0W/M4yGznQtSXD41TsRpg==
X-Received: by 2002:a05:600c:3e86:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-47ee481c269mr3337275e9.21.1768350664696;
        Tue, 13 Jan 2026 16:31:04 -0800 (PST)
Received: from ubuntu ([154.161.34.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0b4559asm11680165e9.0.2026.01.13.16.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 16:31:04 -0800 (PST)
Date: Tue, 13 Jan 2026 16:30:55 -0800
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abdun Nihaal <abdun.nihaal@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jianglei Nie <niejianglei2021@163.com>,
	Matthew Wilcox <willy@infradead.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fbtft: Change udelay() to fsleep()
Message-ID: <aWbjv/w2In6pBPa5@ubuntu>
References: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
 <CAHp75Ved+zhACJ9CYLYnkzW6Z52fmZT0VY+0NWKYk6O38HCkdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75Ved+zhACJ9CYLYnkzW6Z52fmZT0VY+0NWKYk6O38HCkdg@mail.gmail.com>

On Wed, Jan 14, 2026 at 12:33:42AM +0200, Andy Shevchenko wrote:
>No need to send v4 because of this, just reply with the changelogs for
>v1->v2 and v2->v3.
>
Changelog:

v1->v2:
- Added explanation to why usleep_range() is safe in this context to
   commit message.

v2->v3:
- Switched from usleep_range() to fsleep().
- Corrected a minor grammar error in commit message.

No functional changes to the code itself.

>Also note, it's assumed that even for such a simple patch the time
>between versions is at least 24h.
Thank you for the reminder regarding the expected interval between
revions. I will ensure this observed going forward.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
