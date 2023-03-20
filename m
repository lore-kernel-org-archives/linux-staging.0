Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5310E5;
	Mon, 20 Mar 2023 05:31:38 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so8390175wmb.2;
        Sun, 19 Mar 2023 22:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679290297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D9H0D6Byu/mJM0n17NZTVQVrl7cA2wUN5os6K8b6ICE=;
        b=V+I7MIPBjGanpI6KYuGsYzJKdiTyWuSzMYbQbPmBMcSN9oR4WLYo3OgImdHAHbdQtS
         WcqIz5ZMqcDIyXHm5/EC78c42/e2E24awI4KYFGfC6dbwchE7J227cvrabo0Ga8Y3jJM
         IvleqfCE//RbQIk489Rfnw638mx++r6BbXkoo9DD+C9rfCU8lEhrzfsYJY+QU0RqN5SW
         umAU/+5CxJ63h4wcNxEKswCIhfFFPSoITKxTVeYcSAVEj5X4R0ypHVbeL7EW3hYsKvfu
         Hu1pmppsWelJQpAbZBcECnKs57JUlil9W/t1YZYHoTpvd0ntXAQKgJxozHpW6Ihmlbkp
         n11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679290297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9H0D6Byu/mJM0n17NZTVQVrl7cA2wUN5os6K8b6ICE=;
        b=JxN4UQWRl75sENeHiBQjkHxdFM6iwKv6kGd6qBZg/9BIQdckrsUS3nmR7BC2G3JWMI
         cHweb3BF1BCHId6+6WyUoWK/7na9ADxHmtwLdScncHpM83fMFs5JQRa+DvwtUyD21gzk
         Rbz3qdxJcFdDqQbGSvv+CtJjsBr6ISzLHLRnsgu1zd/psCXSTjru98ZWT7HeGl3wMRfY
         X7d32Hd4P1sEDEZ/vQHXE/QoZabzYv8UuK+u/qoHth97kjx5Dyc9pHdxf8SrF3dYprpR
         d6TjeaZURuXgOPYpYniHLUSOvy11MuZ83vigORw6HU80khSS72uqm6UpguUB/N6P3FAP
         sJtg==
X-Gm-Message-State: AO0yUKWOI+tKl3s//uDPXEBHwpxMwm+GyjwH0UG04GTv25YH8AbbI+qQ
	ElNYxFh3Msjjrs/5T6fApik=
X-Google-Smtp-Source: AK7set/EC7/RjQaNkIpua22qI/Hgfn3eBlOlnXK8XJ4ygBQaifCnNq0xMoHvupWok3T6ct96Y/pLuw==
X-Received: by 2002:a05:600c:a05:b0:3eb:29fe:f922 with SMTP id z5-20020a05600c0a0500b003eb29fef922mr31776516wmp.29.1679290296774;
        Sun, 19 Mar 2023 22:31:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k14-20020a7bc40e000000b003ee0d191539sm315942wmi.10.2023.03.19.22.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 22:31:36 -0700 (PDT)
Date: Mon, 20 Mar 2023 08:31:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kloudifold <cloudifold.3125@gmail.com>
Cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <12042537-206d-45d9-af48-b52c3f355cbc@kili.mountain>
References: <ZBfro5U4s0lWA6tl@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBfro5U4s0lWA6tl@CloudiRingWorld>

On Mon, Mar 20, 2023 at 01:14:11PM +0800, Kloudifold wrote:
> Cc: linux-kernel@vger.kernel.org 
> Bcc: 
> Subject: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to snake_case
> Reply-To: 
> 

These email headers were accidentally included in the body of the email.

regards,
dan carpenter

> sm750 driver has sm750_hw_cursor_* functions, which are named in
> camelcase. Rename them to snake case to follow the function naming
> convention.
> 
> - sm750_hw_cursor_setSize  => sm750_hw_cursor_set_size
> - sm750_hw_cursor_setPos   => sm750_hw_cursor_set_pos
> - sm750_hw_cursor_setColor => sm750_hw_cursor_set_color
> - sm750_hw_cursor_setData  => sm750_hw_cursor_set_data
> - sm750_hw_cursor_setData2 => sm750_hw_cursor_set_data2
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>

