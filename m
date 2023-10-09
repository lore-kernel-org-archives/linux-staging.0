Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C63FB2B
	for <linux-staging@lists.linux.dev>; Mon,  9 Oct 2023 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N11rX6is"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c88b467ef8so30090685ad.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Oct 2023 16:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696892937; x=1697497737; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZEAbTE1jnX14hR8pCQlTibWlz5S6mt8A6dPfKwpsV8=;
        b=N11rX6issWTASu0Stsrxi7V6bUN462xGqhz3gcYAHM4Edbe/63Tkg3tswF967CaBD5
         8zINprZIvD+8PFfz2fSZcaDb1P8iTeKGzuwbT6WbRxs2o5LuiG0EbnCboZ/Z1n5HTWp7
         yaf5+lMnEWP20hNmB/8GpsQElDH/HvDZ/UqbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696892937; x=1697497737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZEAbTE1jnX14hR8pCQlTibWlz5S6mt8A6dPfKwpsV8=;
        b=BQzwZUZtHhP4cDckKFlJmvcouIj24VCEljnPVpDPmw134v3tCjhnKhZUPNnmSiUBGl
         o0dyfvXxtJCrQU5Er/CfDdBtImZ9Ffy4KJSiRnboXxSl4RfeOtHvWYnX4ZU97lVXBhn+
         B+ekngXh2jMnXj72qhy3AETeFlWtm0G7b9Xufqp39Kg7JO2dMtHgDg0wGxtfRr/QLD4j
         ikG1+B3IDhAAfHzFMkbIduvcMONXjcvLGkOnAj5rNIGNWn6AkiqYW9BoXOxofDVtPMPu
         Ekp8grBrwTyYCMbd0rQ1vNSllLN29v6zokqAi/ScR5tz4kyvZe6xIYsiZ2ARCw14TfwP
         Z8DQ==
X-Gm-Message-State: AOJu0YwzMLkB/iHxLrMur5tg/wtZD5SlgryPyN1nEwZw16HDFAFruG96
	2aDaaHa1jXZZEq/nm4E4BiEZNg==
X-Google-Smtp-Source: AGHT+IE4bNEi4bN0RSOpbI1oO6kddrnbOzEwTunUzAyAEf4FA+FbGaK82D5lHzRVV9vr+ORb3iYMug==
X-Received: by 2002:a17:902:ec84:b0:1c5:d063:b72a with SMTP id x4-20020a170902ec8400b001c5d063b72amr16810663plg.27.1696892936571;
        Mon, 09 Oct 2023 16:08:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bh2-20020a170902a98200b001c43307f87asm10162365plb.91.2023.10.09.16.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 16:08:56 -0700 (PDT)
Date: Mon, 9 Oct 2023 16:08:52 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] staging: greybus: Add __counted_by for struct
 apr_rx_buf and use struct_size()
Message-ID: <202310091608.C892CFA@keescook>
References: <ZSR2O6zGyT/VX6ve@work>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSR2O6zGyT/VX6ve@work>

On Mon, Oct 09, 2023 at 03:52:59PM -0600, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> While there, use struct_size() helper, instead of the open-coded
> version, to calculate the size for the allocation of the whole
> flexible structure, including of course, the flexible-array member.
> 
> This code was found with the help of Coccinelle, and audited and
> fixed manually.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks right, "len" is updated before accessing "data[]".

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
