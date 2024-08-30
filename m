Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B0B14D294
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724997709; cv=none; b=Kjxwkfcpm1Mng/FbjlU2RWrCVGYH/EbxDhiFkqsWTWd7TSN267HlXI23sZ8b9F6zyzZnM1ReQbqXLdduXvASgKJK4a4uhtYyy3K05R+AboeZINkO9/G99tj7/nu1918Wp4BPcLj1r/3t7r/mQSaqjrgmg6GKbE8YzhWlAkmiC4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724997709; c=relaxed/simple;
	bh=9DNY3ZFRE7CHnMwm1XSpzP3vVjD0l1buQ4MAKMyTHeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOe0/bbx7PifRlvT0QARCFcIjjAEQYROkxLi3W+cjdMCFvQIFSgrz1CN/K8WSfhPd1QbHBxzi5frrIrfPo+JPfdOL9sleMj9pvC2hC5lMTdhO80IvsYoQJPveLWMWsxoyobs7VdLzXPiMDn303U4Ja8r5YMUcXETFJMVksmhGY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EOiwzilc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EOiwzilc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42bbe809b06so100415e9.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724997706; x=1725602506; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Warkqu/1C4P7VyOObJRODovHA5t9+AmBIFpWfc0vrEs=;
        b=EOiwzilcmH3nz9Tn9hAcVhfDXBEFxyOKlRAvKuQKxspKl4USNcVe2YqjF5isjuzPeR
         jncKJlJOetTF3uUnarJxbkK1Gps1SgEdmt3i7seoYCB8hR7+/XnASnEo2cRVcf20kX93
         BiRiT3VyAxJK5kq8Z56dke9QTjzXHKB/nvLJscR6Z8H3+H6/gt7fCo9NPGYaguV6Y/kQ
         Er1xclxS+diBikf1rhdZZmKst0xWCoguZ/rlEx+62WvJdC6+q1mK5tqsdFawKPSLXMf0
         BCO3Ova2CFS5I8o/9Sl7DOWAmDjh6dkRE3AYD50K+//Eb3hiLbvZk/uABEcFRcXIRAgL
         fgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724997706; x=1725602506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Warkqu/1C4P7VyOObJRODovHA5t9+AmBIFpWfc0vrEs=;
        b=QbOE8QuAG+K5k0DIdv4QWigJwAnRCU1Upg2+QPzRgZ6LnF3lha8rX2w3K57z7CNNqh
         7V94IfoTAN8Gnv7+R5RC0Ehkolt6oV8HzqvmrFkurTdlSQRk052r875fbsPD5u4BJZ3G
         8P15xGfbVjn8Iv45zXwqwNi7AHN6GFgtkbXM7TRAPKJTeXFgZEVAHzxdviPi+XkztayL
         SRWFQpJrVQ3b985EwAixccyq0mdmBdDeos3FOkfMmp6ec4miWezaRkMpGFxJvq+WPHcD
         /l9Dbkis5Uw/cIQV8V7QCBsK5bzNJJZYgNHjRQcM4E71zM52dmHBuYFhOyltAPkueHbt
         KoDg==
X-Forwarded-Encrypted: i=1; AJvYcCU4HZ5q3kW6doswrKGrw7m5PysHwjdl3bF7LHti3YGi53BdNy/XlqkeYRsKZA5muQUIngzlazgE3d3vuHEp@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3a8+LD2xqX3icrGx5dFkNYt8dokleoVKzDjrda60rC8Hd49Kk
	DrKHrOIJATTUQSJcWRC4YLgoj+JibwRHLTA6Dvcm6XZv5fFRv2vPipnzFDOtH/o=
X-Google-Smtp-Source: AGHT+IEnYCMR+9YoUxCyT15AEnLKuXgg+ZtwpgefE7r0jjZu+IE1hb8+dWprd3QISNhgKpkxSgiOVA==
X-Received: by 2002:a05:600c:3c8e:b0:429:d0cb:950f with SMTP id 5b1f17b1804b1-42bb02c2031mr41008065e9.2.1724997706001;
        Thu, 29 Aug 2024 23:01:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6425a13sm70170665e9.42.2024.08.29.23.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:01:45 -0700 (PDT)
Date: Fri, 30 Aug 2024 09:01:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: staging: max96712: Add support for MAX96724
Message-ID: <affa5481-b858-4f7c-9325-3bb56de4f538@stanley.mountain>
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>

I don't feel qualified to review this, but it's a lot prettier than v2.  Thanks!

regards,
dan carpenter

