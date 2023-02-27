Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ED1659
	for <linux-staging@lists.linux.dev>; Mon, 27 Feb 2023 07:23:17 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id l1so2040667wry.12
        for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 23:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=InPnkM8NHOwVAlAHVMP17m0ZROfItRQFV6JlGSsqPgc=;
        b=eN+YM348oSNBYu9bE+/139yGNbbjYtmLJeppjYOfFZZbb8OSKaLsGSkFo9kX5BJa8M
         DDTTWrEjolLEA5419o9Mkyu8+an2B0lp2whNihFGZvMu3DBQL5wMoS6Whs7qONzYRxkQ
         w2WploIg8rUCuJ/SXjD2JDWCtDvCBGfa76CWUjBqqueGPXdPjw8VmrAvBMelhgN8PNAP
         GnXYSRsSqdkbLhmxr+xdxhclIorhPMQ58h4T9Pmi03akqfkLW+8cV3Caf8+o0ulpeerI
         hlgyGma8g5VtRtHbATubVOA2wYNZ+zUjQTMa/T6ed5+HEEFD3baelCgtjXFN17EMFzcr
         8XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InPnkM8NHOwVAlAHVMP17m0ZROfItRQFV6JlGSsqPgc=;
        b=p9zRnk4rOaMY8VGXgb865ZpZKYsYF6FUn4N2wK4YQ0hYZjs7rFOFbroXi86r5fYif/
         JRniTU0EVGRdMVscC1iNWwoh/cwItFJCa8l6leKPfj/gUEZDbMAofsU2eYRo+AjNccc2
         ZTdYmxk7eFeBBt7Tti5tWXGllrZddqEQ6j6lRdhuwwi4j5yWA/RKA5nT1wB0r+2oVB/3
         R8vDCu8/7+soCiEfO5VNkNWxUiybpBjSBZz1aMFDnb+sGFb0ZEs787znQyB7Q8cL54xQ
         gAy2Mg0QIfsIcabeBX7Is0JUqAE+niHhikRCYZg1+TIxqWtWae/WlgpiLmhdUOCW/hVS
         EjFA==
X-Gm-Message-State: AO0yUKUufD9usAKC6T0Hej+Ah/OQyCaCZc8lfh1WIsMlelJU2ypJlVtC
	WhkRP0OGgi0r7C+zf2hbZEw=
X-Google-Smtp-Source: AK7set8zUmOM7r6ONEZ/XM/ecICQnd5Os6zYo6/uphRo+BijSp8jj7AaZy56b26n+Zt01cA0ZwQ5UA==
X-Received: by 2002:a5d:4ccf:0:b0:2c9:c90d:6869 with SMTP id c15-20020a5d4ccf000000b002c9c90d6869mr5551277wrt.42.1677482595823;
        Sun, 26 Feb 2023 23:23:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adfea0a000000b002c567b58e9asm6262303wrm.56.2023.02.26.23.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 23:23:15 -0800 (PST)
Date: Mon, 27 Feb 2023 10:23:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kang Chen <void0red@gmail.com>
Cc: paskripkin@gmail.com, Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: add a null check of kzalloc in
 go_add_group_info_attr
Message-ID: <Y/xaXw9LAOizJEBL@kadam>
References: <20230226132500.3933232-1-void0red@gmail.com>
 <Y/w16PI4klfJaeXA@kadam>
 <CANE+tVpqZusCq4EXi7UV+jY0XBG+9x6UWh_JGCWKs3pZRMFBXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANE+tVpqZusCq4EXi7UV+jY0XBG+9x6UWh_JGCWKs3pZRMFBXA@mail.gmail.com>

On Mon, Feb 27, 2023 at 03:11:21PM +0800, Kang Chen wrote:
> Hi, Dan,
> 
> Thanks for your review.
> I noticed there is no error handling in the origin design (this call chain).
> go_add_group_info_attr returns a len-like value indicating the length
> of pbuf.
> I don't think throwing an error to the caller is a good idea, the caller
> doesn't seem to care about it.
> So inserting a netdev_dbg or pr_debug here might be enough.
> Do you have a better idea?
> 

The bug is real, yes.  But you have your static checker which can detect
it and I also have an unpublished static checker test which detects this
bug.

drivers/staging/r8188eu/core/rtw_p2p.c:106 go_add_group_info_attr() warn: 'pdata_attr' was never checked for NULL

If we just hide the bug enough for so that the static checker cannot
find the bug then we're taking a step backward.  When this driver is
ready to leave staging then normally I review every static checker
warning.  But if we hide the warning then it will never be fixed.

regards,
dan carpenter

