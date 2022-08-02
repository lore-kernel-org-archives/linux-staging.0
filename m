Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55017F
	for <linux-staging@lists.linux.dev>; Tue,  2 Aug 2022 19:02:23 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id j8so2332828ejx.9
        for <linux-staging@lists.linux.dev>; Tue, 02 Aug 2022 12:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5XGKPAZehpjIbBHNoqFU/QMw0NFWXHGxjALKpRQuH/Q=;
        b=3ZN8i5AIfRKO069Nl4yIu0bs6n64efLqeQGmt5KIIGfw9TyDf7YVvIirjzhVs6e5UN
         zzi56vDz4WA+E56LQsSqnbPAdaf+/kz2WSZ9HtvuzLxbKQDg7V94x8hdI/Qh1Mx75jhw
         1aV49dQ/Ad2Ex2NQSekRllBzFNJCSEAadstPN6FPzwrsbSd5ScgTcqNQlWffUe3iO3mR
         a+lRihDvuNsHOCOPGQthnm0Xub07HuqR73zVbSL5qDXkzMYOrOVqWydoS71S6MGcUpHy
         FAcQIsLprR8HM7IEhaI+AjJSPne5LTH+/tnPEI0wbaIYmWWwxvLp2HMZIu+aL9bng1ng
         CKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5XGKPAZehpjIbBHNoqFU/QMw0NFWXHGxjALKpRQuH/Q=;
        b=U20vpQGUrg/vBdShIBiIKI1a1dREEFJ+1sBwRYY8HqrhtQpqKzB4Ai4by4K8rOfl+s
         01tQFiqjt8rRRxRCrLbyXymOvjC05fpi0nKdTHlhb/9HTpQNhifVkWRQtkugi8kZiDDW
         5l4J/6EZVBagWTTAXL6vm12Ll+3068VS4/yLtTUSQp98p1Zankwjl2PkMQ8bg1ot2mt+
         6vZpBQNPBXrb4mGNv0kDa2X8uBoP4bOMeBTgrPPk/zIFKV5S4S3DJbXH+6mlOZl3+3h0
         zi2t/UakJFnZo3VumVghWMGYuF81O9kMvWIii2i+YRBhljJyjEmVb6bCC+KaDtdqkDEf
         IAdQ==
X-Gm-Message-State: AJIora+ynpQ+3Nuhzxm8NdMzJMhR82rF8HLHQoFV7pn2IIRbzhoRl/d+
	fuOI4Zqh525ntTcA7G95VSQkE706E6kowg==
X-Google-Smtp-Source: AGRyM1sAt6kPLLurtO4mZK2puhY0Vn2/KI2C0fcZE+l17gCGQVHMOvfaFg99haziKBp5pqXXhw64xA==
X-Received: by 2002:a17:907:9803:b0:72e:ec55:b2a5 with SMTP id ji3-20020a170907980300b0072eec55b2a5mr17483035ejc.347.1659466942030;
        Tue, 02 Aug 2022 12:02:22 -0700 (PDT)
Received: from OEMBP14.local (82-132-212-195.dab.02.net. [82.132.212.195])
        by smtp.gmail.com with ESMTPSA id i28-20020a0564020f1c00b0043d5c9281a3sm5341500eda.96.2022.08.02.12.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 12:02:21 -0700 (PDT)
Date: Tue, 2 Aug 2022 20:02:18 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Grzegorz Szymaszek <gszymaszek@short.pl>
Cc: Greg KH <greg@kroah.com>, Grzegorz Szymaszek <gszymaszek@short.pl>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Larry.Finger@lwfinger.net
Subject: Re: [PATCH] staging: r8188eu: add firmware dependency
Message-ID: <Yul0urtdPUWoCuVe@OEMBP14.local>
References: <YukkBu3TNODO3or9@nx64de-df6d00>
 <YukvnVWuhUeOgRyZ@kroah.com>
 <Yukx8KEEOhKTJ7HQ@nx64de-df6d00>
 <c82114b6-1003-bfb5-0550-98dcbf1a3761@lwfinger.net>
 <YulcdKfhA8dPQ78s@nx64de-df6d00>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YulcdKfhA8dPQ78s@nx64de-df6d00>

On Tue, Aug 02, 2022 at 07:18:44PM +0200, Grzegorz Szymaszek wrote:
> The old rtl8188eu module, removed in commit 55dfa29b43d2 ("staging:
> rtl8188eu: remove rtl8188eu driver from staging dir") (Linux kernel
> v5.15-rc1), required (through a MODULE_FIRMWARE call()) the
> rtlwifi/rtl8188eufw.bin firmware file, which the new r8188eu driver no
> longer requires.
> 
> I have tested a few RTL8188EUS-based Wi-Fi cards and, while supported by
> both drivers, they do not work when using the new one and the firmware
> wasn't manually loaded. According to Larry Finger, the module
> maintainer, all such cards need the firmware and the driver should
> depend on it (see the linked mails).
> 
> Add a proper MODULE_FIRMWARE() call, like it was done in the old driver.
> 
> Thanks to Greg Kroah-Hartman and Larry Finger for quick responses to my
> questions.
> 
> Link: https://answers.launchpad.net/ubuntu/+source/linux-meta-hwe-5.15/+question/702611
> Link: https://lore.kernel.org/lkml/YukkBu3TNODO3or9@nx64de-df6d00/
> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> ---
>  drivers/staging/r8188eu/os_dep/os_intfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index 891c85b088ca..5bd3022e4b40 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -18,6 +18,7 @@ MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
>  MODULE_AUTHOR("Realtek Semiconductor Corp.");
>  MODULE_VERSION(DRIVERVERSION);
> +MODULE_FIRMWARE("rtlwifi/rtl8188eufw.bin");
>  
>  #define CONFIG_BR_EXT_BRNAME "br0"
>  #define RTW_NOTCH_FILTER 0 /* 0:Disable, 1:Enable, */
> -- 
> 2.35.1

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Thanks for the patch :-)

Regards,
Phil
