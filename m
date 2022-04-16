Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC3D2590
	for <linux-staging@lists.linux.dev>; Sat, 16 Apr 2022 19:09:31 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id bv19so20616231ejb.6
        for <linux-staging@lists.linux.dev>; Sat, 16 Apr 2022 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wc5pFB9cFV9X8b0ifj+g9eVrc/4oE6DJhMyg+0grg+A=;
        b=g6SviAzwXAp09tyT7R2XRj717VnDS6GwDtEcvKbhHtciTAYMqsQMA11jPSRytxv9XW
         VFUNpY7EV8Y5oPQJ9ZEoGLCrgx1HKdushCUIVTi1NtwrIybOWklDz4kcdjRsSZskXWLw
         zh1eEM9Ek3muGqX4M+Qk9UWBUD9QHNjpYj6b/i9o4VnZimj1LcebyvcDJ73l9LEG7ZxU
         SCw0yjEdDv5IlHMOo3a4dG2ZUOsIMVRkGOJQIn8KPp7vF8MJPb5nqrTvke/VHHa5NCsG
         2ppWyRQLDnz02tFJevSmSmYFvT/8WXGOQTEYLJNzXD70ecglJ1TRe9jwMuIf9DSxpXva
         vaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wc5pFB9cFV9X8b0ifj+g9eVrc/4oE6DJhMyg+0grg+A=;
        b=r4p5IuiMW8IMeK5w7YFSvo3OaL5rDE3/3ldePGaVBWW9/WeTZQW0EAZq9rAqZ0Jh6M
         boVbckgMcy2U0Uy1ri51+nlSya2sd8SbcyfMg3OZgzsAw5yhCK6R5Fnl+wmhjLHqHTt/
         SVP+4aMv02p8MwBI70f3UedBMV9tHafketLaPukeISpdlzJPTkPh13ZvI7qPjbT8XgcC
         9mIvG5ocVAxZAMmcR/Pj9zWuzFYiYds2zmhIjKJwiMgl5ldS3/4YhF+5bG1xe/PL27gY
         yMePVrqTeDkAsjK5HyJnNZIsSOiGN1NPhQHD5wnD+zNjMIcw3+/wwEia8apF1NSiE1od
         IXng==
X-Gm-Message-State: AOAM530bh3wEftHuJg/hbvyP40Nw4e5lm8kH3Lxu7zocQZJwdfe0fd+a
	YpO5b0z/zBn9dXeJKcK8hLLWM/H93NNEIP8BRGI=
X-Google-Smtp-Source: ABdhPJy0dXUnDlNqpFSRWbTmBQ7n5zYVtmmJh0Ee6Th3tr80ERDWMczGFfIgI95tpj9HKKbOvbuOv7n6qhOInUV9gaw=
X-Received: by 2002:a17:907:2d0f:b0:6e8:b710:a68 with SMTP id
 gs15-20020a1709072d0f00b006e8b7100a68mr3471849ejc.510.1650136169569; Sat, 16
 Apr 2022 12:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225155622.585621-1-ahamedhusni73@gmail.com> <20220320163618.41054-1-ahamedhusni73@gmail.com>
In-Reply-To: <20220320163618.41054-1-ahamedhusni73@gmail.com>
From: Ahamed Husni <ahamedhusni73@gmail.com>
Date: Sun, 17 Apr 2022 00:39:18 +0530
Message-ID: <CAFjpAKqT1eP4vXDPuTG50aBJPuosWTN3qddrURgp3zFS8pCz0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: av7110: fix switch indentation
To: mchehab@kernel.org, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ping :)
