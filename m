Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F25800
	for <linux-staging@lists.linux.dev>; Wed, 23 Feb 2022 05:43:59 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2d07c4a0d06so198562287b3.13
        for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 21:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eodUpTPWhYKf4AxltKUgxmHbO5CaYYvg7LhtDPIsTcM=;
        b=cAX+Ddp7L2gX4YZhVvsBdwNsjk4mRAEW+Ul3CnDPoWjqFYDSD0jpmzh/BfNxLg1nsQ
         3CSJQucaZiq63aNGjh2MQRKIFe31NNIdOehrK67t+suwDsL1gh+zwIkXl+87vRM3f9ou
         jVUHjXZZjmOwuGbAvagKZqt1ghx2+y3dR9WtIQSxKVOmFsgzpWryzQQc3vbk8XIYoCuV
         LQ1VTWrV8Wb+q/ou5zKqm/UoEMlDyLbzEjOq/xQjYu8x3rrTdzDcuUBa0I6h9+O1Ulj2
         cAHMcYua7+LUVIsUPUX4XIWAwqm29Kah5DEQC+BJ+Hmb0dVi0IBzZEfW8aHux+f9kw6N
         UOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eodUpTPWhYKf4AxltKUgxmHbO5CaYYvg7LhtDPIsTcM=;
        b=u89YDilCU1fnVG5AsXgkNMN3A86tUg6auVWxNPWW21l+XJ+YLls9KUw2qUJinuRolN
         H6JM2TG5g98i3hJqBzRWrs8YYzNrdod7JKka3V+qFCMbBpYHmDq7g4lQ30s0/XZAHU6o
         UWq27kRWiusYO/clxcgBa+sy8mTSE3QEdkBkK/xmMa7YgbqteIarsHniRQ1ntlkfMWE3
         ak+RrgPyLzb2m04RyuEVFRxfzkzB6C/ntvelSJz84Om7lIjCxFPxxENX8JloT4ypgTbx
         SCR6Zfmkt2gQ/Bii1/VkOfKIPCPL0e/q0EZIFluS+DDFk1ZjgVadxOq8fH8nhpq8l+8U
         fVGg==
X-Gm-Message-State: AOAM531xnctmq1o6enhKR8nhDrj8Bi55hsMS88w/eC9nZ4qTbdhUp5Z4
	s/AZdLWBummmplX+ew4rzkg7+W7w+Ok06B2kJLo=
X-Google-Smtp-Source: ABdhPJxxOtgK+SZTJRU6dGf+rHY9WUQ3DO3u300cyAZRwwurIdJg6iBLfNhGBEVYEEtiqtZhaAqOpDgdAxzV2JBbK6w=
X-Received: by 2002:a0d:fcc5:0:b0:2d6:8eec:b2f7 with SMTP id
 m188-20020a0dfcc5000000b002d68eecb2f7mr27223356ywf.439.1645595038400; Tue, 22
 Feb 2022 21:43:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220220231554.2510567-1-ztong0001@gmail.com> <YhPI5iDRUpzYWDyY@kroah.com>
In-Reply-To: <YhPI5iDRUpzYWDyY@kroah.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Tue, 22 Feb 2022 21:43:47 -0800
Message-ID: <CAA5qM4B40s7qPY2kipffK+zCZrovA9Z3k0Cvq6EUYGABcdq91Q@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8192u: cleanup proc fs entries upon exit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	Colin Ian King <colin.i.king@googlemail.com>, Saurav Girepunje <saurav.girepunje@gmail.com>, 
	Johan Hovold <johan@kernel.org>, =?UTF-8?Q?Cl=C3=A1udio_Maia?= <clrrm@isep.ipp.pt>, 
	linux-staging@lists.linux.dev, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thank you, Dan and Greg!
I will revise as suggested and send v2.
- Tong
