Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E18D1C06
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 08:44:22 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t15so7980439wro.9
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 00:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AY1Qo88WZIkRuG+ZDC2KWB3/2P/di58fka+9ZuMd9IM=;
        b=fPUPE3V1beCIq5fdrMH7Hri78XL2FB98edJ99HrrtlBhq8l5XNRPF7iyUyCt+labeI
         C+SpCW/OrJuOVVXA4AN4cvZMhp9sogQgaY3o8p1xEre1OFeD4zkomkER7UrNO/yeBovW
         2MWRiRlJ2z5dpewZrT3uBB7DWkco4abciznSt++X9nE1FlJUhkLxbP0bjPmLVgo5bjRB
         Rq7BLJDe44lq1a+Tdmf6MrB3t3ILyAWTE0H2A0qO9A8vw974zruExDEJ5mobmwXNMC3Y
         d7ZzPM02CQLoKPfxRPDNrMNZa2wnhvrv1rAJAmfJzdDmMV5HM4b1ecOsgq/HvFhcYEpE
         Yh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY1Qo88WZIkRuG+ZDC2KWB3/2P/di58fka+9ZuMd9IM=;
        b=nRVr9eWzQ70i7J3428a6apWinNan4g+upY+nK5P8moipv9HWFnOD9LuyxEng0wiINK
         4pTUYi5jIRtvmljv7LS79zy3qkho7g29ciJSsemHgHblbbnvFKX7S80h4WFzT3WaQTRw
         HFU9tJ7AabAkozFwJESgvO1oPnZjcqL7EmZAkken+KQynjM+3AksVgctjsDZQ20Hc/Bx
         mCQgKaWnImRP3aYUOoQxGjXyQLFPYLX5xpun7FEx0nN1DYnNeedANZAoRUnUMwunsBL4
         mT7DWoT3U+TkqoPn50hOjzzLCEoS13Ruwoxcp7NUdU0ci+fUpj717WxQ7GV+58favOSH
         OXew==
X-Gm-Message-State: AFqh2kqSys5zOqzaHoMo2V6KXL75XsY26gwY9LjIHLiIK6c3JC59ObYX
	zl+WcqlKpjTFMn+CEUofw1c=
X-Google-Smtp-Source: AMrXdXsqovVilNtg829q36pX5SKURi5x+Zw5u+rQQfok5rU8zud7SCEYkrvUy5UdpOd3f2DUPO7rJA==
X-Received: by 2002:adf:e34e:0:b0:242:ac3:87f4 with SMTP id n14-20020adfe34e000000b002420ac387f4mr18442415wrj.50.1672303460711;
        Thu, 29 Dec 2022 00:44:20 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n14-20020adfe34e000000b002366dd0e030sm17686502wrj.68.2022.12.29.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 00:44:20 -0800 (PST)
Date: Thu, 29 Dec 2022 11:42:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Anup Sharma <anupnewsmail@gmail.com>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: hal: Fix spelling mistakes in
 comments
Message-ID: <Y61TCOiz2oaA7txp@kadam>
References: <Y6mYdPlqIK1VgQ0Z@local>
 <Y6mnBSg6i5wMCKUV@debian.me>
 <Y6nVIdQwIDdxbhY8@local>
 <c56b6b9e-27b2-a064-a4d9-a4926474f1bb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c56b6b9e-27b2-a064-a4d9-a4926474f1bb@gmail.com>

On Tue, Dec 27, 2022 at 08:51:00AM +0700, Bagas Sanjaya wrote:
> Also, you need to edit the patch subject to "Fix codespell-reported
> spelling mistakes".

That's nonsense advice.  Please don't make yourself into a roadblock
for progress.

regards,
dan carpenter

