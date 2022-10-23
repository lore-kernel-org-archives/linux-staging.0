Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED567B;
	Sun, 23 Oct 2022 13:35:52 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id p14so6913223pfq.5;
        Sun, 23 Oct 2022 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7z7YqZZVbpAlAQvHExqoCDqTGuVoNoLe8669wm15dZQ=;
        b=X1QU2qo7zbp0vSQFgaWQd9/E/APQZawGwjkDIxtoMead8XocGOf60T2kMam0HO3bLp
         pnYd5zmI5vPm2MYUDGEcqdXPXq48gb4MyDs3OSUJAG3nDGM9Mhpn0pSUKVyi1tqZAZTP
         7z0+oGGDGCrHTBtYyFkuHfOgIN9CVrwmpFls4rxjigNVJeWAomb4fq9sTUYeQ4k3Vdgh
         kdo21BJsD66YrssTxjOmhXYRrTYYzqWaIZx5aqZxBk7ckSnaynCjvc2Eb0rjARQlj52w
         pVQs/eioAjjTWmH1PACCwVOgbW5pXvp9uqj4BGbppp9AVEyKZWzs6qq/baTwbKREIc3j
         sFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z7YqZZVbpAlAQvHExqoCDqTGuVoNoLe8669wm15dZQ=;
        b=A0OB+LctM90aYqrZWKhschnEFRdsA6lIZ1xywtIjQxLoNswQfR8AqiiMfaubGXU322
         fdp/nkYyMP7IzjoR84D47QUizdQ2G3e1Y3PmnuVWOtQ3hmavQzD7ynZsKiYncTytlg/V
         QipieiBijFk00m45J4w39DeQ2GZ+Ts8LUeuN9qYFXaTn9RNZ8x7rNxbSmxtnsh0eMr2E
         ueJmHsG+083VC9Wrmq044drcrHuIOPMibabLvXUp/krAdQj39ZC2GPfqm80EnaSF+ggs
         KbP4+x4PpzAXdnKX5qFhTak88KGr8gvc6t9j6qo5ibgdVrCNHaRQKvtgNMZn/jIJU0Ah
         tpjA==
X-Gm-Message-State: ACrzQf1RW9ZnIjBDc+TxcR/fHevDxUmXR+aTu0FOmvK0Td3ZnBiiSaQq
	YvqeL+T6fM+EQht/ZisVOzE=
X-Google-Smtp-Source: AMsMyM5K8ktLCq8rquQ11MICFwPrZxwfEWif2dHkxiDXAgW3bgpbFWSAvGNz86OG1fZWT3TkhiS1aA==
X-Received: by 2002:a63:1b58:0:b0:45f:e7ba:a223 with SMTP id b24-20020a631b58000000b0045fe7baa223mr23273411pgm.548.1666532151686;
        Sun, 23 Oct 2022 06:35:51 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-1.three.co.id. [180.214.232.1])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090301c100b0016eef326febsm4772754plh.1.2022.10.23.06.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 06:35:51 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id C6FC81005FC; Sun, 23 Oct 2022 20:35:47 +0700 (WIB)
Date: Sun, 23 Oct 2022 20:35:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wlan-ng: remove commented debug printk
 messages
Message-ID: <Y1VDM2kWIi1I5dqI@debian.me>
References: <Y1L0FiKvrM9jjZG9@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="poWQKV2hrqk2xXjk"
Content-Disposition: inline
In-Reply-To: <Y1L0FiKvrM9jjZG9@debian-BULLSEYE-live-builder-AMD64>


--poWQKV2hrqk2xXjk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 22, 2022 at 01:03:42AM +0530, Deepak R Varma wrote:
> diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wla=
n-ng/p80211netdev.c
> index e04fc666d218..6bef419e8ad0 100644
> --- a/drivers/staging/wlan-ng/p80211netdev.c
> +++ b/drivers/staging/wlan-ng/p80211netdev.c
> @@ -881,55 +881,42 @@ static int p80211_rx_typedrop(struct wlandevice *wl=
andev, u16 fc)
>  		wlandev->rx.mgmt++;
>  		switch (fstype) {
>  		case WLAN_FSTYPE_ASSOCREQ:
> -			/* printk("assocreq"); */
>  			wlandev->rx.assocreq++;
>  			break;
>  		case WLAN_FSTYPE_ASSOCRESP:
> -			/* printk("assocresp"); */
>  			wlandev->rx.assocresp++;
>  			break;
>  		case WLAN_FSTYPE_REASSOCREQ:
> -			/* printk("reassocreq"); */
>  			wlandev->rx.reassocreq++;
>  			break;
>  		case WLAN_FSTYPE_REASSOCRESP:
> -			/* printk("reassocresp"); */
>  			wlandev->rx.reassocresp++;
>  			break;
>  		case WLAN_FSTYPE_PROBEREQ:
> -			/* printk("probereq"); */
>  			wlandev->rx.probereq++;
>  			break;
>  		case WLAN_FSTYPE_PROBERESP:
> -			/* printk("proberesp"); */
>  			wlandev->rx.proberesp++;
>  			break;
>  		case WLAN_FSTYPE_BEACON:
> -			/* printk("beacon"); */
>  			wlandev->rx.beacon++;
>  			break;
>  		case WLAN_FSTYPE_ATIM:
> -			/* printk("atim"); */
>  			wlandev->rx.atim++;
>  			break;
>  		case WLAN_FSTYPE_DISASSOC:
> -			/* printk("disassoc"); */
>  			wlandev->rx.disassoc++;
>  			break;
>  		case WLAN_FSTYPE_AUTHEN:
> -			/* printk("authen"); */
>  			wlandev->rx.authen++;
>  			break;
>  		case WLAN_FSTYPE_DEAUTHEN:
> -			/* printk("deauthen"); */
>  			wlandev->rx.deauthen++;
>  			break;
>  		default:
> -			/* printk("unknown"); */
>  			wlandev->rx.mgmt_unknown++;
>  			break;
>  		}
> -		/* printk("\n"); */
>  		drop =3D 2;
>  		break;
>=20
> @@ -943,35 +930,27 @@ static int p80211_rx_typedrop(struct wlandevice *wl=
andev, u16 fc)
>  		wlandev->rx.ctl++;
>  		switch (fstype) {
>  		case WLAN_FSTYPE_PSPOLL:
> -			/* printk("pspoll"); */
>  			wlandev->rx.pspoll++;
>  			break;
>  		case WLAN_FSTYPE_RTS:
> -			/* printk("rts"); */
>  			wlandev->rx.rts++;
>  			break;
>  		case WLAN_FSTYPE_CTS:
> -			/* printk("cts"); */
>  			wlandev->rx.cts++;
>  			break;
>  		case WLAN_FSTYPE_ACK:
> -			/* printk("ack"); */
>  			wlandev->rx.ack++;
>  			break;
>  		case WLAN_FSTYPE_CFEND:
> -			/* printk("cfend"); */
>  			wlandev->rx.cfend++;
>  			break;
>  		case WLAN_FSTYPE_CFENDCFACK:
> -			/* printk("cfendcfack"); */
>  			wlandev->rx.cfendcfack++;
>  			break;
>  		default:
> -			/* printk("unknown"); */
>  			wlandev->rx.ctl_unknown++;
>  			break;
>  		}
> -		/* printk("\n"); */
>  		drop =3D 2;
>  		break;
>=20
> @@ -1007,7 +986,6 @@ static int p80211_rx_typedrop(struct wlandevice *wla=
ndev, u16 fc)
>  			wlandev->rx.cfack_cfpoll++;
>  			break;
>  		default:
> -			/* printk("unknown"); */
>  			wlandev->rx.data_unknown++;
>  			break;
>  		}

Shouldn't these printks be guarded under CONFIG_DEBUG_KERNEL instead?

--=20
An old man doll... just what I always wanted! - Clara

--poWQKV2hrqk2xXjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1VDLwAKCRD2uYlJVVFO
oyncAQCxZQScet80h1V0jIpeJeicBZGgSrtnUhtAia3r9SOb0AEAobtYi8GrOk/3
jJZ/0L5cff15DnBaSAb6Wi3y5TUryAg=
=8oiv
-----END PGP SIGNATURE-----

--poWQKV2hrqk2xXjk--
