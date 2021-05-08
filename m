Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3527471
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 13:05:07 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id t11so16628062lfl.11
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 06:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pU8gI7Fhg5vMbPInmCnZKwtrd65h+MuB8P+XOEMgKko=;
        b=ZM29bqJ6kYpm0fLSuvktOsbfdC4h5lgf161k4aIeM/EPc8ZJpoou+JsMd3Y+c/V7T3
         uI8SFK5sdjPGs7ORaj9ohIo8F67/c8i/vzhz6q+ZFXlhIaMGkD9u6vTFD5UkYhzlqWAG
         xL49nlOUhR9wbTw8DleTik8ey18eylchbtieW5PriIM4/mL6GEeW4J42pdG/nop/A3u+
         IwQZdh9NdJzC/3sYShnh+hR+FuuZ61cNBG35XXgqZpeGkVicq1/WF8swgiZDPE7k/bAi
         8MzOW3P3rUJWj0fjj5swNkKaWJ+kAZ/zPIIcnDesOB4vMKkhbW1to7QhFTJaFoxkx2N+
         NG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pU8gI7Fhg5vMbPInmCnZKwtrd65h+MuB8P+XOEMgKko=;
        b=tz3SoZlkYLX9Rfzz50i66jMn5EUcE+M/A8mPz8gdnZTJ7wEor3IDtU2EDZOy9+/GEx
         KaIKcrc+JIcf4DGJ8TFagWU+LEOx0W/c1GsTV7rh+S+7LcPlTgOzcFwxG+exP3lezwxp
         gdtR59pYdg3RKCcwplmlMJHohwG9X+uTC2MjIDclU16ZjsTSsmyJ3J2pYX6NOG9YrXP0
         ox7KU/CRGHlh0sOOIE0HN9rpHTQn0EohIlw/yJY6VCniDj/ePnEvESx+JdxPr7xMgbot
         McxdlomJk5plVjr7RrxRHs/StOSFYcBL5FZv3DtZ9c4PvDooeTeLjl2x1r3QtNI5M5FV
         B+1g==
X-Gm-Message-State: AOAM531eIbehWJaJfGX5X+l8Q3lFk1uE0aALYV2ubW759ltIxU24ruM1
	+1Jd8hIBxwWUEcE3PJpU2bOwegQ6ISgmdZGu
X-Google-Smtp-Source: ABdhPJxgzmfkeR0Eon3JSFovc8AyusdEt6Jwf2Ug0EYW7kgSAq6sXvm4+awTcLinU6jrvi3BHIqkAQ==
X-Received: by 2002:a05:6512:3619:: with SMTP id f25mr7780342lfs.399.1620479104028;
        Sat, 08 May 2021 06:05:04 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id a7sm1628386lff.39.2021.05.08.06.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 06:05:03 -0700 (PDT)
Date: Sat, 8 May 2021 16:05:01 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: media: atomisp: remove useless returns
Message-ID: <20210508160501.4f49d57b@gmail.com>
In-Reply-To: <20210508124334.GA1403@agape.jhs>
References: <cover.1620475909.git.paskripkin@gmail.com>
	<f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
	<20210508124334.GA1403@agape.jhs>
X-Mailer: Claws Mail 3.17.8git77 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi, Fabio!

On Sat, 8 May 2021 14:43:35 +0200
Fabio Aiuto <fabioaiuto83@gmail.com> wrote:

> Hi Pavel,
> 
> On Sat, May 08, 2021 at 03:21:52PM +0300, Pavel Skripkin wrote:
> > Breaks are not useful at the end of void function,
> > they can simply be removed.
> 
> this commit description is not really describing the changes that
> have been made
> 

oh..., it's copy-paste error. Thank you for pointing it out :)
Will fix it in v4 

> > 
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> thank you,
> 
> fabio


With regards,
Pavel Skripkin
