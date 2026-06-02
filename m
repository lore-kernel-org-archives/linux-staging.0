Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA433DB32C
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400237; cv=none; b=GWUVGm166tojg8dAQBZ0cC626wC5/ngs6vc1+Ttac929T9mEOTmXptT/iljItgWOHwE9D9zvS3y/a1M9lKGUz8meBfsjl0oaFEfvy2b4yheTbrArF3DWElLov0h6UoNEm4C4AEncz5YSVStPYkfOBbFM1vx9QLKX5kfvLK1J6H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400237; c=relaxed/simple;
	bh=ps4yH+Db5XhsFitr1uHn4uXEyLSd4Kgy013qVDKCZv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/ArGHEnZ2w5l5ZPbworT7ER/F5PA0HCqRGBJFZUdk8zvI/GUq5yn90ejXsB5Fbn5HdkkPNUw/SZ6RfbPHFkDI0aApilDaSABwAMXciOBYOAktnw60AImZZUC0znGz4DtkM0seqCWsE94AjqTedQ0YR//FIgmhs68oZ6f/LO2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1UMeW5N; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1UMeW5N"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so12881631a12.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 04:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400231; x=1781005031; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kp2N+zLjOHElzwSmf9nw0sj5KvOLM5toSh1xc4D+fMw=;
        b=h1UMeW5NQpJYEtJdkKcruG5kAa86H8bKdoSQ9lSRsIjuoUAVfuJLyIopYluIBymmmj
         kfEC4Cm45hrwDHyYdZm5F2XMHU+Wm0qZOtBFciYCO+LNkOWGQUH47/SVJ+y8BqhlxkLW
         TX70AE46DMBbYrKZEk7MWtAsHyPXov/5SpS30ik35aiRLuXOcqh2VcmSeLahFqbBBPMB
         ZY2/vqiu3ympX4lJO+zJnsciKlfxsZriLeIIFqqNbV6Wf0xSzIYpGFQFlaQ7furC8rII
         vZmuM13xArxh3wObdFGVc+YLFQgL5/40R8+8NOoioEzx1j/z9rhHNidT9sR6N/+hHLT4
         hoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400231; x=1781005031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kp2N+zLjOHElzwSmf9nw0sj5KvOLM5toSh1xc4D+fMw=;
        b=QQK4vnZJ7MhOVb4SaD7RIIOazgovbww3CgmXz5Ghe0A3SZ1J7sT8Gv/7vGXEJtBG+S
         Bw0zlVP5ZpG2Q0auliM8x95LdSd4lyZ6DFRUESFj983cOXyCYAV49/sTp/k/aqfC/+TO
         K5P7oIvlwYYesqd+fjn91YMYATbWkRRTWyr28bEcp9UGVV4YUvObF1UbLTGUvNkSi5oF
         L+yI8RLoZpBmuBhK8Y/ZGPrWS39qs0i7yUcAAauL1DpIDkVaJKWYt79tR4Xb0dv6wfu0
         gaAuMDtHJ30UXTXwproH3mNcmXHjj2l8C0/+mm1K087Gwg7U3Qtg2aMg/48+rP47R+NL
         ok4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+EJs3UMQfFNl8Ps/5vSCoH0h+AmqXspd3iLeKFhO8oa2rlhJS4bV0LeZwcDqxZxEq+ZfI6Kle5xAyqWps3@lists.linux.dev
X-Gm-Message-State: AOJu0YxrG7YrZblyq0uzRbEtf1mt+z536m+WgaQAN1QZ6A5z1yfzZbus
	7MTq5FyySElLqtWIijXzYpyDUG2CDNl1eXferuVFYZYpXbZV5SjEUcW6
X-Gm-Gg: Acq92OGzlFUg9QSEe4PC6g7X9CQHedrVlKoyP1kJysvhyBR/r/jP7N7UGfKfPtoMj3q
	0van6dPfKWkEvO/AovYKBqef33TBdbVng5tGpgW9veP4vQw7S1HbqCtt3rowRcF9/Cuszm4huDD
	EmKeOjqTJUGwezG2VdqC13no/BbKWAdUo/s7vf0caseYo+ZvlJA/8S13JZEFYxIns8Gvg7w95E6
	pIQi+N9wcRsdT3OTgcusYWVhVST939oAKU12UnQV+v5L9obm5xLL7IVtvCsndRfrCQzrS4spG0Q
	0aT9O0x42bQjmrkZ4XmQY2WFQRPbXbhXP2xU11Ky4aviBJMMcNxsmTP1Codes4h2uXWV2nUcum8
	7Zgml3RCKikJYSbEYMa1udqHdCYVyrO/zJZDZhov8DcXfrrpetWs8MtRbWqHai4RNKFxA2MsQkk
	h+IfPrXNokbqrdARDIzunemtFyGNjtnQ==
X-Received: by 2002:a17:907:3c82:b0:bd9:cf0c:93c0 with SMTP id a640c23a62f3a-beab3a414dcmr918981966b.1.1780400230323;
        Tue, 02 Jun 2026 04:37:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bee4092940asm189298066b.11.2026.06.02.04.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:37:09 -0700 (PDT)
Date: Tue, 2 Jun 2026 14:37:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Arihan Bhor <dogestad24@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Jacob Feder <jacobsfeder@gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove driver
Message-ID: <ah7AYukZ5uzW1NVU@stanley.mountain>
References: <20260602103208.15799-1-dogestad24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602103208.15799-1-dogestad24@gmail.com>

On Tue, Jun 02, 2026 at 04:01:53PM +0530, Arihan Bhor wrote:
> Signed-off-by: Arihan Bhor <dogestad24@gmail.com>
> ---

I don't think we should delete this driver.  From reading the git
log, Ovidiu Panait was obviously using this code last year.  Let's
also add Jacob Feder, although he hasn't touched the code in 8 years,
he still might know if there are other users.

Also no commit message.

regards,
dan carpenter

