Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92AD1A27D
	for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 08:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4jx6hn5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-406619b53caso43092145e9.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697446004; x=1698050804; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bx+1uK2uxz3AS67pDvs9fEtJH4P6/YIs+6GQTjHy+3o=;
        b=M4jx6hn5vzsT0/laXQ6BKuc31WZufL9gcgPI0c8q12pQqrjOPhHEJwyfr7oIJii7Y0
         /H4yXc2wS8GW/pgtpWYyQ5xQ32D7DGsPozcS8tTtqS/phD4CSwN2P1kzNfSS5N1YKPnH
         hXNSyrMM47ZP8wQvBOEtqydC+4RFybt3R/7EVPnS0MRZ1lREK8SSJXhWpGt0hxKk+9Iu
         gw++DcPNEbQZtAanuZLxV4zt1oxi7kw8AygBqZkzjkGaxwFruCK5j6hohQegG51SqKzU
         7sWXOtJ1EyVwhKlpRzcDEdQf3jzJnGFBxeciyMGMUo4X+igF0SaqFDhghoUGI/aK29XS
         SNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697446004; x=1698050804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx+1uK2uxz3AS67pDvs9fEtJH4P6/YIs+6GQTjHy+3o=;
        b=UTNuIOf8/4wK13MpysbER8o58goDLp2nmx12fDX+toC2juht9wNh95rSjEIP9gB4nR
         /Ir4mvJ6cxuB7YDCzghlFaiSbQWppenLEvzl58bd2BWybTDstBXf4oQ7VzjAfY6HnOlO
         1cPRNZ/TTjg8wi2bPCjvKv514JyVBQdO30R5sVP8ZawWuoL3YVXSHwdx7yPaSghx+HIb
         VFDfXY8L7VuTqKhv3761oIOmyXgY7TiZwlmoOOCmrg32hEF4G6q8VIFKO1Vgl4KMDM67
         N0XSw5lzzVd25ywtJxuwiK/miiyyZpyMKGT6K/8k661CfZ4piSnzPxocawNa8hxuPif7
         z7PQ==
X-Gm-Message-State: AOJu0Yxx5CMQGg3fr04IT7K+/aH2IGRpBrkih9wmKzfZOWqB00nQrAkC
	DLBlgq42Yr8Pijgl6dT1WdmWww==
X-Google-Smtp-Source: AGHT+IHbSH+ngv1Ft6wPqriSn4jqYatRQW5mAGubnMFJ2lflKm991ZfDhR6XdqN6OuXX+kVABk071Q==
X-Received: by 2002:a05:600c:600a:b0:406:eef6:3540 with SMTP id az10-20020a05600c600a00b00406eef63540mr24264663wmb.0.1697446003901;
        Mon, 16 Oct 2023 01:46:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c4e8c00b0040772934b12sm6672102wmq.7.2023.10.16.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:46:43 -0700 (PDT)
Date: Mon, 16 Oct 2023 11:46:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: wlan-ng: remove helper function
 prism2sta_inf_handover()
Message-ID: <d50d6a13-c27c-4e9f-8728-e3ad3e4d94db@kadam.mountain>
References: <ZSkg7y2Y2T3midXB@lab-ubuntu>
 <67d90726-15b9-4d64-87c6-bfbf662cbe81@kadam.mountain>
 <CADFX3ORVXcEBzovdbPawW2SLxcMoraKBmmLuOFkMpnHj=T48qQ@mail.gmail.com>
 <4c29cb7a-3b24-4682-9211-09aff1e01360@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c29cb7a-3b24-4682-9211-09aff1e01360@kadam.mountain>

On Mon, Oct 16, 2023 at 07:40:57AM +0300, Dan Carpenter wrote:
> On Fri, Oct 13, 2023 at 07:04:56PM +0300, Calvince Otieno wrote:
> > On Fri, Oct 13, 2023 at 3:12 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > > On Fri, Oct 13, 2023 at 01:50:23PM +0300, Calvince Otieno wrote:
> > > > prism2sta_inf_handover() function basically calls pr_debug() to print
> > > > a literal string. This can be done by the parent function directly.
> > > >
> > > > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > > > ---
> > > > Patch version v2:
> > > >       - Replace pr_debug() utility function with the module specific netdev_dbg()
> > >
> > > This isn't a v2 patch, right?  This patch assumes that we applied the
> > > v1 patch...
> > >
> > > This patch is not white space damaged though so that's good.
> > >
> > > regards,
> > > dan carpenter
> > >
> > >
> > 
> > Hello Dan,
> > Does this response mean that the patch was accepted?
> 
> Ugh...  No, sorry.  I suck at emails.  White space damaged is not good.
> I left out the word not...  :/
> 
> You need to figure out what's going on there.  Some of your patches are
> not white space damaged so sometimes you're doing it right but here the
> spaces were replaced with tabs so it doesn't apply.

Wow...  I absolutely suck at writing emails and *reading emails*.  This
wasn't the white space damaged patch.  This was the okay one.

However you sent a v2 patch in the wrong way.  You just posted a fixup
instead of resending the patch.  You've sent v2 patches before but let
me send you my blog link anyway...

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter
