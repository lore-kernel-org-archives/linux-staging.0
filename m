Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5C33FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 15:17:38 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so4619091wml.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9Mvy+Kbt7FAmEXf5iwc1sFwbqDbGbF7nehIGohDWrG0=;
        b=CPUBlUiWu6BJlUaFoHuakqhLmrV9VcgXzW1bdjPLtSDZoKKCDDJP0DH2HlI1FyBc7u
         KYBg6AvQ5KKL8Geflv01OJOlCVGuGRMH9n9Ecb31E60MydDc9xPMRl54O58P7Okm0zFk
         1vk1cW8B+jmcGTjYMXarcaQ/IGGJQCrSfjJGNqMnqu7NJUR4h3jxUwQoHt8TAjhxjVfJ
         KkPDstdPZSlVaapplBGYO/IPsBrAB+olVFAueyQXeLVL7sIUmJudc9oJOt8jAlPjb3RQ
         bUhtzsgdJ/6bmatU82pAjyTl838tmcR4j6RGOGwB4klDAkH8iBAAQCqiOxdwtWG8FLBC
         BGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9Mvy+Kbt7FAmEXf5iwc1sFwbqDbGbF7nehIGohDWrG0=;
        b=uUhYES5VYZsm3wpH63q2lWkg7qQtCKfspU/QIF1bRYBe5uRy4/3prz5Da3SEaqwYQu
         dwyf1dt+UnCeDrI5/uz22yWnADjjCHVEe+LaYWypZeGeB2qn4DTjpmkIeAH5LQozpifo
         /XkV3oQa0M4hXcAopqg/XI9e2eJecCuIc8OnWIIUqNpH2NRbqZs9aQ0ibWoGphKhbeVc
         lwZh3Xvlkn9iDZae3MPBPJ1M0tdn5T6yLaIRb8GOsD7QWM8dPMm2+udIXhk1GNPWI0M8
         eM2gUCYOMmXf+UZXUUfGcLh2SmXOJpgM5XJtBveZRxpkHRf5niAsi8Q3wfEsHt3KvDf8
         8Tdg==
X-Gm-Message-State: AOAM530BTytsVFrjIiH7NXeK8u3KTsp7iouCuajTQ9HUaVruAWWWLUWV
	cmEClsj2zbuZ3MjCwoqMm6Y=
X-Google-Smtp-Source: ABdhPJxL4AYwJNhnzlaVxDWG97HQPWd13eHcTNDpgZmUZxaxBQKuXLHDIrd8kfh3kgR3U7uBQlCwCg==
X-Received: by 2002:a05:600c:4e8a:: with SMTP id f10mr9568594wmq.84.1630077457076;
        Fri, 27 Aug 2021 08:17:37 -0700 (PDT)
Received: from agape.jhs ([5.171.72.80])
        by smtp.gmail.com with ESMTPSA id r4sm5074422wmq.10.2021.08.27.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 08:17:36 -0700 (PDT)
Date: Fri, 27 Aug 2021 17:17:34 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	gregkh@linuxfoundation.org, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3] staging: r8188eu: Provide a TODO file for this driver
Message-ID: <20210827151733.GA1426@agape.jhs>
References: <20210827100813.18610-1-fmdefrancesco@gmail.com>
 <a6265f77-cc21-878e-4980-272202fa5415@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6265f77-cc21-878e-4980-272202fa5415@lwfinger.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Larry,

On Fri, Aug 27, 2021 at 10:00:16AM -0500, Larry Finger wrote:
> On 8/27/21 5:08 AM, Fabio M. De Francesco wrote:
> > +* Switch to use LIB80211.
> > +* Switch to use MAC80211.
> 
> You totally ignored my comment of yesterday!!!!! The driver will be
> converted to use CFG80211 - not eirher of those you quote, unless you are
> planning to convert to use mac80211. I am not.

I think Fabio took inspiration from other staging rtl* TODO files,
(i.e. rtl8723bs which already supports cfg80211) where those items
are listed and it's not related with the work you are donig
with cfg80211.  

> 
> Larry
> 

thank you,

fabio
