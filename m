Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334726A1A7
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761844; cv=none; b=c+wN+8omTkEi1SCZjZ72sOwybJbsmAerL2r/DD9wcbGxmrDsqLSO4dT/LPdlYktHshjWvo9iaF0MjKFBGmOaRe+IJLSSTUwQLJznHksVX2+B8KSxVfYzh5dKgZWEtdVLFmvTpQwFEoTjuE7na382ZNPTfGm91DNb/F3XpJcuqsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761844; c=relaxed/simple;
	bh=AdhIRQHcANdsSgQEBDmB/1gbZlOgmYgM/GKpWpw76YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZWzvhYQZNfi8K/jYHO35kFXU4+N+pUZEujKpDVTeOuoi57G2ml6+BdCHCJw8mQyaunHo/86F+DIEL11ei/T5o3az+lx8gwqC0pL3aNs+1hGlssjwfFJTnNljgZJQqUoYTgE7uPPWDO615jM6XGhCqZqlECj+BIh/RF2ocTjrhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g/UM4NjR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g/UM4NjR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359a302794so1285407f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 00:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769761841; x=1770366641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgIihQppLjFXwmAIz1sRzvzthClZmP8x7B9Zg6GyraE=;
        b=g/UM4NjRdPasVDtZTs7iGlpBI8Gp176lH7EXrZY2B4DzaPwe9Sbxy475H3SLTzZBlB
         xhB9LDc4WoX6eeE2Te2IeTAn0y+v0BoY3dvYzNJKoufxmdpwCV4yEePjQHZj/x5TXAnY
         OeAz4x1CR83a2LSSb5Fkdzvf77jSIjJAbmdWPPjZc/4iyY3/zcrEoyyud+lAPMWvvWKj
         OIQo23ML+wYTm1e+U/C3t3et8+QXLGvDbzAD61ZrShszuQ0sZ1gEcVDCLzLszdSFutM4
         b0AYj31ciIXnqhVoL3/E1eBAoIfuLFUzD8GeXLK0TdNOYOQnu5BcQLzV+FaxwkuIwp6X
         QbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761841; x=1770366641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgIihQppLjFXwmAIz1sRzvzthClZmP8x7B9Zg6GyraE=;
        b=sRTli3zs2o5byL2SDJkENn3WTsnc+OqnRBg68A4OrU6MPmP3poN+tJPJydw4BAoLUQ
         EPwKPa+YSWMXbOQsY/wIpBCq4W1Wi7BnfGSJxQR4KteKa+oEiayPdkVg8WsmXQeIukrY
         R43P7ei/AFHdQNAvPcPAOKEIR9ujswNXh2huWOLBBSxJVneb47QSSU6UcGTx0WP3MgWS
         J1xkXZyHek/xfwIux+JzwQR7SCFInsIQLdK1JNVS0HsNSQm9e2PS1MSJxaFN0X0GHZgu
         6ZHlPaTH/r2i7m42/wctVrfGa8QtNY+3JtiXR+NPS+o5lJl2qqnpQwC1HjAhlCm7jKU9
         o5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXbGf27R4lpZZ0IzKKxSUP0NINo6ZiuC94cdQ+bevrbzz0ZJNfPukfTQvzZOB+s+EH7UQt8lgVQGau4a5Cv@lists.linux.dev
X-Gm-Message-State: AOJu0YyNsy41IzHF5WGtQqRzdim/0yy7si58RA9Us+c0b294jb/bmDxF
	ywN568jxpjRN4s+hEt7reit7D2YaZeovzgXhWcYxxXjhU0YOjHz9iGYyi/89w9FwcAA=
X-Gm-Gg: AZuq6aIUh27UBfK+khJr3TQnadmdL7vfLyt8VA/3SFKFjZiRiiQ2rD+Y68IvhC1jeRR
	5ozHu+KUYrGWNd5dx7DFE41JOVIbN23Gr7ti2MeVAw+NIR3bsCmtAJEF7SMNRIituLvl2EtMDqw
	pF/u2TYQ2ykJpMpAlOdifLK2+aXWHHpZaHJcw6ZRg2Brgef9+StaEGljfdk89kQ5ujppKXarJtt
	c9Lm0sDD4n9yz/Lb/lWAIoBBLRFjZ+9dgyUP1D82fXkGMlHoJ/9ikHM4DEViDbD8223yUTNc11+
	nTDcuTGZ0W4y26aYuLQ4G1DFbKTsDejJ+JHGp7OoqZ05dWHvyFM1tSWVynDcImGyXZWahsT4Ws/
	JGs9YwCnoudLuudKoAp0/b1TSdmpL922TVW9JpgNcuz/5YXO2ZwTUtMCyUDcmxrypkcoxKS8gTs
	rPAdfNQe6lraXl34qc
X-Received: by 2002:a05:6000:40df:b0:432:852d:5662 with SMTP id ffacd0b85a97d-435f3ad23ecmr2726814f8f.63.1769761841199;
        Fri, 30 Jan 2026 00:30:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322dc7sm20322574f8f.37.2026.01.30.00.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:30:40 -0800 (PST)
Date: Fri, 30 Jan 2026 11:30:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Huang <tehsiu.huang@gmail.com>
Cc: Joe Perches <joe@perches.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: refactor BSS Coexistence channel
 report logic
Message-ID: <aXxsLdcI946Xd7-A@stanley.mountain>
References: <aXsEd2bzf35y8i_E@stanley.mountain>
 <20260129080110.73884-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129080110.73884-1-tehsiu.huang@gmail.com>

On Thu, Jan 29, 2026 at 12:01:10AM -0800, Michael Huang wrote:
>   - Retained the 2D structure for 'ch_present' despite only using class 0
>     for now. This aligns with the IEEE 802.11 Regulatory Class/Channel 
>     List hierarchy, making the code easier to map to the specification 
>     and extensible for future operating class support.

No one can predit the future and adding unused cruft based on our
horoscope is discouraged.  Future developers can add it themselves if
they want it.

regards,
dan carpenter

