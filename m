Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8733721B918
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032383; cv=none; b=LXcYOzl05ZeDftjrQy+12o1Q8uRtIXYF3Bg+PbEngZnIJze/7SKPM0IpguJAIGQtV2vE6Audjk0pSDqOQcVQYWpldCTMEfKIi2OhexnM6B+8wHRetffeZmnIShHf+29QNfaBP1zWGVBKJO7ha5zekaz2DSIfsDhKnqpK8hifBQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032383; c=relaxed/simple;
	bh=eMqx+J3sUaycpTqn5YViXSxtwhwDAiBYMYDT4c2jrzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grPcVDONtmHmfAaACFm7jekpqq8evonJU03iLrZRMEW3NWErLID3IOVj7a15KqsYR8L7Dp6Grqn1vCy+n++4cpi2OnviBRLCojgyo0oaX/b1Bg7S+9Re7PkBUKot5vm9EYvcY/XK32XJ3lUT7CZ1bItquj8SNTp/HA8dVOeV8KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vkH+Omvh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vkH+Omvh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48069a48629so44995315e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 03:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770032381; x=1770637181; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=db3xDsJz5VIzfz7a+ZuJ4XpKn22UjeofFPI5A02T3lg=;
        b=vkH+Omvha+Dw+EMpFI7NsKGV7lPZSbEqoIYpkqMAghE89Iiy6JPgs060BNTUJ0FTUF
         a9IcSqWxAWo3RsWm2WjQzf9zsYJtIvrHIhaNxolIORjyew6BidCenLgnhw9sa5ZdtZgZ
         HgX3w5+georDQDHKnub4l3dV9XiwLv0OHBuuLpHkEytrJGB/3KBty6aiwm4xWa23/xg2
         y5CvC+YRlYExdJTn9hczTi+FSYHv/5KWfuc1B7YbYkZlFHTvj2APrADHAqf8p4/LzAhW
         S3cFAz+ZmgCo2vJcPStyxgOW2vj0Jl8etEYWe/06GBQyUKeAHl2Tl020bsr9ZZy+WsVq
         rkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770032381; x=1770637181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=db3xDsJz5VIzfz7a+ZuJ4XpKn22UjeofFPI5A02T3lg=;
        b=Er95utTJg3+T2nz3k8NVWlhB/1vtoxWEfIrFD/W5g+DFuIXiWiLW5qQuQkl7wMMdc9
         U/jQ9GSqIZqooO7DmCqsONWrh3puBMtyHihVDOqmQNomKuevQvnTUH4AIDLPIzIq2PR7
         d9aqeE4jar3xwCCtpuFize4ALyZk2ise+fnbZFx8gl9wGdLpwe+uk2oRHcvzYCDDL1S9
         qsV6fDBPsqvHa2W5CeNb0gTkyjf5dk1c6YIsdgYJL/IONQ2wpGoBDBVG+O8PSIbJy6Zg
         oCKU7MbDMG50XYvesBzny4eRyAoiujVEXXUebFg90iozcPgiMCo4xULF+HLBTG4mvdda
         7m7w==
X-Forwarded-Encrypted: i=1; AJvYcCVLlMIcg8s7ojoYOKKe+1iPgw0ZD+cCFna8GPYqE0YmUlcTJ5AULciEcB+GcVy+UP5BVew8/LGtRCkGr2Iv@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5COdSae0CjWrGPFrA8xNYF+pp10cEUR4Ve0oRRV3VBKcHyJ4s
	hzvfI/D1CCarMT2ELzgZgIi6JN2LMD457DkE0imGJruMccMfOBEACiyBCYrBvxyNm7s=
X-Gm-Gg: AZuq6aKG405/SrbEbtMxKacjUC5lPx9jIFNuD3riOpPiNHZjGX1qxAjRwh8BIKbhQqy
	cmDiv9prkaRSeB1OW73B6YKUSbqsSvPGMZHyOVMTpfhFnw+elDEr4E3dKopGEt8LItr6iNNGSF5
	a8XGTiQJoyDl+nir57+I4Xdzxk0BlTPr//jRtr/tWP9jflD9AAVEE063F1LLs8lTFS1P+MxfyaY
	UOg0xHb7N6T5pKOONME9E1yl36QdLaf8ZENrqE0J4lc72N58hUrXZWnPqwd6yUxvtDApCuzpZLn
	K8Uv8lqaAquz+mfTLoHSofPiaeWtqwleEX4kjxxtgE/E4Kcue76PL8ukH0MIMVk3piR1wFCOYSi
	huOBdUzbtQ+u7euxHaczxHoG7Re+ed0R2PRslOCE55Jeur3ykjujfxHWAxFCuVbIymhe8cNe3Ae
	TCcKBlg6rrgbeJ6Qq8
X-Received: by 2002:a05:600c:530f:b0:47d:3690:7490 with SMTP id 5b1f17b1804b1-482db45ba1cmr144116005e9.9.1770032380811;
        Mon, 02 Feb 2026 03:39:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm411442455e9.14.2026.02.02.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:39:40 -0800 (PST)
Date: Mon, 2 Feb 2026 14:39:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "M.samet Duman" <dumanmehmetsamet@icloud.com>,
	=?iso-8859-1?B?1i4gRWZlIEQu?= <skylinesytbe@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	=?iso-8859-1?B?1i4gRWZlIEQu?= <skyline@noreply.codeberg.org>,
	=?iso-8859-1?Q?=D6ner_Efe_Dasg=FCney?= <efedasguney@protonmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix whitespace issues in hal_com.c
Message-ID: <aYCM-XcW6nUWYTHB@stanley.mountain>
References: <20260202021845.265051-1-skyline@noreply.codeberg.org>
 <96821010-58B3-49FD-865F-E9F420E4699A@icloud.com>
 <aYBvso52Z_-83lQW@stanley.mountain>
 <2026020205-crawlers-kosher-a94e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026020205-crawlers-kosher-a94e@gregkh>

On Mon, Feb 02, 2026 at 10:49:26AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 02, 2026 at 12:34:42PM +0300, Dan Carpenter wrote:
> > On Mon, Feb 02, 2026 at 10:08:02AM +0300, M.samet Duman wrote:
> > > Hello Ömer,
> > > 
> > > I wanted to share a brief observation regarding the patch titled:
> > > 
> > > “Remove spaces before tabs in comments to fix checkpatch warnings”
> > > 
> > 
> > That's not the title.  Why would you mention the title and then get it
> > wrong?  I'm so puzzled by this review.  Is it AI generated?  Please
> > only use AI if there are bugs, don't use AI to comment on the commit
> > message.
> > 
> > https://staticthinking.wordpress.com/2026/01/27/no-ai-slop/
> 
> Oh that's so good, mind if I add it to my bot responses for when it
> detects this type of thing?

Go ahead.  Absolutely.  :)

regards,
dan carpenter

