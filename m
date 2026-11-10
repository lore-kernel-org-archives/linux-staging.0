Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318015;
	b=sK7jWax2diynVBYZhd0dgKEDNcwQcb5dTe4UyE1fkuxYYcdwpprHGj3v9NGTmdbRSmd2
	 DxrIxy1mkrBAzLZTKotvEuGqYt2a8VGVgCpQhPpxaLAj+yoH3/43bn0I8pzHDzq2LhO8t
	 xco1esD0ALCOSEkubvyezvSVLSAroUbjIxIHa5cikJbAGMtkbchzsAu/w+oVgqb4aU4iW
	 sT9Jp8wP1daAOZpBVaT6BuwOfA/wdhK67SEBhIxPSE14OcY/pIm2qVO7ByP8OnLh8OgpH
	 vU4cJsS+NOCzDLyhwYcoFcGLTCjTi5Nrvl5WMLxRtHsRWm2CNfzm6poEbjs0EcUxQPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318015;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=3c2WpukRa6d5qbdvXnuRxcTvhXaqbpkaY6h5ED2Zn2k=;
	b=gvGsW6EHYh25b5DcuZaUJkNM7XhvSdYc+CRMxc50WKu1u+GM3Kjb6nUdVC7UVS1bDek4
	 Ye1g3CuwuMIPef0PvR8xMqxgqWneEyWR112g4AFWT5jiak00i6LU2gQSSJxz8tZM6mqzQ
	 zLvFseUN4n8nZSz7Kvlg53ja1QPZB+Tw1QF85t8J1RJhKPQleW4SuKnyKEk6BBpgDMRAv
	 SIpBivUg2c9CtKqLTbIJxzKEKe0WezJHZfDriUBPql+StQfu6irmVKhUOeV1GXNVyOe0d
	 VSH9DiRZBoDsSPWVJHd9o649i6yulRvMVplPSW/I2kghq6UQhGSgTc5VzXN8iO7LPag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5288D60A2624
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 13:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5288D60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4919a880834so1260954f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 05:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318014; x=1794922814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3c2WpukRa6d5qbdvXnuRxcTvhXaqbpkaY6h5ED2Zn2k=;
        b=CYRBh7lORc/ElWl8bMuU0Pl44B2nEfkvZ0//xxEj+/foF133K8ZsVUlRHC+paemJMb
         gFlGUG2C3rFmvUnXxmrLDgnN8K+F5XQd2Oo67vhLefuD98RGNBi1e2D/8c5LKls0RC0G
         +oYfIK+haGMq8fUcQveP0zPqUKzTSsrR8GNATPRhFvhWYSF9wrhmVf4LhQbB/wHPFMNu
         vZn6vxUEiZ8jx9ru2JWlJDIJn+ZaROjlDSpQfr5dCjP1ILd9o7buC4Bvkd4QBEQj3ipj
         dn14OqnBpK7iMff1Y/RsdvwL6QjeumODYbqs5ABNAtxCzdJixHw16vWYeEoJYF6YEoRW
         VKhQ==
X-Forwarded-Encrypted: i=1; AL+hErHR4ZpJcltWY+oZi+ZjRGCPkGpXFQqsCJ0/isHgrfwZ9IXj3WGmEEUqtdyWu5tI6ufLBlmo+SpN3xHJw82q@lists.linux.dev
X-Gm-Message-State: APuU4Z+6LgVAwfuJGhDAZukz6RAfsI3bQ8BD6S9ur16EZ8VhTrQOgDKs
	AfcdqvKK98BKE5tTLBL5gdAh9TGqeREKqeyQMLm8nvnYCAAMd03bNKHl
X-Gm-Gg: AYBFou0MMGhveI+uNYIAh38t0upGq4mVZd1xUR/jktdtAJLJXOvjF7WLfi1Us0Qrbce
	s/sdyTJkssOEz65nXTVt02c5h4zgnwcm9yLbwEavWWQOnd/MWUNs3w/JbVg70QR3NwJpijw0Acw
	KKpz9l7ecP5FOphNiriLZRcRS8bUCZ9NG2m6LpU8FoFHZIjPNZPahFOj00mJ2ctq9+30JCCGf9V
	zZlP0OOrrv5OikxUhw7X3s5eiYCqmUS83Xy5z5oAH191Oy1rZ9QWqZvlvPXSCqCvUR8bO1vbw/o
	/Wej/HvY1VHlanu0bEPDM1tk8zJ+neAobDqHCyoyFl7CD/L/zUO7zPsG34o8pPBv0HTpqUVSbq9
	5iE8IkZvlSaLmyy8mbRzq6s6vYAQ+svLEzHNIqg8hlktu/1uhk4wnjOS3d4x1cvA0y2YKKHnMvD
	sGoyivhp3RoiGSrVCbnPebeBeA48axKckTbh9OOCVME5nr3g1Px9IeztouENpF9r0t1RQ0BGiLn
	oUU0a/eurRoOgDWAfDGm0MdM9BnKiiZ2ch7sYYcN4Hqym67Hd0rcaOwejQMl6UkxYGSzaE6AHA2
	+NcSunXQCg6HfeHWxY7BcrXb/swug7CQZnWljVFlHXFpPoRXQCCqmKAEqZgZ57mxouaU96A7Do7
	sFBS/H0JcYMlJkcZ4g1BtIhGPMHfoDmxQAf4dxGcL4U2EFPbxXLvow1Iy3aKo1Ygd
X-Received: by 2002:a5d:584f:0:b0:488:823d:5086 with SMTP id ffacd0b85a97d-49827fd20ffmr5377884f8f.0.1794318013331;
        Tue, 10 Nov 2026 05:40:13 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb158sm5074218f8f.36.2026.11.10.05.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:40:12 -0800 (PST)
Date: Tue, 10 Nov 2026 16:40:09 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Kincses =?iso-8859-1?Q?Benj=E1min?= <kincses.benjamin2007@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix spelling in hmm_bo log
 messages
Message-ID: <avMeucyFU9r_nfP2@stanley.mountain>
References: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>

On Tue, Nov 10, 2026 at 12:57:49PM +0100, Kincses Benjámin wrote:
> Three hmm_bo log messages misspell the past tense of 'bind'.
> Fix them to use 'bound', as listed in scripts/spelling.txt.
> Only string literals are changed; no functional change.
> 
> Signed-off-by: Benjamin Kincses <kincses.benjamin2007@gmail.com>
> ---

The patch is corrupted.  Read the first couple paragraphs of
Documentation/process/email-clients.rst

regards,
dan carpenter

