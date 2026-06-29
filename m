Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E803CA4B8
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 07:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717930; cv=none; b=SWOtbl25717Tf2cJdQA2DAe2fSngcwRspph4LFcw+/Qm+Gg0WVa8wqomIPsf4Iy/hwvJb5B80VZfXLURfQkmF09Qvwq8EEFon84f0MFlpWLDLxeEFA6vvpnqkzaFozpTVIG7/WeAj60q0qu16WhhrqOVZzOV8s9vJ/dzNcwgR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717930; c=relaxed/simple;
	bh=khgheVguVdeFE+wyUH5YXIcOZa6D01g5zyQMaHR1NvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVLzT7ehq7fzjoJOPtHwtFrLZUqnGbqa/idNRvwvylZXkNsLeP3v9rnVyQo4uuQJXHQT3PCiD5e6PiaSSaRCoGV4HEQ7W3jIgUK45E/kdPMeim+S3Dr8vNYmQCJDsd6VmjzCQWahgo9CLqdxwpAbdR55SLsUdLK0rN1QRddNrDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5feutev; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5feutev"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493a7bd27c2so9157105e9.3
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 00:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782717926; x=1783322726; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ie4+XaFXJV+Jm6lzci9LsIOsL6cRLfhbTILzizGtUw=;
        b=E5feutevBL3yMo7iwF7YTwoVdGZ1PMh2yjcfEnH/Yl0eqss464u0pvNIw21JYF64Qs
         k8DBjA7ghX56/maJ+l1KxQlNIpWs6QDDyxWEumwsljEDUC/OCEj2gU1QvLUmigFPKOOw
         tI89sYaMcoMGC4LqWYAzQGyDsj/cTh0ZDuoFDnHET/iYT91FQCltiW+3zlMcTfnDx6IF
         T0ZSFVo/exyvDjrqx5EHAjt1r3S3bxM33J1Ot7nhNlCRVg86uiA03WlwASDtaLOO/uDG
         MfAVlD02KW84GIg3O1epzPtL8Zgl5+aiBUfJB4ofXiS5sc0Rncvn94tBYKGlf/wMTgVQ
         Ddxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717926; x=1783322726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ie4+XaFXJV+Jm6lzci9LsIOsL6cRLfhbTILzizGtUw=;
        b=GM1IS+PSWszLupJHMk/MT8GCLsUWF1CqMtQLMDs17X3l4GUeK2wektJnm9v5xfQUsH
         aGakDGyuYERYzq6M7MsekEJsSbAI5XUNJP/c7/x+wuB2bR5tlvpz33v72c/QdTuF1xsi
         Zl/oKUuI6dQJwERmwJkWhwfMxCTcYjYswPkHzu+o+KMeTxRaXHeASnpXJ2TS329BNSnC
         sxkeL+Z+/e3tVLG5d74WGBvsWdh+mMQFhcGHNsd7tDLe9rXbvUyGoMhSJObpTGqdVObP
         OhyC03NS0equnQ2dFLu0sKG9nsS6uzit0MkJSAZO4z8Kj15bjttfJjk+LTE6l0acI7ZV
         LU7g==
X-Forwarded-Encrypted: i=1; AFNElJ8v5McjJY8czFKOkIM4XiTV1SxdqH7TTA/mWlWfD1r4cugEEFVDZ7aUwTc/Lz3Cs4GKVh+jPbl63pe8RSL0@lists.linux.dev
X-Gm-Message-State: AOJu0YzvKlPHvXtkT403x/VmItmCWUpXm3gL9zx9fE7p6nnsHf6FIyUm
	YoNhToAvex2RaGKekw5E0sfDXAgzzVt37idiRnF9Z13nQ5gOoTUpyksY
X-Gm-Gg: AfdE7ck+oYPc3dux87UEFy+i2RXH0N839WTbTIm/Nj6cy+mQiwYwfTp7HTIEd/kE8Cm
	oqDiXxt0DSiwo8uTU6eYXncbLDL5NiVwB9Rk6lidkJbldJ6quyWzE+JQfiGSL6nSpM/K4+KDGKq
	roNwzgJztdIfXDxh2bIsscXTy3lV4vkBopiuBS2zv2Yw84R7O3bdoDVrHccLjTS8vvK4uordTBl
	74qmZkFLfqpWRcaywiVr6+dNoblKIzam7hvNieEYUt5soaZMH0XtjInjj900BMOLRNox6Q2cwM0
	QElja6vh9OxQgWP/rgzTFLwhGIT04gALuiNGemkTHEi/x9XbMC6kaAqh2eAM+la7vG0LsuQebaL
	t2PJMhseFAys/kJS+HpQ2YPzv6Z4yhbe7fV2GWpj/35fdKBR1oK48GpqQkVKMYZnuYX6T4ZQE6R
	7oO0YHFuj5CA==
X-Received: by 2002:a05:600c:4747:b0:493:8391:919a with SMTP id 5b1f17b1804b1-4938391942amr106268015e9.16.1782717925877;
        Mon, 29 Jun 2026 00:25:25 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c285fc1sm198718815e9.1.2026.06.29.00.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:25:25 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:25:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prashant Rahul <prashantrahul23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: octeon: factor out device removal into a
 helper
Message-ID: <akId4dR-VjQqu5d_@stanley.mountain>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
 <20260628-staging-driver-octeon-panic-v1-1-fe8c34989254@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-staging-driver-octeon-panic-v1-1-fe8c34989254@gmail.com>

On Sun, Jun 28, 2026 at 12:31:24PM +0530, Prashant Rahul wrote:
> Factor out the common device removal sequence into a helper in
> preparation for adding cleanup to the probe error path.
> 
> Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
> ---
>  drivers/staging/octeon/ethernet.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index f3fa221f452e2..e07c6911b8252 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -104,6 +104,21 @@ struct net_device *cvm_oct_device[TOTAL_NUMBER_OF_PORTS];
>  
>  u64 cvm_oct_tx_poll_interval;
>  
> +static inline void cvm_oct_remove_device(int port)
> +{
> +	if (cvm_oct_device[port]) {
> +		struct net_device *dev = cvm_oct_device[port];
> +		struct octeon_ethernet *priv = netdev_priv(dev);
> +
> +		cancel_delayed_work_sync(&priv->port_periodic_work);
> +
> +		cvm_oct_tx_shutdown_dev(dev);
> +		unregister_netdev(dev);
> +		free_netdev(dev);
> +		cvm_oct_device[port] = NULL;
> +	}
> +}
> +
>  static void cvm_oct_rx_refill_worker(struct work_struct *work)
>  {
>  	struct octeon_ethernet_platform *plat = container_of(work,
> @@ -949,17 +964,7 @@ static void cvm_oct_remove(struct platform_device *pdev)
>  
>  	/* Free the ethernet devices */
>  	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++) {
> -		if (cvm_oct_device[port]) {
> -			struct net_device *dev = cvm_oct_device[port];
> -			struct octeon_ethernet *priv = netdev_priv(dev);
> -
> -			cancel_delayed_work_sync(&priv->port_periodic_work);
> -
> -			cvm_oct_tx_shutdown_dev(dev);
> -			unregister_netdev(dev);
> -			free_netdev(dev);
> -			cvm_oct_device[port] = NULL;
> -		}
> +		cvm_oct_remove_device(port);
>  	}

Delete the curly braces as well.

regards,
dan carpenter

