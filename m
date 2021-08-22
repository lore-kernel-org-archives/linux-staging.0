Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27BA3FC1
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 06:25:09 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b7so20783928edu.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 23:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mx/gZXnqeR0rM9Ir+nV0y5jx3IPjC/daeOqVGnYhRrY=;
        b=c/DORD6bwzpQxHnRX/Oym75rlynRtl8ksnf3DfJu0SPXsh/Vk43beGVbmzBGThMrsh
         BJ1yOm4ct1IWXq1mveqE1uG2nwYtB04YoYb+AuPYJ2Mj/qtcznqEXjxzWQu/x9YKaSj7
         mdhlk8o9bYtKayShXaAc1G509Jep/OSpxDQbCkH4RzFaHrGJp6wTmP+3VhK067maKf8D
         Vgq0voGB8xy0K+gAqEcgH/IGxUbWCig2YvqiF2KkSNsAIAReXr6Vsj2UCoGJmfsRpbNw
         thJsRhL3U8WdDdFhtGZzDJpZQZZdLagIZFUvi8Ni6lK7e45/7okWb3QZtAVy4WoOM+SP
         IgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mx/gZXnqeR0rM9Ir+nV0y5jx3IPjC/daeOqVGnYhRrY=;
        b=ZUsxoC7BjEaUmJxKlzbGxms1Fkvntsl1DVthTCkwPy7T2c/bhHoN2J7cTOv3hJ46Cr
         VV6yPL8PMtGYK0ookOGFLSv8S0+MoZDxrc6aVkJN7VO0prxIK9mB2h1n+EYZj8IFPS0p
         yTv5gDiLV2Zjq+03rRJZ375MO1xtZpUrIbAuAhjoT1Y3D9u+vvgYs/+5FEFODNDPU60w
         XgjMkBU/uNH9bP+cN9jO+1X+/YQoIKn0pUGA5jh7JfHqCtYkWAnfIVKQCB/1gXbvawDw
         UsYqWtuR5UDXXmw8rclvCdVtmKCO0rOEQ2Si7A5Bj7Bm6WvmebD4gTLbupc7I2cCydjo
         4ftw==
X-Gm-Message-State: AOAM530zKbJLDq4cRa2dlrvjA2HZxVwszjv6youERhnjeY5s10KeoSLm
	/v5IS6Cglsz0SbKgQKEYoJY=
X-Google-Smtp-Source: ABdhPJwu+SWeKv6ve36LjaS49PGof+FJMOUFdFWIjJ5rydi3ruY7H3Z6E84b1g4mV1HFZAgbzgNeag==
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr29786161eds.108.1629613508113;
        Sat, 21 Aug 2021 23:25:08 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id rv4sm5319224ejb.23.2021.08.21.23.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 23:25:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Bryan Brattlof <hello@bryanbrattlof.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] staging: rtl8723bs: remove sdio_read_mem()
Date: Sun, 22 Aug 2021 08:25:05 +0200
Message-ID: <2537053.yL3VPc0Jk4@localhost.localdomain>
In-Reply-To: <20210821235456.2502681-3-hello@bryanbrattlof.com>
References: <20210821235456.2502681-3-hello@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Sunday, August 22, 2021 1:55:29 AM CEST Bryan Brattlof wrote:
> The sdio_read_mem() function is unused. We can remove it.
> 
> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_ops.c   | 11 -----------
>  drivers/staging/rtl8723bs/include/rtw_io.h |  2 --
>  2 files changed, 13 deletions(-)

This change adds a build warning, which is not allowed.

Please merge this, and the 4/6 patch into a single change, so that it
all is removed together, causing no build warnings at any point in time.

thanks,

Fabio



