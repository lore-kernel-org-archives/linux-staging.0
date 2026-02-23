Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F7722332E
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831958; cv=none; b=laWfATdy3/HzjDu1vlpAKsoRwcBie40ITViuif1x4ymLR6/K8SYSAD51DcUOUhayAs0voGZ57glB+3awNwNG5E7/95uh+hduFgmjASGdOdp8XsEtr2k7qrql5ICPTNvJ+8vG07JK+1yM5ydw2nIAFR5l4O1KUafn2UvEZPRzfLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831958; c=relaxed/simple;
	bh=PvbDrgjMqskHg6FOXDs44TNWgdIfcNAEdhkJQLQRQxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLFNeUb1A/4Qb+U9YQiayBt7L2euhV0J1D+V5M9q242vzXlBXGDJQeDdCXO/oswdS8XyrmgUNS9oNDjX6F+TM2sl0bFS8JkOMJljq6ReLzBfb3kNaisBnONKR1J/M2ULrgUOmJJNrk2Sfp6apebPLGFMk0mLftwQZh1mphexoRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JitH7xfC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JitH7xfC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so23473425e9.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 23:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771831955; x=1772436755; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n6CGQmSeC/8d7YXzEWFhZsk3FEUZiTNTyafXM+HHtyQ=;
        b=JitH7xfC+ORNMCjm7wrlDYviatpkelrLpHdG+0EpBnXjUeLCoUgPSnoS/66CK/Ngp6
         02FSDq58UihF4AGR0Jo23Y7wZwoSfUBoQdVug4uyXa9pJVaurTskvOD/oRLIMfcGH3vp
         qBvxyOdOIgv/8fSHGm8kJgpScQI7vEJJagVV28jR7v8k1DHye9ualcLmUBc3VfnQpaOs
         yNe5M+u6KNOEi+57bAnQQOC/Q4IjVKxKMzszNuxTSGwOvclfC22NNsVnLFY7b+HpqXfy
         gfW5MHhFxoQv4BtiJx0xzr5HKrkFXj5T48XzmBzD4oUh5p+Rsx2igyWyR7rBKWvvHFRh
         l1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831955; x=1772436755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6CGQmSeC/8d7YXzEWFhZsk3FEUZiTNTyafXM+HHtyQ=;
        b=rmaVawuuGF6E3KMotJguDPJXmNzp8Vkg4cz2Vl3+bwmqvFJhZsv4+YdG03xz7hEULB
         pNnw6aGwDY0XdrTsd+c/BjOon66b86p426f84QGFVKcc68XCCKz0lj3LH9eBO48DU5N+
         iC/h/GsSy+Raama9Zw3gn/oE3gN9aKE9akEXIrs+vCPOa7T83qoy8WItn2u4ge8r8xLj
         wBAnFFfm3i3aKHSv2U/gXa4a/0GPOIg/tZ2lRJ+H9IXvK5HmfVocIqmPvbO0UwIc7n1y
         tTmWPbBKC33daFM1UheIcbJErvSI/0ho93ITpTTZaheRBLhrrmXJSK6n0EHenLoRvn5/
         sYYw==
X-Forwarded-Encrypted: i=1; AJvYcCUwCflZZv87YYjVhpvr5bRXVPpMY6uBsT5ic1VNgcMXfLdAnNn6MNIkeMI2jeGrTyF8nv7Mu4JpgHUR8hiW@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0vvGlh7Iold0aVW3Hzhif0UUFnyQ92GvaGpM+A7teVoxhT57P
	dVRqr8QwpNM8C8Tfnn+hMmMrLkFDAMRQwQgTxxPwB8n9JX291UnHYsznWxRKNo5fobw=
X-Gm-Gg: AZuq6aK7M9u/k4FJEGbquIHRQotvONneCBSDxsXCkwCsUsfMIVoIm7jJLrk6WDF68XL
	e++CIuwp+QpyZ4qMVfP73sMlFGKT/3Ae0mZImQxbe9bmxRRVplCyIUQXg35/T/KqiLirzwKigde
	PtfIsTSP/Jy7sJ8FGnhFhtKTA5U3okeNf8WUMOnT1+d60k89/xnu7sCObMwYUA2NA7ZSyUDzQ23
	aoXlDN+067Bnh5fF93FJpCtzSVrZ8ra7jGgd7aLqaIR4qLY7Z4gcctEFrtkQZ04Kmhbp7X5JeRv
	7UsbliIVluvzntcZvJ4dbeO3Vu3uhoFlwZ5ywvF8MpWtSQf1Y0GVx7hphHvaSeycMZpSxVlY1KO
	Nb37kUEhKwVGBeXpgGxresC0ESxQrXVjPM7QC6zFou5B3vfVBcv2LVjrCHzxRWDaLQQRLIW0zST
	QidyZoaMqmXF+vnIO6gYRJHVVcMkL09v8phQdQpSc=
X-Received: by 2002:a05:600c:3b27:b0:483:702f:4641 with SMTP id 5b1f17b1804b1-483a95bd842mr116765665e9.3.1771831955135;
        Sun, 22 Feb 2026 23:32:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b6698asm290515395e9.2.2026.02.22.23.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:32:34 -0800 (PST)
Date: Mon, 23 Feb 2026 10:32:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Priit Laes <plaes@plaes.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	=?iso-8859-1?Q?Rog=E9rio?= Fernandes Pereira <rfp2005@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] staging: rtl8723bs: rtw_ieee80211: Reduce
 global symbols
Message-ID: <aZwCj4WEeS_B3FzF@stanley.mountain>
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-12-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221190628.50273-12-plaes@plaes.org>

On Sat, Feb 21, 2026 at 09:01:41PM +0200, Priit Laes wrote:
> Mark internally used symbols/functions as static and drop some unused
> ones.
> WPA_CIPHER_SUITE_WRAP/RSN_CIPHER_SUITE_WRAP are left as commented, as
> these might be actually useful for understanding the code.
> 
> Changes since v1:
> * Comment out unused variables WPA_CIPHER_SUITE_WRAP/RSN_CIPHER_SUITE_WRAP

Put this under the --- cut off line

> 
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
  ^^^
Here.

But really we're not going to allow commented out code.  Just delete
it.  There are reasons why people would merge dead code, such as for
example, in some cases code needs legal approval and it's easier to get
everything approved at once even when it's not needed immediately.  But
here we're not going to allow it.

This would be easier to review as separate patches:
[patch 1] Delete dead code.
[patch 2] make functions static
[patch 3] move the arrays and make them static const

regards,
dan carpenter

