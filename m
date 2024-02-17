Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020EE7E587
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 21:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708207122; cv=none; b=A65zWQBew4FW3zu/BzxjDVixEp5IIEOsysh3SQYPaZPWDHvPyyanXt1tViGz994UaebpaFLrjCXqoTY9sdahbjMRsVrbfQcGz7slD1OCZb9Vfs0RxbrRJnUCagdErBWPnK5O2hCy3GFh1koJbqbTRgCyXjHJkeLSNms1QgkTsvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708207122; c=relaxed/simple;
	bh=ywZlTuum4wD7jSFZh6uqgulvkk0AYR4CsjB1nx0/r5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPrPxy/5u0n8ibBAw5jdM1UE3b9FXP7htwbrRbejTGWcIRoQNAC3m4cVtKkYplE4vMhcl5FFauHVRBokQAoErLrtmJBFdJkqD538Cbfr+9ELC/W0G8wWWdhTjFl7JJGerbE4yBMV4Wj7cREoCL0FvveoT2AvL7eWsmLG3TNqWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SvnPCAOs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SvnPCAOs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d51ba18e1bso33398595ad.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 13:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708207120; x=1708811920; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2udDkf3nnvuGOZcbthLGLXbiEAUsVkkHJpuyz93NVo4=;
        b=SvnPCAOsStpEHAd5Gz6dw+Nv3pKtzA0lv7NfVvCUBZTlqFottAbi4HebAOScr/JOQZ
         A10LURtaSfsbjSd3dxij0xVuZzG9LLhDpsWSY0pfeKaMyY5nPtQVYQP2IWizyM4Mh+jc
         O+sTJP9GxKFlodNGK8Kz4mvoJTvXU/jqpmx4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708207120; x=1708811920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2udDkf3nnvuGOZcbthLGLXbiEAUsVkkHJpuyz93NVo4=;
        b=bpGkxzjf88fpb7cMkLINqwVZ3uh3slLxOgLM0rBb8MXl/WR7lm4vXuMNNqIQNBaMvr
         e5umvMgmwEiLRY0rmZwadbnT9TXL1hAW2avHUqYBVfq9hDapPT4XVhBlzz9iew7YDNX4
         etYvQMRheZfOPNkfKrYjXqU0IxQzXx7N6JU3kn4z+lLN7TL2gXuLcNj2qbXiBgHxAxkp
         eM2DGwkJAPm4b59Udw5+LGkIfpd4qk5kzRihKv7QxpS8T7Qfw4+g10uCWV6gb33xqRK9
         aOvwdnlH3QL/l+hMH8pHxAc8FPMhGHbxYx4ZtojMwuVxNflUmA3wy1ZJxB4TQhETmcg9
         d55Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHvQ9MSH7c6YkWFJEcJUn+w8eopJQ4uCHIhaeRUC7rrd/r+zc2hOkkoBRMAslitGlMMD80TLu3+YmKzMIQy3mfqvCMibMb7dEiGwJYVw==
X-Gm-Message-State: AOJu0Yyjl+SoTyhuVv9sitP5NmRkvhsmHwgquMLgIU1wbOZ/MeA7OdLr
	2qwvnE9x01XenzGOVGo3arSCpOeBVc6daPlwcU5gBYWowpZrUivj5H5PkFgMfg==
X-Google-Smtp-Source: AGHT+IHOMhJGSekMFv4rEX09CV/DMe6NhlrWe0tPcvwNf9MdbYiiO6SbhgkLkSoAEiSdMjj1pRgGYg==
X-Received: by 2002:a17:903:98f:b0:1db:b495:1391 with SMTP id mb15-20020a170903098f00b001dbb4951391mr5503536plb.36.1708207120363;
        Sat, 17 Feb 2024 13:58:40 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id mi11-20020a170902fccb00b001db608107ecsm1865857plb.167.2024.02.17.13.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:58:39 -0800 (PST)
Date: Sat, 17 Feb 2024 13:58:39 -0800
From: Kees Cook <keescook@chromium.org>
To: Alex Elder <elder@ieee.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A . R . Silva" <gustavo@embeddedor.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] greybus: Avoid fake flexible array for response data
Message-ID: <202402171357.E671B5589@keescook>
References: <20240216232824.work.862-kees@kernel.org>
 <672fafca-547e-443e-8dd8-80ccd2320767@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <672fafca-547e-443e-8dd8-80ccd2320767@ieee.org>

On Sat, Feb 17, 2024 at 02:17:33PM -0600, Alex Elder wrote:
> On 2/16/24 5:28 PM, Kees Cook wrote:
> > FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
> > code base has been converted to flexible arrays. In order to enforce
> > the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
> > destinations need to be handled. Instead of converting an empty struct
> > into using a flexible array, just directly use a pointer without any
> > additional indirection. Remove struct gb_bootrom_get_firmware_response
> > and struct gb_fw_download_fetch_firmware_response.
> 
> The only down side I see is that it sort of disrupts a pattern
> used on Greybus request handlers (and the response structure definitions).
> 
> I think a one-line comment in place of each of these two
> definitions would be helpful, something like:
> /* gb_fw_download_fetch_firmware_response contains no data */

Er, maybe this should be "no other data" ? Do you want a v2 of this
patch?

> And then add a similar comment above the calls to
> gb_operation_response_alloc().
> 
> Otherwise this looks good.
> 
> Reviewed-by: Alex Elder <elder@linaro.org>

Thanks!

-- 
Kees Cook
