Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFB82582;
	Wed, 29 Mar 2023 14:27:57 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id n137so4776761qka.2;
        Wed, 29 Mar 2023 07:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680100076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7JQ1XJjsuL6lqx3M3lM712uJGJOEQmz6djad/U4y/oU=;
        b=TP6L/5HG8ebiZoSa2P+wCP6OGe6YnQoguc3nyBjnrvkJpSOMvtjFKki624FZ9tf5D0
         AazONSqjyvAr27iyjCqDKqs4PGvpphbD6fww3s7XzZcwPFqi7QRoQB5Zjh21VyPPFhlE
         N4W7wmzn82J6dGC6PX2FeD+/4Yyeuci+Eo9IqNsWWRAJrYfauxfPa03SJKWnvqAhkE+B
         q18hnjjmg77ozqDSF3CSREmOvYFfe7/P5npWhOGIYs2V7MQ3PnvjJn0T9knXZtOQ83Ix
         lLnqUrKPI2ozCmsFF/+LFJ+wvODOzCH9cpaH+UtN5mMvrAi5AL6zZOco77E/cTyxqN3T
         KRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680100076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JQ1XJjsuL6lqx3M3lM712uJGJOEQmz6djad/U4y/oU=;
        b=uZHaipjidOBzAdGow+cvy3tE0+9Js8d3PorNzQc8inlivK//SkbTdPlIzBF+tKAhMX
         8qks7BVO0aFUcb9RGCuyR5HVS84rMnzHgGq9T8snE6P3eaLjPQ0jeY2FtbUVCWBYifp7
         QxCV32v+EHz0oOJ+2qyCgIFSqiavfHvzndR+uPblqpJzsdsJmtAu8ipRZWoIQPYj05Jh
         J3OrK2C5Hgj4UODEjwZ1tyMTerPwxjy3z7Yq8Uh9+SV7ajhsBCFfBOaX/LBvWO3mlV44
         68c+zZ2kHq0k2YPM85sAqJjg2JTfAZwZ5CWsNwP7/MRxhDoAfi4nnj8xdJZ9pBWJvW7O
         CDEQ==
X-Gm-Message-State: AO0yUKU83SYKR4ZBzPwk70I2M1TraanSPH7VGJNdWQlBBWvEZvHqfed0
	RyMjXnItIZtrwW/Fr+yNXqP2WAyWXZI7YKwWCew=
X-Google-Smtp-Source: AK7set+BHqeCs8Skkw2w2L5Xm0DUXvtQ318RZhOkITUti3EH+kL2u4jZ5oHcNttXsVQ1T0vXityEW+BFPv9CMj+sz4o=
X-Received: by 2002:ae9:efc6:0:b0:745:72f3:637f with SMTP id
 d189-20020ae9efc6000000b0074572f3637fmr4877583qkg.13.1680100076478; Wed, 29
 Mar 2023 07:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZCQeyWW3+d7+qT+b@CloudiRingWorld> <ZCQkPr6t8IOvF6bk@kroah.com>
In-Reply-To: <ZCQkPr6t8IOvF6bk@kroah.com>
From: Kloudifold <cloudifold.3125@gmail.com>
Date: Wed, 29 Mar 2023 22:27:45 +0800
Message-ID: <CAM44cXPVDMoGiMc9v+Z6wPANEW1vaj3=odVW8NtuDUtg+0qf1w@mail.gmail.com>
Subject: Re: [PATCH v6] staging: sm750: Rename sm750_hw_cursor_* functions to snake_case
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, alison.schofield@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Mar 2023 at 19:42, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Mar 29, 2023 at 07:27:04PM +0800, Kloudifold wrote:
> > sm750 driver has sm750_hw_cursor_* functions, which are named in
> > camelcase. Rename them to snake case to follow the function naming
> > convention.
> >
> > - sm750_hw_cursor_setSize  => sm750_hw_cursor_set_size
> > - sm750_hw_cursor_setPos   => sm750_hw_cursor_set_pos
> > - sm750_hw_cursor_setColor => sm750_hw_cursor_set_color
> > - sm750_hw_cursor_setData  => sm750_hw_cursor_set_data
> > - sm750_hw_cursor_setData2 => sm750_hw_cursor_set_data2
> >
> > Reported-by: kernel test robot <lkp@intel.com>
>
> The test robot did not report that the names were incorrect :(
>
> > Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> > Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
>
>  Is that the name you use to sign documents?

Yes.

>
> thanks,
>
> greg k-h
