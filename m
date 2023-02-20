Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7546AF
	for <linux-staging@lists.linux.dev>; Mon, 20 Feb 2023 15:00:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id bo30so963613wrb.0
        for <linux-staging@lists.linux.dev>; Mon, 20 Feb 2023 07:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTfZYHe/X6zZag4f7TPYxf3JfRu+8rYIA0Cjw4xepRo=;
        b=mel5rf3A3XU3JSS6gx8VOtZhSb1dzQUKg4n4P3oru6IvEnW88L56DC8eVsJZ7/BkGw
         pPTDlSeEz1EC7Hx6QLUpdU+NaRkgRPhBBx7HmKg+p9U9nP7pwo+tVvXrauSlyEpzjFjd
         oH9J4aRZOKFdmJ2nSoS6K8nUOYpmxGCbz43/jnkHze8fqtcUka7QqrqStKKOTHW5Z+se
         viRbPC1IxkxKFzyqn+aocouqokepdnu/HD1FTyNB/0zC/0m3gubmRJA/q2lWR+0/F7NF
         GzgFDY8IWJ8hpShKhl1hP+3xF+zbdViTYnWEi5m1cJTFKAT1IffF8UkuLy4hIKhkeQJk
         DxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTfZYHe/X6zZag4f7TPYxf3JfRu+8rYIA0Cjw4xepRo=;
        b=MVjgnTVXUGm7bdLrKIv94iPvzG65CswxyPq5GJcAmFYxf0MpzUwnWCq3bFwvI718m7
         5b4Yamha7OBI94bSRy86/XGrhgTB4ZBc0KOAV+/KaFn53F6PKaAmJdpBXO8sOh+Y2F7j
         hRtsOtHJT75Fih/bSiR46z8BQGiyPjqq/e9VIaJZLIyLzyl7MKgFhTyPOYMmLotIh6B1
         XM90SlRD4Lpz3I8OChJ+v99J6jwfiwzawZp8LyfvnmWBJsPLkIyAH0Qg56EEqUbGhtKh
         bDQ7qLqoxbJ3mVEXVYCbmsA7o9oNBCQHGrA8Fy3vU1nqAhdS0LrNPuzrw9uyla3bCDDH
         kKqA==
X-Gm-Message-State: AO0yUKXh1z0q0X2gs9mGU05emVirDminXFRZQ8ONyT88eZ/lwSmEftQ9
	msv5MKKQDE4lGdDwf/E2F8U=
X-Google-Smtp-Source: AK7set9Xzw1ZL/YOJtkbC+dfvfNWbTdb2GX3nLV1ccierTsJ7OLDuuEPYxtpYgBZ2rwrRS7NQCK/PA==
X-Received: by 2002:adf:dd43:0:b0:2c6:e893:6f3a with SMTP id u3-20020adfdd43000000b002c6e8936f3amr2205115wrm.16.1676905226761;
        Mon, 20 Feb 2023 07:00:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x8-20020a1c7c08000000b003dc4480df80sm528893wmc.34.2023.02.20.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 07:00:26 -0800 (PST)
Date: Mon, 20 Feb 2023 18:00:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shibo Li <zzutcyha@163.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fix multiple line dereference
Message-ID: <Y/OLBzn6sCzcMwgj@kadam>
References: <20230220084050.18459-1-zzutcyha@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220084050.18459-1-zzutcyha@163.com>

On Mon, Feb 20, 2023 at 08:40:50AM +0000, Shibo Li wrote:
> This patch fixes the following warning in rtl871x_mlme.c
> 
> WARNING: Avoid multiple line dereference - prefer 'adapter->securitypriv.PrivacyAlgrthm'
> 
> Signed-off-by: Shibo Li <zzutcyha@163.com>

This one is fine.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

