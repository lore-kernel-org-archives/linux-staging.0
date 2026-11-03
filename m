Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692353;
	b=ycInd9qYl8mQnAjOkFvKCzN2pis3OIUk0tkrYqN7H84D6KfSjPUpog82gMPV6VZCpCgf
	 o2LPaeYZk8rergncP86Y/Zq/2JvCjRzTtucKvqwgwJcnnny5HVBsdicSq2djcTz0QMM2o
	 6FzrJTLRy2BtXNi3b1+eJTyrXIdRRC5f6vYXyd1vuRr+ZEoYbBakluauwRT1FpXAT+gC2
	 R9Liw/2bP1ZvcjbflQa9B9gyW0VeXOji4L57BwZt4LPNnVYSPgMcEmU1ptwv9xCv712rU
	 QemP8C1Yo9I+eynHmrDDbOlr7eev8A2Kl5TRHBMuuT8nfcuebexoJ+/ANKCvnD6+bgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6R7CNAZpahPnRPALzexY2OH6fEkMajMjI2gkDqsBlDU=;
	b=n8timTfO6ErCtNT1B/1c0EC2W0aX24vKsTlhOVTemZRFzOcTSHxKvqaZsAJwJZwWtXuE
	 w5LV1yK38uPtadyHsMj9R0/QWe1A2plDdaVBAtQ+JMRkveQMEn9V6p8KOvR53EAQAmM+y
	 SkLXVHekwwIpZFzRikOK2fOraSfcobiWO3Nxq7MppWWZ/szInDQzsP72j10q2qk7tm+7M
	 Hu+jodHHUsCSuOfNIZYt+KCSqzxgdCYPxm4usfRzBHlpe+k1OUXh6pPyM9UEYjtnTA2Bj
	 cCbEbP/0sOHO8bN7uBO2m/QYYOGEQLwi3VtvU7sZS70vjC0xQbtqdHyYaRnntDtO79Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPMLQDMM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9D6606A329
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 07:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A9D6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPMLQDMM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so39861215e9.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 23:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793692346; x=1794297146; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6R7CNAZpahPnRPALzexY2OH6fEkMajMjI2gkDqsBlDU=;
        b=TPMLQDMM97Qcay0h0Elo0pvf/9yVz9rWx+f9iuOh5XM9yRgeKpy3vESRhYazvbl3Hc
         mvmti71j3W+MvHxDjTI4gZ2FzigWXjxVxmBfeKe0A3Dod3rJCYHhq6ZQyI3UP/xY4Xsg
         GBlZQ5nur8dT5ZV0a1uGBG/DRtjLyRvVizafFLqQKxyWSlVycohANC2z3jbtGOBsGpCM
         fdmtx2qDuaDpJVOC8dO6PdkE+IjROL584GrKwxm1Q8ff7axVJn8E8IyCtU8JFemw1hlb
         pd2YgZBDt3Pl9xzLLFJ0xwiBN+jV59n8h4evCWralr4Tu4Mo4N5HNpSs6LK53hq5BvUN
         SqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692346; x=1794297146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6R7CNAZpahPnRPALzexY2OH6fEkMajMjI2gkDqsBlDU=;
        b=zwx49+11CHeO48l6evYnebixU/3t7USO/wdY44KOZltrpSrWrR4expSo/m/9F9fCA+
         FYBc2ooT8O6cdpUFKvG/hhgogbHNNsw+y89ObyHTuyEdaH3K9qwC5jKRt1cFWp93+pqP
         zz6cDGwQCusAMLzR/8iujMObSCIgzbrsFxkUtz0j0x5bsgKw7IDbsjIgnlpZooltRfb/
         dcKPwkSRK9h8vjO4J8ALw77In+VJPcc5WV6HwYvFrP2L/hOgFNPKe64F03hYaZPLXQ6v
         amY4HuD0gm72XBcLcgUwcSDQuxnnyRpNw4sF+5jbjl740SaciqpBT9bHvxGytg7yBO12
         Wvug==
X-Forwarded-Encrypted: i=1; AKwUvBxO30tFMjgzl2v99rH3t5wR/1O1wysn74422Uu7w+MKXkxmW598jP4+KIOcrIWNc69ZzOS4XKvfX+cddICK@lists.linux.dev
X-Gm-Message-State: APuU4Z+jjmIY5KMwLttUKDo70AGiV/uoXi5Frk7FbMe20DKZcSQqcH4m
	pejaydraQKkbERwgvThlTCgf4HNLCHWBlHefH1Lu+L87UZl+DvRZMtkzv8ALfnnISiSbSqpJ
X-Gm-Gg: AYBFou2jyggJb3oRJz29bUM7YFYA0jMnbpD0ZqSmgiCoA9G9Yf25gwc0vdsriv747AH
	l5lP5Z3mgRvTPTEKFMDjVKGWk+l2clp79d/01nbTBoMjbjn8MNdf/9YSfnv1JmHNyF7bnRrK/yP
	iMc9BWwZRlQK0jk3m3mcjL/1PsrmBsx/3+/W80/3Cjn6fe2OZI9KvaYnJuHHkIh1Fnm5MYEiRSY
	jIa5/NXCMIzKwMa1LPFeBlI4y49+YmYy/aZbbCNb6prFVwuKbKZRnlaOv3cZhwNq7+s60jPeaRh
	ej36zhB3bikyyK2KuMu+h+LOc1ED2X72qDyKBSjXNkUzmOU4hnmaXxoEeMfmysPTyapQNPXN95N
	8X0PT+aT/BsSglHPQ3XWBOIk5wsdyr5UM6ksiUTa9EPbhBTqVrl9os71z481H+gS7e8Zg2aM5tD
	rA0DU8TFJ6NwaRf1jqop+AbKIr0PclA6trUQvSTr7iXUlPBdEDOznVT2y8GiMQDIxcXLISm8zOk
	/HlHdYigHyHsgx0FvfwxtATIesvl06qu/xK0bn2Q+LSNvA8kjxBcWDrB9XST9n5/V1gTy3lwv1j
	gRmygsW6exa2YNnPf4uIpvYtQ0gACjUwjMtauRdC3uEkF6aveE7JxOmyp6JCayOIrZ/Y56wX9S/
	dgDfMFYGloYs1ok9q9MS6YLdjK4tS3CEu7WR5y68Hd+2US0t5E2xR6S5BVqzIa/JRxfhWI19pDb
	nAcqmebnxUZn8=
X-Received: by 2002:a05:600c:4e49:b0:4a4:6fdb:cc42 with SMTP id 5b1f17b1804b1-4ac17b2c38bmr299232835e9.11.1793692346478;
        Mon, 02 Nov 2026 23:52:26 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa953d35sm37915295e9.9.2026.11.02.23.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:52:25 -0800 (PST)
Date: Tue, 3 Nov 2026 10:52:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eric LI <eric.lee0305@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix space prohibited before that close
 parenthesis
Message-ID: <aumStg3EuhPbWkZu@stanley.mountain>
References: <20261031042315.1122699-1-eric.lee0305@gmail.com>
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
In-Reply-To: <20261031042315.1122699-1-eric.lee0305@gmail.com>

I'm going to Ack this patch.  The other patches to silence this warning
introduced weird no-op macros but I feel like this patch does the right
thing.

Reviewed-by: Dan Carpenter <error27@gmail.com>

I don't really care if the patch gets merged or not, but in your heart
you will know that I approved it and hopefully that counts for
something.  :P

regards,
dan carpenter

