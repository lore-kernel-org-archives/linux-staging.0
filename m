Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF47B
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 13:02:54 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id i7so7721913qka.13
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 06:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wIwKw1gOb6F5duzr7O0U8izvfu93fzT6GsFY+BrsqnM=;
        b=WLchoSq/f2Kkw5Mx3GU2X7FcLXOY3v0M0uucywP7l29piamld3Onu7BmMdDi9MYZbJ
         f0PR3Yh6uO7ug5yNDXEtd98wGxJ9PhmA0r8mxFN+YsUfcOBarWwhs/4ROhmdjvC3RcGI
         jlgv7HV/TnhIxvMa/3V3498lPepZV1W56c2J5XeI2UIuPTFJ34pSGLh3KXw8m/aMiIF3
         gj42A0f5McUzadIXbn9/zv/flzCXkWq9NK8OISQ0KN+iFydcKh7yedsPz8ZIfF+E93s5
         /amP5AfQaz/rttYYNTl41Ci2wdV3Myv20galVLjEn8/DNFDzG07+yV3fsA/VwK2Ox56h
         1idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wIwKw1gOb6F5duzr7O0U8izvfu93fzT6GsFY+BrsqnM=;
        b=YdP2E2V5mIEoaP2mywWkKuxt1Cs2sJgY+O5nYY64WLk9lc2ihEH/lQAPJGn/AhUAew
         r+bzmK5u/5moAJivav0Z7CeCh/e/u9y+RMBx1IN1GfDPu2WRPTS4UYKyDDU/VGZ88W0T
         HXP+h66HUfNdAWhOKYEwLgouIcofSsGivuRrtU73dxbFFEwdkT7FKnoa1eoryXqqtQ6d
         EtWjHO2EXxvYyYnketEZfr8xaT7R2Bv0tV+avc7pUbeSqn+Y+bMnOwzMCYXK69aS3OA+
         lFpw12OOTHF4GB/8blOMrvajC6/lwBhaeF2RxOKJHQ04EnrgPFuWObdJzQNRyKQyBLy6
         Nw4w==
X-Gm-Message-State: ACgBeo31sF8cTASpwXc5AdgwuBdQKYUClh3lxKz9H8MoGnsRg3Hu/448
	ZVRGHkrx0z0MyrJyb3PeyRjwniPx5sr5c3DRcnY=
X-Google-Smtp-Source: AA6agR5GKs/gL1Oyb6udRN2RSYIIPhIwxadD03mQmbVzjwC+Oa2puVHwzx4dtEiREOW9fXq+GHnMTzge9KVkUBuceFQ=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr12917577qkp.504.1661173373560; Mon, 22
 Aug 2022 06:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com> <20220821215027.461344-12-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-12-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Aug 2022 16:02:17 +0300
Message-ID: <CAHp75Vezhe_pBrt+pesneh-Tt_eqwJyOHmMdt8s7nG-V+6O7iQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] media: atomisp: hmm_bo: Drop PFN code path from alloc_user_pages()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> alloc_user_pages() is only ever called on qbuf for USERPTR buffers which
> always hits the get_user_pages_fast() path, so the pin_user_pages() path
> can be removed.
>
> Getting the vma then also is no longer necessary since that is only
> done to determine which path to use.
>
> And this also removes the only users of the mem_type struct hmm_bo member,
> so remove that as well.

...

> +       /*Handle frame buffer allocated in user space*/

Spaces?

> +       mutex_unlock(&bo->mutex);

> +       page_nr = get_user_pages_fast((unsigned long)userptr,
> +                                     (int)(bo->pgnr), 1, bo->pages);

No need for parentheses in the first argument.

> +       mutex_lock(&bo->mutex);

> +       dev_dbg(atomisp_dev, "%s: %d user pages were allocated as 0x%08x\n",
> +               __func__, bo->pgnr, page_nr);

Since you touch this you may remove __func__, which can be enabled via
dynamic debug. OTOH, it might be better to go and drop __func__
everywhere in the driver in the debug messages.

-- 
With Best Regards,
Andy Shevchenko
