Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209AD1C08
	for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 04:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMbAjjD1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40537481094so41797225e9.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Oct 2023 21:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697431261; x=1698036061; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OOjXanV6ifmADtLDN2bjdEAHMH7dAxhg1yhRTNpb/Q=;
        b=RMbAjjD1IsbuyL+yQ77UtIWldSCZenQVq3qZegZRrJWvsbmYgiKXa2RK0bdRJm1MCW
         gkD160HHXlkLMBFDTwOZUf8jmaHr/yxPDgAlUh0N1Jy5S1p8ISixcsNb1mm2S5joIRHE
         0+iFDFCPiyC6A/8w5awu3BchRKTBtTjbXnDM0InQ1IQhQuWOwoQiKO6U7/b+qrCfLNEw
         2SFyo1PUP1pa2bzPvDN3ZSJ/CgL+lRP78uBA48DWKbACWA4gopYqPUHgNBHad+zTIyQt
         i2HQ0IWuVnrnZyFWD97YQwcV5JtMXWX8GXK7LwgCkZ0AvfUmn/sN3dfChdk6sydJz9Ja
         ZfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697431261; x=1698036061;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OOjXanV6ifmADtLDN2bjdEAHMH7dAxhg1yhRTNpb/Q=;
        b=H6d5GHKXtW1duHDAEPDh1JPG2jTEBww0eonMY/+Xg7xjJJThekB1Srl6AkLjzzbqs0
         2s/dipeFMAvk/Shg3kOJVjl9zDksl1+IHItRagE7FbnddJAK1CsYaydMvfsoKdRg1BOW
         LODLArZxJSwv2dNXIAFbt4UESb0yGoGYeBeQKTQTRhU2sKoPSI/qGySGwkT3qT5fsHP+
         bvHFexEuboJKaxeV4mCXzOojl3GQn9a7NA1th+HMPZ0bkjHkKEUWJ3zeiW4/fqlRT7bm
         Lh7RBN4zQkFLaEVegpb/njnRuj4qbBQjjr6dzcPjVWNOuTv9KKslfF7Bk/g/Yq7Ah3G5
         LB0A==
X-Gm-Message-State: AOJu0Yw1cuJ+SYv26ki5mkZ4tMKGX4tkHEP/8bQC0BezB9y400DrbPiX
	Q5c15LjkVEL6t7xgSv1Wa2bw+Q==
X-Google-Smtp-Source: AGHT+IEm5GricQB6syD6gMHQyZ6a2BD8XGv+Epu5n10M8kZHUL3BWaF8I0nx3BvzJLt/93ztsJFwng==
X-Received: by 2002:a7b:c851:0:b0:405:3252:fe2 with SMTP id c17-20020a7bc851000000b0040532520fe2mr28195556wml.14.1697431260924;
        Sun, 15 Oct 2023 21:41:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c431200b0040642a1df1csm6020508wme.25.2023.10.15.21.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 21:41:00 -0700 (PDT)
Date: Mon, 16 Oct 2023 07:40:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: wlan-ng: remove helper function
 prism2sta_inf_handover()
Message-ID: <4c29cb7a-3b24-4682-9211-09aff1e01360@kadam.mountain>
References: <ZSkg7y2Y2T3midXB@lab-ubuntu>
 <67d90726-15b9-4d64-87c6-bfbf662cbe81@kadam.mountain>
 <CADFX3ORVXcEBzovdbPawW2SLxcMoraKBmmLuOFkMpnHj=T48qQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADFX3ORVXcEBzovdbPawW2SLxcMoraKBmmLuOFkMpnHj=T48qQ@mail.gmail.com>

On Fri, Oct 13, 2023 at 07:04:56PM +0300, Calvince Otieno wrote:
> On Fri, Oct 13, 2023 at 3:12 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Fri, Oct 13, 2023 at 01:50:23PM +0300, Calvince Otieno wrote:
> > > prism2sta_inf_handover() function basically calls pr_debug() to print
> > > a literal string. This can be done by the parent function directly.
> > >
> > > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > > ---
> > > Patch version v2:
> > >       - Replace pr_debug() utility function with the module specific netdev_dbg()
> >
> > This isn't a v2 patch, right?  This patch assumes that we applied the
> > v1 patch...
> >
> > This patch is not white space damaged though so that's good.
> >
> > regards,
> > dan carpenter
> >
> >
> 
> Hello Dan,
> Does this response mean that the patch was accepted?

Ugh...  No, sorry.  I suck at emails.  White space damaged is not good.
I left out the word not...  :/

You need to figure out what's going on there.  Some of your patches are
not white space damaged so sometimes you're doing it right but here the
spaces were replaced with tabs so it doesn't apply.

regards,
dan carpenter
