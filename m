Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D603E3C5DB8
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694831; cv=none; b=Edc62BIHANIc5LQO0oTKU0nNtBTfAgpUUyDPQz+tCfT5Joqm9LlECEvNDGl8pR2tFWKxpdzOfNXc3SIGkc7fb+yJmbxEZvUHZ6Vyu1DXvi9bjWqVUIpJ5ajSA7yzvxJjhg6MNjysdGTmRPg4GGSj7bNKbJjdXo8BenwmWZOKIkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694831; c=relaxed/simple;
	bh=JmeOw989Ii+YNJAm7GuphtKEYNddmDvGiUCwoY6MGLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gi42KzuVKLf3hoXm2nihGBQHHVZHDEdyJgdmGDEUPixOEjzm3E/j91K3FmqWXrAd9BMJ3Ql9IZWROhgWe0+vPhrQ3NjVtuyy5SQcLhNiVlpu7PqT7T3GsyAeCQwlHtt3kDwGdmnGMxeOpqvsXDkgI4DblbZHS/ulvW6ArD3mPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIB9y0Nr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIB9y0Nr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so36608955e9.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776694828; x=1777299628; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xn6gG3lmWAIV26Onf4TDKzqGtizzY94BWkPWcIHkOfs=;
        b=dIB9y0NrmlLgZDC3XAISwgW24Z3TdF1bDaya7I+AP9V+vpfCXhWJQLUHy7GvMSPB9F
         aM9rnVyBmYNu+5JkNfVJaA5NkJcJ8ClVvnh0EiTHqOkuCmVCyNaSYoJY0ffbtE/jRDd9
         3IPQ6hLN5JM5+tHX5Bf8DX5gGUPB/bVjiBYIbPES0Vhe4P3AN34Q/24KBKLU5EaF3SAY
         c5ueIzCvbT8tdxcw9FdCFKJ4HIWBQKupYB6jBHz0uvjjkdqm04fGkzsmmmxfrWgRAg9j
         8hRDwTtC2cC7qp+RjcpWTkK+AwaxkITevRpP7d/It9JHDVpwC48P+ZV/97ra6pU6SFPh
         K8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694828; x=1777299628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xn6gG3lmWAIV26Onf4TDKzqGtizzY94BWkPWcIHkOfs=;
        b=iQ0tBcUTjkkm/PTh58IdDlkH4kz4DeF9CwOUPWIv+ck5oQY5FB3E39AVjts63IKq3J
         2BcDmq5m6H0+Y+e8Bfaz3sQMiGf0JMjGJU9MXm/298vr+IXunZTZvhdK/JRb6zqd2YWq
         TnJ+53+ZjCYe0lsE5j+SH2uHyUuZr3u1/W6HPEkxwhghQPk4JKOLvvLZiLvjNViVGlX6
         gW/vY2ePafWtx/RF3pg60aK9dustY/oRWNR/jokeNW6SnKFwQV9abDTDAycrmsSGR2XX
         wNUxpUxZ40H0B6tpWHZjVHU28MJ1U6vde82VtTHXm+Q6smPsZXa5zwL2iVWEFwmbKOxt
         R77g==
X-Forwarded-Encrypted: i=1; AFNElJ/W+tPqrEjXV5KUuyZsu0ePOsXKKeAukCJTDX36yHuYnCm8umHN5Jpv8uC7LtuwHApc2XNYYInz9o38ayew@lists.linux.dev
X-Gm-Message-State: AOJu0YwiKne703ZKvCAcKAPuQpmgB0+OXiAJkJYDtrajQ0nP00RjmfU5
	VfGGX28fZ2dKuVrRozEFj5k5LfppMa45xEw79P2HtE+HWhz5nX2vYeWO
X-Gm-Gg: AeBDievrcBqi+mS+bdL3wXT8sePzi0Yte5uDG7Ql42S7spaCJ/kVH5lCNHc/QEcr+HF
	m3iJBarSIK6rK4TGpV1sn/eMGQGqPqQvOsjduhrnz6dx4qSQ3xEJ6NDATzV5GSbRWdlAo7Jya/X
	IDJN9EL9nDA/1GmPfUCHbFfxyRIuV8CyiRDWAoE9MtOdZSyqtBGgg46vsFnlmWOEe12YmqMMwFs
	W0V/dL5mShJNZycktUm3N9d82N+uLqSPKTKg7dviJEaQPsBzp/HkbEtxhh3gaEBuZ7MVG5tQUto
	zM5TShgqQmJ4CEJvykgFjiaHFzpl8wmZEgqo5TE0fRhd5qHHSusbB3h+Gc5/oN3YPF97JSISz3v
	6Eo+J3TyoXVkBLrkwntQiJwxKe34WsKJ7M2ch+YQIMEFy0GpO4djspa0Dv2d2G9OvjJLFtq5gL5
	eWlaFAJeN9IdebI0JmvxCTSuKA/osVaw==
X-Received: by 2002:a05:600c:1d19:b0:48a:525b:e157 with SMTP id 5b1f17b1804b1-48a525be257mr26409375e9.13.1776694828164;
        Mon, 20 Apr 2026 07:20:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm59731985e9.0.2026.04.20.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:20:27 -0700 (PDT)
Date: Mon, 20 Apr 2026 17:20:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Minu Jin <s9430939@naver.com>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>, Ijae Kim <ae878000@gmail.com>,
	Taegyu Kim <tmk5904@psu.edu>
Subject: Re: [PATCH v1] staging: rtl8723bs: fix stale recv_frame free in
 recv_func_posthandle()
Message-ID: <aeY2KNbFP6rCQnd6@stanley.mountain>
References: <20260420042734.3685-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420042734.3685-1-dbgh9129@gmail.com>

On Mon, Apr 20, 2026 at 12:27:34AM -0400, Yuho Choi wrote:
> recv_func_posthandle() saved the original recv_frame pointer before
> calling recvframe_chk_defrag().
> 
> On the last-fragment reassembly path, recvframe_chk_defrag() may return
> the first fragment as the new frame while freeing the original
> last-fragment frame when draining the defrag queue.
> 
> If process_recv_indicatepkts() then fails, recv_func_posthandle() frees
> the saved pre-defrag pointer again, which can result in a stale pointer
> free.

You seem to be saying that process_recv_indicatepkts() frees
orig_prframe.  And, sure, that's true.  But then it returns NULL and we
goto _recv_data_drop so we don't hit this path.

This seems like a false positive.

regards,
dan carpenter

> 
> Free the current recv_frame on the failure path instead of the saved
> pre-defrag pointer.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

