Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BE1246BC6
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032647; cv=none; b=kRSmsw+3Z82dMya/vFjKQ89yO8BKLmVAXCB+auISQaUALddTQnRXxhRFrM7xYKoBjIQhBfD0GOeYsm5L+zeRo57YXTIzr4V23LL4JyuRcGaxVN+4zLGb11Dy6kAswIwY9PetaRqbqESHJxhjGmjfrtfwLl2El0B8nX0klwiNXCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032647; c=relaxed/simple;
	bh=BZ99EKXlZyXA9g21cfciYyjndYi8HXDMmWb4bfiaVIE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KwQiFExF3q8/E0VhKrCA3EqxmulKbr2RDAEL83V+RtNq2XFHJqML2J2et6BKGQ5CeN8BVXKHyxV65w1LV3gbRz++aMjR93MGuOqF7hAgISOD50qPvHmSfwNC5T/n1fjCtjALxAtsjZGhlBznW4DspfzvOicwBUz/1pKiSba553Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=otShkWx1; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="otShkWx1"
Date: Wed, 25 Feb 2026 16:17:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772032644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4ErKeBnZDKTp3GMG3AKz26xUa+6z+GRu4IWtmzYNgI=;
	b=otShkWx1JJL77Xf6nR+y5PwarVO5mPdEWlyEre4FW176ZE3fvkuHt/LQPIoNxfZFAOH0o+
	ilA2Y85A53jqVd04dJeD3tJ/29GasBv35KmzYRfluJm/pcrOnVdHS3UjrnyLCbv27U51BG
	dz1EevTaqp7c5YlqoSWu+r3wc6d0qLA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_10/21=5D_staging=3A_rtl8723bs=3A_os=5F?=
 =?US-ASCII?Q?dep=3A_fix_line_lengths_in_ioctl=5Fcfg80211=2Ec?=
In-Reply-To: <2026022516-huddle-diffuser-8219@gregkh>
References: <20260224132748.12336-1-luka.gejak@linux.dev> <20260224132748.12336-11-luka.gejak@linux.dev> <aZ6dfxhSxcc5_TZf@stanley.mountain> <2026022520-flanked-effects-14cc@gregkh> <D8C30CEE-9D76-4C31-BDAB-B4A4D430CDBF@linux.dev> <2026022516-huddle-diffuser-8219@gregkh>
Message-ID: <68E7EB83-D0BB-4B5A-B703-903AB9E3B39C@linux.dev>
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

On February 25, 2026 4:14:37 PM GMT+01:00, Greg Kroah-Hartman <gregkh@linux=
foundation=2Eorg> wrote:
>On Wed, Feb 25, 2026 at 04:08:02PM +0100, Luka Gejak wrote:
>> On February 25, 2026 3:56:50 PM GMT+01:00, Greg Kroah-Hartman <gregkh@l=
inuxfoundation=2Eorg> wrote:
>> >On Wed, Feb 25, 2026 at 09:58:07AM +0300, Dan Carpenter wrote:
>> >> On Tue, Feb 24, 2026 at 02:27:37PM +0100, luka=2Egejak@linux=2Edev w=
rote:
>> >> > From: Luka Gejak <luka=2Egejak@linux=2Edev>
>> >> >=20
>> >> > Break long lines exceeding 100 characters to comply with kernel co=
ding
>> >> > style=2E
>> >> >=20
>> >> > Signed-off-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>> >> > ---
>> >> >  =2E=2E=2E/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec | 134 +++++=
+++++++------
>> >> >  1 file changed, 94 insertions(+), 40 deletions(-)
>> >> >=20
>> >> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec b=
/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>> >> > index 51725c302458=2E=2Ec04af493f24d 100644
>> >> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>> >> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>> >> > @@ -127,8 +127,10 @@ static struct ieee80211_supported_band *rtw_s=
pt_band_alloc(
>> >> >  	if (!spt_band)
>> >> >  		goto exit;
>> >> > =20
>> >> > -	spt_band->channels =3D (struct ieee80211_channel *)(((u8 *)spt_b=
and) + sizeof(struct ieee80211_supported_band));
>> >> > -	spt_band->bitrates =3D (struct ieee80211_rate *)(((u8 *)spt_band=
->channels) + sizeof(struct ieee80211_channel) * n_channels);
>> >> > +	spt_band->channels =3D (struct ieee80211_channel *)(((u8 *)spt_b=
and) +
>> >> > +			      sizeof(struct ieee80211_supported_band));
>> >> > +	spt_band->bitrates =3D (struct ieee80211_rate *)(((u8 *)spt_band=
->channels) +
>> >> > +			     sizeof(struct ieee80211_channel) * n_channels);
>> >> >  	spt_band->band =3D band;
>> >> >  	spt_band->n_channels =3D n_channels;
>> >> >  	spt_band->n_bitrates =3D n_bitrates;
>> >> > @@ -207,7 +209,8 @@ int rtw_ieee80211_channel_to_frequency(int cha=
n)
>> >> >  }
>> >> > =20
>> >> >  #define MAX_BSSINFO_LEN 1000
>> >> > -struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *pada=
pter, struct wlan_network *pnetwork)
>> >> > +struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *pada=
pter,
>> >> > +					     struct wlan_network *pnetwork)
>> >> >  {
>> >> >  	struct ieee80211_channel *notify_channel;
>> >> >  	struct cfg80211_bss *bss =3D NULL;
>> >> > @@ -248,7 +251,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(=
struct adapter *padapter, struct wl
>> >> >  		u32 wpsielen =3D 0;
>> >> >  		u8 *wpsie =3D NULL;
>> >> > =20
>> >> > -		wpsie =3D rtw_get_wps_ie(pnetwork->network=2Eies + _FIXED_IE_LE=
NGTH_, pnetwork->network=2Eie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
>> >> > +		u8 *ies =3D pnetwork->network=2Eies + _FIXED_IE_LENGTH_;
>> >> > +		uint ie_len =3D pnetwork->network=2Eie_length - _FIXED_IE_LENGT=
H_;
>> >> > +
>> >>=20
>> >> No spaces in the middle of a declaration block, please=2E
>> >
>> >Wait, that's not described in the changelog either!
>> >
>> >I'll go just drop this whole series, thanks Dan for the better review
>> >than I gave it=2E  I'll blame the jet-lag=2E=2E=2E
>> >
>> >thanks,
>> >
>> >greg k-h
>>=20
>> Hi Greg,=20
>> What about 13 patches already in staging-testing?
>
>I just now dropped them all, sorry=2E
>
>Please rebase your whole series and resubmit=2E
>
>thanks,
>
>greg k-h

Should I make any modifications, per Dan's advice?
Thanks, Luka Gejak
