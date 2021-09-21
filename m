Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D9D3FC0
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:36:47 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id bx4so94347edb.4
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3cOxiaXTx9Z24g7+I+WmBeZRqCcpFDof8uhshlDK3+s=;
        b=pyVkZOT8drL8yKpXiTdD7UMqtjaRWMOiR7Xrq0cbvrceD2G03xHJ8P2Kx1uxsWD4QO
         krWpJOZDgIrCYVb9qCK/BsHaIGgnN0nc7a5CNYpGlA2aKRz9X7KhdHzCiatlGPcWG3Jz
         lnx7lUwANO5E+8dpmMUAfsEQbJXSjIWg+SeWhXpdZFxUemoUcxcCtWMlbNDzfb414qK6
         W16LGj9LXC3lBD6a6UnrffijMsNd3WZsDXdyzOSrh9Ws2vYML5halzGfqWfiOwmRAfoG
         L2qNvBjJ5HEwXB0vgTFZsri//xmp0Zh03ovSjb8geD2pgdny2cLSYAjw1JL7Bu0JSX+2
         GJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3cOxiaXTx9Z24g7+I+WmBeZRqCcpFDof8uhshlDK3+s=;
        b=0ZdmUvq0y7U5L/bx4Y4x3+d8WlyYp6+zF0AOQXOXCQNiu+a9+rHoLGPX8rqzGP9KCC
         9Bj5SUV39iLvwpRk79B/aR7XLAbc7/IfrA9Bvh0pvSy4AjgYa18PGlO3fl8vbTwfWaCV
         x4u3f4XroqzOqtpiwMKXMunNjh6y+nFsRuBwjjmLqmmLxM6YIG5hasGoE68l7hd9zBc4
         cgvaJtTDX/mRSdqIkUI33clW59FjO2a33MhtcraUisCVRB8Q1Y5GmZgpGEQF5K0PIDa0
         SdnbhNHvmUqnh4a6Kgzzwz/mzljcU8cuJAENhsvhTbd6cv+P2xHIAxZSB/0g+N6l16Ux
         R07Q==
X-Gm-Message-State: AOAM530ISd/iEnfj00mEHew3Mm2EKqgM4dJTuln7n2q2wNczGxU/dhrk
	UPFlpp+D3RDN7wiMGJs6v28eq+M9wlA=
X-Google-Smtp-Source: ABdhPJwJ8fdjdbDMPXfJJ96A7n4DqcIP+j08vvmoMHD//l9E+AVT3cWqjb2uPA6U7qd/6DDrp3jsnQ==
X-Received: by 2002:a17:907:98e6:: with SMTP id ke6mr9914004ejc.63.1632249406256;
        Tue, 21 Sep 2021 11:36:46 -0700 (PDT)
Received: from localhost.localdomain (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id d16sm7827280ejk.39.2021.09.21.11.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:36:45 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH] staging: r8188eu: Remove mp, a.k.a. manufacturing process, code
Date: Tue, 21 Sep 2021 20:36:44 +0200
Message-ID: <10957254.UNI85QxBjH@localhost.localdomain>
In-Reply-To: <20210920185437.15652-1-Larry.Finger@lwfinger.net>
References: <20210920185437.15652-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, September 20, 2021 8:54:37 PM CEST Larry Finger wrote:
> The standard driver contains code used by the factory to evaluate chips
> that have just been manufactured. Such code is indicated by "mp" in
> the variable names, the routine names, and in file names. All of these
> can be deleted.
> 
> In addition to removing nearly 7,000 lines of code, the size of the driver
> is reduced by 63 KB:
>           text    data     bss     dec     hex
> Before  573959   48582   14660  637201   9b911
> After   513530   45894   14660  574084   8c284
> 
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>

Dear Larry,

It's a great job, a heavyweight, impressive!

Congratulations,

Fabio


