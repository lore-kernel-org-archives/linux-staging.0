Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F162C80
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 17:17:42 +0000 (UTC)
Received: from dslb-188-104-058-096.188.104.pools.vodafone-ip.de ([188.104.58.96] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <postmaster@kaiser.cx>)
	id 1n44UG-0005LM-Ax; Sun, 02 Jan 2022 18:17:40 +0100
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.94.2)
	(envelope-from <martin@martin-debian-2.paytec.ch>)
	id 1n44UF-000Epa-Nb; Sun, 02 Jan 2022 18:17:39 +0100
Date: Sun, 2 Jan 2022 18:17:39 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] staging: r8188eu: bAPKThermalMeterIgnore is set
 but never used
Message-ID: <YdHeM12+1huOMez0@martin-debian-1.paytec.ch>
References: <20220101084937.3411-1-straube.linux@gmail.com>
 <20220101084937.3411-5-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220101084937.3411-5-straube.linux@gmail.com>
Sender: "Martin Kaiser,,," <martin@martin-debian-2.paytec.ch>

Thus wrote Michael Straube (straube.linux@gmail.com):

> The field bAPKThermalMeterIgnore of struct hal_data_8188e is set but
> never used. Remove it.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v3: no changes
> v2: no changes

>  drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 ++---
>  drivers/staging/r8188eu/include/rtl8188e_hal.h  | 1 -
>  2 files changed, 2 insertions(+), 4 deletions(-)

> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index 065c2701077d..cce291ca44b1 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -1230,9 +1230,8 @@ void Hal_ReadThermalMeter_88E(struct adapter *Adapter, u8 *PROMContent, bool Aut
>  	else
>  		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;

> -	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail) {
> -		pHalData->bAPKThermalMeterIgnore = true;
> +	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail)
>  		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
> -	}
> +
>  	DBG_88E("ThermalMeter = 0x%x\n", pHalData->EEPROMThermalMeter);
>  }
> diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> index de58c85b8bdc..40b3db34b8f2 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> @@ -181,7 +181,6 @@ struct hal_data_8188e {
>  	u8	EEPROMRegulatory;

>  	u8	EEPROMThermalMeter;
> -	u8	bAPKThermalMeterIgnore;

>  	bool	EepromOrEfuse;

> -- 
> 2.34.1

Acked-by: Martin Kaiser <martin@kaiser.cx>
