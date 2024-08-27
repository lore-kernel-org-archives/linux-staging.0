Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6431A199EA1
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782894; cv=none; b=tpL7g7tgtbJ9eIv8Uf1G1sadWGNwVZbKddXDIKOti8JwanJAdK2y0vCyxT63Dv+7tpQjiHbKYLJiUOC95dCld6NMoJjFnyQIHDUuoIKj4CkD+3ob4UAMR+SE1GAGmjsl7rsu8NlKiYSqX9jD5dMsatvBFyEO09Ygh+8FI9sKjlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782894; c=relaxed/simple;
	bh=MpceHBZuHH3o2CueqUk5GDOo7VtJrr197q01MLuthFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkB5FhGwSA+legwEhuaQ+IVRoZb0UsaUxS/YwXZli7Lt7MCOKwXCzHOtKktJWimrUqLD2fKdxJIdBN+qmu+JftW1ufNz51BIZ4KZKDphsH8O+bMhUCjjySpypYoIBNP2DdPiabvX5DWjxheDVGCMJjM9BY8OovenRizXx6oUgEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AeMrVRZ0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeMrVRZ0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428e3129851so52457935e9.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 11:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724782891; x=1725387691; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqdvqJEmzWDPrKZyiAdNz0J2ROp2OO31etrcR1BLAWs=;
        b=AeMrVRZ05c5iEgXJ0sOJ/Uyq9qOot7K4jjcnL9mQPGH9h4Jt1CbNIYzbQfF1grTLEp
         hEKMuA0IVxKf5VuppVfgMGnvXGVHmIZ22fe91DN8KqeKbtRgyBWk4LtvcwIgfZ4//EX2
         GNFD9uuNUmnbi+D7O7EmfRQ9QlKAqR6RBsV2J5e+c3FiJF4pkKa/K7d05UPwiiT7r4im
         IyWwGsJ5IVBKnqQZMaVuvugwJkirr9lX1hPAsNtA0I2ujkCTfEqKQzQ0QoJzw9EtfIvq
         ge6DRMdU0h8WRlg6smUJjFFwkqup4Y7SFDLfqCeu13oQiBJHEW6b+6J8XIrVZC3hAIf4
         ZHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724782891; x=1725387691;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqdvqJEmzWDPrKZyiAdNz0J2ROp2OO31etrcR1BLAWs=;
        b=LoDg/6gw7luDFPMALIJ3H2Li1X0C7v866Eq8UnS3xkR/MX8AEzDNpjTY2W68KC+0Q0
         jaboeZIbRt9hPlkjnedFztCe5apNIimO+Pyk7C3ncMwZJpcju8WIfsa8LoAaMFmCR1nT
         7pre2nnXXTjrbL2i7gkat4ZRkHwi+IOFB3fcqYFAGNB8tV/Kd1duA9bkMdqWPZc2bvj9
         IfIuDnZrnPX2JhktJMst3TWpqZ3Bo02uHpOfEpqKJZzNnKTkx2F7cmfYsZw019opA6TW
         vYn3aSNqhO214rzkjy3Mlm1xg3MWTrvj4W4eN8TrHOAdYM3W+dhyrLktbJ9vZ+dQj7qm
         Lgmg==
X-Forwarded-Encrypted: i=1; AJvYcCU515n52UpfsBj/5v6rA27VU4f2WX6VyO3IfV5oV4/xqe86+qh591NqUj+RWcpLnLuGpiIaEpZNJIJALaw+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9ql57zafNElNOIvj4869hckINbPkXquVTI5bYJPIwk9sKv3jZ
	lbkaRnwnyx0JHxR7BdO5CgJzVg1eB1EnZApmEwglFCqNQbYpJ/un6rsfkt6vasA=
X-Google-Smtp-Source: AGHT+IEn/urW2WYXErg3s6zWyW9m2P6dJY1Stz7H7aazJRw4zjfpDd/WN9qJrYv1mjZWFicmilsI7Q==
X-Received: by 2002:a05:600c:45d1:b0:429:e637:959e with SMTP id 5b1f17b1804b1-42b9add4764mr27914815e9.10.1724782890655;
        Tue, 27 Aug 2024 11:21:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5180106sm198559695e9.41.2024.08.27.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:21:29 -0700 (PDT)
Date: Tue, 27 Aug 2024 21:21:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <44676cc2-a9e0-45b9-b08b-5280e8aa7a06@stanley.mountain>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>

On Tue, Aug 27, 2024 at 03:18:41PM +0200, Niklas Söderlund wrote:
> @@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>  	}
>  
>  	/* PCLK 75MHz. */
> -	max96712_write(priv, 0x0009, 0x01);
> +	if (!priv->max96724)
> +		max96712_write(priv, 0x0009, 0x01);
>  

I don't like this either.  The comment should move.  I didn't see the ! the
first couple times I read this.  I don't like the MAX96712_ID and
MAX96724_ID defines because when humans read they only see the general shape of
the words.

https://www.dictionary.com/e/typoglycemia/
https://en.wikipedia.org/wiki/Hamming_distance

I guess the best we can do is remove the _ID so at least the last characters are
different.

It should be something like:

	if (priv->id == MAX96712) {
		/* PCLK 75MHz. */
		max96712_write(priv, 0x0009, 0x01);
	}

Or maybe put in function.

regards,
dan carpenter

