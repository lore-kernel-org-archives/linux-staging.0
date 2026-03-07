Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82F2459C9
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772894652; cv=none; b=Xgw0FhxDwk3mb6Sc0dgx0UAXXqiXcil4m1fHzqs8637UC2s5YS9kDxdrKUkFQQOnvBQtho4uIN5HjQUEyyzcogIqIrPEZjg62VQdztNuiKgE2XZBB3r6XCbfpyiKPxp93r8FC56vvYFZYFCmPANXJJHRZdn2UucYwwFMLRl7+c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772894652; c=relaxed/simple;
	bh=s5D80duEhfer91OrynpHJ+oK+KbxEzXuy9AKUJMhQJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIc+yQEGQpSr596VJp+7sz+AhNvnE3bi2N7up6LOGYkBuuRhVHYHRJfyXf8kkNBmVhn8S+gv8xyqwjP95h1v8JUQbUYdIoOcFVuFzom8idn3XU+qumZX5glaXw8HRmVOqn6mUWJKobNYrMAsYRDtZDRofJAxZLjdVsrOD/uATFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gplUdUYj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gplUdUYj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439afc58ac7so7324637f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 06:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772894649; x=1773499449; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0Woosv//31tm6oZiSnSnGD51f8ZcgGW6Us1yWUdGTI=;
        b=gplUdUYj+QpM6F3es1bVsDgl7L00jSDs1g21LUSeUi10X65e9l7Rv46NRYpwqbjxgV
         C6Qnjhwbydc9D4JvCcuTrHGngMN5IKgEQYrZFLdZyHomEgLFBtmYjwDimb3Qvn1aav8g
         bxjKmiZ7fjLsvQMuWcYcI52lD55sy11h/rfVJEO/YuRzIsavs2CdjPUtP4LZlEWCz9vm
         Rue8/GErbX3JxWUihw79tZp5G9TWhW8FBz7De4jAu2TYOfY5aRW4i74wpr705ZSnrm7E
         8tYxQYQSKv/4yXcvJQVsoA1sCec58tJusDDc2NuknKBQAmaCEXlqhKBdDyDciD3fKaxz
         3cnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772894649; x=1773499449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0Woosv//31tm6oZiSnSnGD51f8ZcgGW6Us1yWUdGTI=;
        b=qqyME+28J7fG0BelrmdWE0XyG23U9yqJH0oW87Z0OkQja7KT0pzcI1sizgX9XldZQo
         qr2C+zxLFbhH2gs4Sk/mBuCyC5M/9oGq0vNe1NV45If0NBuQ8hLjaDBSu07878bOOcNN
         Oi0PSXpD4vCjfxu1bD5C9i73KkT9f1LYWlgOQD8yv1GI26etFzIwFD6wTV/OBtfImG0Q
         vGJQ77xG0Zv3akoA6pA6Jc0YD+b5hr909/Ut9W9yrqnPlz4BtXKgew6fV1IXE8YQtUe7
         hQSYht4wn774DMXvc9AIDNP5AHzbybEJ0CUGS4j09u442vokRXoTJHm5jsllCwAeGhcT
         q0gw==
X-Forwarded-Encrypted: i=1; AJvYcCXAoCZHxYXZG8fJkar0ZLiIUFV1z3pdgLpP/exV6rG6gHMjB4eGW5bKfuu5MTuptjjfSShYZEzcV0V2MpYe@lists.linux.dev
X-Gm-Message-State: AOJu0YzrRMQIBlb1CbypdzBF9xK59QpGbCUYPNuTNbpb1SBQODvoXcrx
	gzl1NXMMilBYoN4j7N4nCNbMiaANxwldCxaxEwivCnzB1vegn8tj8oUEFURL5/FiQ0U=
X-Gm-Gg: ATEYQzy/5LUltezGjML2IDhCrwA5tiwusORIgiZt/qhE1qaXncF8JeB+/3sSTVpBdgE
	miZNbZGhYwMhnEVuE8x5M80/ibehBmt/FRx076WwLkTiS0sn/lbE92vzRAb4+ZyKBOU76UQXVbm
	DBmPadZm/m5MrT/TAb9lAtyJKTquK3mj6FWa7VLgtZiTkm1lWX4rx65d5mJhrSdKQ6OskoQh4yZ
	NsTxKyvnHZ8tdViELY01aeQUPKBpeJ2mWHV2/xGhkL8bseqqs8uXiaDXLZwj7it/JQd5Q0HRU4F
	knfmPDgSbCd0/g/skLARunpqfwyhXT+otgRQ4BjUPEY3jCnxeAwjFr/jU2Wwxim6XpnTupd9RYc
	nl2mBoKtviEkrBaSr3UZ2XTNXRqvQXvqPwUSIOKhP5ZEHP/YpHNA4YE7ON+hTBnyS13T+1+dQoh
	wlZlc47j718WLnfq/vWUzm9Kwn0yjo8zqcUxwh4W4=
X-Received: by 2002:a05:6000:4027:b0:439:b8b2:fad0 with SMTP id ffacd0b85a97d-439da555606mr9905810f8f.5.1772894649084;
        Sat, 07 Mar 2026 06:44:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm11931501f8f.26.2026.03.07.06.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:44:08 -0800 (PST)
Date: Sat, 7 Mar 2026 17:44:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] staging: greybus: resolved checkpatch checks for
 light.c
Message-ID: <aaw5tQ6-QMJxXVIU@stanley.mountain>
References: <20260307140930.1732-1-rchtdhr@gmail.com>
 <20260307140930.1732-3-rchtdhr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307140930.1732-3-rchtdhr@gmail.com>

On Sat, Mar 07, 2026 at 02:09:25PM +0000, Rachit Dhar wrote:
> Added comments to mutex declarations, to resolve the associated checkpatch.pl checks:
> 
> CHECK: struct mutex definition without comment
> +       struct mutex                    lock;
> 
> CHECK: struct mutex definition without comment
> +       struct mutex            lights_lock;
> 
> Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
> ---

This is a v4 so there should be a explanation of what changed since v3.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

