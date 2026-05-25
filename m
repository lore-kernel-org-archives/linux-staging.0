Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DA737DAA0
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725634; cv=none; b=sWVHnn70bTl7qsPHVKqWE5ACrSAL3jHj5huHdVM83kp1JH/V872If7coeM92u7K+x1peTYY6aUKIfbVeONyd8fQB/bKzDiV0uJ2cT9Hwduv3mbh18Lp/NBJ/NS600s6+MqFk7m51MaqyKbhkZByX3tbDZLRjTj0+cuIloFMlHoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725634; c=relaxed/simple;
	bh=JzjiaMqvE6FAwKJVfStKuwbHiv1l5iHnK2iRBi/Jtic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brQeIaBP3z4OA5sMxtqgrDL4JBYhW/oW4/jca6NqcAajLQ2VUxWWasxMaQOdua5s8PhLQvbrIyZd+8px2JEJlfcEWfl6hVVNDHal0a1dfaU9C1Dx2mmcHVUNNs8dAgxx4ils/UVqWa92Dte7luEMRgBKkoJp3Q7nhOL4Ga1zZrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFXz2x4R; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFXz2x4R"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso83520355e9.2
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779725631; x=1780330431; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gmb4w9ug6rV3MhwyPHJsQp6I0uLZIGzYTMG8YoeZqok=;
        b=cFXz2x4RNEqxQWXz2wq0cF45V2pjvPvvKaUy3ZdHbo44vj7IXthEL6MQ/o7+MUVcP2
         zCP/b73hUaOlfspxpWaIwXjmFRuE5brHThWXk5zWU/9xpzLj87uodxWMr6mo0pkOlvhx
         4Yuy0zxTsKhuKk6JfHq7XgD23/WANnHiL6mk0a3MFO5oP7bcTnFPIknSUKAvI/+UP0MR
         QpEgLMahHBwybxKs4vb/QO5zEY/PHQyrJ0dXfd5tpP3kJkc5UFzMmfyI2/gff0oBbGnn
         750BjVH9ctWG8NeY6VCjjzlj3Co4KLCnD6jhIVzhGq4HtkWFsdgRdPJVQvQoAGGuK+0W
         kPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779725631; x=1780330431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmb4w9ug6rV3MhwyPHJsQp6I0uLZIGzYTMG8YoeZqok=;
        b=eBpiet/THzqBRaEuh2O9/xplh/3lKRwXUYf29lvHJdyEBoSI11pQnFFljMu6BGgkVX
         Jh4FxKsprQFZEtDCMXFq+WejV+qU+/ehKlCsuxiGaWZj29OoG4KN7derPyPnBce0KaTH
         M+1LA0R7nQkqt/apaPIHW0ds9FWzkPQJHvkPSWs3k55ZItmxOKtJ4EdIC+JI8ifFDIFx
         ayvK+uzZ2fqqAoSxX0Ugazne46aJ0z6ntqP3J0Eincr+6ymgxDmy1+r2UrWNwIwhnkQj
         4NHqjSRaL3jZIuQclNh3VQpW0n0kduzj0zycnBe/JU6SQ14WnM9QnkLdvMkxDGWPodeU
         gvlg==
X-Forwarded-Encrypted: i=1; AFNElJ85zMROC1XaS2K422G/hmulbjj9Qh4eRljTxknUs27NynkpkUVtk4poQcH/V2rpzbKkoqPTblNKZmaBNcaa@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5sMCFBDZ48L66MLrhVpZcGtRy9cBDRbJ2mnFKcbVazBUIerCH
	JNgLfl76+kP57d+wgknafiIJobfAr0+FtSxTXWp1lfC5c39MBxpkPPBC
X-Gm-Gg: Acq92OGL7l9UT0hJDls9I9QhfAu5bVlv5YBXhOrATNJyAnyowQWoi25Qt2nywDcs8Ov
	Hygwo4+sheng6/64KIiL0TOFk/02lBZr/MQevvHdEQk5fOi5l3ZxnKMXcKCmz8dzGSUdC7PLbxR
	86ThDuU37pYSUNnZDcEdurkBUhAhfCYtr6INkYjAoUs62DHKuVdSshyeZQqHuCYUSMqYTOPsCs+
	Cf5pcssHIb1hFmnzUcbWGscuQNv7BnzPgBNmuOmYe7JeDp08IBULDS4C+K2OcncQKVWNn4rUkJi
	qSZRpyZEaC+2NsTv+Rj8JxiWszAvy4OLHea6sNNz8Xo326Y+5u8zedoO5Q1N5Gad5+oAINonvmP
	0e40I0ITSoXFHHVB/IVW2zgFnyrnOpOctaxhb6QZ3cUysaHrYZeos4SFGzKoyDZ7HlSYlTsLfh/
	8VpSKvr7N6vzTUdkgec84nRd4=
X-Received: by 2002:a05:600c:8b84:b0:490:5466:8576 with SMTP id 5b1f17b1804b1-490546689a7mr190155205e9.1.1779725631134;
        Mon, 25 May 2026 09:13:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904179c615sm90065985e9.4.2026.05.25.09.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 09:13:50 -0700 (PDT)
Date: Mon, 25 May 2026 19:13:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: sm750fb: deduplicate fbinfo loop in
 suspend/resume
Message-ID: <ahR1O_dF9XyVEmPo@stanley.mountain>
References: <20260523051509.166152-1-ahmet@sezginduran.net>
 <20260523051509.166152-6-ahmet@sezginduran.net>
 <ahQB8C1gTr7LF0FO@stanley.mountain>
 <86216e7d-7867-4041-892b-aafeb39781b8@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86216e7d-7867-4041-892b-aafeb39781b8@sezginduran.net>

On Mon, May 25, 2026 at 11:23:43AM +0300, Ahmet Sezgin Duran wrote:
> On 5/25/26 11:01 AM, Dan Carpenter wrote:
> > I was waiting to see if anyone had other comments bout this patchset
> > to decide if I should mention these minor nits.  But then I was
> > confused about v2 so I think there might end up being comments... :P
> 
> v2 was only about dropping another patch from series, no change for this
> patch. (would be better to talk this in v2 mails, but I guess it's no big
> deal.)

I thought you were going to to abandon the ARRAY_SIZE(cdb) in v2.

regards,
dan carpenter

