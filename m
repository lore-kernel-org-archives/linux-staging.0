Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504397F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 17:08:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id u6so9588652eda.12
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JtKK92om0G2WOBVnqwpOEzB17LAG8qKM2Zhmdg8A6S4=;
        b=Z2HRxRGB91lOsuC6eUUPNgHwLqmjDcxMZ92LvFs/wrUpURtnUBps7W2DGgDwnFVnbr
         uXtNCAN/aOaN17Vnbdbv1X9PUHqidhNkmRyTVvXKYVbqUk660ix1N6JD5BwgwqDDlpWr
         cmIN5XWptg7R3ZimhhWn1ymJtGVLnzNsOKDJm71z3ckua6+yMkIaHtHqoz3zeqPisry2
         EbEbPpMzJz0YFNdcMQDc4UAJH7uE4rZj9V0+5L8FmqHE25bpYp5hR+8bhD489FUwyb9X
         N2SZtRZmnU0eA/UIA4SZnnayZz6ExfLXozfgArqCRGIdiU1EMfbv2kUYGjegpqRj4sd1
         osQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JtKK92om0G2WOBVnqwpOEzB17LAG8qKM2Zhmdg8A6S4=;
        b=ic05TPQs5SWWEliiEpAeScdIrcgO1/rLANXWGdfdAxHb0ERwARfDKpqx2RW8tUmmRB
         X14wP798C9nQBflzKf9q5G/8Ewj9HX565SSGHQ9GA0TODk4RyzkR+2jErqoiXz/q/A8m
         +Vg+wVLrb04FxFSjgqMGLQvwf36cYDzRQn8vtm3iiuU776hE88La1XabTQjoupIk16eA
         1QYEOJ1LGQVCipwlhX7fcogBakBu6YM1mQ8s207lzpqE2002A8z+xpd8o7yb7ELna0wK
         ijyKRkZUMlOrrkMzBEW9Y17sHErZg/GgPYeb/5eS6G4MZP/WQLTFXft8EGfWkSV3zK+l
         S5gw==
X-Gm-Message-State: ACgBeo3hFnSJpclINa7E5Syb9lYqmfDz5QdUhqTl8GNBYRuKdFuVQsdU
	jGnYJypQqtSm0he6oDl474PqwAbvl9s=
X-Google-Smtp-Source: AA6agR6r51nJtrAKM5UOSmlhYsNfYlIA+DoYdk4U2mxC/t6Uf2/oGtBM2IwFtzYGJYBzIkxe5TdMng==
X-Received: by 2002:a05:6402:1ccb:b0:446:4346:8597 with SMTP id ds11-20020a0564021ccb00b0044643468597mr19299220edb.177.1662916121414;
        Sun, 11 Sep 2022 10:08:41 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id p1-20020a056402044100b0044e81203bebsm4246565edw.31.2022.09.11.10.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 10:08:40 -0700 (PDT)
Message-ID: <f85070d3-2ead-d80e-8789-2ffc00a8a582@gmail.com>
Date: Sun, 11 Sep 2022 19:08:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] staging: r8188eu: some coding style cleanups
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220911161949.11293-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220911161949.11293-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/22 18:19, Michael Straube wrote:
> This series contains some coding style cleanups in the file
> odm_HWConfig.c.
> 
> Michael Straube (6):
>    staging: r8188eu: rename odm_SignalScaleMapping()
>    staging: r8188eu: clean up camel case in odm_signal_scale_mapping()
>    staging: r8188eu: remove unnecessary initialization
>    staging: r8188eu: rename odm_QueryRxPwrPercentage()
>    staging: r8188eu: clean up camel case in odm_query_rxpwrpercentage()
>    staging: r8188eu: replace tabs with space in
>      odm_query_rxpwrpercentage()
> 
>   drivers/staging/r8188eu/hal/odm_HWConfig.c | 60 +++++++++++-----------
>   1 file changed, 30 insertions(+), 30 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

