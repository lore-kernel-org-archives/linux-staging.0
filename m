Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E743FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 19:50:50 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mIFy3-0006Ia-8C; Mon, 23 Aug 2021 21:50:47 +0200
Date: Mon, 23 Aug 2021 21:50:47 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove 5 GHz code
Message-ID: <20210823195047.xn4brfgrec726oew@viti.kaiser.cx>
References: <20210823193028.12391-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823193028.12391-1-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> The driver is for chips that do not operate in the 5 GHz band.
> Remove some 5 GHz related code.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 30 ++++++--------------
>  1 file changed, 8 insertions(+), 22 deletions(-)

> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index ab4a9200f079..81d4255d1785 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -208,17 +208,10 @@ static char *translate_scan(struct adapter *padapter,
>  		else
>  			snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11bg");
>  	} else {
> -		if (pnetwork->network.Configuration.DSConfig > 14) {
> -			if (ht_cap)
> -				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11an");
> -			else
> -				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11a");
> -		} else {
> -			if (ht_cap)
> -				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11gn");
> -			else
> -				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11g");
> -		}
> +		if (ht_cap)
> +			snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11gn");
> +		else
> +			snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11g");
>  	}

>  	start = iwe_stream_add_event(info, start, stop, &iwe, IW_EV_CHAR_LEN);
> @@ -737,17 +730,10 @@ static int rtw_wx_get_name(struct net_device *dev,
>  			else
>  				snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11bg");
>  		} else {
> -			if (pcur_bss->Configuration.DSConfig > 14) {
> -				if (ht_cap)
> -					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11an");
> -				else
> -					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11a");
> -			} else {
> -				if (ht_cap)
> -					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11gn");
> -				else
> -					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11g");
> -			}
> +			if (ht_cap)
> +				snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11gn");
> +			else
> +				snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11g");
>  		}
>  	} else {
>  		snprintf(wrqu->name, IFNAMSIZ, "unassociated");
> -- 
> 2.32.0


Hi Michael and all,

looks good.

Acked-by: Martin Kaiser <martin@kaiser.cx>


Two comments unrelated to your patch: I guess that DSConfig is the
channel number, those two drivers have a misleading comment:

  3 F   m    DSConfig
    drivers/staging/r8188eu/include/wlan_bssdef.h
               struct:ndis_802_11_config
               u32           DSConfig;           /*  Frequency, units are kHz */
  4 F   m    DSConfig          drivers/staging/rtl8712/wlan_bssdef.h
               struct:NDIS_802_11_CONFIGURATION
               u32 DSConfig;           /* Frequency, units are kHz */


The rtw_wx_get_name function has a similar check
if (pcur_bss->Configuration.DSConfig > 14).

But when Larry adds cfg80211 support, I guess all IW_HANDLER()s will
become obsolete...

Best regards,
Martin
