Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09B01C05
	for <linux-staging@lists.linux.dev>; Mon, 17 Apr 2023 08:04:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id v10so6681639wmn.5
        for <linux-staging@lists.linux.dev>; Mon, 17 Apr 2023 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681718649; x=1684310649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxAVc0ncUnjPKeybMVjKd5qlxZDMp8oAMzg8SofTCCg=;
        b=CAKf/vDt8JEBGp0mnnx5TlC2WmrwGF+A9JBXRln52KHrtc9rD+bXz46fUMASfxJnTt
         rkz555Z+QrhLasN8SSjr9Ae5e7g99errmpTjhcYSInlAWWoGVnAr9x3d9HAXC5I17+Ji
         iixNE8eqUHvKXVDOknf/NJBq8SHchC6FVsoVcjcyxNZE140E1OpQ0TfTEkuq/H6zXudw
         jGpxBG6f9Z+DU7i/VQEh0XBVW5xdaCTmnQlu1hp8AgwPd1ABZtTubLZ130oy7TEQ968X
         5gMxT4hrbGMFvcB8D4yVw7/afVm0JrthXGU9FuiIOU653DoN/jKp7bENCPw9SVinghb8
         HHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681718649; x=1684310649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxAVc0ncUnjPKeybMVjKd5qlxZDMp8oAMzg8SofTCCg=;
        b=TiKB1PXUu2umNFW9X1AZ82LX2hWk2QAkiAZAP1gJDKNaYNqCu5hKAnzgjVAC2m8s7U
         QmrImPXL9+QHHNNZ93Gol95GQi4dAWObIAtKZ3CXRdSkz55zvm5je6+sPBLbE7omRHHG
         K6KWWyqt9J9tzyJWEIFX0KCPeeFktq8wbCbZ+hR9S5Vizp5But31hj0CTdpnB7KRean4
         amBiUo6WKktbN+u4Dn5H12xtDo7Ikg7vO6mMxfYdW3rhrh2gK6biga0VbpUhTQcdaOMH
         6N7/zNql6/TvaAwOmSCx/1SaWjvOAh/hZwFqCTzjlwXoJgUNNU7aeX41NlblvoRC1iKO
         7tcg==
X-Gm-Message-State: AAQBX9dEQhCEFrfeke4QVO5WsHkzv8OoXbm5i5N58d85dUNQIl6I3n2n
	r7P8/ojIS0JMkFIfrGB2V0yMTR/0SHk=
X-Google-Smtp-Source: AKy350bvdQ80DHlW//KAd3GP1I9vxuwmVkjGlB9HPTLmGejdMKeM55i79/l8QkDjq1D7/B3F+Bjadg==
X-Received: by 2002:a1c:7c15:0:b0:3f0:b095:15d9 with SMTP id x21-20020a1c7c15000000b003f0b09515d9mr7262274wmc.40.1681718648924;
        Mon, 17 Apr 2023 01:04:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bca49000000b003f172db455dsm3366558wml.32.2023.04.17.01.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 01:04:08 -0700 (PDT)
Date: Mon, 17 Apr 2023 11:04:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luke Koch <lu.ale.koch@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wlan-ng: replace rate macros
Message-ID: <f44f44e4-25c0-4489-96e9-8ca63fa294d7@kili.mountain>
References: <ZDqwZKZHyZZX4b2J@kernelhacking.kernelhacking.example.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDqwZKZHyZZX4b2J@kernelhacking.kernelhacking.example.com>

On Sat, Apr 15, 2023 at 04:10:44PM +0200, Luke Koch wrote:
> +	for (int i = 0; i < 8; i++) {
> +		if (count > i &&
> +		    DOT11_RATE5_ISBASIC_GET(item->supprates[i])) {
> +			req->basicrate[i] .data = item->supprates[i];
                                         ^
Could you remove these spaces before the .data and .status?  Otherwise
it looks good to me.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

