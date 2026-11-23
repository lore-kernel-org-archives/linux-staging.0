Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447695;
	b=tYLEl44OBFrlowwoAZmPHKuI3/kYZtgfX3Q8Y+wN+r/oqGlgekrgXPkUI5qJ0N66yrks
	 cfZva0pMwIJNxPETT3dXU9FguXRWVYkVsWUdg5S2M78+D8IYTTdBHaprHBXhIov9BDaj+
	 UFgZGDVrzcwdOeZpLqPpLUEac3N3Iw3ay2yKqEr33n5UxO+Pl55oF9kUnn70Wxekn/tjq
	 8JLVlIA3rVRjGgt8EeDd7dBLkGHRBwMsHKSEq2UHam7rpjRzKabgmBvMJcaw0H9464srR
	 vnDT34031E1YarMui7qeRA2kd6ivL+c2Nibqots2u2Fd8Pv2yS7fe7VTCxKbfR3AfbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xrtUeZeZyEMbBtLfg+8UTE0x30lPjCVdQd0dukXGLvA=;
	b=4MVN3rQJJ6JIBqCGXc8aRQL1wFDbtXsiXxxCPha3X2ND6lOUvIpc3m0SQlZLQQciEK9V
	 GNXT2rRmSleFjAmOo3+vztcpCvpdDl18SZXZdy3j4HW6WPwkS0p3mH7u+hRFI1Tc+mFt4
	 PPXP1HSYDCH7OjrR9mSLp+0O8p2aJ5dSWIAg3FyZDyht+wdJ9Ovfrrnv9Ko17Cvc1BB1c
	 YeZWstZ1o+TRP6wqtmoqTaalHcUBBa0dCCXXsEjuh2EI7YBJdVU1QiYOMCGDmVhpTFSb1
	 MSrSK4Lo0iqwF0LZK6OwDo8Lne32TgzEJR27pQsy4+Tu2mHhVdpW+ikyNiffFJNKb0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESADGcJf;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8326606A331
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 15:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8326606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESADGcJf
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so27189745e9.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 07:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447693; x=1796052493; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrtUeZeZyEMbBtLfg+8UTE0x30lPjCVdQd0dukXGLvA=;
        b=ESADGcJf8zvw/8vT8FIY5Ya2dhmlCf+tomz5Aox+4JFkzCcs+iLfiS8CFXCYwcnApJ
         a77z/VoDr7y3gh9n9n/U15+0F74JkRtmIe0ATLafZCK1bKSLKjmh0t2Netal1f/rgnTH
         TVNE1g8xUipEQLig1fGgrGOBJK+kK/lj6ze6mb+N94CMTLJMj5rlMo8Q4MJNsk/b/YKT
         zkf4KEM/jQUWWvR3Krx72UgkxCVCpL005CRdsaycrnzu+nXdjzhlNFrtyxf0W6wbMhiO
         jRCtEkB/mkaaUpAMvEE35Q6FzzAZHkpsI/793hL6xE1x6tzt/Bswl6xfq0bFDRH4No+V
         BUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447693; x=1796052493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrtUeZeZyEMbBtLfg+8UTE0x30lPjCVdQd0dukXGLvA=;
        b=CxF1oVmEkGnXX77/ezwO5ztv592P2q12kePTwkn6dTSrG24mJ6StlvY9Tmso9Mb1nr
         Xa/5BZHoZNj7U0OpLNEGccXgKZIAfFgj6nGv40gLdjpX/YG+5PsOYkfNBpGJ3IhiRTSt
         ETX5bu7/hOve8mYUYzjFz0jxCiXLetuNKd6dk+B0WZFCndDpNDTHu0/xelZ/3cUDCYfR
         5BKZAfXw6d7xAcOx828cCakQRAI75O+ksi53cKhQ0AVbnY3ZS3M6bPpj5DPfU5KWUil6
         HuQ1sn3hK15FR3inwvEOwWVx+tdwdBKBikTrK7EhZo/iTZpV7pKFRZ5UjLIJ+AcPtMBM
         gVGw==
X-Forwarded-Encrypted: i=1; AL+hErG90Wt81wG9KwNosyhA1j/hDV/aVXlzjgMtzqfFdY+vdJ1XaJky6SNef9YYz1zsCMyJzylxIlkIZwohUf01@lists.linux.dev
X-Gm-Message-State: APuU4Z8bOZJX/KRObG4Qb2vX97dtQYn/XUNfdoeHgIIsZLGBrsX9JVqG
	lQ9jzv6CQdBLDcSK62brFJzYV7HzrEnRmj//uGbujwsFhzT7gG9gpThVMBApraSPnODRDd2l
X-Gm-Gg: AZFdTZcJidQHWn2EAcnHov2ojdmkY3dkRGMkCzwcgvpIN7u3LZ0usmTsLyM9lWqq3n9
	88W5S46ja28SnHVzjeXgAWqrG2UJq67uV5CJPgsaj5BPuNHuxbgIbiZSQMXnAQkNA+lt1x6TEYo
	bBk4cwNtw0LZSVwYDPJshkM+YHo2UTaWK+UlRIR1M/1mpU2/U6mMhsmMF4g4cZ2TduP9MxrVN6L
	olqzRaCAS3GEP/8ylvvoUdlUWXJpMiPzI1id1D+kWAwURe6H7IjNkEkyIBN8W2d7sm3SAuOIPi7
	NE0K9x93H3FhAxqou8Tiq2S5bkd/R9YJzCLkqypSamwU+O0qzSLYKY3dDpjJ453xucTthJ+InJe
	qybj6ObH9ZWbJOTXDoRZ97pTStBHYp4tIgOdiLeXawn44GozaPtFdwRkRb/orz6RPpCJNhPlDBX
	WU5chOv7hT6ibz52zx98yurbMaLY7E6hu+ABQxahuEgS86fL7uol2O5EZ+uym0JGae2uyuwkJEE
	uHKUDaD9dmFKSa75LVbYT6LLdjz45F9bH8uuuj3qanjqCFFXWEpSrPckQNpbRC/tVmFnOCZuvUf
	Z7OdpulVKgv+ygPNWIgGXIPEKPYU4FGtsrW8uOiHuqqhIngZBgwUjos2/tJGzXeFgB8Rtk3qO58
	i9tNvF1NVZNNJ8fk5JJ/XOLrgJOFYSUYSdcwR2Rlq/UN8VGUUj9wYCi+2mJ7Vj34g47MKjHf+aF
	dgffUJmLBYmcD0
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr262044665e9.0.1795447693025;
        Mon, 23 Nov 2026 07:28:13 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm21455300f8f.26.2026.11.23.07.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:12 -0800 (PST)
Date: Mon, 23 Nov 2026 18:28:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: audio_manager_module: add
 terminating newlines to sysfs output
Message-ID: <awRbiNF_FpuPwhZJ@stanley.mountain>
References: <20261123144042.60090-1-yogeshdangal66@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123144042.60090-1-yogeshdangal66@gmail.com>

On Mon, Nov 23, 2026 at 08:25:42PM +0545, Chhabilal Dangal wrote:
> The sysfs show callbacks for name, vid, pid, intf_id, ip_devices and
> op_devices print their value without a trailing newline, so a read
> from userspace runs into the next line.  Other sysfs attributes end
> with a newline.
> 
> Line-oriented readers treat an unterminated final line as incomplete:
> read(1) returns failure while still filling the variable, and wc -l
> reports zero lines for the file.
> 
> These attributes have no Documentation/ABI entry and no in-tree
> readers.  Adding the newline does change the user-visible output, so
> it is an ABI change for any out-of-tree consumer that reads the raw
> value.  Please drop the patch if that is not acceptable.

Yeah, sorry I was unclear.  All the users are out-of-tree.  It's
user space after all.  So we can't merge this unless you can
ensure that the out of tree users don't break.

regards,
dan carpenter

