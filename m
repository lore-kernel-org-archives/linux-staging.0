Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1013FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 11:16:24 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id m17so5735548plc.6
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 04:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vu5jBjunzDOP0PLhWuxgdCxdhyX6vl/xQHEmao6wMA8=;
        b=G2XUXbT/Wq8fVmfj6bNjX8cIltYnuxQeiHmXcsilQNimtRh1BtrHy0m2/KzJMMSYF/
         bookN6aCCylFp60CExRwyvi2qwi9Cy5e9pysPGM/csKoda6KYL4EZjYp32rA6rYGHBeD
         G6LKB284QsNYSvhXcAbCbOO+vCB+1860ayvlQ7lu3OVpUdU9B2BD2XdqZ/hznaZfoIoX
         7pYVsiCcd6KfpNhgUCg53b+/Lrdenu7N1eBkr9fM1nlpuLADZh2as+yYcqBA1ZCXf6Pu
         IsHtlZ+9iqW0ttO4fu3Q7KuZCQ6pzAHNJcv7kC6mXMLbO311VWbQpatnpXG0Cqb8B/zH
         6iFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vu5jBjunzDOP0PLhWuxgdCxdhyX6vl/xQHEmao6wMA8=;
        b=WuCOU2xFtL7EXrNPgU9tEfrXqnWgYO1IC/s/nJzchl22kHVr7Dd7QfyryznGV8hoLU
         v6enK9BA9fBT+HvmcV5IwniXZ0REAYQNKK9Ov3rx+KLPqRuSbpZo20tcpSIGTESoGlwq
         tjWJvcZEDezB7aERfVqfXaQ9dzj/+f7+sExPF9rrKk0TweOBqjfkGV5ML4kx1rjqcqWi
         xxTsCrG06ZM/tEWwgdlPHSYlm/n+E+/g3U7MmqiLm6s0LXQGD/SwaGOmch9pYncaoV7D
         QqayTttrkkM1pw+D5mL7mq94BtmoYxrFWSNLYw/5xh13EtrxaqMgEdFLBKBPvJPGNLuw
         QohQ==
X-Gm-Message-State: AOAM533QXsSK/pQ8NkLUB0s5j9flTY2rflmNUScySjY3s9DjSoymR3D3
	iUnehBD+Cff0mQSCd52GdiQ=
X-Google-Smtp-Source: ABdhPJzpZk3hRz+5bRioH81N+ZTuPsyV4pYw01kHLo+T5Q8NNLmy8h1vr86VEk0jN7Lh2rz9SVNyvQ==
X-Received: by 2002:a17:902:dacc:b0:135:960b:1754 with SMTP id q12-20020a170902dacc00b00135960b1754mr13164755plx.77.1630149384542;
        Sat, 28 Aug 2021 04:16:24 -0700 (PDT)
Received: from localhost ([49.206.124.188])
        by smtp.gmail.com with ESMTPSA id t10sm14595617pji.30.2021.08.28.04.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 04:16:24 -0700 (PDT)
Date: Sat, 28 Aug 2021 16:46:22 +0530
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCHi v4] staging: r8188eu: Remove
 _enter/_exit_critical_mutex()
Message-ID: <20210828111622.3jytsm56cblqkvil@xps.yggdrasil>
References: <20210828105109.5776-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828105109.5776-1-fmdefrancesco@gmail.com>

Unrelated to the patch, but if this was a typo then you can easily modify
the subject prefix for new versions with `-v4` using `git format-patch`

-Aakash
