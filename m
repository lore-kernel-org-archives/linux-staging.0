Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E7735B639
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032091; cv=none; b=W5TRiSJnSCEVrJ6+K5kl5wvwVkjGMzAQufSD526PlHPxD1xjZAQ1t9cWC9fOfNYTFHvO3bQReGhwD0gk1zJ0sx3LHI3MbubBh+MAzvBW2cwNWGYyVeX+B7iygW5h8r+2ZHhL6xKn+/Ncy7v38QA+XR4RIcuSTEyGfJFBvjm9NNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032091; c=relaxed/simple;
	bh=7xOBm+V9RIY9omBxQFlOi8TQ8IEdEX7Tn8QHe63PZUs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WAUv0nZbkewH3E/on22aRcN5SrSoHY6Z7Hcc2enUQGqNY6NlFRzNCixLg+wiPg1lHVovvyroClbvKGcZXHAl29LdmPneTFi0Q3IM/801ZT5BA6TpzQPu+pbcqHtoA9hVWaGv0/4LE3bW/tpFrurLL7fECcJJM2TyNBNb1MNqL5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F2vpxCev; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F2vpxCev"
Date: Wed, 25 Feb 2026 16:08:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772032085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wGhEoVaR8LLnSBfxr8rPtOZc8Pb8fObIkBxQi9q5Fa8=;
	b=F2vpxCevoLKkUabMAx8OZYjo+OmiNtGzimot4RilBxZZ2v7QYmxzq2xTle8dEiIojLPnyq
	ypy1mZ36rPxgDuAgJeQLqKtipocphAplXojVJDXNcGX76cIuwxaXtUS89t+zp2kucBQB1I
	PpU80R6z4q7GYdAxRu8LsPwkfE2jNbo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_10/21=5D_staging=3A_rtl8723bs=3A_os=5F?=
 =?US-ASCII?Q?dep=3A_fix_line_lengths_in_ioctl=5Fcfg80211=2Ec?=
In-Reply-To: <2026022520-flanked-effects-14cc@gregkh>
References: <20260224132748.12336-1-luka.gejak@linux.dev> <20260224132748.12336-11-luka.gejak@linux.dev> <aZ6dfxhSxcc5_TZf@stanley.mountain> <2026022520-flanked-effects-14cc@gregkh>
Message-ID: <D8C30CEE-9D76-4C31-BDAB-B4A4D430CDBF@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On February 25, 2026 3:56:50 PM GMT+01:00, Greg Kroah-Hartman <gregkh@linux=
foundation=2Eorg> wrote:
>On Wed, Feb 25, 2026 at 09:58:07AM +0300, Dan Carpenter wrote:
>> On Tue, Feb 24, 2026 at 02:27:37PM +0100, luka=2Egejak@linux=2Edev wrot=
e:
>> > From: Luka Gejak <luka=2Egejak@linux=2Edev>
>> >=20
>> > Break long lines exceeding 100 characters to comply with kernel codin=
g
>> > style=2E
>> >=20
>> > Signed-off-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>> > ---
>> >  =2E=2E=2E/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec | 134 ++++++++=
++++------
>> >  1 file changed, 94 insertions(+), 40 deletions(-)
>> >=20
>> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec b/dr=
ivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>> > index 51725c302458=2E=2Ec04af493f24d 100644
>> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>> > @@ -127,8 +127,10 @@ static struct ieee80211_supported_band *rtw_spt_=
band_alloc(
>> >  	if (!spt_band)
>> >  		goto exit;
>> > =20
>> > -	spt_band->channels =3D (struct ieee80211_channel *)(((u8 *)spt_band=
) + sizeof(struct ieee80211_supported_band));
>> > -	spt_band->bitrates =3D (struct ieee80211_rate *)(((u8 *)spt_band->c=
hannels) + sizeof(struct ieee80211_channel) * n_channels);
>> > +	spt_band->channels =3D (struct ieee80211_channel *)(((u8 *)spt_band=
) +
>> > +			      sizeof(struct ieee80211_supported_band));
>> > +	spt_band->bitrates =3D (struct ieee80211_rate *)(((u8 *)spt_band->c=
hannels) +
>> > +			     sizeof(struct ieee80211_channel) * n_channels);
>> >  	spt_band->band =3D band;
>> >  	spt_band->n_channels =3D n_channels;
>> >  	spt_band->n_bitrates =3D n_bitrates;
>> > @@ -207,7 +209,8 @@ int rtw_ieee80211_channel_to_frequency(int chan)
>> >  }
>> > =20
>> >  #define MAX_BSSINFO_LEN 1000
>> > -struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapte=
r, struct wlan_network *pnetwork)
>> > +struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapte=
r,
>> > +					     struct wlan_network *pnetwork)
>> >  {
>> >  	struct ieee80211_channel *notify_channel;
>> >  	struct cfg80211_bss *bss =3D NULL;
>> > @@ -248,7 +251,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(str=
uct adapter *padapter, struct wl
>> >  		u32 wpsielen =3D 0;
>> >  		u8 *wpsie =3D NULL;
>> > =20
>> > -		wpsie =3D rtw_get_wps_ie(pnetwork->network=2Eies + _FIXED_IE_LENGT=
H_, pnetwork->network=2Eie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
>> > +		u8 *ies =3D pnetwork->network=2Eies + _FIXED_IE_LENGTH_;
>> > +		uint ie_len =3D pnetwork->network=2Eie_length - _FIXED_IE_LENGTH_;
>> > +
>>=20
>> No spaces in the middle of a declaration block, please=2E
>
>Wait, that's not described in the changelog either!
>
>I'll go just drop this whole series, thanks Dan for the better review
>than I gave it=2E  I'll blame the jet-lag=2E=2E=2E
>
>thanks,
>
>greg k-h

Hi Greg,=20
What about 13 patches already in staging-testing?
Thank you for your time, Luka Gejak
