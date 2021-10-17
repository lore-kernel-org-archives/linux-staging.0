Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E82C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 14:13:24 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 5so29480005edw.7
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I0IAJoaBZmIRDLA63S/As9EB+waQC7xkM4RWIrSSIrY=;
        b=RTYroCFLPFfML5sobEP6AIp0l+gbcHfRF3qn1o4puD+3Va8BO+Foh3eADcEVXk5U/+
         D0/4M+gIiuT2q7kSbtvXfpGwjbRwoCbeK0c37EhQ8HicryCapNvNfortuzG0n23/a+XO
         mBnRW/tbnWgsElQjhOJvN7uYkMoyymMrI0GCGttNlSdPsvuX60Y7PpwVbkToMDaI9j+S
         lBHsRtXrdEKVTByVZ7lABxYTeJSku87SNZ0MfNjtMRENVImSAPZqowCsxhSEOukpcfy9
         tgWl+v44s1YjqrmJ1djQTQfm9o0i9nnKRgwsXhwVz1f2OFJslMehSd7RykK1h+G597PY
         sV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I0IAJoaBZmIRDLA63S/As9EB+waQC7xkM4RWIrSSIrY=;
        b=lQQcmvxNCiF6Vim1jkg2EJz27NUdVw59REv8jrDYC4XOHMINqYiPZSr/27ERFuVHAX
         SR6SgbQc97naSk0EG3g0JBVdHVXSo5W7+6QhQcBq+NZzzh2LQmIRQiGW2VtYA8O3v9YG
         2b9b3QLScuTBOsEXyLflrV9YfA4yPSzWS1nZDzQiRapqM6WlzDRwSobHwk2v1Y+DFgzJ
         MuiVcG/m8roe5XhF0FnHV1TSDndaY34D0aLA75MBCH8N5zI9Xi03wnFNeGlh0I2HKDSD
         sh9uKAZ+rE5s9cSlWvpDtA6k3v04ArpVn5l5XAnQzb0mP6Zm2Igs9cboBJK59MRcH3bp
         9wjA==
X-Gm-Message-State: AOAM532nOSqAFuOMuhxhofPjgEC86orQONhNFSU2J4U/nmL6/3VETst2
	G8sy5hwGsT2S9s4DAqrtlzU=
X-Google-Smtp-Source: ABdhPJw+zwt4P/xwDaZdb3nL4pkZUL7UtcuafdxE4UhFhjiGOOojOIwznGer5TKd7zQHVPMRcQvSUA==
X-Received: by 2002:a17:906:1cd1:: with SMTP id i17mr22345686ejh.205.1634480002685;
        Sun, 17 Oct 2021 07:13:22 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id t15sm8336554ejx.75.2021.10.17.07.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 07:13:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Kaiser <martin@kaiser.cx>, Larry Finger <Larry.Finger@lwfinger.net>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: r8188eu: don't accept SIGTERM for cmd thread
Date: Sun, 17 Oct 2021 16:13:20 +0200
Message-ID: <11761221.DPQ3dUVypB@localhost.localdomain>
In-Reply-To: <1957621.GeRc3qvyWe@localhost.localdomain>
References: <20211016181343.3686-1-martin@kaiser.cx> <YWv67ozbJGxMa69t@equinox> <1957621.GeRc3qvyWe@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, October 17, 2021 2:51:40 PM CEST Fabio M. De Francesco wrote:
> On Sunday, October 17, 2021 12:29:02 PM CEST Phillip Potter wrote:
>
> 
> Correct.

Please disregard this second mail. It is a duplicate due to some weird KMail 
crashes.

Fabio


