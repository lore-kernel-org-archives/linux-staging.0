Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A8A31AA8F
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103115; cv=none; b=aceBjdzL7OLWHg3IyW4Spguogv9gUP6mYi2jEgKBMOYpvXRtTaM4RSXy/uAuBTBfiVxdvEuntPKyIqoOV02EyoHzI01iB09awmsesYVJ7tCE6KfGkxwF5PlqM11JikM+jlu1GBYDJCnYZMEqVHf1TLjNwW2E/i++T6Tv9mXEnM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103115; c=relaxed/simple;
	bh=HBxMaCq/NJdFxmKC2//u7xpLGvEuKWEi9QmXI7Kg0iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oa+MK9N0ah2olY/IyVQCP3Pfr3rvLEb0k/iHXzBikVQNKUIiRfyaMzbAupqFYmf6c9J44k6BmxKKF8GJJXWKiC9OrRYkUv4UUfzJ/KpyLrm+zjRqtmRW36Lw1xdXGhbfjQGTxZrFVlRaHrNaji1Req2lyBKbWkFSKgJiWI/1+A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nylBMGyF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nylBMGyF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso6363505e9.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772103113; x=1772707913; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yJGcA2XOdwuW6y3k74UEDq3C0s0YGCQS2cvP8WqxL44=;
        b=nylBMGyFwqvuaEcYtV93RSKaXhVXZ9hOOjpmBbEzpNGOKAFfdEYjuWm3oLDE9ViYuq
         YOjMXmYAJuBgUnSgFi4F3wPh1KZW00GaxWeDlEtbk9bgI9xXC2Z9bBROcLdFHSupTDmf
         etou86/WTQecAoKg6dbmdh0APe/mZzyZo5OhUZr0jgcC2Kfh9DuShN59F2ZENQCnMjuh
         /eyjlqut89aVZkgaLWjT1qCfVBwudodKq5YDCKsPClPDagcrZYQcKrxc4v9rdkHMRWBD
         wtEt3YwWAZ/eiS3T4WLqk4qQMooXRDJxENxzC/b9IpiBgRUwWvMT0sHeawr+kSkvm2px
         hKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772103113; x=1772707913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJGcA2XOdwuW6y3k74UEDq3C0s0YGCQS2cvP8WqxL44=;
        b=qQ0mZQpoYjp5JKXVEkkMB/0LXct/B7x0IiiiDAUjQ62clus9vc+Vt4kuCKLvKh0cDa
         bLf3bQC0bhKVV3NNckRvTRlruZEhIZH/ZJbSK4UYU48gxWaMOOczbNUXRRPt7grbr39l
         8IQXGzljkYB1rgpHtcDtdbIQjD1LffSCLSOasefqvU2Qe7OVyEeErDlznm7vkALc2HEi
         cTKPnc6SM6ACXagoOgShidRTnHv2H0m5ohfoVu5gxgiz2RcCmkwYXbJIkMvtyK+H0/bA
         tK/O0AUJnX0cPplObeS2EPsaGaFOYlHV6s5uDJzgQhIcS0P/L9q1cZH1oOo1TIo5Dwjl
         UoPg==
X-Forwarded-Encrypted: i=1; AJvYcCUtYDfHbn0by9er+oOBGY3kFJADN2bmgeh0Xgwf2URTcDHmoVgCdxKCFzwdY7ba0qRWrlizzHlH9TWvUyn3@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0tKf77AkEk+bed5SlEw2eiaayGfWm7lcTw/KXWo/wYwnXYdWq
	Glu2w78JS9xFMYucpM7ulfY4cCybmI1s7tJ6XH3ugtEjvKUBv13JkkbuR5YELnpvYck=
X-Gm-Gg: ATEYQzzTdEl5lEeDaAoeR8CKA5QolNibTLFpOhxcm37lLIPwX0wQJU2HUW5sOMV+rIT
	M5mAHV85q7TAIZ2A6rbRIVLDZ+C5fsy13ymMvDzFHhCyf6RTERc0TnF4fok67MnuNXCaUQ0kmpQ
	6Gj/BArKshT9AS6S+HGUpH9eUdptTj90GxnpmmFi8qxXZPDRIwOknhj/Byrl5Iy7oUCNEgwz6CN
	oo9MDRaqpOmxUDpChFs7vqeRt/1QMm3rmS8LZhPEWFvT4yT6bGuj16p32Qzzv/OMx/AiZeOaTkP
	XK7uR2plI7VdkIYSWm2NM5y5hyE3lBGEIZ+uVA8vzvMxCfOA/mYD+6QpU6uyfzmuFtxebyEBTut
	6uJgfHCR1TjWXDGDlzCxJUn1OfM4rcmfbcXOK38x01wUdhpdbAAyHaN4R7pmtL4Dx2ardHNxZMf
	362Nf0xsVshW87feUfYmWcSZvsFAPP
X-Received: by 2002:a05:600c:450c:b0:480:4be7:4f53 with SMTP id 5b1f17b1804b1-483a963d656mr343262285e9.31.1772103112751;
        Thu, 26 Feb 2026 02:51:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df90sm140874695e9.14.2026.02.26.02.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:51:52 -0800 (PST)
Date: Thu, 26 Feb 2026 13:51:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mariyam Shahid <mariyam.shahid135@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Wrap long comments to fit line length
Message-ID: <aaAlxYSqSaHtIDIq@stanley.mountain>
References: <20260226103120.32230-1-mariyam.shahid135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226103120.32230-1-mariyam.shahid135@gmail.com>

On Thu, Feb 26, 2026 at 03:31:20PM +0500, Mariyam Shahid wrote:
> Wrap comments exceeding 100 columns across multiple lines
> to fix checkpatch warnings.
> 

Not even one of these changes has to do with the 100 character limit.
Please, split them up so you fix one type of warning per patch.

regards,
dan carpenter

