Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630422;
	b=Q76jbzLMD3tuFcEf2Ry6ujeGhvlCZr7E29jenZ6hwW86GchOaISSmQ17t0ptU7Obzw/E
	 MvNjx8w8N0bgpL3tjlu1NqNMl9yswl0hzxcAJRZOd0d7whTJXULcKR641HfjTV0prW2YV
	 Z8PI/Nnuo0c0n2nhE6KgwJd//oRb8uGx2MqF8SRCY8Zke09YEWnHb3JPeLXbZwqDEM5yS
	 talmkRrqiKhcZmqr6xPYWmdsdX6TLVitig7+5LdHgqaIrXtmVHqTZfQEKUx5oEx4FAmdn
	 iRLZpx+ou8SoQUTxu9lM4D3Jv2Y2x0opDBWnqE2fuSP4AzTXJQ9+kPqYWXwf8RPkpSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UizaT5WEzB9VreQHfjKZbh6TJBmKHW201cFNMemllhA=;
	b=nARALIqAk1lPafjzdA2WGaZRYGl6CNZAYd8vzAm/vfHlCWVB0NXoRTXu4UZ2O85xQzMv
	 lcNzPm6jDEwJILDgJhrPpTk9e9fnB+PRMqPJCLvmwJ46t0WieOPs/J9pCago+0Au7yYph
	 jEsxGmfShXWBrzZL4Oggj/m8rhmGBGbCWPdOw/Z3Vq+5wQWfEECKOOHsNe1acJvm/0PLp
	 cX+HQl+K/Rjq1Jm/D56nT8UFAd6qyz88JCxO9LGHGoS6wMP7gRB7XY0DuLELXih3PKSxt
	 CuW7/P6Uz6uq2N9358GhHkfSqDkrrn7LPDMsH8yaPPu518BMM4jLOAty0BNEJsb66AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtA8+1IU;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0FA606EE9E
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 14:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0FA606EE9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtA8+1IU
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so27719155e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 06:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630421; x=1794235221; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UizaT5WEzB9VreQHfjKZbh6TJBmKHW201cFNMemllhA=;
        b=QtA8+1IUu+axUcsy102L+pUH0keH9sUyyPjBZ/+RnMQ7TpIYj79C+lZiydvK/7neXO
         PmtOS5YRg47ta0VA0LDpMwYNP2BszY1KpUw37KAxxwRDNV8guzSjrHeZRO3WsGgILDjb
         TMwSP9BNFda/PJGTH6COKEZaIrL6CV4J1dgJ/YgVRq4uboxF9FP4lYATBvoIsDGHy4LI
         jOSg9Vy1x3P6DRuGOfQTMeDysgb0DdOogpEtC1BO7FALUCz0uBA+z3uZjrCOqlAVsO2W
         4R9od0NF9/m//s8+t4F2LwLvWy4dZ4gUO0HbT9o9CleIWQftjeva9zat8FtQ8EfJDz1r
         3qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630421; x=1794235221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UizaT5WEzB9VreQHfjKZbh6TJBmKHW201cFNMemllhA=;
        b=VBmcV1T1y8t1y8CnEZ+GEj+2P22JC4nA+Hnhwsu9/ddWWUMHmGWywATdZv0o6D3LAd
         ffkRNkENc4sXokIeTd4ryIck6J+BcLHl4BKVxKIjs1ImsCWSqrlxhqvlGmga76U55ygY
         kyyNxUVAvouDYz9d39MuKu7GYvbuDiRZPpxrmV91zjOFMBFx2kyOPCnbUo+AkyEwVhwQ
         8P/YvdnIKQjmT1HAPHTzg4FnjHxcppy39APSggT6qRDkASqRyPx+wHXcb15MKtjejPoz
         cHR6nXgY7UCJQQ0OfUXJ0wH5KEtmWk9IOX2WTwU5KeokYAgqn76RMCe9f8doNEcrRG1v
         TJEg==
X-Forwarded-Encrypted: i=1; AKwUvBy5pOECtR1qGYN9rozOmdS6RJEhroUj4kGQOK+ZCfhutBFP2cM+uDzafcdiugeqogDORqm30uXcu/JzZAJc@lists.linux.dev
X-Gm-Message-State: AFq9FYKrus4idHaG3qlIQ0PeBgfTS/CQkrDTZ3QvfXTipNiM2RYSvsOj
	R15IGbEjeCJfCv1m18PBKEmL2KXMtIe6lhdcC7kj5kIKiFkIU0RvaqNB
X-Gm-Gg: AYBFou17F/s5+6Ee2paJsDV9w0yQTQ7r3RJ3Rh2a+prsVFpRkt06RiYMOyvUSXW6nfe
	kKRm+akRIaALj1Q/yurCyVB0z2OuqSoz5r4S5OTcopSvuc3BkZ6eLiOXGmEht9FHmJPaDygXNiq
	tpW760JW8u01oKXFoGOEbBhaF0DFi8xll0RHChpdB/N0yUxmsK+WWOw0UAH6o8nCNA8zYCvKliM
	7b7xQZXW9wHJTLLo/eLCSg3H1zzupb7FbxL6VyBqVuNMULrph97yv+DhBjO3qIAY4khCxPMq4ea
	ZL+7iEnZhrPqNobO5wYT5ApdB8QHxCRJL1Y8enEupDi3kRhKsYrEaY6dW2zQeJsf9YPxmkCsmvC
	o1Vzz9BTy9Xlibyo475FlgyDeius7PrvqSoBIjxxY17YO/qx1FhiTNWe7kh+Sq9bUCpA3jfuRfe
	9+ni38T11H1ZygC88as8wgCPtRR/2QnvuA6MALRg0GF9kh3hxTetR1OxX/BCfMtl63uM6h/vOya
	Uqt51GkhIZ4WjRAOG1v4vvcBjhOXVzWnwto+OmYIfz3WJCnA+8d+FdAZpbqFwyQFU6A9PxvEveC
	mg+f08a15SmNUY3DoTuJJVxxsNjs1Ye3lvegokdDRMr2u/+wkzHJeEATy85kyfqveHibkkCKzxQ
	LZPlDenzGfOPaW7At68avkY7dSLT50JyWiCFFuy7TTg2tesVR1Filxxhye1gP1bHvtVRFQCaSNT
	RxZjH5M8oBrwI=
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr239559645e9.16.1793630420527;
        Mon, 02 Nov 2026 06:40:20 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm278034655e9.5.2026.11.02.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:40:20 -0800 (PST)
Date: Mon, 2 Nov 2026 17:40:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adhyansh Verma <adhyanshverma2010@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: add newline to sysfs_emit() in
 show functions
Message-ID: <auig0PAuoPinb0Kl@stanley.mountain>
References: <20261102140438.103135-1-adhyanshverma2010@gmail.com>
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
In-Reply-To: <20261102140438.103135-1-adhyanshverma2010@gmail.com>

On Mon, Nov 02, 2026 at 07:34:38PM +0530, Adhyansh Verma wrote:
> Per Documentation/filesystems/sysfs.rst and kernel conventions, sysfs
> show functions should terminate formatted attribute outputs with a
> newline character.
> 
> Commit 14c91651df34 ("staging: greybus: audio: Use sysfs_emit in show
> functions") converted sprintf() to sysfs_emit(), but left out the
> trailing newlines. As a result, reading these attributes in userspace
> outputs values without a line break and checkpatch warns that
> sysfs_emit() formats should include a terminating newline.
> 
> Add the terminating newline to each sysfs_emit() format string in
> audio_manager_module.c show callbacks.
> 
> Fixes: 14c91651df34 ("staging: greybus: audio: Use sysfs_emit in show functions")
> Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>
> ---

Check the archives (lore.kernel.org) for why we aren't merging this.

regards,
dan carpenter

