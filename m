Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E81876
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 17:49:41 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id nb11so20783228ejc.5
        for <linux-staging@lists.linux.dev>; Sun, 09 Oct 2022 10:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZejLgz2KhY9qLr7ifuLCXoUfoCiZZhSwHm/qMEzGqc=;
        b=lJdQtW8Cft4FLGQkC30bXvrSKFFr1T9Otds+XTl7N/Hrg7APAuLUINc28ugYpC9xqb
         XKoS1UnYh63VInfYA3m/Ul6fr1pFicO+7BlQaVDYAlC6g5LeJ+jIAK/JhgJQP9T1QcGV
         z8PoWxIzH1lTqJiJcCj+ZzSORIRrONGS7LIV/REAfR0ozq9s2FrGQja7v6nCaGYcUDJF
         k7dtHbXF+VjIsfNHAB+wlnmVTE4IVXn5BaLrygrC64shw2cqQcysxNH+hd2By0zaJiNC
         WkPGkC23Uw1ovjOl+vkJJ/Hnrggh23ZZqWisd2RzNp5nOGc2MnRG3stAycDjCBfTGOcN
         0KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZejLgz2KhY9qLr7ifuLCXoUfoCiZZhSwHm/qMEzGqc=;
        b=nb2SP7qyycUpOSt+GazTCHH4Itqir20CTZ1kuix6DJFezOOIAFqXy6YriEHOKIyeHC
         deJkUekDobiX5OFI4VJz1p5Yh6c/MIzLLpM8f1A9lMrml/lpuc0HmE6dNqIVgpvaGf0u
         +jYOA5/n5ASjDcxUbm3G2yb+xp6fFOPHnGfFRiyA6tkXBdtwoXOjilQ2gIeXifjnv9H4
         0E//lKPCK+6BWbedYaRYzdX5+XhjcAB/5FwwPTjT4S74l+RIuWu3wtTq+SL4YXq05InT
         N0lV53nHV7Wtp8vL1xikk3fNAmKi+OctvnTF76PlSn7JhXRa/ZIX8RTMmlmdLbmJTetl
         I6Sg==
X-Gm-Message-State: ACrzQf2RFaiSSf7Sym1ut4IJLKuH1HsUfYzjlv6nUIhg1JwylbcNNsnF
	b9/vgkV6oneq0Utv2BTTD58=
X-Google-Smtp-Source: AMsMyM69T9Sm1c3Oc3V3smOQxTUTnJHlN6nIA2lMu6COU5Ee5zNy51hO2/yOm9YfryUSNG+rypjMWw==
X-Received: by 2002:a17:907:2cea:b0:78d:4e84:778d with SMTP id hz10-20020a1709072cea00b0078d4e84778dmr11011773ejc.246.1665337780002;
        Sun, 09 Oct 2022 10:49:40 -0700 (PDT)
Received: from nam-dell ([131.155.245.44])
        by smtp.gmail.com with ESMTPSA id bo1-20020a170906d04100b0077b2b0563f4sm4248453ejb.173.2022.10.09.10.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 10:49:39 -0700 (PDT)
Date: Sun, 9 Oct 2022 19:49:25 +0200
From: Nam Cao <namcaov@gmail.com>
To: Rui Li <me@lirui.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: remove necessary braces for single
 statement blocks
Message-ID: <20221009174925.GA17573@nam-dell>
References: <166532561205.8.1223417525390189864.67805880@lirui.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166532561205.8.1223417525390189864.67805880@lirui.org>

On Sun, Oct 09, 2022 at 10:26:31PM +0800, Rui Li wrote:
> This commit cleans up checkpatch warning as follows:
> braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Rui Li <me@lirui.org>
> ---
>  drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  3 +--
>  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  9 +++------
>  drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 12 ++++--------
>  3 files changed, 8 insertions(+), 16 deletions(-)

Greg expects a change log describing what has changed compared to the
last version. You should send a v3 with a changelog.

Additionally, did you mean "unnecessary" in the title?

Best regards,
Nam
