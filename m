Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D327A8F77;
	Wed, 18 Oct 2023 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="lJ8eLjOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NWad4ezdKyh7fVlIm7RYq8OCRyT0bSyjdlIaCm1giqw=;
  b=lJ8eLjOkyt075eOOu6aYmoWK+MuD+PtkhmyoeGHj9+66MZqeja+DE+B+
   qiBWWogZQqMePb+86D6gsGbyuUWJKuag3pqa3L6pxZm5iCrHusiAlu7Jo
   KgQLv9R4LOxp6538N0D7oFaMTPxG7oUI90DYqqihSq0dspxzP2XgfA22+
   0=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,234,1694728800"; 
   d="scan'208";a="131810198"
Received: from dhcp-138-246-3-50.dynamic.eduroam.mwn.de (HELO hadrien) ([138.246.3.50])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 09:03:39 +0200
Date: Wed, 18 Oct 2023 09:03:39 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: kenechukwu maduechesi <maduechesik@gmail.com>
cc: outreachy@lists.linux.dev, shreeya.patel23498@gmail.com, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Replace delay function.
In-Reply-To: <20231018004300.GA3189@ubuntu>
Message-ID: <7bc719c4-459f-3d8-7ed-b1e1adf158@inria.fr>
References: <20231018004300.GA3189@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 17 Oct 2023, kenechukwu maduechesi wrote:

> Replace udelay() with usleep_range() for more precise delay handling.
>
> Reported by checkpatch:
>
> CHECK: usleep_range is preferred over udelay

This message is typically not a good candidate for outreachy patches,
because you need access to the device to be sure that any change is
correct.

julia

>
> Signed-off-by: kenechukwu maduechesi <maduechesik@gmail.com>
> ---
>  drivers/staging/rts5208/sd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
> index 74c4f476b3a4..059f99b0a727 100644
> --- a/drivers/staging/rts5208/sd.c
> +++ b/drivers/staging/rts5208/sd.c
> @@ -865,7 +865,7 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
>  						     PHASE_CHANGE);
>  			if (retval)
>  				return retval;
> -			udelay(50);
> +			usleep_range(50);
>  			retval = rtsx_write_register(chip, SD_VP_CTL, 0xFF,
>  						     PHASE_CHANGE |
>  						     PHASE_NOT_RESET |
> @@ -877,14 +877,14 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
>  						     CHANGE_CLK, CHANGE_CLK);
>  			if (retval)
>  				return retval;
> -			udelay(50);
> +			usleep_range(50);
>  			retval = rtsx_write_register(chip, SD_VP_CTL, 0xFF,
>  						     PHASE_NOT_RESET |
>  						     sample_point);
>  			if (retval)
>  				return retval;
>  		}
> -		udelay(100);
> +		usleep_range(100);
>
>  		rtsx_init_cmd(chip);
>  		rtsx_add_cmd(chip, WRITE_REG_CMD, SD_DCMPS_CTL, DCMPS_CHANGE,
> @@ -918,7 +918,7 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
>  				return retval;
>  		}
>
> -		udelay(50);
> +		usleep_range(50);
>  	}
>
>  	retval = rtsx_write_register(chip, SD_CFG1, SD_ASYNC_FIFO_NOT_RST, 0);
> @@ -1416,7 +1416,7 @@ static int sd_wait_data_idle(struct rtsx_chip *chip)
>  			retval = STATUS_SUCCESS;
>  			break;
>  		}
> -		udelay(100);
> +		usleep_range(100);
>  	}
>  	dev_dbg(rtsx_dev(chip), "SD_DATA_STATE: 0x%02x\n", val);
>
> --
> 2.25.1
>
>
>
