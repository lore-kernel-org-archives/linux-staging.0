Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BCF2F80
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 22:48:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g138so6750811wmg.4
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=g7ZjB0kpmQk/BmDkEZAy3iHp85Ka80jxWVGQUzXwpdQ=;
        b=xq+Cmew/0c+qC6oazsVxH2SIoq8IQvqlQ/WQwyY2SQyByvDbQzMWNVkgakr2iSNv3O
         I4M3f84zp9+fNyptuUurGasJ/oIVeqACRZiWY+kGc4YUmtd5LrP4rL5ztq2rmnbl9qbK
         LCzUFVMx5YjyOYH4JXVA8tcaCKW+lYlbxefOa1D2ORqpSQCq4fxHwsTXaKOr4D5yb09s
         yTbxTzK7cIVfirgr2qNl8UxcdqgsnnFlqM27wSmGrSZHvqWwsl6NrONy6dxILyrmWORF
         QrbbiEnNjWINqSMvSvSjpl1O3z6/Lr8BNhzP88UrrXDbaOlMWFVXa5Nyo4RZZ0hStjXz
         Yktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=g7ZjB0kpmQk/BmDkEZAy3iHp85Ka80jxWVGQUzXwpdQ=;
        b=R33X4lH0+/GlVqly+IYlexG7X5Iga73A6tGMWjRlw39iLLwqgJyWC4Dhbd6C5j+xmf
         T56xz91/RtXjtw2T3H/ZNIyYj+BDL0ocHEQa+3rHOqzerJpW9KAhe8C2AqKX6FQhP4pG
         0mTk+NE48QufdKS2NAPypBLPvYr8mFRE2a97AR9hkYeaKfDXVR/LMIfZowQAdW/Pc5RW
         8uqRXnXJQtVtlXkbzCTgBWGDA6FYV2TSv4pFNZn3cS9FcbDrfstbWscbOg1JlBoAZTwM
         HEa4hf8LdWal0RsIk/uDMZoJcr67wj5TRqoI5wlGVrGXxlcG/Zk5hDK8N/Gpp3PUMwyr
         dTJw==
X-Gm-Message-State: AOAM530SS2GjvgkO+RWSt2FDAiODtNZjhIDcgTXoyihyGIHG8mn6k84P
	y8lif2J/8idytbK5XKiEjEWP5g==
X-Google-Smtp-Source: ABdhPJyhrUsxC9Gz+ERvH9s7biHU1OcSsOShSbLFERwJbTpV/8hyLzlV10zkXkBYKuHJdIcP34+4Xw==
X-Received: by 2002:a05:600c:2281:: with SMTP id 1mr5960766wmf.9.1629499689361;
        Fri, 20 Aug 2021 15:48:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:dfde:e1a0::2? (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id a11sm7341504wrw.67.2021.08.20.15.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 15:48:08 -0700 (PDT)
Message-ID: <693326266015233ecdebb0df9ae06a76748f6137.camel@philpotter.co.uk>
Subject: Re: [PATCH 2/2] staging: r8188eu: remove unused function
 rtw_remove_bcn_ie()
From: Phillip Potter <phil@philpotter.co.uk>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, martin@kaiser.cx, fmdefrancesco@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	gregkh@linuxfoundation.org
Date: Fri, 20 Aug 2021 23:48:08 +0100
In-Reply-To: <20210819112200.32030-2-straube.linux@gmail.com>
References: <20210819112200.32030-1-straube.linux@gmail.com>
	 <20210819112200.32030-2-straube.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-19 at 13:22 +0200, Michael Straube wrote:
> Function rtw_remove_bcn_ie() is not used anywhere, remove it.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_ap.c    | 38 ------------------------
>  drivers/staging/r8188eu/include/rtw_ap.h |  2 --
>  2 files changed, 40 deletions(-)
> 

Dear Michael,

Looks good, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil

