Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980553B8
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 15:51:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C1270C8D9F
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 15:40:35 +0000 (UTC)
Received: (Authenticated sender: hadess@hadess.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 0D9784000F;
	Mon,  6 Mar 2023 15:40:26 +0000 (UTC)
Message-ID: <f23d6700b79500e2da9875964aee356c60a60529.camel@hadess.net>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Fix key-store index handling
From: Bastien Nocera <hadess@hadess.net>
To: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, stable@vger.kernel.org
Date: Mon, 06 Mar 2023 16:40:26 +0100
In-Reply-To: <20230306153512.162104-1-hdegoede@redhat.com>
References: <20230306153512.162104-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-03-06 at 16:35 +0100, Hans de Goede wrote:
> There are 2 issues with the key-store index handling
>=20
> 1. The non WEP key stores can store keys with indexes 0 -
> BIP_MAX_KEYID,
> =C2=A0=C2=A0 this means that they should be an array with BIP_MAX_KEYID +=
 1
> =C2=A0=C2=A0 entries. But some of the arrays where just BIP_MAX_KEYID ent=
ries
> =C2=A0=C2=A0 big. While one other array was hardcoded to a size of 6 entr=
ies,
> =C2=A0=C2=A0 instead of using the BIP_MAX_KEYID define.
>=20
> 2. The rtw_cfg80211_set_encryption() and wpa_set_encryption()
> functions
> =C2=A0=C2=A0 index check where checking that the passed in key-index woul=
d fit
> =C2=A0=C2=A0 inside both the WEP key store (which only has 4 entries) as =
well
> as
> =C2=A0=C2=A0 in the non WEP key stores. This breaks any attempts to set n=
on WEP
> =C2=A0=C2=A0 keys with index 4 or 5.
>=20
> Issue 2. specifically breaks wifi connection with some access points
> which advertise PMF support. Without this fix connecting to these
> access points fails with the following wpa_supplicant messages:
>=20
> =C2=A0nl80211: kernel reports: key addition failed
> =C2=A0wlan0: WPA: Failed to configure IGTK to the driver
> =C2=A0wlan0: RSN: Failed to configure IGTK
> =C2=A0wlan0: CTRL-EVENT-DISCONNECTED bssid=3D... reason=3D1
> locally_generated=3D1
>=20
> Fix 1. by using the right size for the key-stores. After this 2. can
> safely be fixed by checking the right max-index value depending on
> the
> used algorithm, fixing wifi not working with some PMF capable APs.

Good job on both those patches.

Can you please also CC: the maintainer of r8188eu which looks like it
has similar code?

Cheers
