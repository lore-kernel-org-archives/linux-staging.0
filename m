Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51ED72
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 06:48:48 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id l14so4353404wrx.5
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IKXcxnWF21IewR9wIieTn14wip6AbGuoZC3VKnAXHRE=;
        b=tpK+5Qm+ktkMRXVijvPcETBwxwofH6M8d29kPVbc61bnfMSCNtbLf5qwFCM5EcNf18
         6Dmc+4XhQ0js/oA2gzcFnNPnko1C/VMLTRdEAVgJ9noqqtDSRvxtI4ers6gwk3ElLf3T
         p8oSHjh0a3EmtV2H/Ny9F04UrKVuP5xQ2mHtW4Nug0kINwxMtCj+vWRdSpvAOStQsl7V
         SVJvrD1bAgaXddXtQlYkybyMhHR5zANgdVKDOivnZhgFcpNFFpo3RQX3EppoI+hIP7or
         QVZYDeyQfCAETXxGwN9LPLQcl7b4/k/9ypfgGdgxNUCYsfU+FzSZ11U5+5nTHl8Y+KLQ
         izlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=IKXcxnWF21IewR9wIieTn14wip6AbGuoZC3VKnAXHRE=;
        b=CVVnqQEOCm8woI+fz84zNERTARQbrjOcNCTv0JimKzHTwp7Qxfm+kwsD3+Rz0n/4KG
         1k5vfHGBsRMENdiMeMf7gDpL8CyQCMJPUL0/lY+eLZC7axZnG/jnodbWM0WCFCnwfhBp
         LOjj6Ar0qEd/wXzYIhkcWq/kiFci1ItgmqSQ4vIoASQAyjDvt+WD96rejEs9sgk2YHX3
         kOwmsg/vZHsPiivdpEue3nQYZxdNluTyBVqEKIf0GdRFKdbGLhFrScPCDT/tWfZL/09V
         qjGC1IkYFlqiO+pZlDzYuPPsTPMjnPPDS7OlxpDDw9V093Coa/gWc6sAbPdNAgcp0YMw
         039Q==
X-Gm-Message-State: AOAM530+5nQwShVvReg6UC9t24UlCbLZ0vgPeWbicPCZb5vFqqGAwzLj
	qMN8btQ6wvzBpO5JFxGMBsI=
X-Google-Smtp-Source: ABdhPJzzEXX2RbhevlNEaKTuSgF6Vcj9Bc5NQt99SWM4AzDlhQHknCzkPCD2pX4lRFJ1Q/AH5Mi2uw==
X-Received: by 2002:adf:ffcc:: with SMTP id x12mr3161980wrs.162.1620283727098;
        Wed, 05 May 2021 23:48:47 -0700 (PDT)
Received: from agape.jhs ([5.171.72.109])
        by smtp.gmail.com with ESMTPSA id r5sm2239134wmh.23.2021.05.05.23.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 23:48:46 -0700 (PDT)
Date: Thu, 6 May 2021 08:48:44 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sven Van Asbroeck <TheSven73@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] staging: fieldbus: anybus: Make remove callback
 return void
Message-ID: <20210506064843.GA1432@agape.jhs>
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Uwe,

On Wed, May 05, 2021 at 10:29:22PM +0200, Uwe Kleine-König wrote:
> The driver core ignores the return value of struct bus_type::remove()
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct vio_driver::remove() return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea.

looks like that the commit description hardly matches what you changed
here. You changed the return type of handler remove() of struct
anybuss_client_driver. Are the latter and bus_type tied in some
fashion?


Why using :: notation?

> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/staging/fieldbus/anybuss/anybuss-client.h | 2 +-
>  drivers/staging/fieldbus/anybuss/hms-profinet.c   | 3 +--
>  drivers/staging/fieldbus/anybuss/host.c           | 3 ++-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/fieldbus/anybuss/anybuss-client.h b/drivers/staging/fieldbus/anybuss/anybuss-client.h
> index 8ee1f1baccf1..a219688006fe 100644
> --- a/drivers/staging/fieldbus/anybuss/anybuss-client.h
> +++ b/drivers/staging/fieldbus/anybuss/anybuss-client.h
> @@ -32,7 +32,7 @@ struct anybuss_client {
>  struct anybuss_client_driver {
>  	struct device_driver driver;
>  	int (*probe)(struct anybuss_client *adev);
> -	int (*remove)(struct anybuss_client *adev);
> +	void (*remove)(struct anybuss_client *adev);
>  	u16 anybus_id;
>  };
>  
> diff --git a/drivers/staging/fieldbus/anybuss/hms-profinet.c b/drivers/staging/fieldbus/anybuss/hms-profinet.c
> index eca7d97b8e85..e691736a53f1 100644
> --- a/drivers/staging/fieldbus/anybuss/hms-profinet.c
> +++ b/drivers/staging/fieldbus/anybuss/hms-profinet.c
> @@ -190,12 +190,11 @@ static int profinet_probe(struct anybuss_client *client)
>  	return 0;
>  }
>  
> -static int profinet_remove(struct anybuss_client *client)
> +static void profinet_remove(struct anybuss_client *client)
>  {
>  	struct profi_priv *priv = anybuss_get_drvdata(client);
>  
>  	fieldbus_dev_unregister(&priv->fbdev);
> -	return 0;
>  }
>  
>  static struct anybuss_client_driver profinet_driver = {
> diff --git a/drivers/staging/fieldbus/anybuss/host.c b/drivers/staging/fieldbus/anybuss/host.c
> index c97df91124a4..de6c287efa03 100644
> --- a/drivers/staging/fieldbus/anybuss/host.c
> +++ b/drivers/staging/fieldbus/anybuss/host.c
> @@ -1194,7 +1194,8 @@ static int anybus_bus_remove(struct device *dev)
>  		to_anybuss_client_driver(dev->driver);
>  
>  	if (adrv->remove)
> -		return adrv->remove(to_anybuss_client(dev));
> +		adrv->remove(to_anybuss_client(dev));
> +
>  	return 0;
>  }
>  
> 
> base-commit: d665ea6ea86c785760ee4bad4543dab3267ad074
> -- 
> 2.30.2
> 
> 

thank you,

fabio
