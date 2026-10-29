Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300001;
	b=4e73LLGE9X+3Gh2qX4yhZgPArkjRFHobQUTJapxkxAUDqIKfkIBw1sP/xZxnFteCp0Ux
	 fXtxIcORIQbUZoqPBFK3J2y7u8VTksRA36ZCPlX1mMVSzMCuWPENBEE2KNxhqVLEI0owT
	 Zj7o4RTlANFYfCtWPPgm26aLowI8m9CPybRbj/zdlrT8p2je4zZ58Pl7C61ZWmVfUPZi0
	 X09H8vJRXOF5w1/wtcmjqxtrPITLjJgu4ZNhiXg6TRrac/5rpK5U9IovngUZgguFlMwMZ
	 JdeBvdI0XO0ObPtaVfGsxkWqmSdhTkKwIqkXgzsKgzA6MyNGbR/S0Uj8jXfycrn9DCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZmWPzm2rbQXWS/0JLk7KpqQzmeNK5xYsM/YYzmVQZ7I=;
	b=BFvwG89KZx5b95u5D2E8zIiaLJRwHjEnNA2VRClPwHQ5kSevWqxctgvmZqYssGehlKZI
	 KuoVrMoWoYk+1LmiDXDg/ayq8IeV+RrqgRwGQFC4VrBJY1DOX1SGDN0wzI2NfOcBes5AM
	 XTDXRmFbKlYRknoiGakcUorVsxaKO9XD6heyLTqGW28EWjBTm7LF7q9pvkSAx2YDG5pYS
	 udsTzlBMq2pq12UJNrC9eWVF+UYCLfaxZfxqgo31HBff023MIohHW2/Vk4faLo1UhvGbE
	 KWwR/83y5Wr+HVAdumuLEXiIi5FtPxCAtv1oQvb0g6CoxsZYug2mMXAb2aII14cg5nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzqB2VJZ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A3C606A31D
	for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 18:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A3C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzqB2VJZ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so12695825e9.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Oct 2026 11:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299999; x=1793904799; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZmWPzm2rbQXWS/0JLk7KpqQzmeNK5xYsM/YYzmVQZ7I=;
        b=NzqB2VJZH6/6JuUX9hDORNMzLqZi3/qpz8IjKGvjEPI7Dap+W7ySGilxFPiSbikbPj
         9nK52aerev2myO5lv0ngSBeEtWcwuUPneh2rTcm+BjkxCgyAdkWAeBcykbVfuCS4sMA8
         jYlk3y3RJZUbM89TcAwZQ7fS+ukMAR/bszu9U23KXNZKXFTILEywmEBAtVCsBPxvfviW
         jA2hGpg6RDLSWRXxU8mSSQ2Kh01CeW/08W2KJJRJ/MvcS6QD+MMFeUs76wcUEJyOnxhg
         PF74IvLCFTC/7zdDtrYmQYA7pfdB4yTCnvIOCmGrO1C0YZyHJjxVQOTqxd9AwF112B84
         nwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299999; x=1793904799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmWPzm2rbQXWS/0JLk7KpqQzmeNK5xYsM/YYzmVQZ7I=;
        b=YFF5GfApi5L+y2gqsVj7NziaeeEPNsBiMWkT2PJl8rBG9q8o0nu7AMxY3LEcTafKnx
         uYHeogl2GPN5dVlxEP4GZSFwnguzSPq7JD5oQL8JhbIZQS5gvLrb5mZEkXe6TC3zXuzA
         voGQ5EJctLT3e59YBA2K+1GFwhaM6NznpfFTttVe7LP1U+aIQvflPpimNnNm+dVMyaY/
         FzCRWIlamR3aI6DaCG1NTfvXmrb23MV6+LLAI0bEkUc09qCu2pAexPpVaLqwrJRA9UYs
         ix8ofxRNHxkY4IwLIEegAIdjk7bUiHYlxKllz0kj8FYSrFDewJnFe2QtVZAf74BWhMLX
         dMDA==
X-Forwarded-Encrypted: i=1; AKwUvBzLk0rabrOsdPw+9O62rYMCTwuvirimw6JxcMxx1sJtoSMfkP4BKqljgB6K6KijEPic/2zd6EhBJm8JqnWA@lists.linux.dev
X-Gm-Message-State: AFq9FYKKEiSKLNWONk/Sl1iwaUY0+Dm0pmoO0DEPM02JftAqvAD3Qg1h
	GQw/RmIsEH1RndovBI8KP5ydJUvZda1VOICmwh+yyexOVEHwQtmEhU3G
X-Gm-Gg: AYBFou0ZioSNYM2gcPwcRuEfVIzkvOrCWAZyTRDz3gQf3GrBkrm0e7c1Zxkaa3jPra9
	dbqaJdLEAj1PsYeKiCsvs8jOUr3tphtIjoleVnYj5UtRb2QLdG75cTbDbkKFQBO4D4qEC36Yl8X
	xJMK87vIyR2AXTDEJH8JKRVKcPTAjwtFbBlZm7CcHjcWak5E16M4PR4+0vWLYGrGaDBU7vk5xkp
	Xnvai819zq361tJzkMTAWJFX61CWy35ThWnGvMCoUGSTK6acStn1nwLcC3Z657ZAUBceV+w6DkM
	uusvqWaVaI+o6V+RkboPsXZXGBPgE1Mht7bEcMdpgij0mS/WeXQ4kvoG7bLfQ2cqfhnbAjINRbH
	A0U8IXUVHV09ZNvdl4pxqkwUbgew5rQGubEc5We+6D+UYa4RkIGIgj19mNui7VX43XhClukD/J7
	BMKmZNwGslcO1IjXGNWK7RaazPaK/g6OlZYIOR4EoSJz00jlff9S8mqNAxzJz0iXHBZtd1UnEaP
	mNzfheSxjwskYcxzypRpr4UdKXNRXf0aI2TeaqphzYn1NiJEy4QJdZzyJ6+OM1QOQg56NUGNXK6
	BLIL2FZXKbZqept741QvHzEEJU9iAxM7UmIt/Bcr1bOnoUS5YQSFvvJ+loUTEu6y8rCX5vGa44h
	6Xp2oki03PxxWF41Scxqpy23F49ARO6UXSHMGJyrpZ2McN5eCmS5WkDHUXqw/EnBCtsA=
X-Received: by 2002:a05:600c:3153:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a9677cb34amr150195915e9.29.1793299998954;
        Thu, 29 Oct 2026 11:53:18 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm4779985e9.13.2026.10.29.11.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:53:18 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:53:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maria Sheikh <mariasheikh812@gmail.com>
Cc: outreachy@lists.linux.dev, vaibhav.sr@gmail.com, mgreer@animalcreek.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager: Add newline to sysfs
 output
Message-ID: <auOWGu-Hja90eAmV@stanley.mountain>
References: <20261029181948.13121-1-mariasheikh812@gmail.com>
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
In-Reply-To: <20261029181948.13121-1-mariasheikh812@gmail.com>

On Thu, Oct 29, 2026 at 11:19:40PM +0500, Maria Sheikh wrote:
> Fix checkpatch warning:
> 
> WARNING: return sysfs_emit(. . .) formats should include a terminating
> newline.
> 
> Add "\n" to the sysfs_emit() format strings of the name, vid, pid,
> intf_id, ip_devices and op_devices attributes.
> 
> Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>

This changes how the sysfs file appears to the user and potentially
breaks a script or something.  You can't do it without testing.

regards,
dan carpenter

