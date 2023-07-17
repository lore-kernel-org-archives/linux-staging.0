Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7556253C8
	for <linux-staging@lists.linux.dev>; Mon, 17 Jul 2023 15:05:54 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-316f4abb1e1so2090632f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Jul 2023 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689606353; x=1692198353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5HMF+3gLK5cYmczoQxqjw4HQ1skgU8ThVv1Ilh3ERK4=;
        b=fg4B4HIsSKwY7p16Qf5wOAW+y+5GZ6vPanUU5sdNy2HOiz0vQgikjMTKW0LI8lyZN/
         1WWGqLld2S8aLQlxa2p30DYSEByxCrS7pjOIV92P+Ufsh5kKem/dlIrts/Z3e+uzJDkM
         JUab9/sKsY37M3A7ogxLETX2XSzyds+aqA+dKWN2PHvu2wS7mSRMcasgcyDeRBAChEiV
         hbxUJlj+BBHrmacycnO9zbtYRnnMfTtlWYGvIK1H0+tMvHqHxHz+035eZOfTFdq0gHRp
         xW0xJHrdPJ9t/ATjwFJwxvswl5toTDLHM9CRemy/pippEgdvHP/bAmWQ+EiP1DzLD2fF
         FqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689606353; x=1692198353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HMF+3gLK5cYmczoQxqjw4HQ1skgU8ThVv1Ilh3ERK4=;
        b=VyxUMT9ppzKrbHolbuT1U7AHyKEhuFanN6KIe2Y7/n0ahqdOC2NjGeZsx5DLpq1g/6
         +omq0Bg2ve5uBsfrJXDNeFv4cWcFs/rISnT7/5KQ2u8//+fYCGZljVWPy1/MQv7UyNHY
         GLuKEu09AFR1WzqZkSzlv0i4UDLFfirJWo56IqQIUdz+uwVeaHBZNg5qmdvJj4VxfKKu
         l3djvcF0x0S52Ymw7zFyL5vastexPf9TYSPsNM7zOEGaHdAKT+9LDY10eGW/e5009CBa
         6z8o7JWzG/hMIuI1tTVJJhyvFu/7+1OUZt9HGlk9+n5zLxZaoTOvZr0il/J/rqGawmJB
         mftg==
X-Gm-Message-State: ABy/qLY7PjtXWyNeb88rJnL3rDRNaef4V8NU/G80AtOrvoip8LitNtNC
	73MFpnKW4aB8c7AigQMpdpVmmg==
X-Google-Smtp-Source: APBJJlFt80i2tF2riyK93o+9FSLSY8biPiP+tNppUxOCK+QtylQ7L/JE6FXrgmwMufNLH2SiflKATQ==
X-Received: by 2002:adf:ea10:0:b0:314:35ce:a0e7 with SMTP id q16-20020adfea10000000b0031435cea0e7mr9638333wrm.16.1689606352894;
        Mon, 17 Jul 2023 08:05:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j18-20020a5d4492000000b00315a1c160casm19401858wrq.99.2023.07.17.08.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:05:51 -0700 (PDT)
Date: Mon, 17 Jul 2023 18:05:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/1] drivers:staging: fix return value check in
 fsl_mx6_enable
Message-ID: <4b6d604d-9712-4d8c-8fa1-508397560860@kadam.mountain>
References: <20230717144717.23907-1-ruc_gongyuanjun@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717144717.23907-1-ruc_gongyuanjun@163.com>

On Mon, Jul 17, 2023 at 10:47:17PM +0800, Yuanjun Gong wrote:
> in fsl_mx6_enable, the second time of calling clk_prepare_enable()
> may fail, so its return value should also be checked. the clk enabled
> by the first invocation of clk_prepare_enable should be disabled
> on the error path.
> 
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  drivers/staging/most/dim2/dim2.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 44d3252d4612..4204cfba6b48 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -944,7 +944,12 @@ static int fsl_mx6_enable(struct platform_device *pdev)
>  		}
>  
>  		writel(0x888, dev->io_base + 0x38);
> -		clk_prepare_enable(dev->clk_pll);
> +		ret = clk_prepare_enable(dev->clk_pll);
> +		if (ret) {
> +			dev_err(&pdev->dev, "%s\n", "clk_prepare_enable failed");
> +			clk_disable_unprepare(dev->clk);
> +			return ret;

This function has several wrong things.  The IS_ERR_OR_NULL() checks
should be IS_ERR().  It should propagate the error code instead of
returning -EFAULT.  Using dev_err_probe() is required as well because
the error code could be -EPROBE_DEFER.

It would be cleaner to use devm_clk_get_enabled().  That's simple enough
for the first instance but I wonder what the writel(0x888, dev->io_base + 0x38);
is for before the second enable?

Anyway, it would be better to send something like this.

regards,
dan carpenter

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 44d3252d4612..d33394d4f742 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -922,29 +922,20 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 	struct dim2_hdm *dev = platform_get_drvdata(pdev);
 	int ret;
 
-	dev->clk = devm_clk_get(&pdev->dev, "mlb");
-	if (IS_ERR_OR_NULL(dev->clk)) {
-		dev_err(&pdev->dev, "unable to get mlb clock\n");
-		return -EFAULT;
-	}
-
-	ret = clk_prepare_enable(dev->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "%s\n", "clk_prepare_enable failed");
-		return ret;
-	}
+	dev->clk = devm_clk_get_enabled(&pdev->dev, "mlb");
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk), "unable to get mlb clock\n");
 
 	if (dev->clk_speed >= CLK_2048FS) {
 		/* enable pll */
 		dev->clk_pll = devm_clk_get(&pdev->dev, "pll8_mlb");
-		if (IS_ERR_OR_NULL(dev->clk_pll)) {
-			dev_err(&pdev->dev, "unable to get mlb pll clock\n");
-			clk_disable_unprepare(dev->clk);
-			return -EFAULT;
-		}
+		if (IS_ERR(dev->clk_pll))
+			return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk_pll), "unable to get mlb pll clock\n");
 
 		writel(0x888, dev->io_base + 0x38);
-		clk_prepare_enable(dev->clk_pll);
+		ret = clk_prepare_enable(dev->clk_pll);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -956,8 +947,6 @@ static void fsl_mx6_disable(struct platform_device *pdev)
 
 	if (dev->clk_speed >= CLK_2048FS)
 		clk_disable_unprepare(dev->clk_pll);
-
-	clk_disable_unprepare(dev->clk);
 }
 
 static int rcar_gen2_enable(struct platform_device *pdev)
