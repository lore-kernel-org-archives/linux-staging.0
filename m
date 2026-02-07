Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0BA2E8B80
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770488774; cv=none; b=WnoVEcXjVxPpTu9ypOU14wPow+P2I3btF58P7sMRlkaI3UWpfI5FFf2xRhZoQfgj5CXBkbTQ5OJCNgKY8NSymAFIm1vlELu0SKaUR0Z/An8RqjtA8HklefGxjwA8jYzdUJiU2JLPL1WJe8daPipnl6WCVIRY6pGurGvQWDwz/io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770488774; c=relaxed/simple;
	bh=of7iMV2Z/iJ6pav2CA9CXWCYZ/s76Fa09HPTT1Ok5rw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=O7+99s3WCXLuBHgpuxnDBEDnEkyhPH+AKOUv4VOocZdCjLcI6H9O5wcAfmtOXkaaKAcAqko4H7AUYO0nh1s32vZJrdzsk9u4gcMTGjaEiGp1cIcMfH/hd76FgvKDd9YOeEQBCtNfs4sltv+8HQa+Wc9xnDjbm2b3Gt+W4k38ku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay1AUUkE; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay1AUUkE"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-40438a46d7cso1358722fac.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 10:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770488773; x=1771093573; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of7iMV2Z/iJ6pav2CA9CXWCYZ/s76Fa09HPTT1Ok5rw=;
        b=Ay1AUUkEHGkaVoqE4WNEYXifi54yybrETlwYxuPFtWvGAGWsucOqYFeV8Ohiip3wqR
         0Z6XC0Z/Jxw58+PJ5YEXxHuLYKY+Tx5fnjUQisKSZT3nior70XtCWCzXJUhPmPTTUTou
         Pp2mOeJQyeeKOp3ohxG5sUZya9EIA/0xj1CV2tdl8pKrX8zQanry5yt7hHi2sNGg1YBy
         O5Il+HdHmPXEfk0nUWrkWm8zExQTKgt8W0mpAK90J8GNg/Sg1sisytyTo7aM2cw97mdt
         ORMAey0WhZ3HBous8jYvQ9VzGco5w3MkRZhkTKfdZ/d03VJTE4gOHqCnSOuY4IC9skHV
         6vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770488773; x=1771093573;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=of7iMV2Z/iJ6pav2CA9CXWCYZ/s76Fa09HPTT1Ok5rw=;
        b=SsQjUdU4Ysc4EcIfG+RavJ45G3u4qTPB74ZQmS9JIOipcJORvBVflURGUuvqyXAaT0
         Oq52/QXj8cRzD4UC6NgMME0vXLy7e1d/0H6+tZLVAwVYBNkAyiRHoAGkTcDL+JFpCDeh
         U3ZeRv9kZKhTfU/MfUwg5bs/XKnBmJgG99kLN/GDlJsE1mO17/d42/OCxMwDM5IXpI0i
         AkTMuNTBGn3xp6P/EpjGzkQEvxiS2tQPkCMt1vwwyL2w+INJWpXVVrvkhGpPDjfaOa2u
         lw2Zk5VCSH+epZ532T3FnPkiiCKTl60kgefOZ24MQg+9WO2yIWDwhABMCekM2fGiiGbs
         a46w==
X-Forwarded-Encrypted: i=1; AJvYcCW7HzmpkHzZcAc+1p69znYGIgF9NgOsn/PmhI7Ig5FSqSm/ONXVqA75uai39ypI/wmYH4ouR6I71IZ3SKbg@lists.linux.dev
X-Gm-Message-State: AOJu0YzO3Bv0bV8E7hfzx7Vuq/1edtkuHJlaCTYZRVFvnkgkwpvihlhL
	nvKKrun0UbBoBOXC5AGEuXDN8vgH16do+EDigDyS3ZXIZJbvhBqkQ5My
X-Gm-Gg: AZuq6aKzTCgpMS9Jonan04tkqvjYhKMjdncQX1/lvEQtcxb+eYjXNaL6xBR9f2GYugx
	7J+0nc3YU1nb4AK+l4fr0ar7QpJqY19pYwhKwQe8m/THXtZpxnxwZ19ALakHJzxwIlaoIscy8Fa
	TDOfdjycM2oBNH3QOXfXjqcVPL4PqqDn05/qaBMfKAjnnb3Tj+1M+fkKig+s4otMYpdFpF7XseG
	SGSzvdKsyWnSWF+xTBjdp9XJchyG4PuJNLEaHS4PKW22woeGtGjoAF7PJWSOfenJHW8kmR1gPXM
	f4M/JFql1c0qWH4FXGA3JhskpKm3yFml/EzQ51QRe2FCl3Q3bQArjumpiqwATAaQRXh0YOLAlqt
	JVw6nKOWkgg4Fy8BcvMrDg90nLvg4cs8NJ+zIJajfhYMC8xAcEynX9Dpfyttlg3rOcvBViEnmX4
	HIUPgy1A1Sfy16vuEg9SaNjoick3ZFY/AQGmuMK6/3t2EhHH4iAOqZv92p9sFyTxc7OYUF8xVvC
	RdRRDn45q3Moa6nL6p5KwZuJMUSRulB8VbCTAobgFGFenyFhhXANNzI
X-Received: by 2002:a05:6820:3088:b0:663:859:c41e with SMTP id 006d021491bc7-66d0cc377bbmr3117593eaf.71.1770488772635;
        Sat, 07 Feb 2026 10:26:12 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:106d:f0c:a2a5:1623])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-66d3b2a5aefsm2974879eaf.13.2026.02.07.10.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 10:26:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 12:26:11 -0600
Message-Id: <DG8XW0Z05J2W.2PG3PVJ56TIM3@gmail.com>
To: "Sajja Easwar Sai" <eshwarsajja20@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <ethantidmore06@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <iryuken@duck.com>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove hardcoded dead debug code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260207180934.73593-1-eshwarsajja20@gmail.com>
In-Reply-To: <20260207180934.73593-1-eshwarsajja20@gmail.com>

On Sat Feb 7, 2026 at 12:09 PM CST, Sajja Easwar Sai wrote:
> The debug code is guarded by a constant false condition and is never
> executed. Remove it to simplify the code. This also removes the now
> unused variable 'pattrib'.
>
> Signed-off-by: Sajja Easwar Sai <eshwarsajja20@gmail.com>

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
