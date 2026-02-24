Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994F2D9EDC
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959272; cv=none; b=rxTXraZ4eh8a+tmzNCFsiCeahF4jrCaa3HE5U4dRzf8ZhMfVoJGNQMwmHDceWYelg2MoKUjg/5VJAhLBEIGuaBdFSA9Oa7cW6UPDCGweGNNgm2EQXeIhX4Ks5Li2QTCvG8uHh8Q9AAUYRfvYKf+FpN5y4EICMhNTnkEv7Hg40yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959272; c=relaxed/simple;
	bh=QLPQ2tlmZCniATQPTVEQo4c3EuTk7tGCc7k8E4aEq2k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=d8IYQuafvgKwQwHgJ4p9GDzTd/EE8+/WCpYsohjU1n21+bJGbWN6UgnpbdeEeuCF6TwggHq84emqqhy1m8KDvWIfUoe7B3aRFcUx4IPm1hq4bhiqspK3edOVAvsKR5XEnBowvBKjWxWEJIdCZxKugq3cPdQKBcx6AlOOnnKuM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=em9q/VJQ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="em9q/VJQ"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79827d28fc4so33393867b3.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 10:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959270; x=1772564070; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMBCdXMus7RTjHV4ycLc6g6ULWhxBWfE1E237fe5EVo=;
        b=em9q/VJQdVlZIzCg1hgUOBQBdOPmOVg/2UdpThT2jfUhM0Ic9llDETpfS3IwmxNDJR
         uTQI1BGKEEIX636qfjCDhIruVlhpAawoeDF1JrIT8Wb2xDVbt7FVYxYg6qMnLBl8/QtC
         eG43zQVjF0C7uopMXg//j5Yiogx+ZOcL3JVtXCVHSMYv76eq02PX+z8Y+m3iHaTL8shO
         PQii9utWcszb2AH7WVuYLrDQdne4R1DxO2wyKtmpRkHYWC4FvEgH8uglpI0RnLqtMJUL
         58bY0wDnaBThKY5b37TMOZwGf/3UbMqwXHeMO0g3uN4ZiPPGeL67OZ5LXUdUhRdAybGb
         6iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959270; x=1772564070;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMBCdXMus7RTjHV4ycLc6g6ULWhxBWfE1E237fe5EVo=;
        b=Ob08egHEX3/zWs+b8ILCdOuxHPhgei9JvoTgVAUjHny9Jd7qLo+gT2zrpQdnwH6RZf
         CNbGNYp6MAML5JBD6wED8afTw3vCudwh1etVmG6wl+3ZmMHOhO6EjyJwa7P4fvEG7v6T
         x1Kb/7aKDmnvLGBpZhds/dV1nsveZD8dSThYwQmvP4oQnq/daQF8QMR8lYzw1tzJSB4E
         6kpZKWtr00U9C1+h8GbTM0KJ3qDvS5EKCMYJK53pM+dbPMVJxDn/0XQDTwASafiTFq+/
         yrlsGx8OaVjyymwkYbFXjiT75wntbOCFKix/fgkhMXlb2IICxV3ZYXXnLcwyUjeQA30l
         9AZw==
X-Forwarded-Encrypted: i=1; AJvYcCVPqYvQQN1hRKUjla75C38YeVDeeO26L/dXXfmvOsOPlRFSC5ty/ZJo2AdRajlJ9aa1+d1v4FbR4Rj0g0Fv@lists.linux.dev
X-Gm-Message-State: AOJu0Yym91a4kPwg2EQeEj9keRLnL4OEJhVUibwtBVNh4CisiFtNhcPK
	pVci3emQY/pnDLwGVrGgAFTohZyV1NGzfiiduodFR99C7vruMvgdy6p8
X-Gm-Gg: ATEYQzznQx710SA+A80e5gfEgBL454ZOxVnKYNAL3Jchgfjf2IcpqIzQkAvAAoThy2X
	LUTT4am+gVd0NBIoyijNiTxwp0w7XPf3/P8VR9jTwnY4phx9wWWVebVpjnLiZ73hZcTLLgAZYMC
	X4/LdimcMJuzxFxtbJGRnT0sjRi0dRk0LwVD2wvR/XSjykY6c4DrP1wSBzkeG+FILXwlcLfQq+h
	KS1QApiKeVgaj9agga7APMSZI18BGvsaQKNg/NJXBJ2+xdZtS1D/UMc+MvpdhYFpAg8K/UAUB/y
	SvyiDmUuIYYBuWr86XiQLZrFKCGdALjtV7zu2NqcC5TRmnhnueVCTLDs7AC4jVoepKlR37xF3sg
	XsUsenqkVXBlO9O+3TP8svsaVEZwGkowOX7wT8b5k5rDy+r1wlCbdecjD61VitKIOvBUvwnJ7lo
	D/t1ZPq8vxCI5oau7k48QWCmvOxMYQK8iigx+ksTjeTSlGFYeX5aJqxlIP6uPCN6CKlkLdmtBON
	BXLsNcUeXpNSo2XX4WCs0ZN0HIrlOsQ
X-Received: by 2002:a05:690c:6893:b0:793:b660:fbf7 with SMTP id 00721157ae682-79828cd06c6mr116813567b3.9.1771959269692;
        Tue, 24 Feb 2026 10:54:29 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982ddc5a60sm47383157b3.35.2026.02.24.10.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 10:54:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 12:54:08 -0600
Message-Id: <DGNF4P4XYTCA.2YN3TZZZWMN0J@gmail.com>
Subject: Re: [PATCH v3 2/2] staging: rtl8723bs: convert single-line comment
 to multi-line format
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
Cc: <tomasz.unger@yahoo.pl>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223200006.145296-1-tomasz.unger@yahoo.pl>
 <20260223200006.145296-2-tomasz.unger@yahoo.pl>
 <DGMXXS3DIY2Z.3GUN0MJI6S15M@gmail.com>
 <2026022431-splotchy-prison-d68a@gregkh>
In-Reply-To: <2026022431-splotchy-prison-d68a@gregkh>

On Tue Feb 24, 2026 at 11:59 AM CST, Greg KH wrote:
> On Mon, Feb 23, 2026 at 11:25:47PM -0600, Ethan Tidmore wrote:
>> On Mon Feb 23, 2026 at 2:00 PM CST, tomasz.unger wrote:
>> > From: Tomasz Unger <tomasz.unger@yahoo.pl>
>> >
>> > Convert a long single-line comment to multi-line format
>> > as per coding-style.rst.
>> >
>> > Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
>> > ---
>> > v3: Split into two separate patches as requested by Greg Kroah-Hartman=
.
>> > v2: Added multi-line comment format, changed to codespell.
>> >
>> >  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/=
staging/rtl8723bs/core/rtw_wlan_util.c
>> > index 74c31a97f093..cffb1a9d36fa 100644
>> > --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
>> > +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
>> > @@ -597,7 +597,9 @@ s16 rtw_camid_alloc(struct adapter *adapter, struc=
t sta_info *sta, u8 kid)
>> > =20
>> >  		i =3D _rtw_camid_search(adapter, addr, kid);
>> >  		if (i >=3D 0) {
>> > -			/* Fix issue that pairwise and group key have same key id. Pairwis=
e key first, group key can overwrite group only(ex: rekey) */
>> > +			/* Fix issue that pairwise and group key have same key id.
>> > +			 * Pairwise key first, group key can overwrite group only(ex: reke=
y)
>> > +			 */
>>=20
>> Almost, the correct format is this:
>>=20
>> /*
>>  * Fix issue ...
>>  * ...
>>  */=20
>
> Except for the network stack/drivers.  So this _is_ correct, as this is
> a network driver.

Oops, sorry about that. I thought it was just net/ that applied.

Thanks,

ET
