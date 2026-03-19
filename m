Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EC83A4521
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907177; cv=none; b=tacyn76AppbDZ9WLzCQLTTd8qCX04UetmEucPso2byvH+sIVhZI1T1mFLabXUgkXtcUeoN55pMjPolBVhAXe9dq4rfoFagCFsZADuvxgy+T5z0efdTtQYYbTDYqLQIzpV6INWDUH07T7Ydr/aBh9J1kBg/y97YFR2LW6dWIcxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907177; c=relaxed/simple;
	bh=ELCzqXit/oe83VIDIh89/ZDRU54F/m5y80ods+85gAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E98Vbb4AnFyYKrPYm9zEiq2wv7a71o9Exs5u5afPLo+7R73FbD/Ump61t1o5JSAqPT9JLT55zCoaHBE5VRrILQDpRWiOkcvI7G4vc+ip00VuYWohKQ0sgWf1KFtsF3SX4FS/aj7Xw7MgJB1xQ+1deWKiVxdS0i6qTfpZQdOIC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qerww+jC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qerww+jC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486b9675d36so2540445e9.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773907174; x=1774511974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iSK5A1S1NLHAbiNruCvB/8A9CPcmcJkE4A1kCXD3HQw=;
        b=qerww+jCOHQCMUsNCC1/QPju+KKtVGsvo8DJXvuqmx5rV1PYxsV8PKWpKDR0/B2jso
         dcn+hUfZbieOZqMLFKd2scfixTa0arEPhRUlake4HfcWJLaefg1kXhM5xyofchjvBUmk
         CMmBz6bZX/3nMzPkGyijT/xRU2sHrGoBohFaTf3BTAcH9wgOBXbpPTkgiHNj697OiOuJ
         SMH/qBXU5ptZhCbos82m/X9PV0XsOSgJSf0L0XbiTKyW82en3R8YyhPYnh8GESF17Z8L
         mGyO72NHjgJiDyiqA1vyTZyMVPCBN9RjNiJ8rTCbByrZMf2pTs8eFODcBLgqTsGv/IU6
         djTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907174; x=1774511974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSK5A1S1NLHAbiNruCvB/8A9CPcmcJkE4A1kCXD3HQw=;
        b=J6CStYwKDd00YZzfclqdh7Lsq+FtIy7p+43IGtP3ZLAN0wXrjB9qym3sPqHR6jMVHs
         +DpEV0La5UdWcxs3lkLwCrwNb22gsd0AK49ByhVpi/2VPhd96yt7OWcEf1Gxvy9HsS1f
         +vr5f2Q0nqf4ei9BGbaCzyfR1x+d/KtfobnX8pLc6rb3Bg66hDJ3YoAUbmuP2uuhmQcG
         m1ojTcKwyP/H1+oVcTUpdWabMBfRQslk36RpZDAL6xlzDRVQs8+nEaWEQn8y1SPgef6p
         2YC7nU9zHw6mJTOxJQNlCODipqMTIuK/EHTPDJSSejk9dUp9jjxEDMwtVDd6fR3hgFUf
         45mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmSvav5S7S2g7eRXVTg7cne4sAjjlUmh1CtOKSzL1JrLve7U5DsMP7z2rBy879NWYXX7P0RAZxa+6AvtpF@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjzq6KBR+6h/qGR8+zU37FgC7vkL1kJywH+WRS/Fa5/SybyK6q
	7M5fGGcZdjKIK+fhGTQ1HCAImocmRJlivrZD47dqx9aK1Iy3AYJoYsen6dbPBOMwdeQHlWpttkI
	Bd0FU
X-Gm-Gg: ATEYQzy9mHimilQhIxB18A6oNdKBB2biQzmHuWU4Gbf6heA9tQAHey/Z125Bj6uGr09
	237WZ8/2k+yYdwrSE+2xEdgqOwpQ51lIl0KY5BVuhBlxlO7psgkxo02UokAOGG9MqMCBwa2Gx42
	HwtZUHLdd9XXxQse5Ny8V8REyiYRzNjmQvQPnHrhrJleTb02DoDrxjD96Q4/aXhj35Lmzmqvv6F
	zFSngsQxoTndwTQymcCh4MwXZJ7X9VQQTqTPeZXWzhNn2NChTakG5vNpPR3OSC8UIZGBeK9hAjP
	MNeVHda+DcFx+hAj5u1trnV/JrxffPmRMo8+pZjGSUBTiv8c0Z7aCE9S7GK46i3jJpmSqd1XBOT
	HBHo4kSQpa/S/tlGsRxlNcBRmfU++AaOJUXjH/PvciOY0uZsi/uWZNkOaA43FfrQTYgIryX+5Of
	fWH/JK3jyUEMa2hZVZPN72WHleXS3H
X-Received: by 2002:a05:600c:1f11:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-486f445fad8mr98623725e9.27.1773907174592;
        Thu, 19 Mar 2026 00:59:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f466701dsm69781355e9.2.2026.03.19.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 00:59:33 -0700 (PDT)
Date: Thu, 19 Mar 2026 10:59:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lin YuChen <starpt.official@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: use guard clause for AES check
Message-ID: <abus4pKF0ykt6nhj@stanley.mountain>
References: <2026031810-kitty-untamed-2812@gregkh>
 <20260318215124.22612-1-starpt.official@gmail.com>
 <20260318215124.22612-2-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318215124.22612-2-starpt.official@gmail.com>

On Thu, Mar 19, 2026 at 05:51:23AM +0800, Lin YuChen wrote:
> Refactor the AES encryption check by using a guard clause to
> reduce the indentation level of the subsequent logic.
> 
> Signed-off-by: Lin YuChen <starpt.official@gmail.com>
> ---

Let's do it a little bit differently.  See the other email
I just sent to v1.

regards,
dan carpenter

