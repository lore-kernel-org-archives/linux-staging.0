Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AC780604
	for <linux-staging@lists.linux.dev>; Wed,  8 Jan 2025 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736356460; cv=none; b=aMio5LBoodNrwfsLLaipG6sOaj0j79Z8fCYGu18VI4T13WMOUiRMTzCLsG4oYAvf/FtaXiXcEP7zkL9lRRf5z6khbJ5jNMY6f2i3kKCLYjk61BCXNGCF9WHvcZHxaeh8oZHsLRLUvZKR6AW7i6lyG9U5wp7QYMYMCIFlTJf6rlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736356460; c=relaxed/simple;
	bh=aooA7LYXUoVys5fZ1anzMAbIybJlbE/gkMABOVVxI/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asVTIR1DuWobqJUaXwgALg/Xj0f+J+tAWodnL4IrbscC3OKpWmmbTr/OTn7XXfrDM413IRDWYSh5QnS5OIQ0OE/t7IeOXf8k3yIGfc40w8F/3FbN0Bu5yLW8BV0F0vptPop8LAmHCCO8bFQyN/OpNAp01F9uAYaaT2eN3R5zdgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Syo6AdMZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Syo6AdMZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso570035e9.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Jan 2025 09:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736356457; x=1736961257; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQZuIYs4dJFxY5w9PNV/Pi3AUB4FBPjFOwxnGDPvk84=;
        b=Syo6AdMZPTrYVcUocc64DNEYA8JRj5G3lS2GgQ0+cAci+SdjEvTDTQpdFCP55MuXPT
         0twAcGDK1la2z4/J4sLBo3XLKEYN4oxsYS62RC/iXjbsGrb0MS/hDAkPn1NBDxIXVURs
         hxkmtGkog3tWEmeNghb/kt+M/QRIq/Ki5MsjS2zTozkh3V86GnfMdUTnVZZOLQOa/tac
         +7p5M2oiiZuJSSfzt9rJZpROI3n1hXxXhPFq3KvJX9+GF562BpSTCFzhLV7we+LmJD4l
         xz4/Ns7gq5oJYiSP+ge8yVVrwRF6oe0i9c1xrdd3eXiRxEheoyWaZv10yQJlM1CBi7bs
         lHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736356457; x=1736961257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQZuIYs4dJFxY5w9PNV/Pi3AUB4FBPjFOwxnGDPvk84=;
        b=wVSaCudw4x2kBErxM+fZOAgNVXjJqHtn5OL3TDnStK4j9jFrWzC1EFzdYsnDDvCZP4
         m8tE5XJ8eRkvSSKFtdOyoBCr4BaTgTvIy+CmwekY3xkuNex9nymPktpPgdrEUJ8qSsdg
         gVmx56Dl9YYO4rjm6a4WHDWwC8WZ4laoq6OnLtfamg0GEF40/g8mzX962EB+DXzZZL7k
         pWB3ATj9TzMHEnUhatV52Y2fynBHySriKs45caplmn/wWsP51cIQi2vvgdYfwrADdAp9
         5LyuJ4QfmNmuwSzsl5i75uVJSc9SRDoLyqP86pHbrRCgcerKE8yxHNlFoh7eir5it6XD
         x66A==
X-Forwarded-Encrypted: i=1; AJvYcCWYFjkFJZgVFz76IGxld/51EK5d1sMrsxGnYkYCjNyPEF0m16u2fm7G/RAO2xWvHqnLXlCPBqW6IU5qMOlw@lists.linux.dev
X-Gm-Message-State: AOJu0YxoN/0GkmdVvlyrRpPY73VG/UX/6sHeapjJzqjqXlq2Jk7UPcaK
	/yZvnlvPETe3LTI3Eo9iA6UrPkmMaskk58kCs9cFc0aYeAVpuERYcpDHCHIx6xHaHjkZ9Yaq0rZ
	q
X-Gm-Gg: ASbGncukjJFrHpCxSztzAei3qEP1AVYvkI0L7itvtbn3J6piAHDFnJoMmUSE5DKf4oX
	CfFHFRr3CJg+rQRyrJnI5YsHctUHef7GuexlOe4Tin9WIn9Sw61U9B1g1Jtz6d+wC2y807Y4mYF
	FPffImTrAKx40aAIMPymxpVht6GOJ3AfJR8+7LEEmBylxAIPWWgZxYFdgPvvcSsrE7Mvn0/l3ks
	fYiLPBHHQfERameJQ5BWAumZpw/NgGDg+sPZKblr4BP+oHLPO8Bph9mR1RpXA==
X-Google-Smtp-Source: AGHT+IFmN2O6u5JhvIH2VcEzrI77cQ6Q1cDuRHrLNzPC9J6UpQtHIgTBqtUCzq6KiNRm740FpmamKQ==
X-Received: by 2002:a05:6000:1862:b0:385:f6b9:e762 with SMTP id ffacd0b85a97d-38a8733068dmr3316575f8f.36.1736356457291;
        Wed, 08 Jan 2025 09:14:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1a1sm52748082f8f.69.2025.01.08.09.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:14:17 -0800 (PST)
Date: Wed, 8 Jan 2025 20:14:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Modernize gpib_interface_t initialization and make static
Message-ID: <0518fba7-7c35-4a91-9354-6a32a35f2ed7@stanley.mountain>
References: <20250108152942.17687-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108152942.17687-1-dpenkler@gmail.com>

The subsystem prefix is missing in the subject.

On Wed, Jan 08, 2025 at 04:29:42PM +0100, Dave Penkler wrote:
> All interface drivers were using the old style initialization of
> this struct
> 
> field : value;
> 
> This generated the followng sparse warning, for example:
> agilent_82357a/agilent_82357a.c:1492:1: warning: obsolete struct initializer, use C99 syntax
> 
> Change the initialization to use the C99 syntax
> 
> .field = value;
> 
> This also resolves the checkpatch constraint of no indentation.
> 
> These structs were also not declared as static, unnecessarily polluting
> the symbol namespace and generating the following sparse warnings,
> for example:
> 
> agilent_82357a/agilent_82357a.c:1465:18: warning: symbol 'agilent_82357a_gpib_interface' was not declared. Should it be static?
> 
> Declare them as static and remove any conflicting extern declarations
> in the corresponding include files.

The c99 initializers and the making the structs static would ideally be
done in separate patches.  Splitting up patches is kind of more art than
science...

regards,
dan carpenter


