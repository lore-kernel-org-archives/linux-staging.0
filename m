Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320FE168
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 18:57:19 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id y23so14560716oia.13
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 10:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WE5pCl9Bv6lvJdU3hooef5OUywFPsVbb8vY6CeFQjqo=;
        b=aeJ/mJezruy5niqH4LF0n+pGQOn0aSqHfzXMUBYRD3tkmg9UgyMG3Rf1GrvHir/SNe
         ucx4qMUL7/HyX2o2d4OSs494rzODZt+HtW5a1fJbFEHDUgkWOKd/TZ1lLkHecdNT9ySa
         geCzMMFoM3kbHgsuszNNaULnhB4B3xo0cSW/IvoaMCR7VsuBnW844X4HxipBBgQD2RM9
         lldLE3Vdb/xqrmqqnj+xwVcbTo5LwQCzxKOjFQYbVWurxdK9qBVN7l3Vnvc+ZHszfBk8
         GPf70fVUJsBVMEEa4U1n3XK3QAJ4uw+HC49hAaXpUuSwYsXUVupCN9KC2WB74OZzPxgD
         afyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WE5pCl9Bv6lvJdU3hooef5OUywFPsVbb8vY6CeFQjqo=;
        b=t6NvqZpvhlD8j39kP01B/Kg70DKhF2U0NypAMoORUPf5kc8OiLl58NWQuUOcv764jd
         3+O/4V2yxLtAXcAqQlDKIKaqrCIW9XIrhMFw3vGBcBk6XQufpQzcuO7321ZC4JU34W0e
         glw6zInRqcVlTldOX6MGRBLjh8O9IMGZbnVALAZmXi/lrMliXS8e5+migCCl+YOfSLcJ
         VRvL566U+2VkBlvu5p7R/HCoWeNp30YTPQDREoLCP+VV8RJ3peDddeBvARM5ZTw4DiCx
         o4fQoyrII+TaqUr/Aw5lWz5xcB4yWB6BblH737ENBtJSF+NNKnySMgF85ZteQj6qjlan
         1xdg==
X-Gm-Message-State: AOAM5305vywayMO4WPITb8XplHFnPafcPueizpWBanJlKiuhq0EGRMZE
	GW1nxko/aNQl9FQpDsODPH+qYw==
X-Google-Smtp-Source: ABdhPJyMsHLmdvHCbt7oGLxKO6/gQpQvEppY7vrVNoj5xgPVyZ+CJV5ILNr38BnKSnrPytywMOOXqQ==
X-Received: by 2002:a05:6808:159b:: with SMTP id t27mr1504381oiw.233.1643137038250;
        Tue, 25 Jan 2022 10:57:18 -0800 (PST)
Received: from eze-laptop ([186.122.18.78])
        by smtp.gmail.com with ESMTPSA id q11sm7202385otl.8.2022.01.25.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 10:57:17 -0800 (PST)
Date: Tue, 25 Jan 2022 15:57:10 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, aford@beaconembedded.com,
	cphealy@gmail.com, Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH V4 01/11] arm64: dts: imx8mq-tqma8mq: Remove redundant
 vpu reference
Message-ID: <YfBIBlK2LAvjftUE@eze-laptop>
References: <20220125171129.472775-1-aford173@gmail.com>
 <20220125171129.472775-2-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125171129.472775-2-aford173@gmail.com>

On Tue, Jan 25, 2022 at 11:11:18AM -0600, Adam Ford wrote:
> The vpu is enabled by default, so there is no need to manually
> enable it.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
> index 8aedcddfeab8..38ffcd145b33 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
> @@ -272,10 +272,6 @@ &usdhc1 {
>  	status = "okay";
>  };
>  
> -&vpu {
> -	status = "okay";
> -};
> -
>  /* Attention: wdog reset forcing POR needs baseboard support */
>  &wdog1 {
>  	status = "okay";
> -- 
> 2.32.0
> 
